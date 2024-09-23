@implementation MLITDBGeniusDatabase

- (MLITDBGeniusDatabase)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MLITDBGeniusDatabase;
  return -[MLITDBGeniusDatabase init](&v3, sel_init);
}

- (ML3MusicLibrary)musicLibrary
{
  return +[ML3MusicLibrary autoupdatingSharedLibrary](ML3MusicLibrary, "autoupdatingSharedLibrary");
}

- (void)performGeniusDatabaseReadWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MLITDBGeniusDatabase musicLibrary](self, "musicLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__MLITDBGeniusDatabase_performGeniusDatabaseReadWithBlock___block_invoke;
  v7[3] = &unk_1E5B62CA0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "databaseConnectionAllowingWrites:withBlock:", 0, v7);

}

- (BOOL)_hasRowsInTable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT COUNT() FROM %@ LIMIT 1"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__MLITDBGeniusDatabase__hasRowsInTable___block_invoke;
  v8[3] = &unk_1E5B64FE0;
  v6 = v5;
  v9 = v6;
  v10 = &v11;
  -[MLITDBGeniusDatabase performGeniusDatabaseReadWithBlock:](self, "performGeniusDatabaseReadWithBlock:", v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (unsigned)_getInt32ValueInTable:(id)a3 column:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM %@ LIMIT 1"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__MLITDBGeniusDatabase__getInt32ValueInTable_column___block_invoke;
  v11[3] = &unk_1E5B64FE0;
  v9 = v8;
  v12 = v9;
  v13 = &v14;
  -[MLITDBGeniusDatabase performGeniusDatabaseReadWithBlock:](self, "performGeniusDatabaseReadWithBlock:", v11);
  LODWORD(self) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return self;
}

- (unint64_t)_getInt64ValueInTable:(id)a3 column:(id)a4 where:(id)a5 limit:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  id v16;
  unint64_t v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((_DWORD)v6)
    v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" LIMIT %d"), v6);
  else
    v13 = &stru_1E5B66908;
  if (objc_msgSend(v12, "length"))
    v14 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" WHERE %@"), v12);
  else
    v14 = &stru_1E5B66908;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT %@ FROM %@%@%@"), v11, v10, v14, v13);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__MLITDBGeniusDatabase__getInt64ValueInTable_column_where_limit___block_invoke;
  v19[3] = &unk_1E5B64FE0;
  v16 = v15;
  v20 = v16;
  v21 = &v22;
  -[MLITDBGeniusDatabase performGeniusDatabaseReadWithBlock:](self, "performGeniusDatabaseReadWithBlock:", v19);
  v17 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v17;
}

- (BOOL)_copyBlobData:(id *)a3 blobAllocType:(int)a4 table:(id)a5 blobColumn:(id)a6 where:(id)a7
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  void *v14;
  id v15;
  id v16;
  char v17;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t *v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  if (objc_msgSend(v12, "length"))
    v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" WHERE %@"), v12);
  else
    v13 = &stru_1E5B66908;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT %@ FROM %@%@ LIMIT 1"), v11, v10, v13);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__10393;
  v36[4] = __Block_byref_object_dispose__10394;
  if (a3)
    v15 = *a3;
  else
    v15 = 0;
  v37 = v15;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__10393;
  v34[4] = __Block_byref_object_dispose__10394;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__10393;
  v32 = __Block_byref_object_dispose__10394;
  v33 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__MLITDBGeniusDatabase__copyBlobData_blobAllocType_table_blobColumn_where___block_invoke;
  v21[3] = &unk_1E5B62CC8;
  v16 = v14;
  v22 = v16;
  v23 = v34;
  v27 = a4;
  v24 = v36;
  v25 = &v38;
  v26 = &v28;
  -[MLITDBGeniusDatabase performGeniusDatabaseReadWithBlock:](self, "performGeniusDatabaseReadWithBlock:", v21);
  if (a3)
    *a3 = objc_retainAutorelease((id)v29[5]);
  v17 = *((_BYTE *)v39 + 24);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  return v17;
}

- (id)_copyBlobDataAndBytesInTable:(id)a3 blobColumn:(id)a4 where:(id)a5
{
  id v6;

  v6 = 0;
  -[MLITDBGeniusDatabase _copyBlobData:blobAllocType:table:blobColumn:where:](self, "_copyBlobData:blobAllocType:table:blobColumn:where:", &v6, 0, a3, a4, a5);
  return v6;
}

- (BOOL)_readBlobIntoData:(id)a3 table:(id)a4 blobColumn:(id)a5 where:(id)a6
{
  id v10;
  id v11;
  id v13;

  v13 = a3;
  v10 = a3;
  LOBYTE(a6) = -[MLITDBGeniusDatabase _copyBlobData:blobAllocType:table:blobColumn:where:](self, "_copyBlobData:blobAllocType:table:blobColumn:where:", &v13, 1, a4, a5, a6);
  v11 = v13;

  return (char)a6;
}

- (BOOL)_readBlobForRowID:(unint64_t)a3 intoData:(id)a4 table:(const char *)a5 blobColumn:(const char *)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  const char *v16;
  const char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v10 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__MLITDBGeniusDatabase__readBlobForRowID_intoData_table_blobColumn___block_invoke;
  v13[3] = &unk_1E5B62CF0;
  v16 = a5;
  v17 = a6;
  v18 = a3;
  v11 = v10;
  v14 = v11;
  v15 = &v19;
  -[MLITDBGeniusDatabase performGeniusDatabaseReadWithBlock:](self, "performGeniusDatabaseReadWithBlock:", v13);
  LOBYTE(a5) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)a5;
}

- (BOOL)_hasAnySongs
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  +[ML3BitMaskPredicate predicateWithProperty:mask:value:](ML3BitMaskPredicate, "predicateWithProperty:mask:value:", CFSTR("media_type"), 1032, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLITDBGeniusDatabase musicLibrary](self, "musicLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity queryWithLibrary:predicate:orderingTerms:](ML3Track, "queryWithLibrary:predicate:orderingTerms:", v4, v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasEntities");

  return v6;
}

- (BOOL)hasGeniusDataAvailable
{
  _BOOL4 v3;

  v3 = -[MLITDBGeniusDatabase _hasAnySongs](self, "_hasAnySongs");
  if (v3)
    LOBYTE(v3) = -[MLITDBGeniusDatabase _hasRowsInTable:](self, "_hasRowsInTable:", CFSTR("genius_metadata"));
  return v3;
}

- (BOOL)hasGeniusFeatureEnabled
{
  return -[MLITDBGeniusDatabase _hasRowsInTable:](self, "_hasRowsInTable:", CFSTR("genius_config"));
}

- (unint64_t)defaultMinTrackCount
{
  unint64_t result;

  LODWORD(result) = -[MLITDBGeniusDatabase _getInt32ValueInTable:column:](self, "_getInt32ValueInTable:column:", CFSTR("genius_config"), CFSTR("min_num_results"));
  if ((_DWORD)result)
    return result;
  else
    return 2;
}

- (unint64_t)defaultTrackCount
{
  unint64_t result;

  LODWORD(result) = -[MLITDBGeniusDatabase _getInt32ValueInTable:column:](self, "_getInt32ValueInTable:column:", CFSTR("genius_config"), CFSTR("default_num_results"));
  if ((_DWORD)result)
    return result;
  else
    return 25;
}

- (id)copyGeniusConfigrationDataAndBytes
{
  return -[MLITDBGeniusDatabase _copyBlobDataAndBytesInTable:blobColumn:where:](self, "_copyBlobDataAndBytesInTable:blobColumn:where:", CFSTR("genius_config"), CFSTR("data"), 0);
}

- (unsigned)geniusConfigurationVersion
{
  return -[MLITDBGeniusDatabase _getInt32ValueInTable:column:](self, "_getInt32ValueInTable:column:", CFSTR("genius_config"), CFSTR("version"));
}

- (id)copyGeniusMetadataDataAndBytesForGlobalID:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("genius_id = %llu"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MLITDBGeniusDatabase _copyBlobDataAndBytesInTable:blobColumn:where:](self, "_copyBlobDataAndBytesInTable:blobColumn:where:", CFSTR("genius_metadata"), CFSTR("data"), v4);

  return v5;
}

- (id)copyGeniusSimilaritiesDataAndBytesForGlobalID:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("genius_id = %llu"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MLITDBGeniusDatabase _copyBlobDataAndBytesInTable:blobColumn:where:](self, "_copyBlobDataAndBytesInTable:blobColumn:where:", CFSTR("genius_similarities"), CFSTR("data"), v4);

  return v5;
}

- (BOOL)getGeniusConfigrationDataAndBytesIntoData:(id)a3
{
  return -[MLITDBGeniusDatabase _readBlobIntoData:table:blobColumn:where:](self, "_readBlobIntoData:table:blobColumn:where:", a3, CFSTR("genius_config"), CFSTR("data"), 0);
}

- (BOOL)getGeniusMetadataDataAndBytesForGlobalID:(unint64_t)a3 intoData:(id)a4
{
  return -[MLITDBGeniusDatabase _readBlobForRowID:intoData:table:blobColumn:](self, "_readBlobForRowID:intoData:table:blobColumn:", a3, a4, "genius_metadata", "data");
}

- (BOOL)getGeniusSimilaritiesDataAndBytesForGlobalID:(unint64_t)a3 intoData:(id)a4
{
  return -[MLITDBGeniusDatabase _readBlobForRowID:intoData:table:blobColumn:](self, "_readBlobForRowID:intoData:table:blobColumn:", a3, a4, "genius_similarities", "data");
}

void __68__MLITDBGeniusDatabase__readBlobForRowID_intoData_table_blobColumn___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v3, "stringWithUTF8String:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1[7]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openBlobInTable:column:row:readOnly:", v6, v7, a1[8], 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v8, "readData:numberOfBytes:offset:", a1[4], objc_msgSend(v8, "length"), 0) == 0;

}

void __75__MLITDBGeniusDatabase__copyBlobData_blobAllocType_table_blobColumn_where___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(a2, "executeQuery:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = 3221225472;
  v6[2] = __75__MLITDBGeniusDatabase__copyBlobData_blobAllocType_table_blobColumn_where___block_invoke_2;
  v6[3] = &unk_1E5B65200;
  v6[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v3, "enumerateRowsWithBlock:", v6);
  v4 = *(_DWORD *)(a1 + 72);
  if (v4 == 1)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else if (!v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                           + 40) != 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }

}

void __75__MLITDBGeniusDatabase__copyBlobData_blobAllocType_table_blobColumn_where___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "dataForColumnIndex:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __65__MLITDBGeniusDatabase__getInt64ValueInTable_column_where_limit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  objc_msgSend(a2, "executeQuery:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__MLITDBGeniusDatabase__getInt64ValueInTable_column_where_limit___block_invoke_2;
  v4[3] = &unk_1E5B65200;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "enumerateRowsWithBlock:", v4);

}

uint64_t __65__MLITDBGeniusDatabase__getInt64ValueInTable_column_where_limit___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "int64ForColumnIndex:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __53__MLITDBGeniusDatabase__getInt32ValueInTable_column___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  objc_msgSend(a2, "executeQuery:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__MLITDBGeniusDatabase__getInt32ValueInTable_column___block_invoke_2;
  v4[3] = &unk_1E5B65200;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "enumerateRowsWithBlock:", v4);

}

uint64_t __53__MLITDBGeniusDatabase__getInt32ValueInTable_column___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "intForColumnIndex:", 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __40__MLITDBGeniusDatabase__hasRowsInTable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  objc_msgSend(a2, "executeQuery:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__MLITDBGeniusDatabase__hasRowsInTable___block_invoke_2;
  v4[3] = &unk_1E5B65200;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "enumerateRowsWithBlock:", v4);

}

uint64_t __40__MLITDBGeniusDatabase__hasRowsInTable___block_invoke_2(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3;

  if (!a3)
  {
    v3 = result;
    result = objc_msgSend(a2, "intForColumnIndex:");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = (int)result > 0;
  }
  return result;
}

uint64_t __59__MLITDBGeniusDatabase_performGeniusDatabaseReadWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)sharedGeniusDatabase
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)sharedGeniusDatabase_instance;
  if (!sharedGeniusDatabase_instance)
  {
    v3 = objc_alloc_init((Class)objc_opt_class());
    v4 = (void *)sharedGeniusDatabase_instance;
    sharedGeniusDatabase_instance = (uint64_t)v3;

    v2 = (void *)sharedGeniusDatabase_instance;
  }
  return v2;
}

@end
