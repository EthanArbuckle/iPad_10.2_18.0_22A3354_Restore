@implementation _PASSqliteDatabase(ATXExtras)

- (uint64_t)atx_countRowsOfTable:()ATXExtras returnValueOnError:
{
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT count(*) FROM %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v10[5] = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73___PASSqliteDatabase_ATXExtras__atx_countRowsOfTable_returnValueOnError___block_invoke;
  v11[3] = &unk_1E82DCC00;
  v11[4] = &v12;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73___PASSqliteDatabase_ATXExtras__atx_countRowsOfTable_returnValueOnError___block_invoke_2;
  v10[3] = &unk_1E82DCC78;
  v10[4] = &v12;
  objc_msgSend(a1, "prepAndRunQuery:onPrep:onRow:onError:", v7, 0, v11, v10);
  v8 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (uint64_t)atx_countRowsOfTable:()ATXExtras
{
  return objc_msgSend(a1, "atx_countRowsOfTable:returnValueOnError:", a3, 0);
}

@end
