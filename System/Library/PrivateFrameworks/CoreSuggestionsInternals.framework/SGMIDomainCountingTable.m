@implementation SGMIDomainCountingTable

- (SGMIDomainCountingTable)initWithDatabase:(id)a3 tableName:(id)a4
{
  id v7;
  id v8;
  SGMIDomainCountingTable *v9;
  void *v10;
  uint64_t v11;
  NSString *tableNameEscaped;
  id v13;
  void *v14;
  uint64_t v15;
  _PASLock *lock;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SGMIDomainCountingTable;
  v9 = -[SGMIDomainCountingTable init](&v18, sel_init);
  if (v9)
  {
    v10 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_storeStrong((id *)&v9->_db, a3);
    objc_storeStrong((id *)&v9->_tableName, a4);
    +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    tableNameEscaped = v9->_tableNameEscaped;
    v9->_tableNameEscaped = (NSString *)v11;

    v13 = objc_alloc(MEMORY[0x1E0D815F0]);
    v14 = (void *)objc_opt_new();
    v15 = objc_msgSend(v13, "initWithGuardedData:", v14);
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v15;

    objc_autoreleasePoolPop(v10);
  }

  return v9;
}

- (void)_updateSchemaVersion
{
  _PASSqliteDatabase *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__SGMIDomainCountingTable__updateSchemaVersion__block_invoke;
  v3[3] = &unk_1E7DB56F0;
  v3[4] = self;
  -[_PASSqliteDatabase readTransaction:](db, "readTransaction:", v3);
}

- (id)_currentColumns
{
  _PASSqliteDatabase *db;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__30539;
  v10 = __Block_byref_object_dispose__30540;
  v11 = 0;
  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SGMIDomainCountingTable__currentColumns__block_invoke;
  v5[3] = &unk_1E7DB78A0;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASSqliteDatabase readTransaction:](db, "readTransaction:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)_hasColumn:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[SGMIDomainCountingTable _currentColumns](self, "_currentColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v5, "count"), 0, &__block_literal_global_30656);

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_readCurrentColumnsUncached
{
  void *v3;
  _PASSqliteDatabase *db;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  SGMIDomainCountingTable *v13;
  id v14;

  v3 = (void *)objc_opt_new();
  db = self->_db;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __54__SGMIDomainCountingTable__readCurrentColumnsUncached__block_invoke;
  v12 = &unk_1E7DB6A30;
  v13 = self;
  v5 = v3;
  v14 = v5;
  v6 = (void *)MEMORY[0x1C3BD4F6C](-[_PASSqliteDatabase readTransaction:](db, "readTransaction:", &v9));
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_30656, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v6);

  return v7;
}

- (void)_addColumn:(id)a3
{
  void *v4;
  _PASSqliteDatabase *db;
  id v6;
  _QWORD v7[5];
  id v8;

  +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__SGMIDomainCountingTable__addColumn___block_invoke;
  v7[3] = &unk_1E7DB6A30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v7);

}

- (void)_mergeColumn:(id)a3 intoColumn:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _PASSqliteDatabase *db;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a4;
  +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  db = self->_db;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__SGMIDomainCountingTable__mergeColumn_intoColumn___block_invoke;
  v12[3] = &unk_1E7DB7800;
  v12[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v12);

}

- (BOOL)_removeColumnFromTotal:(id)a3
{
  id v4;
  void *v5;
  _PASSqliteDatabase *db;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__SGMIDomainCountingTable__removeColumnFromTotal___block_invoke;
  v9[3] = &unk_1E7DB7878;
  v9[4] = self;
  v7 = v5;
  v10 = v7;
  v11 = &v12;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v9);
  LOBYTE(db) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)db;
}

- (void)_dropColumn:(id)a3
{
  id v4;
  void *v5;
  _PASSqliteDatabase *db;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__SGMIDomainCountingTable__dropColumn___block_invoke;
  v9[3] = &unk_1E7DB7800;
  v9[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v9);

}

- (BOOL)_zeroColumn:(id)a3
{
  id v4;
  void *v5;
  _PASSqliteDatabase *db;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__SGMIDomainCountingTable__zeroColumn___block_invoke;
  v9[3] = &unk_1E7DB7878;
  v9[4] = self;
  v7 = v5;
  v10 = v7;
  v11 = &v12;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v9);
  LOBYTE(db) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)db;
}

- (void)_recycleColumn:(id)a3 asColumn:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _PASSqliteDatabase *db;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  db = self->_db;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__SGMIDomainCountingTable__recycleColumn_asColumn___block_invoke;
  v14[3] = &unk_1E7DB77B0;
  v14[4] = self;
  v15 = v6;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v6;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v14);

}

- (void)_deleteZeroRows
{
  _PASSqliteDatabase *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__SGMIDomainCountingTable__deleteZeroRows__block_invoke;
  v3[3] = &unk_1E7DB56F0;
  v3[4] = self;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v3);
}

- (id)_parentDomainsForDomain:(id)a3
{
  __CFString *v3;
  void *v4;
  CFIndex Length;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFIndex v20;
  UniChar v21;
  int64_t v22;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  CFIndex v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CFStringRef theString;
  const UniChar *v42;
  const char *v43;
  uint64_t v44;
  CFIndex v45;
  int64_t v46;
  int64_t v47;
  CFRange v48;

  v3 = (__CFString *)a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_30;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  Length = CFStringGetLength(v3);
  theString = v3;
  v44 = 0;
  v45 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  v42 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  v46 = 0;
  v47 = 0;
  v43 = CStringPtr;
  if (Length >= 1)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 64;
    do
    {
      if ((unint64_t)v17 >= 4)
        v19 = 4;
      else
        v19 = v17;
      v20 = v45;
      if (v45 > v17)
      {
        if (v42)
        {
          v21 = v42[v17 + v44];
        }
        else if (v43)
        {
          v21 = v43[v44 + v17];
        }
        else
        {
          v22 = v46;
          if (v47 <= v17 || v46 > v17)
          {
            v24 = v19 + v15;
            v25 = v18 - v19;
            v26 = v17 - v19;
            v27 = v26 + 64;
            if (v26 + 64 >= v45)
              v27 = v45;
            v46 = v26;
            v47 = v27;
            if (v45 >= v25)
              v20 = v25;
            v48.length = v20 + v24;
            v48.location = v26 + v44;
            CFStringGetCharacters(theString, v48, (UniChar *)&v33);
            v22 = v46;
          }
          v21 = *((_WORD *)&v33 + v17 - v22);
        }
        if (v21 == 46)
        {
          v28 = (void *)MEMORY[0x1C3BD4F6C](CStringPtr, v6, v7, v8, v9, v10, v11, v12, v33, *((_QWORD *)&v33 + 1), v34, *((_QWORD *)&v34 + 1), v35, *((_QWORD *)&v35 + 1), v36, *((_QWORD *)&v36 + 1));
          if (!v16)
            v16 = (void *)objc_opt_new();
          -[__CFString substringToIndex:](v3, "substringToIndex:", v17);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v29);

          objc_autoreleasePoolPop(v28);
        }
      }
      ++v17;
      --v15;
      ++v18;
    }
    while (Length != v17);
  }
  else
  {
LABEL_30:
    v16 = 0;
  }

  if (v16)
    v30 = v16;
  else
    v30 = (void *)MEMORY[0x1E0C9AA60];
  v31 = v30;

  return v31;
}

- (void)_commitDomainsAndCounts:(id)a3 toColumn:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _PASSqliteDatabase *db;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v16 = a3;
  v6 = a4;
  if (objc_msgSend(v16, "count"))
  {
    v7 = (void *)objc_msgSend(v16, "mutableCopy");
    v8 = (void *)objc_opt_new();
    v9 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke;
    v22[3] = &unk_1E7DB5740;
    v22[4] = self;
    v10 = v8;
    v23 = v10;
    v11 = v16;
    v24 = v11;
    v12 = v7;
    v25 = v12;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v22);
    db = self->_db;
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_2;
    v17[3] = &unk_1E7DB57C8;
    v17[4] = self;
    v18 = v11;
    v19 = v10;
    v20 = v6;
    v21 = v12;
    v14 = v12;
    v15 = v10;
    -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v17);

  }
}

- (id)totalsForDomains:(id)a3
{
  id v4;
  void *v5;
  _PASSqliteDatabase *db;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
    db = self->_db;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__SGMIDomainCountingTable_totalsForDomains___block_invoke;
    v11[3] = &unk_1E7DB7800;
    v11[4] = self;
    v12 = v4;
    v7 = v5;
    v13 = v7;
    -[_PASSqliteDatabase readTransaction:](db, "readTransaction:", v11);
    v8 = v13;
    v9 = v7;

  }
  else
  {
    v9 = (id)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

- (int64_t)totalForDomain:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;
  _QWORD v11[4];
  id v12;
  SGMIDomainCountingTable *v13;
  uint64_t *v14;
  SEL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIDomainCountingTable totalsForDomains:](self, "totalsForDomains:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__SGMIDomainCountingTable_totalForDomain___block_invoke;
  v11[3] = &unk_1E7DB57F0;
  v8 = v5;
  v12 = v8;
  v13 = self;
  v14 = &v16;
  v15 = a2;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  v9 = v17[3];
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (int64_t)countForColumn:(id)a3 domain:(id)a4
{
  id v7;
  id v8;
  _PASSqliteDatabase *db;
  id v10;
  id v11;
  int64_t v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  SEL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  db = self->_db;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__SGMIDomainCountingTable_countForColumn_domain___block_invoke;
  v14[3] = &unk_1E7DB5818;
  v14[4] = self;
  v10 = v7;
  v15 = v10;
  v18 = a2;
  v11 = v8;
  v16 = v11;
  v17 = &v19;
  -[_PASSqliteDatabase readTransaction:](db, "readTransaction:", v14);
  v12 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (unint64_t)_domainSegmentCount:(id)a3
{
  __CFString *v3;
  void *v4;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  UniChar v15;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  CFIndex v20;
  _OWORD v22[8];
  CFStringRef theString;
  const UniChar *v24;
  const char *v25;
  uint64_t v26;
  CFIndex v27;
  int64_t v28;
  int64_t v29;
  CFRange v30;

  v3 = (__CFString *)a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_28;
  memset(v22, 0, sizeof(v22));
  Length = CFStringGetLength(v3);
  theString = v3;
  v26 = 0;
  v27 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  v24 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  v28 = 0;
  v29 = 0;
  v25 = CStringPtr;
  if (Length >= 1)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 1;
    v12 = 64;
    do
    {
      if ((unint64_t)v10 >= 4)
        v13 = 4;
      else
        v13 = v10;
      v14 = v27;
      if (v27 > v10)
      {
        if (v24)
        {
          v15 = v24[v10 + v26];
        }
        else if (v25)
        {
          v15 = v25[v26 + v10];
        }
        else
        {
          if (v29 <= v10 || v9 > v10)
          {
            v17 = v13 + v8;
            v18 = v12 - v13;
            v19 = v10 - v13;
            v20 = v19 + 64;
            if (v19 + 64 >= v27)
              v20 = v27;
            v28 = v19;
            v29 = v20;
            if (v27 >= v18)
              v14 = v18;
            v30.length = v14 + v17;
            v30.location = v19 + v26;
            CFStringGetCharacters(theString, v30, (UniChar *)v22);
            v9 = v28;
          }
          v15 = *((_WORD *)v22 + v10 - v9);
        }
        if (v15 == 46)
          ++v11;
      }
      ++v10;
      --v8;
      ++v12;
    }
    while (Length != v10);
  }
  else
  {
LABEL_28:
    v11 = 1;
  }

  return v11;
}

- (id)nonZeroColumnsForDomains:(id)a3 withColumns:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _PASSqliteDatabase *db;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  SGMIDomainCountingTable *v19;
  id v20;
  id v21;
  SEL v22;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  db = self->_db;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke;
  v17[3] = &unk_1E7DB58B0;
  v18 = v8;
  v19 = self;
  v22 = a2;
  v20 = v7;
  v11 = v9;
  v21 = v11;
  v12 = v7;
  v13 = v8;
  -[_PASSqliteDatabase readTransaction:](db, "readTransaction:", v17);
  v14 = v21;
  v15 = v11;

  return v15;
}

- (id)nonZeroColumnsForDomain:(id)a3 withColumns:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIDomainCountingTable nonZeroColumnsForDomains:withColumns:](self, "nonZeroColumnsForDomains:withColumns:", v9, v7, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)firstNonZeroColumnForDomains:(id)a3 withColumns:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _PASSqliteDatabase *db;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  SGMIDomainCountingTable *v19;
  id v20;
  id v21;
  SEL v22;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  db = self->_db;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke;
  v17[3] = &unk_1E7DB58B0;
  v18 = v8;
  v19 = self;
  v22 = a2;
  v20 = v7;
  v11 = v9;
  v21 = v11;
  v12 = v7;
  v13 = v8;
  -[_PASSqliteDatabase readTransaction:](db, "readTransaction:", v17);
  v14 = v21;
  v15 = v11;

  return v15;
}

- (id)firstNonZeroColumnForDomain:(id)a3 withColumns:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIDomainCountingTable firstNonZeroColumnForDomains:withColumns:](self, "firstNonZeroColumnForDomains:withColumns:", v9, v7, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)enumerateChildrenOfDomain:(id)a3 depth:(unint64_t)a4 usingBlock:(id)a5
{
  -[SGMIDomainCountingTable enumerateChildrenOfDomain:greaterThan:depth:limit:usingBlock:](self, "enumerateChildrenOfDomain:greaterThan:depth:limit:usingBlock:", a3, 0, a4, 0, a5);
}

- (void)enumerateChildrenOfDomain:(id)a3 greaterThan:(id)a4 depth:(unint64_t)a5 limit:(id)a6 usingBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  _PASSqliteDatabase *db;
  unint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  SGMIDomainCountingTable *v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  SEL v32;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  if (v13)
    v17 = -[SGMIDomainCountingTable _domainSegmentCount:](self, "_domainSegmentCount:", v13);
  else
    v17 = 0;
  db = self->_db;
  if (a5)
    v19 = a5;
  else
    v19 = -1;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __88__SGMIDomainCountingTable_enumerateChildrenOfDomain_greaterThan_depth_limit_usingBlock___block_invoke;
  v24[3] = &unk_1E7DB5968;
  v25 = v13;
  v26 = self;
  v27 = v15;
  v28 = v14;
  v31 = v19;
  v32 = a2;
  v29 = v16;
  v30 = v17;
  v20 = v16;
  v21 = v14;
  v22 = v15;
  v23 = v13;
  -[_PASSqliteDatabase readTransaction:](db, "readTransaction:", v24);

}

- (unint64_t)numberOfRowsAssociatedWithDomain:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__SGMIDomainCountingTable_numberOfRowsAssociatedWithDomain___block_invoke;
  v9[3] = &unk_1E7DB7878;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_PASSqliteDatabase readTransaction:](db, "readTransaction:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)addColumn:(id)a3
{
  id v5;
  _PASSqliteDatabase *db;
  id v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  db = self->_db;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SGMIDomainCountingTable_addColumn___block_invoke;
  v8[3] = &unk_1E7DB6BB8;
  v8[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v8);

}

- (void)zeroColumn:(id)a3
{
  id v5;
  _PASSqliteDatabase *db;
  id v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  db = self->_db;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SGMIDomainCountingTable_zeroColumn___block_invoke;
  v8[3] = &unk_1E7DB6BB8;
  v8[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v8);

}

- (void)dropColumn:(id)a3
{
  id v5;
  _PASSqliteDatabase *db;
  id v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  db = self->_db;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SGMIDomainCountingTable_dropColumn___block_invoke;
  v8[3] = &unk_1E7DB6BB8;
  v8[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v8);

}

- (void)recycleColumn:(id)a3 asColumn:(id)a4
{
  id v7;
  id v8;
  _PASSqliteDatabase *db;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  db = self->_db;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__SGMIDomainCountingTable_recycleColumn_asColumn___block_invoke;
  v12[3] = &unk_1E7DB5990;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v12);

}

- (void)mergeColumn:(id)a3 intoColumn:(id)a4
{
  id v7;
  id v8;
  _PASSqliteDatabase *db;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  db = self->_db;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__SGMIDomainCountingTable_mergeColumn_intoColumn___block_invoke;
  v12[3] = &unk_1E7DB5990;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v12);

}

- (void)commitDomainsCountedSet:(id)a3 toColumn:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "allObjects");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__SGMIDomainCountingTable_commitDomainsCountedSet_toColumn___block_invoke;
  v12[3] = &unk_1E7DB59B8;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v11, "_pas_mappedArrayWithTransform:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v9, v11);
  -[SGMIDomainCountingTable commitDomainsAndCounts:toColumn:](self, "commitDomainsAndCounts:toColumn:", v10, v7);

}

- (void)commitDomainsAndCounts:(id)a3 toColumn:(id)a4
{
  id v7;
  id v8;
  _PASSqliteDatabase *db;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  db = self->_db;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__SGMIDomainCountingTable_commitDomainsAndCounts_toColumn___block_invoke;
  v12[3] = &unk_1E7DB5990;
  v12[4] = self;
  v13 = v8;
  v14 = v7;
  v15 = a2;
  v10 = v7;
  v11 = v8;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v12);

}

- (void)deleteDomainSelection:(id)a3 keepingDomainsPassingTest:(id)a4
{
  id v6;
  _PASSqliteDatabase *db;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (!v8 || objc_msgSend(v8, "count"))
  {
    db = self->_db;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__SGMIDomainCountingTable_deleteDomainSelection_keepingDomainsPassingTest___block_invoke;
    v9[3] = &unk_1E7DB6F48;
    v9[4] = self;
    v11 = v6;
    v10 = v8;
    -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v9);

  }
}

- (void)deleteDomainSelection:(id)a3
{
  void *v4;
  _PASSqliteDatabase *db;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "allDomains");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    db = self->_db;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke;
    v8[3] = &unk_1E7DB6A30;
    v8[4] = self;
    v9 = v4;
    v6 = v4;
    -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v8);

  }
}

- (void)deleteDomain:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0D815A0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithDomain:", v5);

  -[SGMIDomainCountingTable deleteDomainSelection:](self, "deleteDomainSelection:", v6);
}

- (void)deleteAllRows
{
  _PASSqliteDatabase *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__SGMIDomainCountingTable_deleteAllRows__block_invoke;
  v3[3] = &unk_1E7DB56F0;
  v3[4] = self;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_tableNameEscaped, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

void __40__SGMIDomainCountingTable_deleteAllRows__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(v1, "prepAndRunQuery:onPrep:onRow:onError:", v2, 0, 0, 0);

}

void __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  size_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  int v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  id v36;
  id v37;
  size_t v38;
  id v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[7];
  _QWORD v47[5];
  char *v48;
  void **v49;
  uint64_t v50;
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[6];
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _QWORD v63[5];
  _QWORD v64[4];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v42 = a1;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE (domain >= ?1 || '.') AND (domain < ?1 || '/')"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(v1, "_pas_stringBackedByUTF8CString");
  v41 = (id)objc_claimAutoreleasedReturnValue();

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v2 = *(id *)(v42 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v59 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        v7 = *(void **)(*(_QWORD *)(v42 + 32) + 8);
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_2;
        v57[3] = &unk_1E7DB74A0;
        v57[4] = v6;
        objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v41, v57, 0, 0);
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v3);
  }

  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(v42 + 32), "_currentColumns");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObject:", CFSTR("total"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v10, "count");
  if (v40 >= 0x7FFFFFFF)
    __assert_rtn("-[SGMIDomainCountingTable deleteDomainSelection:]_block_invoke", "SGMIFeatureStore.m", 874, "columnCount < INT_MAX");
  objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_228);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_pas_mappedArrayWithIndexedTransform:", &__block_literal_global_229);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(v42 + 32) + 24);
  v64[0] = CFSTR("DELETE FROM");
  v64[1] = v13;
  v64[2] = CFSTR("WHERE domain = ? RETURNING");
  objc_msgSend(v11, "_pas_componentsJoinedByString:", CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_pas_componentsJoinedByString:", CFSTR(" "));
  v39 = (id)objc_claimAutoreleasedReturnValue();

  v16 = *(_QWORD *)(*(_QWORD *)(v42 + 32) + 24);
  v63[0] = CFSTR("UPDATE");
  v63[1] = v16;
  v63[2] = CFSTR("SET");
  objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(","));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v17;
  v63[4] = CFSTR("WHERE domain IN _pas_nsarray(:parentDomains)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_pas_componentsJoinedByString:", CFSTR(" "));
  v36 = (id)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  v38 = 8 * v40;
  v19 = (8 * v40) | 7;
  v48 = 0;
  v49 = 0;
  v34 = v19;
  if (v19 > 0x4000)
  {
    v31 = malloc_type_posix_memalign((void **)&v48, 8uLL, v38, 0x100004000313F17uLL);
    LOBYTE(v49) = 0;
    if (v31)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v32);
    }
    v20 = v48;
  }
  else
  {
    v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v20, v19);
  }
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_5;
  v56[3] = &__block_descriptor_48_e27___NSNumber_16__0__NSArray_8l;
  v56[4] = v40;
  v56[5] = v20;
  v35 = (id)MEMORY[0x1C3BD5158](v56);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v37 = *(id *)(v42 + 40);
  v21 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v53 != v22)
          objc_enumerationMutation(v37);
        v24 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
        v25 = (void *)MEMORY[0x1C3BD4F6C]();
        v26 = v42;
        objc_msgSend(*(id *)(v42 + 32), "_parentDomainsForDomain:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        bzero(v20, v38);
        v48 = 0;
        v49 = (void **)&v48;
        v50 = 0x2020000000;
        v51 = 0;
        v28 = *(void **)(*(_QWORD *)(v26 + 32) + 8);
        v46[6] = v20;
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_6;
        v47[3] = &unk_1E7DB74A0;
        v47[4] = v24;
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_7;
        v46[3] = &unk_1E7DB5A90;
        v46[4] = &v48;
        v46[5] = v40;
        objc_msgSend(v28, "prepAndRunQuery:onPrep:onRow:onError:", v39, v47, v46, 0);
        if (*((_BYTE *)v49 + 24) && objc_msgSend(v27, "count"))
        {
          v29 = *(void **)(*(_QWORD *)(v42 + 32) + 8);
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_8;
          v43[3] = &unk_1E7DB6390;
          v45 = v35;
          v44 = v27;
          objc_msgSend(v29, "prepAndRunQuery:onPrep:onRow:onError:", v36, v43, 0, 0);

        }
        _Block_object_dispose(&v48, 8);

        objc_autoreleasePoolPop(v25);
      }
      v21 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v21);
  }
  v30 = v34 > 0x4000;

  if (v30)
    free(v20);
  objc_msgSend(*(id *)(v42 + 32), "_deleteZeroRows");

}

uint64_t __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

id __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5 >= *(_QWORD *)(a1 + 32))
    __assert_rtn("-[SGMIDomainCountingTable deleteDomainSelection:]_block_invoke_5", "SGMIFeatureStore.m", 903, "index < columnCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_7(_QWORD *a1, void *a2)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1[5];
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  if (v2)
  {
    v5 = 0;
    v6 = a1[6];
    do
    {
      v7 = *(_QWORD *)(v6 + 8 * v5);
      v8 = objc_msgSend(a2, "getIntegerForColumn:", v5);
      v6 = a1[6];
      *(_QWORD *)(v6 + 8 * v5++) = v8 + v7;
    }
    while (a1[5] > v5);
  }
  return *MEMORY[0x1E0D81780];
}

void __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toBlock:", ":block", v3);
  objc_msgSend(v4, "bindNamedParam:toNSArray:", ":parentDomains", *(_QWORD *)(a1 + 32));

}

id __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a2;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:", CFSTR("%@=%@-_pas_block(:block,%tu)"), v5, v5, a3);

  return v6;
}

id __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", a2);
}

void __75__SGMIDomainCountingTable_deleteDomainSelection_keepingDomainsPassingTest___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  void *v4;
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
  _QWORD v15[5];
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__SGMIDomainCountingTable_deleteDomainSelection_keepingDomainsPassingTest___block_invoke_2;
  v15[3] = &unk_1E7DB5A08;
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = *(id *)(a1 + 48);
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BD5158](v15);
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v3, "allDomains", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x1C3BD4F6C]();
          v2[2](v2, v9);
          objc_autoreleasePoolPop(v10);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
      }
      while (v6);
    }

  }
  else
  {
    v2[2](v2, 0);
  }

}

void __75__SGMIDomainCountingTable_deleteDomainSelection_keepingDomainsPassingTest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__30539;
  v19 = __Block_byref_object_dispose__30540;
  v20 = 0;
  v4 = MEMORY[0x1E0C809B0];
  do
  {
    v5 = (void *)MEMORY[0x1C3BD4F6C]();
    v6 = (void *)objc_opt_new();
    v7 = *(void **)(a1 + 32);
    v8 = v16[5];
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __75__SGMIDomainCountingTable_deleteDomainSelection_keepingDomainsPassingTest___block_invoke_3;
    v11[3] = &unk_1E7DB59E0;
    v14 = &v15;
    v9 = v6;
    v12 = v9;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v7, "enumerateChildrenOfDomain:greaterThan:depth:limit:usingBlock:", v3, v8, -1, 0, v11);
    v10 = objc_msgSend(v9, "count");
    if (v10)
      objc_msgSend(*(id *)(a1 + 32), "deleteDomainSelection:", v9);

    objc_autoreleasePoolPop(v5);
  }
  while (v10);
  _Block_object_dispose(&v15, 8);

}

BOOL __75__SGMIDomainCountingTable_deleteDomainSelection_keepingDomainsPassingTest___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  _BOOL8 v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v5 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsDomain:", v4) & 1) == 0)
  {
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 32), "addDomain:", v4),
          (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") <= 0x7F))
    {
      v5 = 1;
    }
  }

  return v5;
}

uint64_t __59__SGMIDomainCountingTable_commitDomainsAndCounts_toColumn___block_invoke(uint64_t a1)
{
  void *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "_hasColumn:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("SGMIFeatureStore.m"), 784, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _hasColumn:column]"));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_commitDomainsAndCounts:toColumn:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __60__SGMIDomainCountingTable_commitDomainsCountedSet_toColumn___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "countForObject:", a2));
}

uint64_t __50__SGMIDomainCountingTable_mergeColumn_intoColumn___block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "_hasColumn:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("SGMIFeatureStore.m"), 765, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _hasColumn:donorColumn]"));

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_hasColumn:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("SGMIFeatureStore.m"), 766, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _hasColumn:recipientColumn]"));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_mergeColumn:intoColumn:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __50__SGMIDomainCountingTable_recycleColumn_asColumn___block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "_hasColumn:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("SGMIFeatureStore.m"), 755, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _hasColumn:columnName]"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_hasColumn:", *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("SGMIFeatureStore.m"), 756, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![self _hasColumn:newColumnName]"));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_recycleColumn:asColumn:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __38__SGMIDomainCountingTable_dropColumn___block_invoke(uint64_t a1)
{
  void *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "_hasColumn:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("SGMIFeatureStore.m"), 746, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _hasColumn:columnName]"));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_dropColumn:", *(_QWORD *)(a1 + 40));
}

uint64_t __38__SGMIDomainCountingTable_zeroColumn___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "_hasColumn:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("SGMIFeatureStore.m"), 734, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _hasColumn:columnName]"));

  }
  result = objc_msgSend(*(id *)(a1 + 32), "_zeroColumn:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_deleteZeroRows");
  return result;
}

uint64_t __37__SGMIDomainCountingTable_addColumn___block_invoke(uint64_t a1)
{
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "_hasColumn:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("SGMIFeatureStore.m"), 725, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![self _hasColumn:columnName]"));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_addColumn:", *(_QWORD *)(a1 + 40));
}

void __60__SGMIDomainCountingTable_numberOfRowsAssociatedWithDomain___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT COUNT(*) AS n FROM %@ WHERE domain = :domain OR (domain >= :domain || '.' AND domain < :domain || '/')"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__SGMIDomainCountingTable_numberOfRowsAssociatedWithDomain___block_invoke_2;
  v6[3] = &unk_1E7DB74A0;
  v7 = *(id *)(a1 + 40);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __60__SGMIDomainCountingTable_numberOfRowsAssociatedWithDomain___block_invoke_3;
  v5[3] = &unk_1E7DB7510;
  v5[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v3, v6, v5, 0);

}

uint64_t __60__SGMIDomainCountingTable_numberOfRowsAssociatedWithDomain___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":domain", *(_QWORD *)(a1 + 32));
}

uint64_t __60__SGMIDomainCountingTable_numberOfRowsAssociatedWithDomain___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnAlias:", "n");
  return *MEMORY[0x1E0D81788];
}

void __88__SGMIDomainCountingTable_enumerateChildrenOfDomain_greaterThan_depth_limit_usingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  __int128 v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  __CFString *v25;
  id v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[5];
  id v34;

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__30539;
  v33[4] = __Block_byref_object_dispose__30540;
  v34 = 0;
  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("."));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);
  if (v3)
    v4 = v3;
  else
    v4 = &stru_1E7DB83A8;
  v5 = v4;

  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v6);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (*(_QWORD *)(a1 + 48))
    v9 = CFSTR(" LIMIT :limit");
  else
    v9 = &stru_1E7DB83A8;
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("SELECT domain AS d, total as t FROM %@ WHERE (d >= MAX(:firstChildOfPrefix, COALESCE(:skipTo, ''), COALESCE(:greaterThan, ''))) AND (d IS NOT :greaterThan) AND (d < :firstAfterPrefix) ORDER BY d ASC%@"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), v9);
  v11 = MEMORY[0x1E0C809B0];
  do
  {
    v12 = (void *)MEMORY[0x1C3BD4F6C]();
    *((_BYTE *)v30 + 24) = 0;
    v13 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __88__SGMIDomainCountingTable_enumerateChildrenOfDomain_greaterThan_depth_limit_usingBlock___block_invoke_2;
    v23[3] = &unk_1E7DB5918;
    v28 = v33;
    v24 = *(id *)(a1 + 56);
    v14 = v5;
    v25 = v14;
    v15 = v7;
    v26 = v15;
    v27 = *(id *)(a1 + 48);
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __88__SGMIDomainCountingTable_enumerateChildrenOfDomain_greaterThan_depth_limit_usingBlock___block_invoke_3;
    v17[3] = &unk_1E7DB5940;
    v22 = *(_QWORD *)(a1 + 88);
    v16 = *(_QWORD *)(a1 + 40);
    v21 = *(_OWORD *)(a1 + 72);
    v17[4] = v16;
    v19 = v33;
    v20 = &v29;
    v18 = *(id *)(a1 + 64);
    objc_msgSend(v13, "prepAndRunQuery:onPrep:onRow:onError:", v10, v23, v17, 0);

    objc_autoreleasePoolPop(v12);
  }
  while (*((_BYTE *)v30 + 24));

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v33, 8);

}

void __88__SGMIDomainCountingTable_enumerateChildrenOfDomain_greaterThan_depth_limit_usingBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":skipTo", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":greaterThan", a1[4]);
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":firstChildOfPrefix", a1[5]);
  if (a1[6])
    objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":firstAfterPrefix");
  else
    objc_msgSend(v4, "bindNamedParam:toNonnullNSData:", ":firstAfterPrefix", *MEMORY[0x1E0D81688]);
  v3 = v4;
  if (a1[7])
  {
    objc_msgSend(v4, "bindNamedParam:toInt64AsNonnullNSNumber:", ":limit");
    v3 = v4;
  }

}

uint64_t __88__SGMIDomainCountingTable_enumerateChildrenOfDomain_greaterThan_depth_limit_usingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  unsigned __int8 *v13;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "nonnullNSStringForColumnAlias:", "d");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(*(id *)(a1 + 32), "_domainSegmentCount:", v4) - *(_QWORD *)(a1 + 64)) <= *(_QWORD *)(a1 + 72))
  {
    objc_msgSend(v3, "getIntegerForColumnAlias:", "t");
    v12 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v13 = (unsigned __int8 *)MEMORY[0x1E0D81780];
    if (!v12)
      v13 = (unsigned __int8 *)MEMORY[0x1E0D81788];
    v11 = *v13;
  }
  else
  {
    v5 = (void *)MEMORY[0x1C3BD4F6C]();
    v6 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("."), 6);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("SGMIFeatureStore.m"), 677, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lastDot != NSNotFound"));

    }
    objc_msgSend(v4, "substringToIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("/"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v11 = *MEMORY[0x1E0D81788];
    objc_autoreleasePoolPop(v5);
  }

  return v11;
}

void __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(a1 + 40), "_hasColumn:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v6)) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("SGMIFeatureStore.m"), 571, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _hasColumn:column]"));

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_pas_mappedArrayWithIndexedTransform:", &__block_literal_global_184);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v8, "_pas_componentsJoinedByString:", CFSTR(" "));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("SELECT domain AS d, CASE %@ ELSE -1 END AS c FROM %@ WHERE domain IN _pas_nsarray(:domains)"), v10, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));

      v12 = *(void **)(a1 + 48);
      v13 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
      v14 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke_3;
      v18[3] = &unk_1E7DB74A0;
      v19 = v12;
      v15[0] = v14;
      v15[1] = 3221225472;
      v15[2] = __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke_4;
      v15[3] = &unk_1E7DB6BE0;
      v16 = *(id *)(a1 + 32);
      v17 = *(id *)(a1 + 56);
      objc_msgSend(v13, "prepAndRunQuery:onPrep:onRow:onError:", v11, v18, v15, 0);

    }
  }
}

uint64_t __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSArray:", ":domains", *(_QWORD *)(a1 + 32));
}

uint64_t __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 *v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "getIntegerForColumnAlias:", "c");
  if (v4 != -1)
  {
    v5 = v4;
    objc_msgSend(v3, "nonnullNSStringForColumnAlias:", "d");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);

  }
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v8;
}

id __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WHEN %@ THEN %tu"), v4, a3);

  return v5;
}

void __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke(uint64_t a1)
{
  unint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  unint64_t v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(a1 + 40), "_hasColumn:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v7)) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("SGMIFeatureStore.m"), 534, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _hasColumn:column]"));

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  if (objc_msgSend(*(id *)(a1 + 48), "count") && v2)
  {
    if (v2 >= 0x7FFFFFFF)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("SGMIFeatureStore.m"), 539, CFSTR("columnCount %tu is too big"), v2);

    }
    objc_msgSend(*(id *)(a1 + 32), "_pas_mappedArrayWithTransform:", &__block_literal_global_179);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v9, "_pas_componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("SELECT %@, domain FROM %@ WHERE domain IN _pas_nsarray(:domains)"), v11, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));

    v13 = *(void **)(a1 + 48);
    v14 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_3;
    v21[3] = &unk_1E7DB74A0;
    v22 = v13;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_4;
    v17[3] = &unk_1E7DB5888;
    v20 = v2;
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 32);
    objc_msgSend(v14, "prepAndRunQuery:onPrep:onRow:onError:", v12, v21, v17, 0);

  }
}

uint64_t __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSArray:", ":domains", *(_QWORD *)(a1 + 32));
}

uint64_t __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(v3, "nonnullNSStringForColumn:", *(unsigned int *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_5;
  v10[3] = &unk_1E7DB5860;
  v11 = v3;
  v6 = v3;
  objc_msgSend(v5, "_pas_filteredArrayWithIndexedTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v4);

  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v8;
}

BOOL __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getIntegerForColumn:") != 0;
}

id __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", a2);
}

void __49__SGMIDomainCountingTable_countForColumn_domain___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  if ((objc_msgSend(*(id *)(a1 + 32), "_hasColumn:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("SGMIFeatureStore.m"), 505, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _hasColumn:column]"));

  }
  +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE domain = ?"), v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SGMIDomainCountingTable_countForColumn_domain___block_invoke_2;
  v8[3] = &unk_1E7DB74A0;
  v9 = *(id *)(a1 + 48);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __49__SGMIDomainCountingTable_countForColumn_domain___block_invoke_3;
  v7[3] = &unk_1E7DB7510;
  v7[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v3, v8, v7, 0);

}

uint64_t __49__SGMIDomainCountingTable_countForColumn_domain___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toNSString:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __49__SGMIDomainCountingTable_countForColumn_domain___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getIntegerForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

void __42__SGMIDomainCountingTable_totalForDomain___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(a2, "isEqual:", a1[4]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[5], CFSTR("SGMIFeatureStore.m"), 494, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[d isEqual:domain]"));

  }
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v8, "integerValue");
  *a4 = 1;

}

void __44__SGMIDomainCountingTable_totalsForDomains___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT domain AS d, total AS t FROM %@ WHERE domain IN _pas_nsarray(:domains)"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SGMIDomainCountingTable_totalsForDomains___block_invoke_2;
  v7[3] = &unk_1E7DB74A0;
  v8 = *(id *)(a1 + 40);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __44__SGMIDomainCountingTable_totalsForDomains___block_invoke_3;
  v5[3] = &unk_1E7DB6ED0;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v3, v7, v5, 0);

}

uint64_t __44__SGMIDomainCountingTable_totalsForDomains___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSArray:", ":domains", *(_QWORD *)(a1 + 32));
}

uint64_t __44__SGMIDomainCountingTable_totalsForDomains___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 *v6;

  v3 = a2;
  objc_msgSend(v3, "nonnullNSStringForColumnAlias:", "d");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "int64AsNonnullNSNumberForColumnAlias:", "t");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v6;
}

void __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a3, "integerValue");
  v7 = (uint64_t *)MEMORY[0x1E0C99778];
  if (v6 < 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("You can't commit a negative count"));
  objc_msgSend(a1[4], "_parentDomainsForDomain:", v5, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "addObjectsFromArray:", v8);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = *v7;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(a1[6], "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v12, CFSTR("You can't commit counts to both a parent and its child (you can't commit 1 to both foo and foo.bar)"));
        objc_msgSend(a1[7], "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17 + v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[7], "setObject:forKeyedSubscript:", v18, v14);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

}

void __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[13];

  v19[12] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT 1 FROM _pas_nsdictionary(:domainsAndCounts) WHERE EXISTS (SELECT domain FROM %@ WHERE (domain >= key || '.') AND (domain < key || '/'))"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_3;
  v17[3] = &unk_1E7DB74A0;
  v18 = v3;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v2, v17, &__block_literal_global_136_30605, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT 1 FROM _pas_nsset(:parentDomains) WHERE EXISTS (SELECT domain FROM %1$@ WHERE domain = value) AND NOT EXISTS (SELECT domain FROM %1$@ WHERE (domain >= value || '.') AND (domain < value || '/'))"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_5;
  v15[3] = &unk_1E7DB74A0;
  v16 = *(id *)(a1 + 48);
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v6, v15, &__block_literal_global_142, 0);
  +[SGMIDomainCountingTable _escapedSQLIdentifier:](SGMIDomainCountingTable, "_escapedSQLIdentifier:", *(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v19[0] = CFSTR("INSERT INTO");
  v19[1] = v9;
  v19[2] = CFSTR("(domain,");
  v19[3] = v8;
  v19[4] = CFSTR(", total)");
  v19[5] = CFSTR("SELECT key, value, value FROM _pas_nsdictionary(:domainsAndCascadedCounts) WHERE value != 0");
  v19[6] = CFSTR("ON CONFLICT(domain)");
  v19[7] = CFSTR("DO UPDATE SET");
  v19[8] = v8;
  v19[9] = CFSTR("=");
  v19[10] = v8;
  v19[11] = CFSTR("+ excluded.total, total = total + excluded.total");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_pas_componentsJoinedByString:", CFSTR(" "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_7;
  v13[3] = &unk_1E7DB74A0;
  v14 = *(id *)(a1 + 64);
  objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", v11, v13, 0, 0);

}

uint64_t __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSDictionary:", ":domainsAndCounts", *(_QWORD *)(a1 + 32));
}

uint64_t __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSSet:", ":parentDomains", *(_QWORD *)(a1 + 32));
}

uint64_t __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSDictionary:", ":domainsAndCascadedCounts", *(_QWORD *)(a1 + 32));
}

void __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  __break(1u);
}

void __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  __break(1u);
}

void __42__SGMIDomainCountingTable__deleteZeroRows__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE total IS 0"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(v1, "prepAndRunQuery:onPrep:onRow:onError:", v2, 0, 0, 0);

}

uint64_t __51__SGMIDomainCountingTable__recycleColumn_asColumn___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_zeroColumn:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ALTER TABLE %@ RENAME COLUMN %@ TO %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v3, 0, 0, 0);

  return objc_msgSend(*(id *)(a1 + 32), "_deleteZeroRows");
}

void __39__SGMIDomainCountingTable__zeroColumn___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  v2 = *(void **)(a1[4] + 8);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE %@ SET total = total - %@, %@ = 0 WHERE %@ IS NOT 0 RETURNING 1"), *(_QWORD *)(a1[4] + 24), a1[5], a1[5], a1[5]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SGMIDomainCountingTable__zeroColumn___block_invoke_2;
  v4[3] = &unk_1E7DB7510;
  v4[4] = a1[6];
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v3, 0, v4, 0);

}

uint64_t __39__SGMIDomainCountingTable__zeroColumn___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81780];
}

void __39__SGMIDomainCountingTable__dropColumn___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "_removeColumnFromTotal:", *(_QWORD *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "_deleteZeroRows");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ALTER TABLE %@ DROP COLUMN %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v3, 0, 0, 0);

}

void __50__SGMIDomainCountingTable__removeColumnFromTotal___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  v2 = *(void **)(a1[4] + 8);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE %@ SET total = total - %@ WHERE %@ IS NOT 0 RETURNING 1"), *(_QWORD *)(a1[4] + 24), a1[5], a1[5]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SGMIDomainCountingTable__removeColumnFromTotal___block_invoke_2;
  v4[3] = &unk_1E7DB7510;
  v4[4] = a1[6];
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v3, 0, v4, 0);

}

uint64_t __50__SGMIDomainCountingTable__removeColumnFromTotal___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E0D81780];
}

void __51__SGMIDomainCountingTable__mergeColumn_intoColumn___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[15];

  v8[14] = *MEMORY[0x1E0C80C00];
  v1 = a1[4];
  v2 = a1[5];
  v3 = *(void **)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 24);
  v8[0] = CFSTR("UPDATE");
  v8[1] = v4;
  v8[2] = CFSTR("SET");
  v8[3] = v2;
  v8[4] = CFSTR("=");
  v8[5] = v2;
  v5 = a1[6];
  v8[6] = CFSTR("+");
  v8[7] = v5;
  v8[8] = CFSTR(",");
  v8[9] = v5;
  v8[10] = CFSTR("= 0");
  v8[11] = CFSTR("WHERE");
  v8[12] = v5;
  v8[13] = CFSTR("IS NOT 0");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pas_componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", v7, 0, 0, 0);

}

void __38__SGMIDomainCountingTable__addColumn___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ALTER TABLE %@ ADD COLUMN %@ DEFAULT 0 NOT NULL"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "prepAndRunQuery:onPrep:onRow:onError:", v2, 0, 0, 0);

}

void __54__SGMIDomainCountingTable__readCurrentColumnsUncached__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA table_info(%@)"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SGMIDomainCountingTable__readCurrentColumnsUncached__block_invoke_2;
  v4[3] = &unk_1E7DB6ED0;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v3, 0, v4, 0);

}

uint64_t __54__SGMIDomainCountingTable__readCurrentColumnsUncached__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumn:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", CFSTR("domain")) & 1) == 0
    && (objc_msgSend(v3, "isEqual:", CFSTR("total")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __42__SGMIDomainCountingTable__currentColumns__block_invoke(uint64_t a1)
{
  __int128 v1;
  void *v2;
  _QWORD v4[4];
  __int128 v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SGMIDomainCountingTable__currentColumns__block_invoke_2;
  v4[3] = &unk_1E7DB5718;
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = v1;
  return objc_msgSend(v2, "runWithLockAcquired:", v4);
}

void __42__SGMIDomainCountingTable__currentColumns__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_updateSchemaVersion");
  objc_msgSend(v9, "currentColumns");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_readCurrentColumnsUncached");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(v9, "setCurrentColumns:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }

}

uint64_t __47__SGMIDomainCountingTable__updateSchemaVersion__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SGMIDomainCountingTable__updateSchemaVersion__block_invoke_2;
  v4[3] = &unk_1E7DB6ED0;
  v4[4] = v1;
  return objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("PRAGMA schema_version"), 0, v4, 0);
}

uint64_t __47__SGMIDomainCountingTable__updateSchemaVersion__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v6[5];

  v3 = objc_msgSend(a2, "getIntegerForColumn:", 0);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SGMIDomainCountingTable__updateSchemaVersion__block_invoke_3;
  v6[3] = &__block_descriptor_40_e44_v16__0__SGMIDomainCountingTableGuardedData_8l;
  v6[4] = v3;
  objc_msgSend(v4, "runWithLockAcquired:", v6);
  return *MEMORY[0x1E0D81788];
}

uint64_t __47__SGMIDomainCountingTable__updateSchemaVersion__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSchemaVersion:", *(_QWORD *)(a1 + 32));
}

+ (id)domainForStringTokens:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_53_30696);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v6;
}

+ (id)stringTokensFromDomain:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_62_30689);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v6;
}

+ (id)domainByAppendingToken:(id)a3 toDomain:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domainForStringTokens:", v9, v14, v15[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_pas_componentsJoinedByString:", CFSTR("."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_escapedSQLIdentifier:(id)a3
{
  __CFString *v3;
  void *v4;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  UniChar v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFIndex v20;
  void *v21;
  id v22;
  void *v23;
  __CFString *v24;
  void *v26;
  void *v27;
  UniChar buffer[8];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CFStringRef theString;
  const UniChar *v37;
  const char *v38;
  uint64_t v39;
  CFIndex v40;
  uint64_t v41;
  uint64_t v42;
  CFRange v43;

  v3 = (__CFString *)a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_31;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  *(_OWORD *)buffer = 0u;
  v29 = 0u;
  Length = CFStringGetLength(v3);
  theString = v3;
  v39 = 0;
  v40 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  v37 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  v41 = 0;
  v42 = 0;
  v38 = CStringPtr;
  if (Length >= 1)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 64;
    while (1)
    {
      v13 = (unint64_t)v11 >= 4 ? 4 : v11;
      v14 = v40;
      if (v40 <= v11)
        break;
      if (v37)
      {
        v15 = v37[v11 + v39];
      }
      else if (v38)
      {
        v15 = v38[v39 + v11];
      }
      else
      {
        if (v42 <= v11 || v9 > v11)
        {
          v17 = v13 + v8;
          v18 = v12 - v13;
          v19 = v11 - v13;
          v20 = v19 + 64;
          if (v19 + 64 >= v40)
            v20 = v40;
          v41 = v19;
          v42 = v20;
          if (v40 >= v18)
            v14 = v18;
          v43.length = v14 + v17;
          v43.location = v19 + v39;
          CFStringGetCharacters(theString, v43, buffer);
          v9 = v41;
        }
        v15 = buffer[v11 - v9];
      }
      switch(v15)
      {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          if ((v10 & 1) == 0)
            goto LABEL_28;
          break;
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'L':
        case 'M':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
        case 'S':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
        case 'Z':
        case '_':
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'q':
        case 'r':
        case 's':
        case 't':
        case 'u':
        case 'v':
        case 'w':
        case 'x':
        case 'y':
        case 'z':
          break;
        default:
          goto LABEL_28;
      }
      ++v11;
      --v8;
      ++v12;
      v10 = 1;
      if (Length == v11)
        goto LABEL_31;
    }
LABEL_28:
    v21 = (void *)MEMORY[0x1C3BD4F6C]();
    if (-[__CFString rangeOfString:options:](v3, "rangeOfString:options:", &stru_1E7DD7D28, 2) != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[__CFString dataUsingEncoding:](v3, "dataUsingEncoding:", 10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "base64EncodedStringWithOptions:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid SQL identifier (cannot contain interior null). b64 utf16: %@"), v27);
    }
    v22 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[__CFString stringByReplacingOccurrencesOfString:withString:options:range:](v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\"\"), 2, 0, -[__CFString length](v3, "length"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (__CFString *)objc_msgSend(v22, "initWithFormat:", CFSTR("\"%@\"), v23);

    objc_autoreleasePoolPop(v21);
  }
  else
  {
LABEL_31:

    v24 = v3;
  }

  return v24;
}

+ (void)createTableNamed:(id)a3 inDatabase:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_escapedSQLIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("_zeroTotalIdx"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_escapedSQLIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__SGMIDomainCountingTable_createTableNamed_inDatabase___block_invoke;
  v14[3] = &unk_1E7DB7800;
  v15 = v6;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v6;
  objc_msgSend(v13, "writeTransaction:", v14);

}

void __55__SGMIDomainCountingTable_createTableNamed_inDatabase___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CREATE TABLE %@ (domain TEXT PRIMARY KEY NOT NULL, total INT NOT NULL) WITHOUT ROWID"), a1[5]);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", v3, 0, 0, 0);

  v4 = (void *)a1[4];
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CREATE INDEX %@ ON %@ (domain) WHERE total IS 0"), a1[6], a1[5]);
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v5, 0, 0, 0);

}

id __50__SGMIDomainCountingTable_stringTokensFromDomain___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("^^"), CFSTR("."), 2, 0, objc_msgSend(v2, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("^ "), CFSTR("^"), 2, 0, objc_msgSend(v3, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __49__SGMIDomainCountingTable_domainForStringTokens___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("^"), CFSTR("^ "), 2, 0, objc_msgSend(v2, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("."), CFSTR("^^"), 2, 0, objc_msgSend(v3, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
