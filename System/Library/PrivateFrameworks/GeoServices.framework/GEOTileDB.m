@implementation GEOTileDB

uint64_t __38__GEOTileDB__isTileSetTTLExpired_age___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  double *i;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 80);
  if (v2)
  {
    for (i = (double *)(*(_QWORD *)(v1 + 72) + 8); *((_DWORD *)i - 2) != *(_DWORD *)(result + 56); i += 2)
    {
      if (!--v2)
        return result;
    }
    if (*(double *)(result + 48) > *i)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void __64__GEOTileDB_dataForKeys_reason_group_callbackQueue_dataHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v2);
      v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
      v8 = (void *)MEMORY[0x18D764E2C](v3);
      LODWORD(v7) = objc_msgSend(*(id *)(a1 + 40), "_dataForKeyOnDBQueue:reason:callbackQueue:dataHandler:", v7, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), (_QWORD)v10);
      objc_autoreleasePoolPop(v8);
      if (!(_DWORD)v7)
        break;
      if (v4 == ++v6)
      {
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v4 = v3;
        if (v3)
          goto LABEL_3;
        break;
      }
    }
  }

  v9 = *(NSObject **)(a1 + 56);
  if (v9)
    dispatch_group_leave(v9);
}

- (void)_setLastAccessTimeOnDBQueue:(uint64_t)a3 forKey:(int *)a4
{
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *a4;
  v7 = a4[1];
  v8 = a4[2];
  v9 = a4[3];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -1;
  v10 = (void *)a1[1];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__GEOTileDB__setLastAccessTimeOnDBQueue_forKey___block_invoke;
  v11[3] = &unk_1E1C00C30;
  v11[4] = &v12;
  LookupTileRowForKey(v10, v6, v7, v8, v9, v11);
  if (v13[3] != -1)
    objc_msgSend(a1, "_setLastAccessTimeOnDBQueue:forDataRow:", a2);
  _Block_object_dispose(&v12, 8);
}

- (void)_setLastAccessTimeOnDBQueue:(double)a3 forDataRow:(int64_t)a4
{
  GEOSQLiteDB *db;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  db = self->_db;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__GEOTileDB__setLastAccessTimeOnDBQueue_forDataRow___block_invoke;
  v12[3] = &unk_1E1C00D98;
  v12[4] = self;
  v12[5] = &v17;
  v12[6] = &v13;
  v12[7] = a4;
  if (-[GEOSQLiteDB statementForKey:statementBlock:](db, "statementForKey:statementBlock:", CFSTR("GetAccessTime"), v12))
  {
    v8 = (uint64_t)(*MEMORY[0x1E0C9ADF8] + a3);
    if (!*((_BYTE *)v18 + 24))
      goto LABEL_6;
    v9 = v8 - v14[3];
    if (v9 < 0)
      v9 = v14[3] - v8;
    if (self->_timestampDeltaWriteThreshold >= (double)v9)
    {
      GEOGetTileDBLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = v8 - v14[3];
        *(_DWORD *)buf = 134217984;
        v22 = v11;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "Last-access timestamp has not changed sufficiently (only %lli). Not writing.", buf, 0xCu);
      }

    }
    else
    {
LABEL_6:
      UpdateAccessTime(self->_db, a4, v8 & ~(v8 >> 63));
    }
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

- (BOOL)_dataForKeyOnDBQueue:(__int128 *)a3 reason:(unsigned int)a4 callbackQueue:(void *)a5 dataHandler:(void *)a6
{
  __int128 *v8;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD *v17;
  id v18;
  _QWORD *v19;
  NSObject *v20;
  id v21;
  _GEOTileDBUpdateAccessTimeOperation *v22;
  _GEOTileDBUpdateAccessTimeOperation *v23;
  _BOOL8 v24;
  __int128 v26;
  _QWORD v27[11];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  id obj;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  char v39;
  _QWORD v40[4];
  _QWORD v41[3];
  _BYTE v42[8];
  _QWORD v43[5];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  __int128 *v49;
  _QWORD v50[5];
  id v51;
  _QWORD block[4];
  id v53;
  uint8_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  __int128 v60;
  uint8_t buf[8];
  __int128 v62;
  void *v63;
  id v64;
  id v65;
  _QWORD *v66;
  __int128 v67;
  uint64_t v68;

  v8 = a3;
  v68 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v10 = a5;
  v11 = a6;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__5;
  v43[4] = __Block_byref_object_dispose__5;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42[0] = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  v39 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5;
  v37 = __Block_byref_object_dispose__5;
  v12 = *(void **)(a1 + 16);
  obj = 0;
  objc_msgSend(v12, "dataForKey:ETag:originalLoadReason:isKnownNotToExist:", v8, &obj, v42, &v39);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v44, obj);
  v38 = v13;
  v14 = MEMORY[0x1E0C809B0];
  if (v34[5])
  {
    *((_BYTE *)v46 + 24) = 1;
  }
  else if (!v39)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v15 = *(void **)(a1 + 8);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __67__GEOTileDB__dataForKeyOnDBQueue_reason_callbackQueue_dataHandler___block_invoke;
    v27[3] = &unk_1E1C00B40;
    v27[4] = a1;
    v27[5] = v40;
    v27[6] = &v28;
    v27[7] = &v33;
    v27[8] = v43;
    v27[9] = &v45;
    v27[10] = v41;
    v26 = *v8;
    v16 = v15;
    v17 = v27;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = __Block_byref_object_copy__5;
    v50[4] = __Block_byref_object_dispose__5;
    v51 = 0;
    *(_QWORD *)buf = v14;
    *(_QWORD *)&v62 = 3221225472;
    *((_QWORD *)&v62 + 1) = __GetDataForKey_block_invoke;
    v63 = &unk_1E1C01A60;
    v18 = v16;
    v64 = v18;
    v66 = v50;
    v67 = v26;
    v19 = v17;
    v65 = v19;
    objc_msgSend(v18, "statementForKey:statementBlock:", CFSTR("GetDataForKey"), buf);

    _Block_object_dispose(v50, 8);
    if (*((_BYTE *)v29 + 24))
    {
      GEOGetTileDBLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157955;
        *(_DWORD *)&buf[4] = 8;
        LOWORD(v62) = 2097;
        *(_QWORD *)((char *)&v62 + 2) = &v49;
        _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "Key %{private,geo:TileKey}.*P references nonexistent external file", buf, 0x12u);
      }

      objc_msgSend((id)a1, "_deleteDataOnDBQueueForKey:", v49);
    }
    _Block_object_dispose(&v28, 8);
    v8 = v49;
  }
  v60 = *v8;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v62 = buf;
  *((_QWORD *)&v62 + 1) = 0x2020000000;
  LOBYTE(v63) = 1;
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __67__GEOTileDB__dataForKeyOnDBQueue_reason_callbackQueue_dataHandler___block_invoke_413;
  block[3] = &unk_1E1C00B68;
  v54 = buf;
  v21 = v11;
  v53 = v21;
  v55 = &v33;
  v56 = &v45;
  v57 = v43;
  v58 = v41;
  v59 = v40;
  dispatch_sync(v10, block);
  if (a4 <= 4 && ((1 << a4) & 0x13) != 0)
  {
    v22 = [_GEOTileDBUpdateAccessTimeOperation alloc];
    v23 = -[_GEOTileDBUpdateAccessTimeOperation initWithTileKey:timestamp:](v22, "initWithTileKey:timestamp:", v49, CFAbsoluteTimeGetCurrent());
    objc_msgSend(*(id *)(a1 + 16), "addOperation:", v23);

  }
  v24 = *(_BYTE *)(v62 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

  _Block_object_dispose(&v45, 8);
  return v24;
}

uint64_t __52__GEOTileDB__setLastAccessTimeOnDBQueue_forDataRow___block_invoke(_QWORD *a1, sqlite3_stmt *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  if (!objc_msgSend(*(id *)(a1[4] + 8), "bindInt64Parameter:toValue:inStatement:error:", "@data_pk", a1[7], a2, 0)|| sqlite3_step(a2) != 100)
  {
    return 0;
  }
  v4 = sqlite3_column_type(a2, 0);
  v5 = *(_QWORD *)(a1[5] + 8);
  if (v4 == 5)
  {
    *(_BYTE *)(v5 + 24) = 0;
    return 1;
  }
  else
  {
    v6 = 1;
    *(_BYTE *)(v5 + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 8), "int64ForColumn:inStatment:", 0, a2);
  }
  return v6;
}

uint64_t __67__GEOTileDB__dataForKeyOnDBQueue_reason_callbackQueue_dataHandler___block_invoke(uint64_t a1, unsigned int a2, unint64_t a3, void *a4, void *a5, void *a6, char a7, char a8)
{
  id v15;
  id v16;
  id v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  GEOTileData *v25;
  uint64_t v26;
  void *v27;
  id v28;
  GEOTileData *v29;
  uint64_t v30;
  char v32;
  unsigned int v33;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  *(CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFAbsoluteTimeGetCurrent()
                                                                      + *MEMORY[0x1E0C9ADF8]
                                                                      - (double)a3;
  if (v16)
  {
    v32 = a7;
    v33 = a2;
    v18 = a8;
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    objc_msgSend(v16, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URLByAppendingPathComponent:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "fileExistsAtPath:", v23);

    if (!v24)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

      goto LABEL_11;
    }
    v25 = -[GEOTileData initWithFileURL:]([GEOTileData alloc], "initWithFileURL:", v21);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;
    a8 = v18;
    a7 = v32;
    a2 = v33;
  }
  else
  {
    if (v15)
    {
      v28 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v28;
    v29 = -[GEOTileData initWithData:]([GEOTileData alloc], "initWithData:", v28);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v27 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a7;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = a8;
  if (objc_msgSend(*(id *)(a1 + 32), "_isTileSetTTLExpired:age:", a2, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)))*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
LABEL_11:

  return 0;
}

- (BOOL)_isTileSetTTLExpired:(id)a3 age:(double)a4
{
  char v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  geo_assert_not_isolated();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  geo_isolate_sync_data();
  v4 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v4;
}

uint64_t __48__GEOTileDB__setLastAccessTimeOnDBQueue_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __35__GEOTileDB__performInTransaction___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

- (void)_performInTransaction:(id)a3
{
  id v4;
  GEOSQLiteDB *db;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__GEOTileDB__performInTransaction___block_invoke;
  v7[3] = &unk_1E1C00910;
  v8 = v4;
  v6 = v4;
  -[GEOSQLiteDB executeInTransaction:](db, "executeInTransaction:", v7);

}

uint64_t __38__GEOTileDB_calculateFreeableSizeSync__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_allTileDataSize");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_allTileDataSize
{
  unint64_t v3;
  GEOSQLiteDB *v4;
  GEOSQLiteDB *v5;
  _QWORD v7[4];
  GEOSQLiteDB *v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;

  if (self->_tileDataSizeIsValid)
    return self->_tileDataSize;
  v4 = self->_db;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__5;
  v15[4] = __Block_byref_object_dispose__5;
  v16 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __CalculateTotalTileDataSize_block_invoke;
  v7[3] = &unk_1E1C019C0;
  v9 = &v11;
  v5 = v4;
  v8 = v5;
  v10 = v15;
  -[GEOSQLiteDB statementForKey:statementBlock:](v5, "statementForKey:statementBlock:", CFSTR("CalculateTotalTileDataSize"), v7);
  v3 = v12[3];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v15, 8);

  self->_tileDataSize = v3;
  self->_tileDataSizeIsValid = 1;
  return v3;
}

- (void)dataForKeys:(id)a3 reason:(unsigned __int8)a4 group:(id)a5 callbackQueue:(id)a6 dataHandler:(id)a7
{
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  GEOSQLiteDB *db;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  GEOTileDB *v29;
  id v30;
  NSObject *v31;
  id v32;
  unsigned __int8 v33;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v13)
    dispatch_group_enter(v13);
  db = self->_db;
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __64__GEOTileDB_dataForKeys_reason_group_callbackQueue_dataHandler___block_invoke;
  v27[3] = &unk_1E1C00B90;
  v28 = v12;
  v29 = self;
  v33 = a4;
  v30 = v14;
  v32 = v15;
  v31 = v13;
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __64__GEOTileDB_dataForKeys_reason_group_callbackQueue_dataHandler___block_invoke_2;
  v22[3] = &unk_1E1C00BE0;
  v23 = v30;
  v24 = v28;
  v25 = v31;
  v26 = v32;
  v18 = v31;
  v19 = v32;
  v20 = v28;
  v21 = v30;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v27, v22);

}

- (void)_performOnDBQueue:(id)a3
{
  -[GEOSQLiteDB executeAsync:](self->_db, "executeAsync:", a3);
}

- (NSString)devicePostureCountry
{
  NSString *v3;
  geo_isolater *v5;

  v5 = self->_infrequentlyChangingMetadataIsolater;
  _geo_isolate_lock_data();
  v3 = self->_devicePostureCountry;
  _geo_isolate_unlock();

  return v3;
}

- (NSString)devicePostureRegion
{
  NSString *v3;
  geo_isolater *v5;

  v5 = self->_infrequentlyChangingMetadataIsolater;
  _geo_isolate_lock_data();
  v3 = self->_devicePostureRegion;
  _geo_isolate_unlock();

  return v3;
}

- (unint64_t)calculateFreeableSizeSync
{
  GEOSQLiteDB *db;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__GEOTileDB_calculateFreeableSizeSync__block_invoke;
  v5[3] = &unk_1E1C00760;
  v5[4] = self;
  v5[5] = &v6;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (GEOTileDB)init
{
  GEOTileDB *result;

  result = (GEOTileDB *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOTileDB)initWithDBDirectory:(id)a3 externalFilesDirectory:(id)a4
{
  return -[GEOTileDB initWithDBDirectory:externalFilesDirectory:manifestManager:countryConfiguration:offlineDataConfiguration:locale:maximumDatabaseSize:](self, "initWithDBDirectory:externalFilesDirectory:manifestManager:countryConfiguration:offlineDataConfiguration:locale:maximumDatabaseSize:", a3, a4, 0, 0, 0, 0, 524288000);
}

- (GEOTileDB)initWithDBDirectory:(id)a3 externalFilesDirectory:(id)a4 manifestManager:(id)a5 countryConfiguration:(id)a6 offlineDataConfiguration:(id)a7 locale:(id)a8 maximumDatabaseSize:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  GEOTileDB *v20;
  uint64_t v21;
  geo_isolater *infrequentlyChangingMetadataIsolater;
  uint64_t v23;
  geo_isolater *createdExternalDataDirectoryIsolater;
  GEOResourceManifestManager *v25;
  GEOResourceManifestManager *manifestManager;
  GEOCountryConfiguration *v27;
  GEOCountryConfiguration *countryConfiguration;
  GEOOfflineDataConfiguration *v29;
  GEOOfflineDataConfiguration *offlineDataConfiguration;
  GEOObserverHashTable *v31;
  void *global_queue;
  uint64_t v33;
  GEOObserverHashTable *observers;
  double Uint64;
  _GEOTileDBWriteQueue *v36;
  _GEOTileDBWriteQueue *writeQueue;
  uint64_t v38;
  NSURL *dbDirectory;
  uint64_t v40;
  NSURL *externalDataDirectory;
  void *v42;
  uint64_t v43;
  GEOSQLiteDB *db;
  void *v45;
  uint64_t v46;
  id timestampDeltaWriteThresholdConfigListener;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  GEOOfflineDataConfiguration *v52;
  void *v53;
  GEOTileDB *v54;
  id v56;
  _QWORD v57[4];
  id v58;
  id location[2];
  objc_super v60;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v56 = a8;
  v60.receiver = self;
  v60.super_class = (Class)GEOTileDB;
  v20 = -[GEOTileDB init](&v60, sel_init);
  if (!v20)
  {
LABEL_18:
    v54 = 0;
    goto LABEL_19;
  }
  v21 = geo_isolater_create();
  infrequentlyChangingMetadataIsolater = v20->_infrequentlyChangingMetadataIsolater;
  v20->_infrequentlyChangingMetadataIsolater = (geo_isolater *)v21;

  v23 = geo_isolater_create();
  createdExternalDataDirectoryIsolater = v20->_createdExternalDataDirectoryIsolater;
  v20->_createdExternalDataDirectoryIsolater = (geo_isolater *)v23;

  if (v17)
  {
    v25 = (GEOResourceManifestManager *)v17;
  }
  else
  {
    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v25 = (GEOResourceManifestManager *)objc_claimAutoreleasedReturnValue();
  }
  manifestManager = v20->_manifestManager;
  v20->_manifestManager = v25;

  if (v18)
  {
    v27 = (GEOCountryConfiguration *)v18;
  }
  else
  {
    +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
    v27 = (GEOCountryConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  countryConfiguration = v20->_countryConfiguration;
  v20->_countryConfiguration = v27;

  if (v19)
  {
    v29 = (GEOOfflineDataConfiguration *)v19;
  }
  else
  {
    +[GEOOfflineDataConfiguration sharedConfiguration](GEOOfflineDataConfiguration, "sharedConfiguration");
    v29 = (GEOOfflineDataConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  offlineDataConfiguration = v20->_offlineDataConfiguration;
  v20->_offlineDataConfiguration = v29;

  objc_storeStrong((id *)&v20->_overrideLocale, a8);
  v31 = [GEOObserverHashTable alloc];
  global_queue = (void *)geo_get_global_queue();
  v33 = -[GEOObserverHashTable initWithProtocol:queue:](v31, "initWithProtocol:queue:", &unk_1EDF5F1A8, global_queue);
  observers = v20->_observers;
  v20->_observers = (GEOObserverHashTable *)v33;

  v20->_maxDatabaseSize = a9;
  if (GEOConfigGetUint64(GeoServicesConfig_TileDBTimestampDeltaWriteThreshold, (uint64_t)off_1EDF4D438) < 1801)
    Uint64 = 1800.0;
  else
    Uint64 = (double)GEOConfigGetUint64(GeoServicesConfig_TileDBTimestampDeltaWriteThreshold, (uint64_t)off_1EDF4D438);
  v20->_timestampDeltaWriteThreshold = Uint64;
  v36 = -[_GEOTileDBWriteQueue initWithDB:maxOperations:maxOperationsSizeInBytes:]([_GEOTileDBWriteQueue alloc], "initWithDB:maxOperations:maxOperationsSizeInBytes:", v20, 8, 0x40000);
  writeQueue = v20->_writeQueue;
  v20->_writeQueue = v36;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v15);
  v38 = objc_claimAutoreleasedReturnValue();
  dbDirectory = v20->_dbDirectory;
  v20->_dbDirectory = (NSURL *)v38;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v16);
  v40 = objc_claimAutoreleasedReturnValue();
  externalDataDirectory = v20->_externalDataDirectory;
  v20->_externalDataDirectory = (NSURL *)v40;

  if (-[NSURL isEqual:](v20->_dbDirectory, "isEqual:", v20->_externalDataDirectory))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: ![_dbDirectory isEqual:_externalDataDirectory]", (uint8_t *)location, 2u);
    }
    goto LABEL_18;
  }
  -[NSURL URLByAppendingPathComponent:](v20->_dbDirectory, "URLByAppendingPathComponent:", CFSTR("MapTiles.sqlitedb"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTileDB _setupDB:](v20, "_setupDB:", v42);
  v43 = objc_claimAutoreleasedReturnValue();
  db = v20->_db;
  v20->_db = (GEOSQLiteDB *)v43;

  objc_initWeak(location, v20);
  -[GEOSQLiteDB isolationQueue](v20->_db, "isolationQueue");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __145__GEOTileDB_initWithDBDirectory_externalFilesDirectory_manifestManager_countryConfiguration_offlineDataConfiguration_locale_maximumDatabaseSize___block_invoke;
  v57[3] = &unk_1E1C00800;
  objc_copyWeak(&v58, location);
  _GEOConfigAddBlockListenerForKey(GeoServicesConfig_TileDBTimestampDeltaWriteThreshold, (uint64_t)off_1EDF4D438, v45, v57);
  v46 = objc_claimAutoreleasedReturnValue();
  timestampDeltaWriteThresholdConfigListener = v20->_timestampDeltaWriteThresholdConfigListener;
  v20->_timestampDeltaWriteThresholdConfigListener = (id)v46;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObserver:selector:name:object:", v20, sel__localeChanged_, *MEMORY[0x1E0C99720], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addObserver:selector:name:object:", v20, sel__deviceLocked_, CFSTR("GEODeviceLockingNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObserver:selector:name:object:", v20, sel__countryChanged_, CFSTR("GEOCountryConfigurationCountryCodeDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObserver:selector:name:object:", v20, sel__editionUpdate_, CFSTR("GEOTileEditionUpdateNotification"), 0);

  v52 = v20->_offlineDataConfiguration;
  -[GEOSQLiteDB isolationQueue](v20->_db, "isolationQueue");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOOfflineDataConfiguration registerObserver:queue:](v52, "registerObserver:queue:", v20, v53);

  v54 = v20;
  objc_destroyWeak(&v58);
  objc_destroyWeak(location);

LABEL_19:
  return v54;
}

void __145__GEOTileDB_initWithDBDirectory_externalFilesDirectory_manifestManager_countryConfiguration_offlineDataConfiguration_locale_maximumDatabaseSize___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double Uint64;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (GEOConfigGetUint64(GeoServicesConfig_TileDBTimestampDeltaWriteThreshold, (uint64_t)off_1EDF4D438) < 1801)
      Uint64 = 1800.0;
    else
      Uint64 = (double)GEOConfigGetUint64(GeoServicesConfig_TileDBTimestampDeltaWriteThreshold, (uint64_t)off_1EDF4D438);
    WeakRetained = v3;
    *((double *)v3 + 21) = Uint64;
  }

}

- (void)dealloc
{
  $A8EAA16C94BAA7F1E1D71B02AD84D80A *expirationRecords;
  objc_super v4;

  GEOConfigRemoveBlockListener(self->_timestampDeltaWriteThresholdConfigListener);
  GEOConfigRemoveBlockListener(self->_tileElevationConfigListener);
  expirationRecords = self->_expirationRecords;
  if (expirationRecords)
  {
    free(expirationRecords);
    self->_expirationRecords = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOTileDB;
  -[GEOTileDB dealloc](&v4, sel_dealloc);
}

- (void)tearDown
{
  GEOSQLiteDB *db;
  NSObject *v4;
  void *v5;
  _QWORD block[5];

  db = self->_db;
  if (db)
  {
    -[GEOSQLiteDB isolationQueue](db, "isolationQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __21__GEOTileDB_tearDown__block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_sync(v4, block);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[GEOOfflineDataConfiguration unregisterObserver:](self->_offlineDataConfiguration, "unregisterObserver:", self);
}

void __21__GEOTileDB_tearDown__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tearDown");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[GEOObserverHashTable registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)unregisterObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

+ (void)migrateDBFrom:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_ensureURLExistsAndIsDirectory(v6))
  {
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("MapTiles.sqlitedb"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("MapTiles.sqlitedb"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOSQLiteDB migrateAllDBFilesFrom:to:](GEOSQLiteDB, "migrateAllDBFilesFrom:to:", v7, v8);

  }
}

+ (void)migrateFilesFrom:(id)a3 to:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  id v18;
  NSObject *v19;
  char v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  char v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t buf[4];
  NSObject *v51;
  __int16 v52;
  NSObject *v53;
  __int16 v54;
  NSObject *v55;
  _BYTE v56[128];
  _QWORD v57[4];

  v57[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a4, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (_ensureURLExistsAndIsDirectory(v38))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0C999D0];
    v57[0] = *MEMORY[0x1E0C999D0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, v9, 23, &v49);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v49;

    if (v11)
    {
      GEOGetTileDBLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v11;
        _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Unable to enumerate external resources for migration: %@", buf, 0xCu);
      }
      goto LABEL_34;
    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v13 = v10;
    v39 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    if (!v39)
    {

      v11 = 0;
      goto LABEL_29;
    }
    v33 = v10;
    v34 = v6;
    v35 = v5;
    v11 = 0;
    v14 = *(_QWORD *)v46;
    v37 = 1;
    v36 = *(_QWORD *)v46;
LABEL_7:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v14)
        objc_enumerationMutation(v13);
      v16 = *(NSObject **)(*((_QWORD *)&v45 + 1) + 8 * v15);
      v43 = 0;
      v44 = 0;
      v17 = -[NSObject getResourceValue:forKey:error:](v16, "getResourceValue:forKey:error:", &v44, v8, &v43);
      v18 = v44;
      v19 = v43;

      if (!v17)
      {
        v11 = v19;
        goto LABEL_22;
      }
      if (!objc_msgSend(v18, "BOOLValue"))
        break;
      v42 = v19;
      v20 = objc_msgSend(v7, "removeItemAtURL:error:", v16, &v42);
      v11 = v42;

      if ((v20 & 1) == 0)
      {
        GEOGetTileDBLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v51 = v16;
          v52 = 2112;
          v53 = v11;
          _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "Unable to remove directory at \"%@\": %@", buf, 0x16u);
        }
        v37 = 0;
LABEL_21:

      }
LABEL_22:

      if (v39 == ++v15)
      {
        v28 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
        v39 = v28;
        if (!v28)
        {

          v6 = v34;
          v5 = v35;
          v10 = v33;
          if ((v37 & 1) == 0)
          {
LABEL_35:

            goto LABEL_36;
          }
LABEL_29:
          v29 = v7;
          v30 = v11;
          v40 = v11;
          v31 = v29;
          v32 = objc_msgSend(v29, "removeItemAtPath:error:", v5, &v40);
          v11 = v40;

          if ((v32 & 1) != 0)
          {
            v7 = v31;
            goto LABEL_35;
          }
          GEOGetTileDBLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v51 = v5;
            v52 = 2112;
            v53 = v11;
            _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Unable to clean up old directory \"%@\": %@", buf, 0x16u);
          }
          v7 = v31;
LABEL_34:

          goto LABEL_35;
        }
        goto LABEL_7;
      }
    }
    v22 = v13;
    v23 = v8;
    -[NSObject relativePath](v16, "relativePath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "URLByAppendingPathComponent:", v24);
    v21 = objc_claimAutoreleasedReturnValue();

    v41 = v19;
    v25 = v7;
    v26 = objc_msgSend(v7, "moveItemAtURL:toURL:error:", v16, v21, &v41);
    v11 = v41;

    if ((v26 & 1) == 0)
    {
      GEOGetTileDBLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v51 = v16;
        v52 = 2112;
        v53 = v21;
        v54 = 2112;
        v55 = v11;
        _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_ERROR, "Unable to move file from \"%@\" to \"%@\": %@", buf, 0x20u);
      }

      v37 = 0;
    }
    v7 = v25;
    v8 = v23;
    v13 = v22;
    v14 = v36;
    goto LABEL_21;
  }
LABEL_36:

}

- (id)_setupDB:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  GEOSQLiteDB *v8;
  void *v9;
  uint64_t v10;
  GEOSQLiteDB *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  +[GEOSQLiteDB defaultPragmas](GEOSQLiteDB, "defaultPragmas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  defaultPragmas();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  objc_initWeak(&location, self);
  v8 = [GEOSQLiteDB alloc];
  GEOGetTileDBLog();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __22__GEOTileDB__setupDB___block_invoke;
  v15[3] = &unk_1E1C00828;
  objc_copyWeak(&v16, &location);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __22__GEOTileDB__setupDB___block_invoke_2;
  v13[3] = &unk_1E1BFF638;
  objc_copyWeak(&v14, &location);
  v11 = -[GEOSQLiteDB initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:](v8, "initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:", "com.apple.geo.TileDB", v9, v4, 3145728, v6, v15, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  return v11;
}

uint64_t __22__GEOTileDB__setupDB___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(WeakRetained, "_setup:", v3);

  return v5;
}

void __22__GEOTileDB__setupDB___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_flushPendingWrites");

}

- (BOOL)_setup:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSURL *externalDataDirectory;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  int function_v2;
  NSObject *v24;
  BOOL v25;
  int v27;
  uint64_t v28;
  GEOSQLiteDB *db;
  uint64_t v30;
  GEOSQLiteDB *v31;
  _QWORD *v32;
  GEOSQLiteDB *v33;
  uint64_t *v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  NSMutableDictionary *editionsMap;
  NSMutableDictionary *v40;
  NSMutableDictionary *v41;
  GEOSQLiteDB *v42;
  GEOSQLiteDB *v43;
  _QWORD *v44;
  GEOSQLiteDB *v45;
  uint64_t *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id tileElevationConfigListener;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  GEOSQLiteDB *v57;
  _BOOL4 v58;
  BOOL v59;
  const char *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[5];
  _QWORD v65[6];
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  id v72[6];
  id v73;
  _BYTE *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t v82;
  _BYTE buf[24];
  void *v84;
  GEOSQLiteDB *v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t v88;
  GEOTileDB *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _GEOCreateTransaction();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTemporaryStoreMode:", 1);
  if (objc_msgSend(v4, "user_version") == 73)
    goto LABEL_15;
  GEOGetTileDBLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = objc_msgSend(v4, "user_version");
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 73;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Database schema version changed (%llu => %i). Attempting to migrate if possible.", buf, 0x12u);
  }

  v6 = objc_msgSend(v4, "user_version");
  v7 = v4;
  v8 = v7;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  LOBYTE(v78) = 0;
  if (v6 > 73)
  {
LABEL_5:
    _Block_object_dispose(&v75, 8);

LABEL_6:
    GEOGetTileDBLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Unable to migrate. Dropping all tables and starting fresh.", buf, 2u);
    }

    if (!objc_msgSend(v8, "dropAllTables"))
      goto LABEL_29;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v84) = 0;
    v72[1] = (id)MEMORY[0x1E0C809B0];
    v72[2] = (id)3221225472;
    v72[3] = __20__GEOTileDB__setup___block_invoke;
    v72[4] = &unk_1E1C00850;
    v72[5] = self;
    v74 = buf;
    v73 = v8;
    geo_isolate_sync();
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      -[GEOObserverHashTable tileDBDidDeleteExternalResource:](self->_observers, "tileDBDidDeleteExternalResource:", self);

    _Block_object_dispose(buf, 8);
    goto LABEL_15;
  }
  if (v6 == 73)
  {
    _Block_object_dispose(&v75, 8);

LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  v53 = 0;
  v54 = v6;
  do
  {
    ++v54;
    if (v53 <= 3)
      v55 = 3;
    else
      v55 = v53;
    v56 = v55 + 1;
    while (migrateToSchemaVersion_availableMigratorVersions[v53] != v54)
    {
      if (v56 == ++v53)
        goto LABEL_5;
    }
  }
  while (v54 != 73);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __migrateToSchemaVersion_block_invoke;
  v84 = &unk_1E1C01918;
  v87 = (uint64_t *)v6;
  v88 = 73;
  v57 = (GEOSQLiteDB *)v7;
  v89 = self;
  v85 = v57;
  v86 = &v75;
  v58 = -[GEOSQLiteDB executeInTransaction:](v57, "executeInTransaction:", buf);
  v59 = v58;
  if (v58)
    v10 = *((unsigned __int8 *)v76 + 24);
  else
    v10 = 0;

  _Block_object_dispose(&v75, 8);
  if (!v59)
    goto LABEL_6;
LABEL_16:
  objc_msgSend(v4, "setUser_version:", 73);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_externalDataDirectory, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    externalDataDirectory = self->_externalDataDirectory;
    v81 = *MEMORY[0x1E0CB2AD8];
    v82 = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = 0;
    v17 = objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", externalDataDirectory, 1, v16, v72);
    v18 = v72[0];

    if ((v17 & 1) == 0)
    {
      GEOGetTileDBLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Failed to create external resources directory: %{public}@", buf, 0xCu);
      }

    }
  }
  GEOGetTileDBLog();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  v22 = v20;
  function_v2 = sqlite3_create_function_v2((sqlite3 *)objc_msgSend(v21, "sqliteDB"), "insideRadius", 6, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_insideRadius_sqlite, 0, 0, 0);
  if (function_v2)
  {
    v24 = v22;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      goto LABEL_202;
    goto LABEL_27;
  }
  function_v2 = sqlite3_create_function_v2((sqlite3 *)objc_msgSend(v21, "sqliteDB"), "coordinatesMatch", 5, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_coordinatesMatch_sqlite, 0, 0, 0);
  if (function_v2)
  {
    v24 = v22;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
LABEL_202:
      v60 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v21, "sqliteDB"));
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = function_v2;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = v60;
      _os_log_fault_impl(&dword_1885A9000, v24, OS_LOG_TYPE_FAULT, "create fn failed %d %{public}s", buf, 0x12u);
    }
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  if (!objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS device_posture(   row INT PRIMARY KEY NOT NULL,    locale TEXT,    country TEXT,    region TEXT   );",
                        0)
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS edition(   tileset INT NOT NULL,    edition INT NOT NULL,    UNIQUE(tileset)   );",
                        0)
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS external_data_pending_deletion(   ext_uuid BLOB NOT NULL   );",
                        0)
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS global_offline_metadata(   row INT PRIMARY KEY NOT NULL,    regulatory_region_id INT NOT NULL,    UNIQUE(regulatory_region_id)   );",
                        0)
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS data(   rowid INTEGER PRIMARY KEY NOT NULL,    data BLOB,    ext_uuid BLOB,    size INT NOT NULL,    etag TEXT   );",
                        0)
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS data_ext_uuid_idx ON data (ext_uuid) WHERE ext_uuid IS NOT NULL;")
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS tiles(   key_a INT NOT NULL,    key_b INT NOT NULL,    key_c INT NOT NULL,    key_d INT NOT NULL,    tileset INT NOT NULL,    is_current INT NOT NULL,    insert_timestamp INT NOT NULL,    insert_reason INT NOT NULL,    data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    UNIQUE(key_a, key_b, key_c, key_d)    ON CONFLICT REPLACE   );",
                        0)
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS tiles_tileset_idx ON tiles (tileset);")
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS tiles_data_pk_idx ON tiles (data_pk);")
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS offline_data(   rowid INTEGER PRIMARY KEY NOT NULL,    layer INT NOT NULL,    key BLOB NOT NULL,    version INT NOT NULL,    insert_timestamp INT NOT NULL,    ext_uuid BLOB,    UNIQUE(layer, key, version)   );",
                        0)
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS offline_data_batches(   rowid INTEGER PRIMARY KEY NOT NULL,    layer INT NOT NULL,    key BLOB NOT NULL,    version INT NOT NULL,    etag TEXT,    data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    UNIQUE(layer, key, version)   );",
                        0)
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS offline_data_batches_data_pk_idx ON offline_data_batches (data_pk);")
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS offline_data_batch_refs(   batch_pk INT NOT NULL,    offline_data_pk INT NOT NULL,    offset INT NOT NULL,    size INT NOT NULL,    layer INT NOT NULL,    version INT NOT NULL,    UNIQUE(batch_pk, offline_data_pk)    ON CONFLICT REPLACE   );",
                        0)
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS offline_data_batch_refs_batch_pk_idx ON offline_data_batch_refs (batch_pk);")
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS offline_data_batch_refs_offline_data_pk_idx ON offline_data_batch_refs (offline_data_pk);")
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS offline_data_batch_refs_layer_idx ON offline_data_batch_refs (layer);")
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS access_times(   data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    timestamp INT   );",
                        0)
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS access_times_data_pk_idx ON access_times (data_pk);")
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS failed_tiles(   rowid INTEGER PRIMARY KEY NOT NULL,    key_a INT NOT NULL,    key_b INT NOT NULL,    key_c INT NOT NULL,    key_d INT NOT NULL,    tileset INT NOT NULL,    wants_proactive_load INT NOT NULL,    timestamp INT,    UNIQUE(key_a, key_b, key_c, key_d)    ON CONFLICT REPLACE   );",
                        0)
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS failed_tiles_tileset_idx ON failed_tiles (tileset);")
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS subscriptions(   rowid INTEGER PRIMARY KEY NOT NULL,    identifier TEXT NOT NULL,    originating_bundle_id TEXT,    data_types INT NOT NULL,    policy INT NOT NULL,    expiration_timestamp INT,    map_region BLOB NOT NULL,    display_name TEXT,    insert_timestamp INT NOT NULL,    UNIQUE(identifier)    ON CONFLICT REPLACE   );",
                        0)
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS expired_subscriptions(   rowid INTEGER PRIMARY KEY NOT NULL,    identifier TEXT NOT NULL,    originating_bundle_id TEXT,    data_types INT NOT NULL,    policy INT NOT NULL,    map_region BLOB NOT NULL,    display_name TEXT,    regulatory_region_id INT,    UNIQUE(identifier)    ON CONFLICT REPLACE   );",
                        0)
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS subscription_data_refs(   subscription_pk INT NOT NULL REFERENCES subscriptions(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    UNIQUE(subscription_pk, data_pk)    ON CONFLICT REPLACE   );",
                        0)
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS subscription_data_refs_subscription_pk_idx ON subscription_data_refs (subscription_pk);")
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS subscription_data_refs_data_pk_idx ON subscription_data_refs (data_pk);")
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS paired_device_subscription_sync(   subscription_pk INT NOT NULL REFERENCES subscriptions(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    device_id BLOB NOT NULL,    should_sync INT,    UNIQUE(subscription_pk, device_id)    ON CONFLICT IGNORE   );",
                        0)
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS paired_device_subscription_sync_subscription_pk_idx ON paired_device_subscription_sync (subscription_pk);")
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS subscription_data_state(   subscription_pk INT NOT NULL REFERENCES subscriptions(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    data_type INT NOT NULL,    data_subtype INT NOT NULL,    version INT NOT NULL,    complete INT NOT NULL,    data_count INT NOT NULL,    data_size INT NOT NULL,    UNIQUE(subscription_pk, data_type, data_subtype, version)    ON CONFLICT REPLACE   );",
                        0)
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS subscription_data_state_subscription_pk_idx ON subscription_data_state (subscription_pk);")
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS subscription_download_state(   subscription_pk INT NOT NULL REFERENCES subscriptions(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    download_state INT NOT NULL,    UNIQUE(subscription_pk)    ON CONFLICT REPLACE   );",
                        0)
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS subscription_download_state_subscription_pk_idx ON subscription_download_state (subscription_pk);")
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS subscription_access_times(   subscription_pk INT NOT NULL REFERENCES subscriptions(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    timestamp INT,    UNIQUE(subscription_pk)    ON CONFLICT REPLACE   );",
                        0)
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS subscription_access_times_subscription_pk_idx ON subscription_access_times (subscription_pk);")
    || !objc_msgSend(v21, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS shiftresponse(   time INT NOT NULL,    lat REAL NOT NULL,    lng REAL NOT NULL,    rad REAL NOT NULL,    data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE   );",
                        0)
    || !objc_msgSend(v21, "createIndex:", "CREATE INDEX IF NOT EXISTS shiftresponse_data_pk_idx ON shiftresponse (data_pk);")
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT locale, country, region    FROM device_posture    WHERE row = 0    LIMIT 1;",
                        CFSTR("ReadDevicePosture"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO device_posture    (row, locale, country, region)    VALUES (0, @locale, @country, @region);",
                        CFSTR("SetDevicePosture"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT tileset, edition    FROM edition;",
                        CFSTR("ReadEditions"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO edition    (tileset, edition)    VALUES (@tileset, @edition);",
                        CFSTR("SetEdition"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT ext_uuid    FROM external_data_pending_deletion;",
                        CFSTR("GetAllExternalDataPendingDeletion"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT INTO external_data_pending_deletion    (ext_uuid)    VALUES (@ext_uuid);",
                        CFSTR("MarkExternalDataForDeletion"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM external_data_pending_deletion    WHERE ext_uuid = @ext_uuid;",
                        CFSTR("ClearExternalDataPendingDeletion"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM external_data_pending_deletion;",
                        CFSTR("ClearAllExternalDataPendingDeletion"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT regulatory_region_id    FROM global_offline_metadata    WHERE row = 0    LIMIT 1;",
                        CFSTR("ReadGlobalOfflineMetadata"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO global_offline_metadata    (row, regulatory_region_id)    VALUES (0, @regulatory_region_id);",
                        CFSTR("SetGlobalOfflineMetadata"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO data    (data, ext_uuid, size, etag)    VALUES (@data, @ext_uuid, @size, @etag);",
                        CFSTR("InsertData"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM data    WHERE rowid == @rowid;",
                        CFSTR("DeleteData"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT ext_uuid    FROM data    WHERE ext_uuid IS NOT NULL;",
                        CFSTR("EnumerateExternalResources"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO tiles    (key_a, key_b, key_c, key_d, tileset, is_current, insert_timestamp, insert_reason, data_pk)    VALUES (@key_a, @key_b, @key_c, @key_d, @tileset, 1, @insert_timestamp, @insert_reason, @data_pk);",
                        CFSTR("InsertTile"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT data_pk    FROM tiles    WHERE key_a == @key_a AND key_b == @key_b AND key_c == @key_c AND key_d == @key_d;",
                        CFSTR("LookupTileRowForKey"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "UPDATE tiles    SET is_current = 1, insert_timestamp = @insert_timestamp, insert_reason = @insert_reason    WHERE data_pk = @data_pk;",
                        CFSTR("MarkCurrent"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "UPDATE tiles    SET is_current = 0;",
                        CFSTR("InvalidateAllData"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "UPDATE tiles    SET is_current = 0    WHERE tileset = @tileset;",
                        CFSTR("InvalidateTileSet"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO offline_data    (layer, key, version, insert_timestamp, ext_uuid)    VALUES (@layer, @key, @version, @insert_timestamp, NULL);",
                        CFSTR("InsertOfflineData"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "UPDATE offline_data    SET ext_uuid = @ext_uuid    WHERE rowid = @rowid;",
                        CFSTR("SetOfflineDataExtUUID"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT rowid, ext_uuid    FROM offline_data    WHERE layer == @layer AND version == @version AND key == @key;",
                        CFSTR("GetDataForOfflineKey"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT offline_data.rowid, offline_data.ext_uuid    FROM offline_data INNER JOIN offline_data_batch_refs ON offline_data_batch_refs.offline_data_pk = offline_data.rowid INNER JOIN offline_data_batches ON offline_data_batch_refs.batch_pk = offline_data_batches.rowid INNER JOIN subscription_data_refs ON subscription_data_refs.data_pk = offline_data_batches.data_pk INNER JOIN subscription_data_state ON subscription_data_refs.subscription_pk = subscription_data_state.subscription_pk    WHERE offline_data.layer == @offline_data_layer AND offline_data.version == @offline_data_version AND offline_data.key == @offline_data_key AND subscription_data_state.data_type = 1024 AND subscription_data_state.data_subtype = offline_data.layer AND subscription_data_state.version = offline_data.version AND subscription_data_state.complete = 1    LIMIT 1;",
                        CFSTR("GetDataForOfflineKeyInFullyLoadedSubscription"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT rowid    FROM offline_data    WHERE layer == @layer AND version == @version AND key == @key;",
                        CFSTR("GetOfflineDataPKForKey"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT ext_uuid    FROM offline_data    WHERE ext_uuid IS NOT NULL;",
                        CFSTR("EnumerateOfflineDataExternalResources"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO offline_data_batches    (layer, key, version, etag, data_pk)    VALUES (@layer, @key, @version, @etag, @data_pk);",
                        CFSTR("InsertOfflineDataBatch"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT rowid, etag, data_pk    FROM offline_data_batches    WHERE layer == @layer AND version == @version AND key == @key;",
                        CFSTR("CheckExistenceOfOfflineBatchKey"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM offline_data_batches    WHERE layer = @layer AND version != @versionA AND version != @versionB;",
                        CFSTR("DeleteOfflineDataBatchNotMatchingVersions"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT DISTINCT version    FROM offline_data_batches    WHERE layer = @layer;",
                        CFSTR("GetAllOfflineDataBatchVersionsForLayer"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO offline_data_batch_refs    (batch_pk, offline_data_pk, offset, size, layer, version)    VALUES (@batch_pk, @offline_data_pk, @offset, @size, @layer, @version);",
                        CFSTR("InsertOfflineDataBatchReference"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT data.rowid, data.data, data.ext_uuid, data.size, offline_data_batch_refs.offset, offline_data_batch_refs.size    FROM offline_data_batches INNER JOIN offline_data_batch_refs ON offline_data_batch_refs.batch_pk = offline_data_batches.rowid INNER JOIN data ON offline_data_batches.data_pk = data.rowid    WHERE offline_data_batch_refs.offline_data_pk = @offline_data_batch_refs_offline_data_pk;",
                        CFSTR("GetBatchDataForOfflineDataPK"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT INTO access_times    (data_pk, timestamp)    VALUES (@data_pk, @timestamp);",
                        CFSTR("AddAccessTime"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "UPDATE access_times    SET timestamp = @timestamp    WHERE data_pk = @data_pk;",
                        CFSTR("UpdateAccessTime"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT timestamp    FROM access_times    WHERE data_pk = @data_pk;",
                        CFSTR("GetAccessTime"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO failed_tiles    (key_a, key_b, key_c, key_d, tileset, wants_proactive_load, timestamp)    VALUES (@key_a, @key_b, @key_c, @key_d, @tileset, @wants_proactive_load, @timestamp);",
                        CFSTR("InsertFailedTile"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM failed_tiles    WHERE key_a == @key_a AND key_b == @key_b AND key_c == @key_c AND key_d == @key_d;",
                        CFSTR("DeleteFailedTile"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM failed_tiles    WHERE tileset == @tileset;",
                        CFSTR("DeleteFailedTilesForTileSet"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM failed_tiles    WHERE timestamp < @timestamp;",
                        CFSTR("DeleteOldFailedTiles"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT wants_proactive_load, timestamp    FROM failed_tiles    WHERE key_a == @key_a AND key_b == @key_b AND key_c == @key_c AND key_d == @key_d;",
                        CFSTR("LookupFailureInfo"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT key_a, key_b, key_c, key_d, tileset    FROM failed_tiles    WHERE wants_proactive_load = 1 AND timestamp > @timestamp    ORDER BY timestamp DESC;",
                        CFSTR("GetFailedKeysForProactiveLoad"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT rowid    FROM subscriptions    WHERE identifier == @identifier    LIMIT 1;",
                        CFSTR("GetSubscriptionPK"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO subscription_data_refs    (subscription_pk, data_pk)    VALUES (@subscription_pk, @data_pk);",
                        CFSTR("InsertSubscriptionDataRef"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT rowid, identifier, originating_bundle_id, data_types, policy, expiration_timestamp, map_region, display_name    FROM subscriptions;",
                        CFSTR("FetchSubscriptions"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT rowid, identifier, originating_bundle_id, data_types, policy, expiration_timestamp, map_region, display_name    FROM subscriptions    WHERE identifier == @identifier;",
                        CFSTR("FetchSubscription"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT rowid, identifier, originating_bundle_id, data_types, policy, expiration_timestamp, map_region, display_name    FROM subscriptions    WHERE rowid = @rowid;",
                        CFSTR("FetchSubscriptionForPK"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO subscriptions    (identifier, originating_bundle_id, data_types, policy, expiration_timestamp, map_region, display_name, insert_timestamp)    VALUES (@identifier, @originating_bundle_id, @data_types, @policy, @expiration_timestamp, @map_region, @display_name, @insert_timestamp);",
                        CFSTR("InsertSubscription"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "UPDATE subscriptions    SET expiration_timestamp = @expiration_timestamp, display_name = @display_name    WHERE rowid = @rowid;",
                        CFSTR("UpdateSubscriptionExpirationAndDisplayName"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM subscriptions    WHERE identifier == @identifier;",
                        CFSTR("RemoveSubscription"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM subscriptions    WHERE expiration_timestamp > 0 AND expiration_timestamp < @expiration_timestamp    RETURNING rowid, identifier, originating_bundle_id, data_types, policy, expiration_timestamp, map_region, display_name, insert_timestamp;",
                        CFSTR("RemoveExpiredSubscriptions"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM subscriptions    WHERE 0 != (data_types & @data_types)    RETURNING rowid, identifier, originating_bundle_id, data_types, policy, expiration_timestamp, map_region, display_name, insert_timestamp;",
                        CFSTR("RemoveAllSubscriptionsForDataType"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO expired_subscriptions    (identifier, originating_bundle_id, data_types, policy, map_region, display_name, regulatory_region_id)    VALUES (@identifier, @originating_bundle_id, @data_types, @policy, @map_region, @display_name, @regulatory_region_id);",
                        CFSTR("InsertExpiredSubscription"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT identifier, originating_bundle_id, data_types, policy, map_region, display_name, regulatory_region_id    FROM expired_subscriptions;",
                        CFSTR("FetchExpiredSubscriptions"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT rowid, data_types    FROM expired_subscriptions    WHERE identifier = @identifier;",
                        CFSTR("FetchExpiredSubscription"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM expired_subscriptions    WHERE rowid = @rowid;",
                        CFSTR("RemoveExpiredSubscription"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO paired_device_subscription_sync    (subscription_pk, device_id, should_sync)    VALUES (@subscription_pk, @device_id, @should_sync);",
                        CFSTR("SetSubscriptionShouldSyncToPairedDevice"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT INTO paired_device_subscription_sync    (subscription_pk, device_id, should_sync)    VALUES (@subscription_pk, @device_id, @should_sync);",
                        CFSTR("SetSubscriptionShouldSyncToPairedDeviceNoOverwrite"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT subscriptions.identifier, paired_device_subscription_sync.should_sync    FROM paired_device_subscription_sync INNER JOIN subscriptions ON paired_device_subscription_sync.subscription_pk = subscriptions.rowid    WHERE paired_device_subscription_sync.device_id = @paired_device_subscription_sync_device_id;",
                        CFSTR("GetSubscriptionsForSyncToPairedDevice"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM paired_device_subscription_sync    WHERE device_id = @device_id;",
                        CFSTR("ClearSubscriptionsForSyncToPairedDevice"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO subscription_data_state    (subscription_pk, data_type, data_subtype, version, complete, data_count, data_size)    VALUES (@subscription_pk, @data_type, @data_subtype, @version, @complete, @data_count, @data_size);",
                        CFSTR("SetSubscriptionDataState"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM subscription_data_state    WHERE data_type = @data_type AND data_subtype = @data_subtype AND version != @versionA AND version != @versionB;",
                        CFSTR("ClearSubscriptionDataStatesNotMatchingVersions"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT data_type, data_subtype, version, complete, data_count, data_size    FROM subscription_data_state    WHERE subscription_pk == @subscription_pk;",
                        CFSTR("GetSubscriptionDataStates"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "UPDATE subscription_data_state    SET complete = @complete    WHERE data_type = @data_type AND data_subtype = @data_subtype AND version = @version;",
                        CFSTR("BulkUpdateSubscriptionDataState"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "UPDATE subscription_data_state    SET complete = @complete    WHERE data_type = @data_type AND version = @version;",
                        CFSTR("BulkUpdateSubscriptionDataStateAllSubtypes"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO subscription_download_state    (subscription_pk, download_state)    VALUES (@subscription_pk, @download_state);",
                        CFSTR("SetSubscriptionDownloadState"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM subscription_download_state    WHERE subscription_pk = @subscription_pk;",
                        CFSTR("ClearSubscriptionDownloadState"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT download_state    FROM subscription_download_state    WHERE subscription_pk = @subscription_pk;",
                        CFSTR("GetSubscriptionDownloadState"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT OR REPLACE INTO subscription_access_times    (subscription_pk, timestamp)    VALUES (@subscription_pk, @timestamp);",
                        CFSTR("SetSubscriptionLastAccessTime"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT SUM(data.size)    FROM tiles INNER JOIN data ON tiles.data_pk == data.rowid;",
                        CFSTR("CalculateTotalTileDataSize"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT SUM(data.size)    FROM offline_data_batches INNER JOIN data ON offline_data_batches.data_pk == data.rowid;",
                        CFSTR("CalculateTotalOfflineDataSize"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT tiles.tileset, tiles.insert_timestamp, data.data, data.ext_uuid, data.etag, tiles.is_current, tiles.insert_reason    FROM tiles INNER JOIN data ON tiles.data_pk == data.rowid    WHERE tiles.key_a == @tiles_key_a AND tiles.key_b == @tiles_key_b AND tiles.key_c == @tiles_key_c AND tiles.key_d == @tiles_key_d;",
                        CFSTR("GetDataForKey"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT tiles.key_a, tiles.key_b, tiles.key_c, tiles.key_d, tiles.tileset, tiles.insert_timestamp, data.data, data.etag, tiles.is_current, tiles.insert_reason    FROM tiles INNER JOIN data ON tiles.data_pk == data.rowid;",
                        CFSTR("GetDataForAllKeys"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT tiles.data_pk, data.ext_uuid, data.size    FROM tiles INNER JOIN data ON tiles.data_pk == data.rowid    WHERE tiles.key_a == @tiles_key_a AND tiles.key_b == @tiles_key_b AND tiles.key_c == @tiles_key_c AND tiles.key_d == @tiles_key_d;",
                        CFSTR("LookupTileInfoForKey"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT data.rowid, data.ext_uuid    FROM tiles INNER JOIN data ON tiles.data_pk == data.rowid    WHERE tiles.key_a == @tiles_key_a AND tiles.key_b == @tiles_key_b AND tiles.key_c == @tiles_key_c AND tiles.key_d == @tiles_key_d;",
                        CFSTR("LookupTileExternalDataUUIDForKey"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT data.ext_uuid, data.size    FROM data INNER JOIN access_times ON access_times.data_pk == data.rowid INNER JOIN tiles on tiles.data_pk == data.rowid    ORDER BY tiles.is_current, access_times.timestamp, tiles.insert_timestamp ASC;",
                        CFSTR("EnumerateDataSizeFromOldest"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT tiles.key_a, tiles.key_b, tiles.key_c, tiles.key_d, tiles.tileset, data.size    FROM tiles INNER JOIN data ON tiles.data_pk == data.rowid INNER JOIN access_times ON access_times.data_pk == data.rowid    WHERE tiles.is_current = 0 AND access_times.timestamp > @access_times_timestamp    ORDER BY data.size DESC;",
                        CFSTR("GetRecentlyUsedStaleKeys"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT DISTINCT offline_data.key    FROM offline_data INNER JOIN offline_data_batch_refs ON offline_data.rowid = offline_data_batch_refs.offline_data_pk INNER JOIN offline_data_batches ON offline_data_batch_refs.batch_pk = offline_data_batches.rowid INNER JOIN subscription_data_refs ON offline_data_batches.data_pk == subscription_data_refs.data_pk INNER JOIN subscription_data_state ON subscription_data_state.subscription_pk == subscription_data_refs.subscription_pk    WHERE offline_data.layer = @offline_data_layer AND offline_data.version = @offline_data_version AND subscription_data_state.data_type = 1024 AND subscription_data_state.data_subtype = @offline_data_layer AND subscription_data_state.version = @offline_data_version AND subscription_data_state.complete = 1;",
                        CFSTR("GetAvailableOfflineKeys"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles                WHERE tileset = @tileset   );",
                        CFSTR("DeleteTileSet"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT ext_uuid    FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles                WHERE tileset = @tileset   ) AND ext_uuid IS NOT NULL;",
                        CFSTR("GetExternalResourcesForTileSet"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles   );",
                        CFSTR("DeleteAllTiles"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT ext_uuid    FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles   ) AND ext_uuid IS NOT NULL;",
                        CFSTR("GetAllTileExternalResources"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT access_times.data_pk                FROM access_times INNER JOIN tiles ON access_times.data_pk = tiles.data_pk                ORDER BY access_times.timestamp, tiles.insert_timestamp ASC                LIMIT @limit   );",
                        CFSTR("DeleteOldestNTiles"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles                WHERE insert_timestamp < @insert_timestamp   );",
                        CFSTR("DeleteOldTileData"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT ext_uuid    FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles                WHERE insert_timestamp < @insert_timestamp   ) AND ext_uuid IS NOT NULL;",
                        CFSTR("GetOldTileExternalResources"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles                WHERE insert_timestamp < @insert_timestamp AND tileset = @tileset   );",
                        CFSTR("DeleteOldDataForTileset"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT ext_uuid    FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM tiles                WHERE insert_timestamp < @insert_timestamp AND tileset = @tileset   ) AND ext_uuid IS NOT NULL;",
                        CFSTR("GetOldTileExternalResourcesForTileSet"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT DISTINCT subscription_data_refs.subscription_pk, tiles.tileset, tiles.is_current    FROM subscription_data_refs INNER JOIN tiles ON tiles.data_pk = subscription_data_refs.data_pk    WHERE subscription_data_refs.data_pk in(           SELECT access_times.data_pk                FROM access_times INNER JOIN tiles ON access_times.data_pk = tiles.data_pk                ORDER BY access_times.timestamp, tiles.insert_timestamp ASC                LIMIT @limit   );",
                        CFSTR("FindSubscriptionsReferencingOldestNTiles"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT DISTINCT subscription_data_refs.subscription_pk, tiles.tileset, tiles.is_current    FROM subscription_data_refs INNER JOIN tiles ON tiles.data_pk = subscription_data_refs.data_pk    WHERE tiles.insert_timestamp < @tiles_insert_timestamp;",
                        CFSTR("FindSubscriptionsReferencingOldTiles"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM external_data_pending_deletion    WHERE ext_uuid IN(           SELECT ext_uuid                FROM data                WHERE ext_uuid IS NOT NULL   );",
                        CFSTR("UnmarkForDeletionExternalData"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM external_data_pending_deletion    WHERE ext_uuid IN(           SELECT ext_uuid                FROM offline_data                WHERE ext_uuid IS NOT NULL   );",
                        CFSTR("UnmarkForDeletionExternalOfflineData"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM offline_data_batches                WHERE layer = @layer AND version != @versionA AND version != @versionB   );",
                        CFSTR("DeleteDataForOfflineBatchesNotMatchingVersions"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM offline_data_batch_refs    WHERE layer = @layer AND version != @versionA AND version != @versionB;",
                        CFSTR("DeleteOfflineDataBatchRefsNotMatchingVersions"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM offline_data    WHERE layer = @layer AND version != @versionA AND version != @versionB;",
                        CFSTR("DeleteOfflineDataNotMatchingVersions"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM offline_data_batch_refs    WHERE batch_pk IN(           SELECT offline_data_batches.rowid                FROM offline_data_batches LEFT JOIN subscription_data_refs ON offline_data_batches.data_pk = subscription_data_refs.data_pk                WHERE subscription_data_refs.subscription_pk IS NULL   );",
                        CFSTR("DeleteOfflineBatchRefsNotAssociatedWithSubscription"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM offline_data_batches    WHERE offline_data_batches.rowid IN(           SELECT offline_data_batches.rowid                FROM offline_data_batches LEFT JOIN subscription_data_refs ON offline_data_batches.data_pk = subscription_data_refs.data_pk                WHERE subscription_data_refs.subscription_pk IS NULL   );",
                        CFSTR("DeleteOfflineBatchesNotAssociatedWithSubscription"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM offline_data_batches   ) AND data.rowid NOT IN(           SELECT data_pk                FROM subscription_data_refs   );",
                        CFSTR("DeleteOfflineDataNotAssociatedWithSubscription"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM offline_data    WHERE offline_data.rowid NOT IN(           SELECT offline_data_pk                FROM offline_data_batch_refs   );",
                        CFSTR("DeleteOfflineDataNotAssociatedWithBatch"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT INTO shiftresponse    (time, lat, lng, rad, data_pk)    VALUES (@time, @lat, @lng, @rad, @data_pk);",
                        CFSTR("AddShiftEntry"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT data.rowid, data.data    FROM shiftresponse INNER JOIN data ON shiftresponse.data_pk == data.rowid    WHERE insideRadius(@shiftresponse_lat, @shiftresponse_lng, shiftresponse.lat, shiftresponse.lng, shiftresponse.rad, @less) != 0    ORDER BY time DESC    LIMIT 1;",
                        CFSTR("FindShiftEntry"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT data.rowid, data.data    FROM shiftresponse INNER JOIN data ON shiftresponse.data_pk == data.rowid    WHERE coordinatesMatch(@shiftresponse_lat, @shiftresponse_lng, shiftresponse.lat, shiftresponse.lng, @epsilon) != 0    ORDER BY time DESC    LIMIT 1;",
                        CFSTR("FindShiftEntryWithin"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM shiftresponse                WHERE coordinatesMatch(@lat, @lng, lat, lng, 1e-8) != 0                ORDER BY time ASC                LIMIT 1   ) AND data.rowid NOT IN(           SELECT data_pk                FROM subscription_data_refs   );",
                        CFSTR("RemoveExactShiftEntry"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM shiftresponse                WHERE time < @time   ) AND data.rowid NOT IN(           SELECT data_pk                FROM subscription_data_refs   );",
                        CFSTR("PruneCachedShiftEntriesByDate"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "DELETE FROM data    WHERE data.rowid IN(           SELECT data_pk                FROM shiftresponse                ORDER BY time DESC                LIMIT -1                OFFSET @count   ) AND data.rowid NOT IN(           SELECT data_pk                FROM subscription_data_refs   );",
                        CFSTR("PruneCachedShiftEntriesByCount"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT time, lat, lng, rad    FROM shiftresponse    ORDER BY time DESC;",
                        CFSTR("ListAllShiftEntries"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT subscription_data_refs.subscription_pk, subscription_access_times.timestamp    FROM subscription_data_refs    LEFT JOIN subscription_access_times ON subscription_data_refs.subscription_pk = subscription_access_times.subscription_pk    WHERE subscription_data_refs.data_pk = @data_pk;",
                        CFSTR("FetchSubscriptionsReferencingData"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT subscriptions.rowid, subscriptions.identifier, subscriptions.data_types, subscriptions.expiration_timestamp, subscriptions.insert_timestamp, subscription_access_times.timestamp    FROM subscriptions    LEFT JOIN subscription_access_times ON subscriptions.rowid = subscription_access_times.subscription_pk;",
                        CFSTR("GetAllSubscriptionTimestamps"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT SUM(data.size), COUNT(1), COUNT(data.ext_uuid)    FROM data INNER JOIN tiles ON data.rowid = tiles.data_pk    WHERE tiles.insert_timestamp < @insert_timestamp;",
                        CFSTR("CalculateOldDataSize"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT SUM(data.size), COUNT(data.ext_uuid)    FROM data INNER JOIN tiles ON data.rowid = tiles.data_pk    WHERE tiles.tileset = @tileset;",
                        CFSTR("CalculateSizeOfTileSet"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT SUM(data.size), COUNT(1), COUNT(data.ext_uuid)    FROM data INNER JOIN tiles ON data.rowid = tiles.data_pk    WHERE tiles.tileset = @tileset AND tiles.insert_timestamp < @insert_timestamp;",
                        CFSTR("CalculateOldDataSizeForTileset"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT SUM(data.size), COUNT(1)    FROM data    INNER JOIN tiles ON tiles.data_pk = data.rowid    INNER JOIN subscription_data_refs ON data.rowid = subscription_data_refs.data_pk    WHERE subscription_data_refs.subscription_pk = @subscription_pk    AND tiles.tileset = @tileset    AND tiles.is_current = @is_current;",
                        CFSTR("GetSubscriptionSizeForTileset"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "SELECT SUM(data.size), COUNT(1)    FROM data    INNER JOIN offline_data_batches ON offline_data_batches.data_pk = data.rowid    INNER JOIN subscription_data_refs ON data.rowid = subscription_data_refs.data_pk    WHERE subscription_data_refs.subscription_pk = @subscription_pk    AND offline_data_batches.layer = @layer    AND offline_data_batches.version = @version;",
                        CFSTR("GetSubscriptionSizeForOfflineLayer"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT INTO external_data_pending_deletion    SELECT ext_uuid FROM data WHERE data.rowid IN(   SELECT data_pk FROM offline_data_batches WHERE layer = @layer AND version != @versionA AND version != @versionB   ) AND ext_uuid IS NOT NULL;",
                        CFSTR("MarkForDeletionExternalDataForOfflineBatchesNotMatchingVersions"))
    || !objc_msgSend(v21, "prepareStatement:forKey:", "INSERT INTO external_data_pending_deletion    SELECT ext_uuid FROM offline_data    WHERE ext_uuid IS NOT NULL AND layer = @layer AND version != @versionA AND version != @versionB;",
                        CFSTR("MarkForDeletionExternalDataForOfflineDataNotMatchingVersions"))
    || (objc_msgSend(v21, "prepareStatement:forKey:", "INSERT INTO external_data_pending_deletion    SELECT ext_uuid FROM data WHERE ext_uuid IS NOT NULL AND data.rowid IN(   SELECT data_pk FROM offline_data_batches   ) AND data.rowid NOT IN(   SELECT data_pk FROM subscription_data_refs   );",
          CFSTR("MarkForDeletionExternalDataForOfflineBatchesNotAssociatedWithSubscription")) & 1) == 0)
  {
    goto LABEL_28;
  }
  v27 = objc_msgSend(v21, "prepareStatement:forKey:", "INSERT INTO external_data_pending_deletion    SELECT ext_uuid FROM offline_data WHERE ext_uuid IS NOT NULL AND offline_data.rowid NOT IN(   SELECT offline_data_pk FROM offline_data_batch_refs   );",
          CFSTR("MarkForDeletionExternalDataForOfflineDataNotAssociatedWithBatch"));

  if (v27)
  {
    v28 = 0;
    while ((objc_msgSend(v21, "createIndex:", off_1E1C00870[v28]) & 1) != 0)
    {
      if (++v28 == 3)
      {
        objc_msgSend(v21, "setTemporaryStoreMode:", 2);
        v66 = 0;
        v67 = &v66;
        v68 = 0x3032000000;
        v69 = __Block_byref_object_copy__5;
        v70 = __Block_byref_object_dispose__5;
        v71 = 0;
        db = self->_db;
        v30 = MEMORY[0x1E0C809B0];
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __20__GEOTileDB__setup___block_invoke_388;
        v65[3] = &unk_1E1C008C0;
        v65[4] = self;
        v65[5] = &v66;
        v31 = db;
        v32 = v65;
        v75 = 0;
        v76 = &v75;
        v77 = 0x3032000000;
        v78 = __Block_byref_object_copy__5;
        v79 = __Block_byref_object_dispose__5;
        v80 = 0;
        *(_QWORD *)buf = v30;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __ReadDevicePosture_block_invoke;
        v84 = &unk_1E1BFF998;
        v33 = v31;
        v85 = v33;
        v34 = v32;
        v86 = v34;
        v87 = &v75;
        -[GEOSQLiteDB statementForKey:statementBlock:](v33, "statementForKey:statementBlock:", CFSTR("ReadDevicePosture"), buf);

        _Block_object_dispose(&v75, 8);
        v35 = (void *)v67[5];
        if (v35)
        {
          _languageLocale(self->_overrideLocale);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v35, "isEqualToString:", v36);

          if ((v37 & 1) == 0)
          {
            GEOGetTileDBLog();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1885A9000, v38, OS_LOG_TYPE_INFO, "Locale changed. Dropping all cached tile data", buf, 2u);
            }

            -[GEOTileDB _dropAllTileData](self, "_dropAllTileData");
          }
        }
        -[GEOTileDB _updateDevicePosture](self, "_updateDevicePosture");
        _Block_object_dispose(&v66, 8);

        editionsMap = self->_editionsMap;
        if (!editionsMap)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v40 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          v41 = self->_editionsMap;
          self->_editionsMap = v40;

          editionsMap = self->_editionsMap;
        }
        -[NSMutableDictionary removeAllObjects](editionsMap, "removeAllObjects");
        v42 = self->_db;
        v64[0] = v30;
        v64[1] = 3221225472;
        v64[2] = __20__GEOTileDB__setup___block_invoke_391;
        v64[3] = &unk_1E1C008E8;
        v64[4] = self;
        v43 = v42;
        v44 = v64;
        v75 = 0;
        v76 = &v75;
        v77 = 0x3032000000;
        v78 = __Block_byref_object_copy__5;
        v79 = __Block_byref_object_dispose__5;
        v80 = 0;
        *(_QWORD *)buf = v30;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __ReadEditions_block_invoke;
        v84 = &unk_1E1BFF998;
        v45 = v43;
        v85 = v45;
        v46 = v44;
        v86 = v46;
        v87 = &v75;
        -[GEOSQLiteDB statementForKey:statementBlock:](v45, "statementForKey:statementBlock:", CFSTR("ReadEditions"), buf);

        _Block_object_dispose(&v75, 8);
        objc_initWeak((id *)buf, self);
        -[GEOTileDB _removeExpiredSubscriptions](self, "_removeExpiredSubscriptions");
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObserver:selector:name:object:", self, sel__supportsOfflineDidChange_, CFSTR("GEOSupportsOfflineMapsDidChangeNotificationName"), 0);

        -[GEOTileDB _expireOfflineSubscriptionsForRegulatoryRegionIfNecessary](self, "_expireOfflineSubscriptionsForRegulatoryRegionIfNecessary");
        -[GEOOfflineDataConfiguration activeVersions](self->_offlineDataConfiguration, "activeVersions");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOOfflineDataConfiguration latestAvailableVersions](self->_offlineDataConfiguration, "latestAvailableVersions");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOTileDB _deleteOfflineDataNotMatchingVersions:orVersions:](self, "_deleteOfflineDataNotMatchingVersions:orVersions:", v48, v49);

        -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = v30;
        v62[1] = 3221225472;
        v62[2] = __20__GEOTileDB__setup___block_invoke_2_396;
        v62[3] = &unk_1E1C00800;
        objc_copyWeak(&v63, (id *)buf);
        _GEOConfigAddBlockListenerForKey(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1EDF4E2A8, v50, v62);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        tileElevationConfigListener = self->_tileElevationConfigListener;
        self->_tileElevationConfigListener = v51;

        if (v10)
          -[GEOTileDB _cleanUpOrphanedExternalResources](self, "_cleanUpOrphanedExternalResources");
        -[GEOTileDB _cleanUpDeletedExternalDataIfNecessary](self, "_cleanUpDeletedExternalDataIfNecessary");
        objc_destroyWeak(&v63);
        objc_destroyWeak((id *)buf);
        v25 = 1;
        goto LABEL_30;
      }
    }
  }
LABEL_29:
  v25 = 0;
LABEL_30:

  return v25;
}

uint64_t __20__GEOTileDB__setup___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "path");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "fileExistsAtPath:", v3))
    goto LABEL_6;
  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 152);

  if (!v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
    v9 = 0;
    v7 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v9);
    v2 = v9;

    if ((v7 & 1) != 0)
    {
LABEL_7:

      return objc_msgSend(*(id *)(a1 + 40), "vacuum");
    }
    GEOGetTileDBLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v2;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Failed to remove external resources directory: %{public}@", buf, 0xCu);
    }
LABEL_6:

    goto LABEL_7;
  }
  return objc_msgSend(*(id *)(a1 + 40), "vacuum");
}

uint64_t __20__GEOTileDB__setup___block_invoke_388(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v15;
  void *v16;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v15 = v9;
  v16 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  geo_isolate_sync_data();

  return 0;
}

void __20__GEOTileDB__setup___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 56));
}

uint64_t __20__GEOTileDB__setup___block_invoke_391(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  return 1;
}

void __20__GEOTileDB__setup___block_invoke_2_396(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dropAllTileData");

}

- (void)_cleanUpOrphanedExternalResources
{
  NSObject *v3;
  NSObject *v4;
  GEOSQLiteDB *db;
  _QWORD v6[5];
  uint8_t buf[16];

  GEOGetTileDBLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Cleaning up external data blobs which are no longer referenced by the database", buf, 2u);
  }

  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  db = self->_db;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__GEOTileDB__cleanUpOrphanedExternalResources__block_invoke;
  v6[3] = &unk_1E1C00938;
  v6[4] = self;
  -[GEOSQLiteDB ensureInTransaction:](db, "ensureInTransaction:", v6);
}

BOOL __46__GEOTileDB__cleanUpOrphanedExternalResources__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 result;
  NSObject *v15;
  const char *v16;
  void *context;
  _QWORD v18[4];
  id v19;
  id location[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x18D764E2C]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), MEMORY[0x1E0C9AA60], 21, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x18D764E2C]();
        v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v8, "relativePath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);

        if (v12 && (MarkExternalDataForDeletion(*(void **)(*(_QWORD *)(a1 + 32) + 8), v12) & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            LOWORD(location[0]) = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: MarkExternalDataForDeletion(_db, ((void *)0), externalResourceUUID)", (uint8_t *)location, 2u);
          }

          objc_autoreleasePoolPop(v9);
          objc_autoreleasePoolPop(context);
          return 0;
        }

        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_autoreleasePoolPop(context);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeStatement:statementBlock:", CFSTR("UnmarkForDeletionExternalData"), &__block_literal_global_978) & 1) == 0)
  {
    result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    LOWORD(location[0]) = 0;
    v15 = MEMORY[0x1E0C81028];
    v16 = "Assertion failed: UnmarkForDeletionExternalData(_db, ((void *)0))";
    goto LABEL_22;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeStatement:statementBlock:", CFSTR("UnmarkForDeletionExternalOfflineData"), &__block_literal_global_979) & 1) != 0)
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __46__GEOTileDB__cleanUpOrphanedExternalResources__block_invoke_399;
    v18[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v19, location);
    objc_msgSend(v13, "addTransactionPostCommitAction:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
  if (result)
  {
    LOWORD(location[0]) = 0;
    v15 = MEMORY[0x1E0C81028];
    v16 = "Assertion failed: UnmarkForDeletionExternalOfflineData(_db, ((void *)0))";
LABEL_22:
    _os_log_fault_impl(&dword_1885A9000, v15, OS_LOG_TYPE_FAULT, v16, (uint8_t *)location, 2u);
    return 0;
  }
  return result;
}

void __46__GEOTileDB__cleanUpOrphanedExternalResources__block_invoke_399(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanUpDeletedExternalDataIfNecessary");
    WeakRetained = v2;
  }

}

- (void)_cleanUpDeletedExternalDataIfNecessary
{
  GEOSQLiteDB *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__GEOTileDB__cleanUpDeletedExternalDataIfNecessary__block_invoke;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = self;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v3);
}

uint64_t __51__GEOTileDB__cleanUpDeletedExternalDataIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__GEOTileDB__cleanUpDeletedExternalDataIfNecessary__block_invoke_2;
  v4[3] = &unk_1E1C00938;
  v4[4] = v1;
  return objc_msgSend(v2, "executeInTransaction:", v4);
}

uint64_t __51__GEOTileDB__cleanUpDeletedExternalDataIfNecessary__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  __int128 buf;
  uint64_t (*v32)(uint64_t, sqlite3_stmt *);
  void *v33;
  id v34;
  uint64_t *v35;
  _QWORD *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  GEOGetTileDBLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Removing any external files which are no longer referenced by the database", (uint8_t *)&buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  v5 = MEMORY[0x1E0C809B0];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __51__GEOTileDB__cleanUpDeletedExternalDataIfNecessary__block_invoke_400;
  v22 = &unk_1E1C00AA0;
  v23 = v3;
  v24 = &v25;
  v6 = v4;
  v7 = &v19;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__5;
  v29[4] = __Block_byref_object_dispose__5;
  v30 = 0;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v32 = __GetAllExternalDataPendingDeletion_block_invoke;
  v33 = &unk_1E1BFF998;
  v8 = v6;
  v34 = v8;
  v9 = v7;
  v35 = v9;
  v36 = v29;
  LOBYTE(v7) = objc_msgSend(v8, "statementForKey:statementBlock:", CFSTR("GetAllExternalDataPendingDeletion"), &buf, v19, v20, v21, v22, v23, v24);

  _Block_object_dispose(v29, 8);
  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_17:
      v15 = 0;
      goto LABEL_13;
    }
    LOWORD(buf) = 0;
    v17 = MEMORY[0x1E0C81028];
    v18 = "Assertion failed: GetAllExternalDataPendingDeletion(_db, ((void *)0), ^(NSUUID *extUUID) { ++removedExternalRe"
          "sourcesCount; @autoreleasepool { NSURL *externalResourceURL = [_externalDataDirectory URLByAppendingPathCompon"
          "ent:extUUID.UUIDString]; [NSFileManager.defaultManager removeItemAtURL:externalResourceURL error:((void *)0)];"
          " } return __objc_yes; })";
LABEL_19:
    _os_log_fault_impl(&dword_1885A9000, v17, OS_LOG_TYPE_FAULT, v18, (uint8_t *)&buf, 2u);
    goto LABEL_17;
  }
  v10 = v26[3];
  GEOGetTileDBLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = v26[3];
      LODWORD(buf) = 134349056;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "Removed %{public}llu files which were no longer referenced by the database", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_12;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = v26[3];
    LODWORD(buf) = 134349056;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "Removed %{public}llu files which were no longer referenced by the database", (uint8_t *)&buf, 0xCu);
  }

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeStatement:statementBlock:", CFSTR("ClearAllExternalDataPendingDeletion"), &__block_literal_global_980) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_17;
    LOWORD(buf) = 0;
    v17 = MEMORY[0x1E0C81028];
    v18 = "Assertion failed: ClearAllExternalDataPendingDeletion(_db, ((void *)0))";
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "tileDBDidDeleteExternalResource:");
LABEL_12:
  v15 = 1;
LABEL_13:
  _Block_object_dispose(&v25, 8);
  return v15;
}

uint64_t __51__GEOTileDB__cleanUpDeletedExternalDataIfNecessary__block_invoke_400(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4 = (void *)MEMORY[0x18D764E2C]();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(v3, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeItemAtURL:error:", v7, 0);

  objc_autoreleasePoolPop(v4);
  return 1;
}

- (void)_localeChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  GEOSQLiteDB *db;
  id v8;
  _QWORD v9[4];
  id v10;
  GEOTileDB *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  GEOTileDB *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__5;
  v22[4] = __Block_byref_object_dispose__5;
  _GEOCreateTransaction();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  _languageLocale(self->_overrideLocale);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__5;
  v20[4] = __Block_byref_object_dispose__5;
  v21 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __28__GEOTileDB__localeChanged___block_invoke;
  v17 = &unk_1E1C00760;
  v18 = self;
  v19 = v20;
  geo_isolate_sync_data();
  db = self->_db;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __28__GEOTileDB__localeChanged___block_invoke_2;
  v9[3] = &unk_1E1C00960;
  v8 = v5;
  v10 = v8;
  v11 = self;
  v12 = v20;
  v13 = v22;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v9);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

}

void __28__GEOTileDB__localeChanged___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

void __28__GEOTileDB__localeChanged___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)) & 1) == 0)
  {
    GEOGetTileDBLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Locale changed. Dropping all cached tile data", v5, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_dropAllTileData");
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateDevicePosture");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)_deviceLocked:(id)a3
{
  -[GEOTileDB flushPendingWritesWithGroup:](self, "flushPendingWritesWithGroup:", 0);
}

- (void)_countryChanged:(id)a3
{
  GEOSQLiteDB *db;
  _QWORD v4[5];

  db = self->_db;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__GEOTileDB__countryChanged___block_invoke;
  v4[3] = &unk_1E1BFF6F8;
  v4[4] = self;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v4);
}

uint64_t __29__GEOTileDB__countryChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDevicePosture");
}

- (void)_editionUpdate:(id)a3
{
  void *v4;
  void *v5;
  GEOSQLiteDB *db;
  id v7;
  _QWORD v8[4];
  id v9;
  GEOTileDB *v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("GEOTileEditionUpdateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  db = self->_db;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__GEOTileDB__editionUpdate___block_invoke;
  v8[3] = &unk_1E1C00738;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v8);

}

void __28__GEOTileDB__editionUpdate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t *v10;
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  char v14;

  if (objc_msgSend(*(id *)(a1 + 32), "flushEverything"))
  {
    GEOGetTileDBLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Tile edition update requires full flush", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_dropAllTileData");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_flushPendingWrites");
    *(_QWORD *)buf = 0;
    v12 = buf;
    v13 = 0x2020000000;
    v14 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[2] = __28__GEOTileDB__editionUpdate___block_invoke_403;
    v7[3] = &unk_1E1C00988;
    v3 = *(void **)(a1 + 32);
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v7[1] = 3221225472;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 40);
    v8 = v5;
    v9 = v6;
    v10 = buf;
    objc_msgSend(v4, "executeInTransaction:", v7);
    if (v12[24])
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "tileDBDidDeleteExternalResource:");

    _Block_object_dispose(buf, 8);
  }
}

uint64_t __28__GEOTileDB__editionUpdate___block_invoke_403(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  char v7;
  char v8;
  uint64_t v9;
  uint8_t buf[4];

  if (objc_msgSend(*(id *)(a1 + 32), "invalidateEverything"))
  {
    GEOGetTileDBLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Tile edition update requires full invalidation", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_invalidateAllTileData");
  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "tilesetCount");
    if (v3)
    {
      v4 = v3;
      for (i = 0; i != v4; ++i)
      {
        *(_DWORD *)buf = 0;
        v9 = 0;
        v8 = 0;
        objc_msgSend(*(id *)(a1 + 32), "tileset:edition:provider:invalidateOnly:atIndex:", buf, (char *)&v9 + 4, &v9, &v8, i);
        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 40), "_invalidateTileSet:", *(unsigned int *)buf);
        }
        else
        {
          v7 = 0;
          objc_msgSend(*(id *)(a1 + 40), "_deleteTileSet:deletedExternalResources:", *(unsigned int *)buf, &v7);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v7;
        }
        objc_msgSend(*(id *)(a1 + 40), "_setEdition:forTileSet:", HIDWORD(v9), *(unsigned int *)buf);
      }
    }
  }
  return 1;
}

- (void)setExpirationRecords:(id *)a3 count:(unint64_t)a4
{
  void *v6;

  if (a4)
  {
    v6 = malloc_type_malloc(16 * a4, 0x1000040F7F8B94BuLL);
    memcpy(v6, a3, 16 * a4);
  }
  geo_isolate_sync_data();
}

void __40__GEOTileDB_setExpirationRecords_count___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = a1[4];
  v3 = *(void **)(v2 + 72);
  if (v3)
  {
    free(v3);
    v2 = a1[4];
  }
  v4 = a1[6];
  *(_QWORD *)(v2 + 72) = a1[5];
  *(_QWORD *)(a1[4] + 80) = v4;
}

- (void)beginPreloadSessionOfSize:(unint64_t)a3
{
  GEOSQLiteDB *db;
  _QWORD v4[6];

  db = self->_db;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__GEOTileDB_beginPreloadSessionOfSize___block_invoke;
  v4[3] = &unk_1E1BFF6D0;
  v4[4] = self;
  v4[5] = a3;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v4);
}

uint64_t __39__GEOTileDB_beginPreloadSessionOfSize___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = a1 + 32;
  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(v4 + 8);
  v5 = v2[3];
  v6 = v5 >= v3;
  v7 = v5 - v3;
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  result = objc_msgSend(v2, "_shrinkToSize:", v8);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
  return result;
}

- (void)endPreloadSession
{
  GEOSQLiteDB *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__GEOTileDB_endPreloadSession__block_invoke;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = self;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v3);
}

uint64_t __30__GEOTileDB_endPreloadSession__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 88) = 0;
  return result;
}

- (void)_vacuum
{
  NSObject *v3;
  GEOSQLiteDB *db;
  _QWORD v5[5];

  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__GEOTileDB__vacuum__block_invoke;
  v5[3] = &unk_1E1BFF6F8;
  v5[4] = self;
  -[GEOSQLiteDB performWithTemporaryStoreMode:block:](db, "performWithTemporaryStoreMode:block:", 1, v5);
}

uint64_t __20__GEOTileDB__vacuum__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "vacuum");
}

- (void)shrinkToSize:(unint64_t)a3 queue:(id)a4 finished:(id)a5
{
  id v8;
  id v9;
  GEOSQLiteDB *db;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;

  v8 = a4;
  v9 = a5;
  db = self->_db;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke;
  v17[3] = &unk_1E1C00A00;
  v17[4] = self;
  v20 = a3;
  v18 = v8;
  v19 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke_3;
  v14[3] = &unk_1E1C00A28;
  v15 = v18;
  v16 = v19;
  v12 = v19;
  v13 = v18;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v17, v14);

}

void __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_shrinkToSize:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_vacuum");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke_2;
  v4[3] = &unk_1E1C009D8;
  v3 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = v2;
  dispatch_async(v3, v4);

}

uint64_t __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke_4;
  block[3] = &unk_1E1C01F48;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __41__GEOTileDB_shrinkToSize_queue_finished___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)shrinkBySize:(unint64_t)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  GEOSQLiteDB *db;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;

  v8 = a4;
  v9 = a5;
  db = self->_db;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke;
  v17[3] = &unk_1E1C00A00;
  v17[4] = self;
  v20 = a3;
  v18 = v8;
  v19 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke_3;
  v14[3] = &unk_1E1C00A28;
  v15 = v18;
  v16 = v19;
  v12 = v19;
  v13 = v18;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v17, v14);

}

void __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_shrinkBySize:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_vacuum");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke_2;
  v4[3] = &unk_1E1C009D8;
  v3 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = v2;
  dispatch_async(v3, v4);

}

uint64_t __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke_4;
  block[3] = &unk_1E1C01F48;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __41__GEOTileDB_shrinkBySize_queue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)shrinkToSizeSync:(unint64_t)a3
{
  GEOSQLiteDB *db;
  unint64_t v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  db = self->_db;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__GEOTileDB_shrinkToSizeSync___block_invoke;
  v6[3] = &unk_1E1C00A50;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __30__GEOTileDB_shrinkToSizeSync___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_shrinkToSize:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "vacuum");
}

- (unint64_t)shrinkBySizeSync:(unint64_t)a3
{
  GEOSQLiteDB *db;
  unint64_t v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  db = self->_db;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__GEOTileDB_shrinkBySizeSync___block_invoke;
  v6[3] = &unk_1E1C00A50;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __30__GEOTileDB_shrinkBySizeSync___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_shrinkBySize:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "vacuum");
}

- (void)_incrementCalculatedTileDataSize:(unint64_t)a3
{
  if (self->_tileDataSizeIsValid)
    self->_tileDataSize += a3;
}

- (void)_decrementCalculatedTileDataSize:(unint64_t)a3
{
  unint64_t tileDataSize;
  BOOL v4;
  unint64_t v5;

  if (self->_tileDataSizeIsValid)
  {
    tileDataSize = self->_tileDataSize;
    v4 = tileDataSize >= a3;
    v5 = tileDataSize - a3;
    if (!v4)
      v5 = 0;
    self->_tileDataSize = v5;
  }
}

- (void)_evictIfNecessary
{
  -[GEOTileDB _shrinkToSize:](self, "_shrinkToSize:", self->_maxDatabaseSize);
}

- (unint64_t)_shrinkToSize:(unint64_t)a3
{
  NSObject *v3;
  unint64_t v4;
  unint64_t v8;
  uint8_t v9[16];

  if (self->_preloading)
  {
    GEOGetTileDBLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Refusing to shrink database because there is an active preload session", v9, 2u);
    }

    return 0;
  }
  v8 = -[GEOTileDB _allTileDataSize](self, "_allTileDataSize");
  v4 = v8;
  if (!a3)
  {
    -[GEOTileDB _dropAllTileData](self, "_dropAllTileData");
    return v4;
  }
  if (v8 <= a3)
    return 0;
  return -[GEOTileDB _shrinkBySizeSlow:](self, "_shrinkBySizeSlow:", v8 - a3);
}

- (unint64_t)_shrinkBySize:(unint64_t)a3
{
  NSObject *v3;
  unint64_t v4;
  unint64_t v7;
  uint8_t v9[16];

  if (self->_preloading)
  {
    GEOGetTileDBLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Refusing to shrink database because there is an active preload session", v9, 2u);
    }

    return 0;
  }
  else
  {
    v7 = -[GEOTileDB _allTileDataSize](self, "_allTileDataSize");
    if (v7 > a3)
      return -[GEOTileDB _shrinkBySizeSlow:](self, "_shrinkBySizeSlow:", a3);
    v4 = v7;
    -[GEOTileDB _dropAllTileData](self, "_dropAllTileData");
  }
  return v4;
}

- (unint64_t)_shrinkBySizeSlow:(unint64_t)a3
{
  NSObject *v5;
  GEOSQLiteDB *db;
  unint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  __int128 buf;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  GEOGetTileDBLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Attempting to shrink database by %{bytes}llu", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x2020000000;
  v16 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__GEOTileDB__shrinkBySizeSlow___block_invoke;
  v9[3] = &unk_1E1C00AF0;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = &buf;
  v9[7] = a3;
  -[GEOSQLiteDB executeInTransaction:](db, "executeInTransaction:", v9);
  -[GEOTileDB _decrementCalculatedTileDataSize:](self, "_decrementCalculatedTileDataSize:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 24));
  if (*((_BYTE *)v11 + 24))
    -[GEOObserverHashTable tileDBDidDeleteExternalResource:](self->_observers, "tileDBDidDeleteExternalResource:", self);
  v7 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&buf, 8);
  return v7;
}

uint64_t __31__GEOTileDB__shrinkBySizeSlow___block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current;
  double v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  id v9;
  uint64_t *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  int v20;
  id v21;
  _QWORD *v22;
  id v23;
  uint64_t *v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  void *v28;
  int v29;
  __int128 v30;
  void *v31;
  id v32;
  _QWORD *v33;
  id v34;
  uint64_t *v35;
  int v36;
  id v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  id v45;
  _QWORD *v46;
  id v47;
  uint64_t *v48;
  NSObject *v49;
  int v50;
  uint64_t v51;
  uint64_t *v52;
  id v53;
  id v54;
  int v55;
  NSObject *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[9];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  _QWORD v82[4];
  __int128 v83;
  _QWORD v84[7];
  _QWORD v85[3];
  int v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  int v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *(*v94)(_QWORD *);
  void *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t *v98;
  _QWORD v99[7];
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint8_t v114[128];
  _BYTE buf[32];
  id v116;
  uint64_t *v117;
  uint64_t *v118;
  unint64_t v119;
  int v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  v3 = *MEMORY[0x1E0C9ADF8];
  v4 = (unint64_t)(Current + -15552000.0 + *MEMORY[0x1E0C9ADF8]);
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v104 = 0;
  v105 = &v104;
  v106 = 0x2020000000;
  LODWORD(v107) = 0;
  v100 = 0;
  v101 = &v100;
  v102 = 0x2020000000;
  LODWORD(v103) = 0;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = MEMORY[0x1E0C809B0];
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __31__GEOTileDB__shrinkBySizeSlow___block_invoke_2;
  v99[3] = &unk_1E1C00A78;
  v99[4] = &v76;
  v99[5] = &v104;
  v99[6] = &v100;
  v7 = v5;
  v8 = v99;
  v108 = 0;
  v109 = &v108;
  v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__5;
  v112 = __Block_byref_object_dispose__5;
  v113 = 0;
  *(_QWORD *)buf = v6;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __CalculateOldDataSize_block_invoke;
  *(_QWORD *)&buf[24] = &unk_1E1C019E8;
  v9 = v7;
  v118 = &v108;
  v119 = v4;
  v116 = v9;
  v10 = v8;
  v117 = v10;
  objc_msgSend(v9, "statementForKey:statementBlock:", CFSTR("CalculateOldDataSize"), buf);

  _Block_object_dispose(&v108, 8);
  if (v77[3])
  {
    GEOGetTileDBLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *((_DWORD *)v105 + 6);
      v13 = v77[3];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v12;
      *(_WORD *)&buf[8] = 2048;
      *(_QWORD *)&buf[10] = v13;
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_INFO, "Deleting %d tiles (%{bytes}llu) > 6 months old", buf, 0x12u);
    }

    buf[0] = 0;
    objc_msgSend(*(id *)(a1 + 32), "_evictVeryOldTiles:", buf);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= buf[0];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v77[3];
  }
  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(&v76, 8);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 56))
  {
    GEOGetTileDBLog();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      v67 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v67;
      goto LABEL_39;
    }
  }
  else
  {
    v76 = 0;
    v77 = &v76;
    v78 = 0x2020000000;
    v79 = 0;
    v104 = 0;
    v105 = &v104;
    v106 = 0x2020000000;
    v107 = 0;
    v14 = *(_QWORD *)(a1 + 32);
    v92 = v6;
    v93 = 3221225472;
    v94 = __31__GEOTileDB__shrinkBySizeSlow___block_invoke_406;
    v95 = &unk_1E1C00788;
    v96 = v14;
    v97 = &v104;
    v98 = &v76;
    geo_isolate_sync_data();
    if (v105[3])
    {
      v16 = 0;
      v17 = 0;
      *(_QWORD *)&v15 = 67109634;
      v70 = v15;
      do
      {
        v91 = 0;
        v91 = *(_DWORD *)(v77[3] + v16);
        v18 = (unint64_t)(v3 + CFAbsoluteTimeGetCurrent() - *(double *)(v77[3] + v16 + 8));
        v100 = 0;
        v101 = &v100;
        v102 = 0x2020000000;
        v103 = 0;
        v87 = 0;
        v88 = &v87;
        v89 = 0x2020000000;
        v90 = 0;
        v85[0] = 0;
        v85[1] = v85;
        v85[2] = 0x2020000000;
        v86 = 0;
        v19 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        v20 = v91;
        v84[0] = v6;
        v84[1] = 3221225472;
        v84[2] = __31__GEOTileDB__shrinkBySizeSlow___block_invoke_2_407;
        v84[3] = &unk_1E1C00A78;
        v84[4] = &v100;
        v84[5] = &v87;
        v84[6] = v85;
        v21 = v19;
        v22 = v84;
        v108 = 0;
        v109 = &v108;
        v110 = 0x3032000000;
        v111 = __Block_byref_object_copy__5;
        v112 = __Block_byref_object_dispose__5;
        v113 = 0;
        *(_QWORD *)buf = v6;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __CalculateOldDataSizeForTileset_block_invoke;
        *(_QWORD *)&buf[24] = &unk_1E1C01A10;
        v23 = v21;
        v120 = v20;
        v116 = v23;
        v118 = &v108;
        v119 = v18;
        v24 = v22;
        v117 = v24;
        objc_msgSend(v23, "statementForKey:statementBlock:", CFSTR("CalculateOldDataSizeForTileset"), buf);

        _Block_object_dispose(&v108, 8);
        if (v101[3])
        {
          GEOGetTileDBLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = *((_DWORD *)v88 + 6);
            v27 = v101[3];
            GEOTileDBTileSetShortDescription((unsigned __int8 *)&v91);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v70;
            *(_DWORD *)&buf[4] = v26;
            *(_WORD *)&buf[8] = 2048;
            *(_QWORD *)&buf[10] = v27;
            *(_WORD *)&buf[18] = 2112;
            *(_QWORD *)&buf[20] = v28;
            _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_INFO, "Deleting %d expired tiles (%{bytes}llu) for tileset %@", buf, 0x1Cu);

          }
          objc_msgSend(*(id *)(a1 + 32), "_invalidateSubscriptionsReferencingTilesOlderThan:forTileSet:", v18, &v91);
          v29 = v91;
          v82[0] = v6;
          v30 = *(_OWORD *)(a1 + 32);
          v31 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
          v82[1] = 3221225472;
          v82[2] = __31__GEOTileDB__shrinkBySizeSlow___block_invoke_408;
          v82[3] = &unk_1E1C00AA0;
          v83 = v30;
          v32 = v31;
          v33 = v82;
          v108 = 0;
          v109 = &v108;
          v110 = 0x3032000000;
          v111 = __Block_byref_object_copy__5;
          v112 = __Block_byref_object_dispose__5;
          v113 = 0;
          *(_QWORD *)buf = v6;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __GetOldTileExternalResourcesForTileSet_block_invoke;
          *(_QWORD *)&buf[24] = &unk_1E1C01A10;
          v34 = v32;
          v118 = &v108;
          v119 = v18;
          v116 = v34;
          v120 = v29;
          v35 = v33;
          v117 = v35;
          objc_msgSend(v34, "statementForKey:statementBlock:", CFSTR("GetOldTileExternalResourcesForTileSet"), buf);

          _Block_object_dispose(&v108, 8);
          v36 = v91;
          v37 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
          v108 = 0;
          v109 = &v108;
          v110 = 0x3032000000;
          v111 = __Block_byref_object_copy__5;
          v112 = __Block_byref_object_dispose__5;
          v113 = 0;
          *(_QWORD *)buf = v6;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __DeleteOldDataForTileset_block_invoke;
          *(_QWORD *)&buf[24] = &unk_1E1C01A38;
          v38 = v37;
          v117 = &v108;
          v118 = (uint64_t *)v18;
          v116 = v38;
          LODWORD(v119) = v36;
          objc_msgSend(v38, "executeStatement:statementBlock:", CFSTR("DeleteOldDataForTileset"), buf);

          _Block_object_dispose(&v108, 8);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v101[3];
        }
        v39 = *(_QWORD *)(a1 + 56);
        v40 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        _Block_object_dispose(v85, 8);
        _Block_object_dispose(&v87, 8);
        _Block_object_dispose(&v100, 8);
        if (v40 >= v39)
          break;
        ++v17;
        v16 += 16;
      }
      while (v17 < v105[3]);
    }
    v41 = (void *)v77[3];
    if (v41)
      free(v41);
    _Block_object_dispose(&v104, 8);
    _Block_object_dispose(&v76, 8);
    v42 = *(_QWORD *)(a1 + 48);
    v43 = *(_QWORD *)(a1 + 56);
    if (*(_QWORD *)(*(_QWORD *)(v42 + 8) + 24) >= v43)
    {
      GEOGetTileDBLog();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        v68 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v68;
        goto LABEL_39;
      }
    }
    else
    {
      v104 = 0;
      v105 = &v104;
      v106 = 0x2020000000;
      LODWORD(v107) = 0;
      v100 = 0;
      v101 = &v100;
      v102 = 0x2020000000;
      v103 = 0;
      v76 = 0;
      v77 = &v76;
      v78 = 0x3032000000;
      v79 = __Block_byref_object_copy__5;
      v80 = __Block_byref_object_dispose__5;
      v81 = 0;
      v44 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v75[0] = v6;
      v75[1] = 3221225472;
      v75[2] = __31__GEOTileDB__shrinkBySizeSlow___block_invoke_409;
      v75[3] = &unk_1E1C00AC8;
      v75[4] = &v104;
      v75[5] = &v100;
      v75[6] = &v76;
      v75[7] = v42;
      v75[8] = v43;
      v45 = v44;
      v46 = v75;
      v108 = 0;
      v109 = &v108;
      v110 = 0x3032000000;
      v111 = __Block_byref_object_copy__5;
      v112 = __Block_byref_object_dispose__5;
      v113 = 0;
      *(_QWORD *)buf = v6;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __EnumerateDataSizeFromOldest_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E1BFF998;
      v47 = v45;
      v116 = v47;
      v48 = v46;
      v117 = v48;
      v118 = &v108;
      objc_msgSend(v47, "statementForKey:statementBlock:", CFSTR("EnumerateDataSizeFromOldest"), buf);

      _Block_object_dispose(&v108, 8);
      if (*((_DWORD *)v105 + 6))
      {
        GEOGetTileDBLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          v50 = *((_DWORD *)v105 + 6);
          v51 = v101[3];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = v50;
          *(_WORD *)&buf[8] = 2048;
          *(_QWORD *)&buf[10] = v51;
          _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_INFO, "Deleting %d oldest tiles (%{bytes}llu)", buf, 0x12u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_invalidateSubscriptionsReferencingOldestTilesWithLimit:", *((unsigned int *)v105 + 6));
        v52 = (uint64_t *)*((unsigned int *)v105 + 6);
        v53 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
        v108 = 0;
        v109 = &v108;
        v110 = 0x3032000000;
        v111 = __Block_byref_object_copy__5;
        v112 = __Block_byref_object_dispose__5;
        v113 = 0;
        *(_QWORD *)buf = v6;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __DeleteOldestNTiles_block_invoke;
        *(_QWORD *)&buf[24] = &unk_1E1BFF770;
        v54 = v53;
        v117 = &v108;
        v118 = v52;
        v116 = v54;
        v55 = objc_msgSend(v54, "executeStatement:statementBlock:", CFSTR("DeleteOldestNTiles"), buf);

        _Block_object_dispose(&v108, 8);
        if (objc_msgSend((id)v77[5], "count"))
        {
          GEOGetTileDBLog();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            v57 = objc_msgSend((id)v77[5], "count");
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v57;
            _os_log_impl(&dword_1885A9000, v56, OS_LOG_TYPE_INFO, "Deleting %llu externally-stored data blobs)", buf, 0xCu);
          }

          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v58 = (id)v77[5];
          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v71, v114, 16);
          if (v59)
          {
            v60 = *(_QWORD *)v72;
            do
            {
              for (i = 0; i != v59; ++i)
              {
                if (*(_QWORD *)v72 != v60)
                  objc_enumerationMutation(v58);
                v62 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
                objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "UUIDString", v70, (_QWORD)v71);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "URLByAppendingPathComponent:", v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteExternalResourceAtURL:error:", v64, 0);
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

              }
              v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v71, v114, 16);
            }
            while (v59);
          }

        }
        if (v55)
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v101[3];
      }
      _Block_object_dispose(&v76, 8);

      _Block_object_dispose(&v100, 8);
      _Block_object_dispose(&v104, 8);
      GEOGetTileDBLog();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        v66 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v66;
LABEL_39:
        _os_log_impl(&dword_1885A9000, v65, OS_LOG_TYPE_INFO, "Purged %{bytes}llu", buf, 0xCu);
      }
    }
  }

  return 1;
}

uint64_t __31__GEOTileDB__shrinkBySizeSlow___block_invoke_2(_QWORD *a1, uint64_t a2, int a3, int a4)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;
  return 1;
}

_QWORD *__31__GEOTileDB__shrinkBySizeSlow___block_invoke_406(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 80);
  v1 = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  if (v1)
  {
    v2 = result;
    *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = malloc_type_malloc(16 * v1, 0x1000040F7F8B94BuLL);
    return memcpy(*(void **)(*(_QWORD *)(v2[6] + 8) + 24), *(const void **)(v2[4] + 72), 16 * *(_QWORD *)(*(_QWORD *)(v2[5] + 8) + 24));
  }
  return result;
}

uint64_t __31__GEOTileDB__shrinkBySizeSlow___block_invoke_2_407(_QWORD *a1, uint64_t a2, int a3, int a4)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;
  return 1;
}

uint64_t __31__GEOTileDB__shrinkBySizeSlow___block_invoke_408(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (a2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    objc_msgSend(a2, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteExternalResourceAtURL:error:", v5, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  }
  return 1;
}

BOOL __31__GEOTileDB__shrinkBySizeSlow___block_invoke_409(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;

  v5 = a2;
  ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += a3;
  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1[6] + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    }
    objc_msgSend(v6, "addObject:", v5);
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) + *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) <= a1[8];

  return v10;
}

- (void)calculateFreeableSizeWithQueue:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  GEOSQLiteDB *db;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke;
  v15[3] = &unk_1E1BFFC90;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke_3;
  v12[3] = &unk_1E1C00A28;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v15, v12);

}

void __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_allTileDataSize");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke_2;
  v4[3] = &unk_1E1C009D8;
  v3 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = v2;
  dispatch_async(v3, v4);

}

uint64_t __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke_4;
  block[3] = &unk_1E1C01F48;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __52__GEOTileDB_calculateFreeableSizeWithQueue_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)clearPurgeableOfflineData
{
  GEOSQLiteDB *db;
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
  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__GEOTileDB_clearPurgeableOfflineData__block_invoke;
  v5[3] = &unk_1E1BFF920;
  v5[4] = self;
  v5[5] = &v6;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __38__GEOTileDB_clearPurgeableOfflineData__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t *v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[8];
  uint64_t v18;
  uint64_t (*v19)(uint64_t, sqlite3_stmt *);
  void *v20;
  id v21;
  uint64_t *v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(v3 + 8);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __38__GEOTileDB_clearPurgeableOfflineData__block_invoke_2;
  v14 = &unk_1E1C00B18;
  v15 = v3;
  v6 = v2;
  v16 = v6;
  v7 = v5;
  v8 = &v11;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__5;
  v24[4] = __Block_byref_object_dispose__5;
  v25 = 0;
  *(_QWORD *)buf = v4;
  v18 = 3221225472;
  v19 = __EnumerateOfflineDataExternalResources_block_invoke;
  v20 = &unk_1E1BFF998;
  v9 = v7;
  v21 = v9;
  v10 = v8;
  v22 = v10;
  v23 = v24;
  LOBYTE(v4) = objc_msgSend(v9, "statementForKey:statementBlock:", CFSTR("EnumerateOfflineDataExternalResources"), buf, v11, v12, v13, v14, v15);

  _Block_object_dispose(v24, 8);
  if ((v4 & 1) != 0)
  {

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: EnumerateOfflineDataExternalResources(_db, ((void *)0), ^BOOL(NSUUID *ext_uuid) { NSURL *fileURL = [_externalDataDirectory URLByAppendingPathComponent:ext_uuid.UUIDString]; if ([fileManager fileExistsAtPath"
        ":fileURL.path]) { if (__builtin_expect(!([fileManager removeItemAtURL:fileURL error:((void *)0)]), 0)) { __ext"
        "ension__({ os_log_t _log_tmp = (((__bridge os_log_t)&(_os_log_default))); os_log_type_t _type_tmp = OS_LOG_TYPE_"
        "FAULT; if (os_log_type_enabled(_log_tmp, _type_tmp)) { __extension__({ _Pragma(\"clang diagnostic push\") _Pragm"
        "a(\"clang diagnostic ignored \\\"-Wvla\\\"\") _Pragma(\"clang diagnostic error \\\"-Wformat\\\"\") _Static_asser"
        "t(__builtin_constant_p(\"Assertion failed: \" \"[fileManager removeItemAtURL:fileURL error:((void *)0)]\"), \"fo"
        "rmat/label/description argument must be a string constant\"); __attribute__((section(\"__TEXT,__oslogstring,cstr"
        "ing_literals\"),internal_linkage)) static const char _os_fmt_str[] __asm(\"LOS_LOG46\") = \"Assertion failed: \"
        " \"[fileManager removeItemAtURL:fileURL error:((void *)0)]\"; uint8_t _Alignas(16) __attribute__((uninitialized)"
        ") _os_fmt_buf[__builtin_os_log_format_buffer_size(\"Assertion failed: \" \"[fileManager removeItemAtURL:fileURL "
        "error:((void *)0)]\")]; _os_log_fault_impl(&__dso_handle, _log_tmp, _type_tmp, _os_fmt_str, (uint8_t *)__builtin"
        "_os_log_format(_os_fmt_buf, \"Assertion failed: \" \"[fileManager removeItemAtURL:fileURL error:((void *)0)]\"),"
        " (uint32_t)sizeof(_os_fmt_buf)) _Pragma(\"clang diagnostic pop\"); }); } }); return __objc_no; } else do {} whil"
        "e (0); } return __objc_yes; })",
        buf,
        2u);
    }

  }
}

uint64_t __38__GEOTileDB_clearPurgeableOfflineData__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v10[16];

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(a2, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((_DWORD)v6 && (objc_msgSend(*(id *)(a1 + 40), "removeItemAtURL:error:", v5, 0) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [fileManager removeItemAtURL:fileURL error:((void *)0)]", v10, 2u);
    }
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t __67__GEOTileDB__dataForKeyOnDBQueue_reason_callbackQueue_dataHandler___block_invoke_413(_QWORD *a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(double))(a1[4] + 16))(*(double *)(*(_QWORD *)(a1[10] + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

void __64__GEOTileDB_dataForKeys_reason_group_callbackQueue_dataHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__GEOTileDB_dataForKeys_reason_group_callbackQueue_dataHandler___block_invoke_3;
  block[3] = &unk_1E1C00BB8;
  v2 = *(NSObject **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __64__GEOTileDB_dataForKeys_reason_group_callbackQueue_dataHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(v2);
      if (!(*(unsigned int (**)(double))(*(_QWORD *)(a1 + 48) + 16))(0.0))
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

  v7 = *(NSObject **)(a1 + 40);
  if (v7)
    dispatch_group_leave(v7);
}

- (uint64_t)addData:(uint64_t)a3 forKey:(uint64_t)a4 edition:(uint64_t)a5 set:(unsigned int)a6 provider:(uint64_t)a7 etag:(uint64_t)a8 reason:(unsigned __int8)a9
{
  uint64_t v10;

  LOWORD(v10) = a9;
  return objc_msgSend(a1, "addData:forKey:edition:set:provider:etag:reason:isIdenticalToExistingStaleData:", a3, a4, a5, a6, v10);
}

- (uint64_t)addData:(uint64_t)a3 forKey:(uint64_t)a4 edition:(uint64_t)a5 set:(unsigned int)a6 provider:(uint64_t)a7 etag:(uint64_t)a8 reason:(__int16)a9 isIdenticalToExistingStaleData:
{
  uint64_t v10;

  LOWORD(v10) = a9;
  return objc_msgSend(a1, "addData:forKey:edition:set:provider:etag:reason:isIdenticalToExistingStaleData:forSubscriptionWithIdentifier:", a3, a4, a5, a6, v10, 0);
}

- (BOOL)_prepareDataForPersistence:(id)a3 isIdenticalToExistingStaleData:(BOOL)a4 externalResourceUUID:(id *)a5
{
  return -[GEOTileDB _prepareDataForPersistence:isIdenticalToExistingStaleData:preferredExternalResourceUUID:externalResourceUUID:](self, "_prepareDataForPersistence:isIdenticalToExistingStaleData:preferredExternalResourceUUID:externalResourceUUID:", a3, a4, 0, a5);
}

- (BOOL)_prepareDataForPersistence:(id)a3 isIdenticalToExistingStaleData:(BOOL)a4 preferredExternalResourceUUID:(id)a5 externalResourceUUID:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSURL *externalDataDirectory;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  int v25;
  NSObject *v26;
  BOOL v27;
  id v29[7];
  uint8_t v30[8];
  uint8_t *v31;
  uint64_t v32;
  char v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v8 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v16 = 0;
    goto LABEL_19;
  }
  if (v8)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v10, "fileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v13, "initWithUUIDString:", v15);

    if (v16)
      goto LABEL_19;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: newExternalResourceUUID != nil", v30, 2u);
    }
  }
  *(_QWORD *)v30 = 0;
  v31 = v30;
  v32 = 0x2020000000;
  v33 = 0;
  v29[1] = (id)MEMORY[0x1E0C809B0];
  v29[2] = (id)3221225472;
  v29[3] = __122__GEOTileDB__prepareDataForPersistence_isIdenticalToExistingStaleData_preferredExternalResourceUUID_externalResourceUUID___block_invoke;
  v29[4] = &unk_1E1BFF920;
  v29[5] = self;
  v29[6] = v30;
  geo_isolate_sync();
  if (v31[24])
  {
    if (v11)
    {
      v17 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v17;
    externalDataDirectory = self->_externalDataDirectory;
    objc_msgSend(v17, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL URLByAppendingPathComponent:](externalDataDirectory, "URLByAppendingPathComponent:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = 0;
    v23 = objc_msgSend(v21, "moveItemAtURL:toURL:error:", v22, v20, v29);
    v24 = v29[0];

    if ((v23 & 1) != 0)
    {
      objc_msgSend(v10, "_replaceFileURL:", v20);
      v25 = 0;
    }
    else
    {
      GEOGetTileDBLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v24;
        _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_ERROR, "Failed to move external resource: %{public}@", buf, 0xCu);
      }

      v25 = 1;
    }

  }
  else
  {
    v16 = 0;
    v25 = 1;
  }
  _Block_object_dispose(v30, 8);
  if (v25)
  {
    v27 = 0;
    goto LABEL_22;
  }
LABEL_19:
  if (a6)
  {
    v16 = objc_retainAutorelease(v16);
    *a6 = v16;
  }
  v27 = 1;
LABEL_22:

  return v27;
}

void __122__GEOTileDB__prepareDataForPersistence_isIdenticalToExistingStaleData_preferredExternalResourceUUID_externalResourceUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if ((v4 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  v14 = *MEMORY[0x1E0CB2AD8];
  v15[0] = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, v7, &v11);
  v9 = v11;

  if ((v8 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = 1;

LABEL_4:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    return;
  }
  GEOGetTileDBLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "Failed to create external resources directory: %{public}@", buf, 0xCu);
  }

}

- (void)addData:(void *)a3 forKey:(__int128 *)a4 edition:(int)a5 set:(int)a6 provider:(uint64_t)a7 etag:(void *)a8 reason:(char)a9 isIdenticalToExistingStaleData:(unsigned __int8)a10 forSubscriptionWithIdentifier:(void *)a11
{
  id v16;
  id v17;
  id v18;
  int v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  int v28;
  int v29;
  unsigned __int8 v30;
  __int128 v31;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a8;
  v18 = a11;
  if (v16)
  {
    v22 = 0;
    v19 = objc_msgSend(a1, "_prepareDataForPersistence:isIdenticalToExistingStaleData:externalResourceUUID:", v16, a10, &v22);
    v20 = v22;
    if (v19)
    {
      v31 = *a4;
      v21 = (void *)a1[1];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __122__GEOTileDB_addData_forKey_edition_set_provider_etag_reason_isIdenticalToExistingStaleData_forSubscriptionWithIdentifier___block_invoke;
      v23[3] = &unk_1E1C00C08;
      v23[4] = a1;
      v28 = a6;
      v29 = a5;
      v30 = a10;
      v24 = v16;
      v25 = v17;
      v32 = a9;
      v26 = v20;
      v27 = v18;
      objc_msgSend(v21, "executeAsync:", v23);

    }
  }

}

void __122__GEOTileDB_addData_forKey_edition_set_provider_etag_reason_isIdenticalToExistingStaleData_forSubscriptionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  __objc2_class **v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v8, "unsignedIntValue");
  v5 = *(unsigned int *)(a1 + 76);
  if (v4 != (_DWORD)v5)
  {
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateTileSet:", *(unsigned int *)(a1 + 72));
      v5 = *(unsigned int *)(a1 + 76);
    }
    objc_msgSend(*(id *)(a1 + 32), "_setEdition:forTileSet:", v5, *(unsigned int *)(a1 + 72));
  }
  if (*(_BYTE *)(a1 + 80))
    v6 = &off_1E1BEF370;
  else
    v6 = off_1E1BEF368;
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithTileKey:tileSet:data:ETag:reason:externalResourceUUID:forSubscriptionWithIdentifier:", a1 + 81, *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 97), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addOperation:", v7);

}

- (void)getLastAccessTimestampForKey:(__int128 *)a3 callbackQueue:(void *)a4 callback:(void *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    if (v8)
    {
      v19 = *a3;
      v11 = MEMORY[0x1E0C809B0];
      v12 = *(void **)(a1 + 8);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke;
      v16[3] = &unk_1E1C00C80;
      v16[4] = a1;
      v17 = v8;
      v18 = v10;
      v13[0] = v11;
      v13[1] = 3221225472;
      v13[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_6;
      v13[3] = &unk_1E1C00A28;
      v14 = v17;
      v15 = v18;
      objc_msgSend(v12, "executeAsync:errorHandler:", v16, v13);

    }
    else
    {
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    }
  }

}

void __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD block[4];
  id v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v2 = *(_DWORD *)(a1 + 56);
  v3 = *(_DWORD *)(a1 + 60);
  v4 = *(_DWORD *)(a1 + 64);
  v5 = *(_DWORD *)(a1 + 68);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = -1;
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_2;
  v29[3] = &unk_1E1C00C30;
  v29[4] = &v30;
  LookupTileRowForKey(v7, v2, v3, v4, v5, v29);
  if (v31[3] == -1)
  {
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_3;
    block[3] = &unk_1E1C01F48;
    v11 = *(NSObject **)(a1 + 40);
    v28 = *(id *)(a1 + 48);
    dispatch_async(v11, block);

  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 8);
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_4;
    v18[3] = &unk_1E1C00C58;
    v18[4] = v8;
    v18[5] = &v30;
    v18[6] = &v23;
    v18[7] = &v19;
    objc_msgSend(v9, "statementForKey:statementBlock:", CFSTR("GetAccessTime"), v18);
    if (*((_BYTE *)v24 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v20[3]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_5;
    v15[3] = &unk_1E1BFF970;
    v12 = *(NSObject **)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v16 = v10;
    v17 = v13;
    v14 = v10;
    dispatch_async(v12, v15);

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }
  _Block_object_dispose(&v30, 8);
}

uint64_t __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_4(_QWORD *a1, sqlite3_stmt *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  if (!objc_msgSend(*(id *)(a1[4] + 8), "bindInt64Parameter:toValue:inStatement:error:", "@data_pk", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), a2, 0)|| sqlite3_step(a2) != 100)
  {
    return 0;
  }
  v4 = sqlite3_column_type(a2, 0);
  v5 = *(_QWORD *)(a1[6] + 8);
  if (v4 == 5)
  {
    *(_BYTE *)(v5 + 24) = 0;
    return 1;
  }
  else
  {
    v6 = 1;
    *(_BYTE *)(v5 + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 8), "int64ForColumn:inStatment:", 0, a2);
  }
  return v6;
}

uint64_t __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_6(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_7;
  block[3] = &unk_1E1C01F48;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __65__GEOTileDB_getLastAccessTimestampForKey_callbackQueue_callback___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getStaleTileKeysUsedSince:(double)a3 fromTileSets:(id)a4 maxCount:(unint64_t)a5 maxTotalSize:(unint64_t)a6 queue:(id)a7 callback:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  GEOSQLiteDB *db;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  double v27;
  unint64_t v28;
  unint64_t v29;

  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = v16;
  if (v16)
  {
    if (v15)
    {
      db = self->_db;
      v19 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke;
      v23[3] = &unk_1E1C00CD0;
      v27 = a3;
      v23[4] = self;
      v24 = v14;
      v28 = a6;
      v29 = a5;
      v25 = v15;
      v26 = v17;
      v20[0] = v19;
      v20[1] = 3221225472;
      v20[2] = __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_4;
      v20[3] = &unk_1E1C00A28;
      v21 = v25;
      v22 = v26;
      -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v23, v20);

    }
    else
    {
      (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
    }
  }

}

void __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke(uint64_t a1)
{
  GEOTileKeyList *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  GEOTileKeyList *v7;
  id v8;
  _QWORD *v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  GEOTileKeyList *v14;
  _QWORD block[4];
  GEOTileKeyList *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  GEOTileKeyList *v20;
  _QWORD *v21;
  __int128 v22;
  _QWORD v23[4];
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD v29[5];
  id v30;

  v2 = objc_alloc_init(GEOTileKeyList);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v3 = (unint64_t)(*(double *)(a1 + 64) + *MEMORY[0x1E0C9ADF8]);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v18[2] = __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_2;
  v18[3] = &unk_1E1C00CA8;
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v19 = v4;
  v7 = v2;
  v20 = v7;
  v21 = v23;
  v22 = *(_OWORD *)(a1 + 72);
  v8 = v5;
  v9 = v18;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__5;
  v29[4] = __Block_byref_object_dispose__5;
  v30 = 0;
  v24[0] = v6;
  v24[1] = 3221225472;
  v24[2] = __GetRecentlyUsedStaleKeys_block_invoke;
  v24[3] = &unk_1E1C019E8;
  v10 = v8;
  v27 = v29;
  v28 = v3;
  v25 = v10;
  v11 = v9;
  v26 = v11;
  objc_msgSend(v10, "statementForKey:statementBlock:", CFSTR("GetRecentlyUsedStaleKeys"), v24);

  _Block_object_dispose(v29, 8);
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_3;
  block[3] = &unk_1E1BFF970;
  v12 = *(NSObject **)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v16 = v7;
  v17 = v13;
  v14 = v7;
  dispatch_async(v12, block);

  _Block_object_dispose(v23, 8);
}

BOOL __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v13 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v13, "containsObject:", v14);

  if (!(_DWORD)v13)
    return 1;
  v16[0] = a2 | (unint64_t)(a3 << 32);
  v16[1] = a4 | (unint64_t)(a5 << 32);
  objc_msgSend(*(id *)(a1 + 40), "addKey:", v16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += a7;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < *(_QWORD *)(a1 + 56)
      && (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") < *(_QWORD *)(a1 + 64);
}

uint64_t __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_4(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_5;
  block[3] = &unk_1E1C01F48;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __89__GEOTileDB_getStaleTileKeysUsedSince_fromTileSets_maxCount_maxTotalSize_queue_callback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)trackSubscriptionAssociationForKey:(__int128 *)a3 subscriptionIdentifier:(void *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v12 = *a3;
  v7 = *(void **)(a1 + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__GEOTileDB_trackSubscriptionAssociationForKey_subscriptionIdentifier___block_invoke;
  v9[3] = &unk_1E1BFFCE0;
  v10 = v6;
  v11 = a1;
  v8 = v6;
  objc_msgSend(v7, "executeAsync:", v9);

}

void __71__GEOTileDB_trackSubscriptionAssociationForKey_subscriptionIdentifier___block_invoke(uint64_t a1)
{
  _GEOTileDBAddSubscriptionAssociationOperation *v2;

  v2 = -[_GEOTileDBAddSubscriptionAssociationOperation initWithTileKey:subscriptionIdentifier:]([_GEOTileDBAddSubscriptionAssociationOperation alloc], "initWithTileKey:subscriptionIdentifier:", a1 + 48, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addOperation:", v2);

}

- (uint64_t)trackFailureForKey:(__int128 *)a3 tileSet:(int)a4 shouldProactivelyLoad:(char)a5
{
  void *v5;
  _QWORD v7[5];
  int v8;
  __int128 v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = *a3;
  v5 = *(void **)(a1 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__GEOTileDB_trackFailureForKey_tileSet_shouldProactivelyLoad___block_invoke;
  v7[3] = &unk_1E1C00CF8;
  v8 = a4;
  v10 = a5;
  v7[4] = a1;
  return objc_msgSend(v5, "executeAsync:", v7);
}

void __62__GEOTileDB_trackFailureForKey_tileSet_shouldProactivelyLoad___block_invoke(uint64_t a1)
{
  _GEOTileDBTrackFailureOperation *v2;

  v2 = -[_GEOTileDBTrackFailureOperation initWithTileKey:tileSet:shouldProactivelyLoad:]([_GEOTileDBTrackFailureOperation alloc], "initWithTileKey:tileSet:shouldProactivelyLoad:", a1 + 44, *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 60));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addOperation:", v2);

}

- (void)getFailedTileKeysForProactiveLoadSince:(double)a3 maxCount:(unint64_t)a4 queue:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  void *v12;
  GEOSQLiteDB *db;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  double v21;
  unint64_t v22;

  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (v11)
  {
    if (v10)
    {
      db = self->_db;
      v14 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke;
      v18[3] = &unk_1E1C00C80;
      v18[4] = self;
      v21 = a3;
      v22 = a4;
      v19 = v10;
      v20 = v12;
      v15[0] = v14;
      v15[1] = 3221225472;
      v15[2] = __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_4;
      v15[3] = &unk_1E1C00A28;
      v16 = v19;
      v17 = v20;
      -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v18, v15);

    }
    else
    {
      (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    }
  }

}

void __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke(uint64_t a1)
{
  GEOTileKeyList *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  GEOTileKeyList *v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  GEOTileKeyList *v14;
  _QWORD v15[4];
  GEOTileKeyList *v16;
  id v17;
  _QWORD v18[4];
  GEOTileKeyList *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD v26[5];
  id v27;

  objc_msgSend(*(id *)(a1 + 32), "_flushPendingWrites");
  v2 = objc_alloc_init(GEOTileKeyList);
  v3 = (unint64_t)fmax(*(double *)(a1 + 56) + *MEMORY[0x1E0C9ADF8], 0.0);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_2;
  v18[3] = &unk_1E1C00D20;
  v6 = v2;
  v7 = *(_QWORD *)(a1 + 64);
  v19 = v6;
  v20 = v7;
  v8 = v4;
  v9 = v18;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__5;
  v26[4] = __Block_byref_object_dispose__5;
  v27 = 0;
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __GetFailedKeysForProactiveLoad_block_invoke;
  v21[3] = &unk_1E1C019E8;
  v10 = v8;
  v24 = v26;
  v25 = v3;
  v22 = v10;
  v11 = v9;
  v23 = v11;
  objc_msgSend(v10, "statementForKey:statementBlock:", CFSTR("GetFailedKeysForProactiveLoad"), v21);

  _Block_object_dispose(v26, 8);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_3;
  v15[3] = &unk_1E1BFF970;
  v12 = *(NSObject **)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v16 = v6;
  v17 = v13;
  v14 = v6;
  dispatch_async(v12, v15);

}

BOOL __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = a2 | (unint64_t)(a3 << 32);
  v7[1] = a4 | (unint64_t)(a5 << 32);
  objc_msgSend(*(id *)(a1 + 32), "addKey:", v7);
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < *(_QWORD *)(a1 + 40);
}

uint64_t __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_4(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_5;
  block[3] = &unk_1E1C01F48;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __76__GEOTileDB_getFailedTileKeysForProactiveLoadSince_maxCount_queue_callback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (uint64_t)_markExistingTileDataAsCurrentOnDBQueue:(int *)a3 reason:(unsigned int)a4 subscriptionIdentifier:(void *)a5
{
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  id v14;
  CFAbsoluteTime Current;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  _QWORD v33[5];
  id v34;

  v8 = a5;
  v9 = *a3;
  v10 = a3[1];
  v11 = a3[2];
  v12 = a3[3];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = -1;
  v13 = MEMORY[0x1E0C809B0];
  v14 = a1[1];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __83__GEOTileDB__markExistingTileDataAsCurrentOnDBQueue_reason_subscriptionIdentifier___block_invoke;
  v22[3] = &unk_1E1C00C30;
  v22[4] = &v23;
  LookupTileRowForKey(v14, v9, v10, v11, v12, v22);
  if (v24[3] == -1)
    goto LABEL_9;
  Current = CFAbsoluteTimeGetCurrent();
  v16 = (uint64_t)(Current + *MEMORY[0x1E0C9ADF8]) & ~((uint64_t)(Current + *MEMORY[0x1E0C9ADF8]) >> 63);
  v17 = v24[3];
  v18 = a1[1];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__5;
  v33[4] = __Block_byref_object_dispose__5;
  v34 = 0;
  v27[0] = v13;
  v27[1] = 3221225472;
  v27[2] = __MarkCurrent_block_invoke;
  v27[3] = &unk_1E1C01A88;
  v19 = v18;
  v28 = v19;
  v29 = v33;
  v32 = a4;
  v30 = v16;
  v31 = v17;
  LOBYTE(v17) = objc_msgSend(v19, "executeStatement:statementBlock:", CFSTR("MarkCurrent"), v27);

  _Block_object_dispose(v33, 8);
  if ((v17 & 1) == 0 || a4 <= 4 && ((1 << a4) & 0x13) != 0 && !UpdateAccessTime(a1[1], v24[3], v16))
  {
LABEL_9:
    v20 = 0;
  }
  else
  {
    if (objc_msgSend(v8, "length"))
      objc_msgSend(a1, "_markDataAtRow:associatedWithSubscriptionIdentifier:", v24[3], v8);
    v20 = 1;
  }
  _Block_object_dispose(&v23, 8);

  return v20;
}

uint64_t __83__GEOTileDB__markExistingTileDataAsCurrentOnDBQueue_reason_subscriptionIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (int64_t)_insertDataRowForData:(id)a3 ETag:(id)a4 externalResourceUUID:(id)a5 timestamp:(int64_t *)a6 subscriptionIdentifier:(id)a7
{
  id v12;
  GEOSQLiteDB *db;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  GEOSQLiteDB *v20;
  _QWORD v22[7];

  v12 = a7;
  db = self->_db;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v16, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "length");

  LODWORD(v16) = InsertData(db, v17, v14, v18, v15);
  if ((_DWORD)v16)
  {
    v19 = -[GEOSQLiteDB lastInsertRowID](self->_db, "lastInsertRowID");
    v20 = self->_db;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __94__GEOTileDB__insertDataRowForData_ETag_externalResourceUUID_timestamp_subscriptionIdentifier___block_invoke;
    v22[3] = &unk_1E1C00D48;
    v22[4] = self;
    v22[5] = v19;
    v22[6] = a6;
    -[GEOSQLiteDB executeStatement:statementBlock:](v20, "executeStatement:statementBlock:", CFSTR("AddAccessTime"), v22);
    if (objc_msgSend(v12, "length"))
      -[GEOTileDB _markDataAtRow:associatedWithSubscriptionIdentifier:](self, "_markDataAtRow:associatedWithSubscriptionIdentifier:", v19, v12);
  }
  else
  {
    v19 = -1;
  }

  return v19;
}

uint64_t __94__GEOTileDB__insertDataRowForData_ETag_externalResourceUUID_timestamp_subscriptionIdentifier___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  _QWORD *v5;
  void *v6;

  result = objc_msgSend(*(id *)(a1[4] + 8), "bindInt64Parameter:toValue:inStatement:error:", "@data_pk", a1[5], a2, 0);
  if ((_DWORD)result)
  {
    v5 = (_QWORD *)a1[6];
    v6 = *(void **)(a1[4] + 8);
    if (v5)
    {
      if ((objc_msgSend(v6, "bindInt64Parameter:toValue:inStatement:error:", "@timestamp", *v5, a2, 0) & 1) == 0)
        return 0;
    }
    else
    {
      result = objc_msgSend(v6, "bindNullParameter:inStatement:error:", "@timestamp", a2, 0);
      if (!(_DWORD)result)
        return result;
    }
    return 1;
  }
  return result;
}

- (void)_addDataOnDBQueueWithData:(void *)a3 key:(int *)a4 tileSet:(int)a5 ETag:(void *)a6 reason:(unsigned int)a7 externalResourceUUID:(void *)a8 subscriptionIdentifier:(void *)a9
{
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD *v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  int v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v42[8];
  _QWORD v43[7];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t *v64;
  uint64_t *v65;
  unint64_t v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;

  v40 = a3;
  v39 = a6;
  v38 = a8;
  v37 = a9;
  v13 = *a4;
  v36 = a4[1];
  v15 = a4[2];
  v14 = a4[3];
  v16 = (uint64_t)(CFAbsoluteTimeGetCurrent() + *MEMORY[0x1E0C9ADF8]);
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = -1;
  v58 = v16;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__5;
  v52 = __Block_byref_object_dispose__5;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v17 = *(void **)(a1 + 8);
  v18 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __107__GEOTileDB__addDataOnDBQueueWithData_key_tileSet_ETag_reason_externalResourceUUID_subscriptionIdentifier___block_invoke;
  v43[3] = &unk_1E1C00D70;
  v43[4] = &v54;
  v43[5] = &v48;
  v43[6] = &v44;
  v19 = v17;
  v20 = v43;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__5;
  v77 = __Block_byref_object_dispose__5;
  v78 = 0;
  v59 = v18;
  v60 = 3221225472;
  v61 = (uint64_t)__LookupTileInfoForKey_block_invoke;
  v62 = &unk_1E1C01A60;
  v21 = v19;
  v63 = v21;
  v65 = &v73;
  v66 = __PAIR64__(v36, v13);
  v67 = v15;
  v68 = v14;
  v22 = v20;
  v64 = v22;
  objc_msgSend(v21, "statementForKey:statementBlock:", CFSTR("LookupTileInfoForKey"), &v59);

  _Block_object_dispose(&v73, 8);
  if (a7 <= 4 && ((1 << a7) & 0x13) != 0)
  {
    v23 = &v58;
    v24 = v18;
    goto LABEL_12;
  }
  v24 = v18;
  if (qword_1ECDBB8F0 != -1)
    dispatch_once(&qword_1ECDBB8F0, &__block_literal_global_10);
  if (_MergedGlobals_180 && v55[3] != -1)
  {
    v59 = 0;
    v60 = (uint64_t)&v59;
    v61 = 0x2020000000;
    LOBYTE(v62) = 0;
    v73 = 0;
    v74 = &v73;
    v75 = 0x2020000000;
    v76 = 0;
    v25 = *(void **)(a1 + 8);
    v42[0] = v18;
    v42[1] = 3221225472;
    v42[2] = __107__GEOTileDB__addDataOnDBQueueWithData_key_tileSet_ETag_reason_externalResourceUUID_subscriptionIdentifier___block_invoke_3;
    v42[3] = &unk_1E1C00C58;
    v42[4] = a1;
    v42[5] = &v54;
    v42[6] = &v59;
    v42[7] = &v73;
    objc_msgSend(v25, "statementForKey:statementBlock:", CFSTR("GetAccessTime"), v42);
    if (*(_BYTE *)(v60 + 24))
    {
      v58 = v74[3];
      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(&v59, 8);
      v23 = &v58;
      goto LABEL_12;
    }
    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(&v59, 8);
  }
  v23 = 0;
LABEL_12:
  v26 = objc_msgSend((id)a1, "_insertDataRowForData:ETag:externalResourceUUID:timestamp:subscriptionIdentifier:", v40, v39, v38, v23, v37);
  if (v26 != -1)
  {
    v27 = (void *)v49[5];
    if (v27)
    {
      v28 = *(void **)(a1 + 136);
      objc_msgSend(v27, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "URLByAppendingPathComponent:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 8), "deleteExternalResourceAtURL:error:", v30, 0);
      objc_msgSend(*(id *)(a1 + 160), "tileDBDidDeleteExternalResource:", a1);

    }
    DeleteFailedTile(*(void **)(a1 + 8), v13, v36, v15, v14);
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend((id)a1, "_decrementCalculatedTileDataSize:", v45[3]);
      objc_msgSend((id)a1, "_incrementCalculatedTileDataSize:", objc_msgSend(v40, "length"));
    }
    v31 = v58 & ~(v58 >> 63);
    v32 = *(id *)(a1 + 8);
    v73 = 0;
    v74 = &v73;
    v75 = 0x3032000000;
    v76 = __Block_byref_object_copy__5;
    v77 = __Block_byref_object_dispose__5;
    v78 = 0;
    v59 = v24;
    v60 = 3221225472;
    v61 = (uint64_t)__InsertTile_block_invoke;
    v62 = &unk_1E1C01B00;
    v33 = v32;
    v63 = v33;
    v64 = &v73;
    v67 = v13;
    v68 = v36;
    v69 = v15;
    v70 = v14;
    v71 = a5;
    v72 = a7;
    v65 = (uint64_t *)v31;
    v66 = v26;
    objc_msgSend(v33, "executeStatement:statementBlock:", CFSTR("InsertTile"), &v59);

    _Block_object_dispose(&v73, 8);
    v34 = v55[3];
    if (v34 != -1)
      DeleteData(*(void **)(a1 + 8), v34);
  }
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

uint64_t __107__GEOTileDB__addDataOnDBQueueWithData_key_tileSet_ETag_reason_externalResourceUUID_subscriptionIdentifier___block_invoke(_QWORD *a1, uint64_t a2, id obj, uint64_t a4)
{
  id v7;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
  v7 = obj;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;

  return 0;
}

uint64_t __107__GEOTileDB__addDataOnDBQueueWithData_key_tileSet_ETag_reason_externalResourceUUID_subscriptionIdentifier___block_invoke_2()
{
  uint64_t result;

  result = GEOConfigGetBOOL(GeoServicesConfig_TileDBInsertPreserveExistingAccessTime, (uint64_t)off_1EDF4D428);
  _MergedGlobals_180 = result;
  return result;
}

uint64_t __107__GEOTileDB__addDataOnDBQueueWithData_key_tileSet_ETag_reason_externalResourceUUID_subscriptionIdentifier___block_invoke_3(_QWORD *a1, sqlite3_stmt *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  if (!objc_msgSend(*(id *)(a1[4] + 8), "bindInt64Parameter:toValue:inStatement:error:", "@data_pk", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), a2, 0)|| sqlite3_step(a2) != 100)
  {
    return 0;
  }
  v4 = sqlite3_column_type(a2, 0);
  v5 = *(_QWORD *)(a1[6] + 8);
  if (v4 == 5)
  {
    *(_BYTE *)(v5 + 24) = 0;
    return 1;
  }
  else
  {
    v6 = 1;
    *(_BYTE *)(v5 + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 8), "int64ForColumn:inStatment:", 0, a2);
  }
  return v6;
}

- (void)_markDataAtRow:(int64_t)a3 associatedWithSubscriptionIdentifier:(id)a4
{
  id v6;
  uint64_t v7;
  GEOSQLiteDB *db;
  uint64_t v9;
  GEOSQLiteDB *v10;
  GEOSQLiteDB *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  __int128 buf;
  uint64_t (*v21)(_QWORD *, uint64_t);
  void *v22;
  GEOSQLiteDB *v23;
  _QWORD *v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = -1;
    v7 = MEMORY[0x1E0C809B0];
    db = self->_db;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__GEOTileDB__markDataAtRow_associatedWithSubscriptionIdentifier___block_invoke;
    v13[3] = &unk_1E1C00C30;
    v13[4] = &v14;
    GetSubscriptionPK(db, v6, v13);
    v9 = v15[3];
    if (v9 == -1)
    {
      GEOGetTileDBLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138477827;
        *(_QWORD *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Unknown subscription identifier: %{private}@", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {
      v10 = self->_db;
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x3032000000;
      v18[3] = __Block_byref_object_copy__5;
      v18[4] = __Block_byref_object_dispose__5;
      v19 = 0;
      *(_QWORD *)&buf = v7;
      *((_QWORD *)&buf + 1) = 3221225472;
      v21 = __InsertSubscriptionDataRef_block_invoke;
      v22 = &unk_1E1C01AB0;
      v11 = v10;
      v23 = v11;
      v24 = v18;
      v25 = v9;
      v26 = a3;
      -[GEOSQLiteDB executeStatement:statementBlock:](v11, "executeStatement:statementBlock:", CFSTR("InsertSubscriptionDataRef"), &buf);

      _Block_object_dispose(v18, 8);
    }
    _Block_object_dispose(&v14, 8);
  }

}

uint64_t __65__GEOTileDB__markDataAtRow_associatedWithSubscriptionIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)_markDataForTileKey:(int *)a3 associatedWithSubscriptionIdentifier:(void *)a4
{
  id v6;
  int v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int **v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v7 = *a3;
    v8 = a3[1];
    v9 = a3[2];
    v10 = a3[3];
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = -1;
    v11 = (void *)a1[1];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__GEOTileDB__markDataForTileKey_associatedWithSubscriptionIdentifier___block_invoke;
    v14[3] = &unk_1E1C00C30;
    v14[4] = &v15;
    LookupTileRowForKey(v11, v7, v8, v9, v10, v14);
    v12 = v16[3];
    if (v12 == -1)
    {
      GEOGetTileDBLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68158211;
        v21 = 8;
        v22 = 2097;
        v23 = &v19;
        v24 = 2113;
        v25 = v6;
        _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_FAULT, "No cached data exists for key %{private,geo:TileKey}.*P. Cannot associate it with subscription '%{private}@'", buf, 0x1Cu);
      }

    }
    else
    {
      objc_msgSend(a1, "_markDataAtRow:associatedWithSubscriptionIdentifier:", v12, v6);
    }
    _Block_object_dispose(&v15, 8);
  }

}

uint64_t __70__GEOTileDB__markDataForTileKey_associatedWithSubscriptionIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)_trackFailureOnDBQueueWithKey:(int *)a3 tileSet:(int)a4 shouldProactivelyLoad:(char)a5
{
  int v7;
  int v8;
  int v9;
  int v10;
  double Current;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  id v16;
  uint64_t *v17;
  unint64_t v18;
  void *v19;
  BOOL v20;
  uint64_t *v21;
  id v22;
  id v23;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  BOOL v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v7 = *a3;
  v8 = a3[1];
  v9 = a3[2];
  v10 = a3[3];
  Current = CFAbsoluteTimeGetCurrent();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v12 = *(void **)(a1 + 8);
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __73__GEOTileDB__trackFailureOnDBQueueWithKey_tileSet_shouldProactivelyLoad___block_invoke;
  v25[3] = &unk_1E1C00DC0;
  v25[4] = &v30;
  v25[5] = &v26;
  v14 = v12;
  v15 = v25;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__5;
  v51 = __Block_byref_object_dispose__5;
  v52 = 0;
  v34 = v13;
  v35 = 3221225472;
  v36 = __LookupFailureInfo_block_invoke;
  v37 = &unk_1E1C01A60;
  v16 = v14;
  v38 = v16;
  v40 = &v47;
  v41 = v7;
  v42 = v8;
  v43 = v9;
  v44 = v10;
  v17 = v15;
  v39 = v17;
  objc_msgSend(v16, "statementForKey:statementBlock:", CFSTR("LookupFailureInfo"), &v34);
  v18 = (unint64_t)(Current + *MEMORY[0x1E0C9ADF8]);

  _Block_object_dispose(&v47, 8);
  v19 = *(void **)(a1 + 8);
  v20 = (a5 & 1) != 0 || *((_BYTE *)v31 + 24) != 0;
  if (v27[3] <= v18)
    v21 = (uint64_t *)v18;
  else
    v21 = (uint64_t *)v27[3];
  v22 = v19;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__5;
  v51 = __Block_byref_object_dispose__5;
  v52 = 0;
  v34 = MEMORY[0x1E0C809B0];
  v35 = 3221225472;
  v36 = __InsertFailedTile_block_invoke;
  v37 = &unk_1E1C01B50;
  v23 = v22;
  v38 = v23;
  v39 = &v47;
  v41 = v7;
  v42 = v8;
  v43 = v9;
  v44 = v10;
  v45 = a4;
  v46 = v20;
  v40 = v21;
  objc_msgSend(v23, "executeStatement:statementBlock:", CFSTR("InsertFailedTile"), &v34);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

uint64_t __73__GEOTileDB__trackFailureOnDBQueueWithKey_tileSet_shouldProactivelyLoad___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  return 0;
}

- (uint64_t)deleteDataForKey:(__int128 *)a3
{
  void *v3;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = *a3;
  v3 = *(void **)(a1 + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__GEOTileDB_deleteDataForKey___block_invoke;
  v5[3] = &unk_1E1BFFD08;
  v5[4] = a1;
  return objc_msgSend(v3, "executeAsync:", v5);
}

void __30__GEOTileDB_deleteDataForKey___block_invoke(uint64_t a1)
{
  _GEOTileDBDeleteTileOperation *v2;

  v2 = -[_GEOTileDBDeleteTileOperation initWithTileKey:]([_GEOTileDBDeleteTileOperation alloc], "initWithTileKey:", a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "prunePendingOperationsSupercededByOperation:", v2);
  -[_GEOTileDBDeleteTileOperation performWithDB:](v2, "performWithDB:", *(_QWORD *)(a1 + 32));

}

- (void)_deleteDataOnDBQueueForKey:(int *)a3
{
  int v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  _QWORD v38[5];
  id v39;

  v4 = a3[1];
  v18 = *a3;
  v5 = a3[2];
  v6 = a3[3];
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = -1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  v25 = 0;
  v7 = *(void **)(a1 + 8);
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __40__GEOTileDB__deleteDataOnDBQueueForKey___block_invoke;
  v19[3] = &unk_1E1C00DE8;
  v19[4] = &v26;
  v19[5] = &v20;
  v9 = v7;
  v10 = v19;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__5;
  v38[4] = __Block_byref_object_dispose__5;
  v39 = 0;
  v30[0] = v8;
  v30[1] = 3221225472;
  v30[2] = __LookupTileExternalDataUUIDForKey_block_invoke;
  v30[3] = &unk_1E1C01A60;
  v11 = v9;
  v31 = v11;
  v33 = v38;
  v34 = v18;
  v35 = v4;
  v36 = v5;
  v37 = v6;
  v12 = v10;
  v32 = v12;
  objc_msgSend(v11, "statementForKey:statementBlock:", CFSTR("LookupTileExternalDataUUIDForKey"), v30);

  _Block_object_dispose(v38, 8);
  v13 = v27[3];
  if (v13 != -1)
    DeleteData(*(void **)(a1 + 8), v13);
  DeleteFailedTile(*(void **)(a1 + 8), v18, v4, v5, v6);
  v14 = (void *)v21[5];
  if (v14)
  {
    v15 = *(void **)(a1 + 136);
    objc_msgSend(v14, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 8), "deleteExternalResourceAtURL:error:", v17, 0);
    objc_msgSend(*(id *)(a1 + 160), "tileDBDidDeleteExternalResource:", a1);

  }
  *(_BYTE *)(a1 + 40) = 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

uint64_t __40__GEOTileDB__deleteDataOnDBQueueForKey___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  return 0;
}

- (void)deleteDataForTilesets:(id)a3
{
  id v4;
  GEOSQLiteDB *db;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__GEOTileDB_deleteDataForTilesets___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v7);

}

void __35__GEOTileDB_deleteDataForTilesets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t i;
  unsigned int v8;
  char v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_flushPendingWrites");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedIntValue");
        v10 = 0;
        objc_msgSend(*(id *)(a1 + 32), "_deleteTileSet:deletedExternalResources:", v8, &v10);
        v9 = v10 | v5;
        v5 = v9 != 0;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);

    if (v9)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "tileDBDidDeleteExternalResource:");
  }
  else
  {

  }
}

- (void)flushPendingWritesWithGroup:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  GEOSQLiteDB *db;
  NSObject *v7;
  _QWORD v8[5];
  NSObject *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
    dispatch_group_enter(v4);
  db = self->_db;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__GEOTileDB_flushPendingWritesWithGroup___block_invoke;
  v8[3] = &unk_1E1C00738;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v8);

}

void __41__GEOTileDB_flushPendingWritesWithGroup___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "_flushPendingWrites");
  v2 = *(NSObject **)(a1 + 40);
  if (v2)
    dispatch_group_leave(v2);
}

- (void)_flushPendingWrites
{
  NSObject *v3;

  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_GEOTileDBWriteQueue flushPendingOperations:](self->_writeQueue, "flushPendingOperations:", 1);
}

- (void)evaluateDevicePostureAgainstCurrentManifest:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  GEOSQLiteDB *db;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  _QWORD v11[5];
  NSObject *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
    dispatch_group_enter(v4);
  v6 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__GEOTileDB_evaluateDevicePostureAgainstCurrentManifest___block_invoke;
  v11[3] = &unk_1E1C00738;
  v11[4] = self;
  v12 = v5;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __57__GEOTileDB_evaluateDevicePostureAgainstCurrentManifest___block_invoke_3;
  v9[3] = &unk_1E1C00E10;
  v10 = v12;
  v8 = v12;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v11, v9);

}

void __57__GEOTileDB_evaluateDevicePostureAgainstCurrentManifest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  v14 = 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__5;
  v7 = __Block_byref_object_dispose__5;
  v8 = 0;
  geo_isolate_sync_data();
  objc_msgSend(*(id *)(a1 + 32), "_invalidateTileSetsForNewDevicePostureCountry:newDevicePostureRegion:oldDevicePostureCountry:oldDevicePostureRegion:", v10[5], v4[5], v10[5], v4[5]);
  v2 = *(NSObject **)(a1 + 40);
  if (v2)
    dispatch_group_leave(v2);
  _Block_object_dispose(&v3, 8);

  _Block_object_dispose(&v9, 8);
}

void __57__GEOTileDB_evaluateDevicePostureAgainstCurrentManifest___block_invoke_2(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 104));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 112));
}

void __57__GEOTileDB_evaluateDevicePostureAgainstCurrentManifest___block_invoke_3(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 32);
  if (v1)
    dispatch_group_leave(v1);
}

- (void)_updateDevicePosture
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  GEOSQLiteDB *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  GEOSQLiteDB *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[5];
  id v42;
  _BYTE buf[24];
  void *v44;
  GEOSQLiteDB *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  _QWORD *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  -[GEOCountryConfiguration countryCode](self->_countryConfiguration, "countryCode");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  _postureRegion(self->_overrideLocale);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  _languageLocale(self->_overrideLocale);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)objc_msgSend(v5, "copy");

  GEOGetTileDBLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "Setting device posture (country / region) to (%{private}@ / %{private}@)", buf, 0x16u);
  }

  if (!v6 || !v3 || !v4)
  {

    v4 = CFSTR("US");
    v6 = CFSTR("en:en_US");
    v3 = CFSTR("US");
  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__5;
  v39 = __Block_byref_object_dispose__5;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__5;
  v33 = __Block_byref_object_dispose__5;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = v3;
  v10 = v4;
  v11 = v6;
  v22 = v11;
  geo_isolate_sync_data();
  if ((v36[5] || v30[5])
    && (!-[__CFString isEqual:](v9, "isEqual:")
     || (-[__CFString isEqual:](v10, "isEqual:", v30[5]) & 1) == 0))
  {
    -[GEOTileDB _invalidateTileSetsForNewDevicePostureCountry:newDevicePostureRegion:oldDevicePostureCountry:oldDevicePostureRegion:](self, "_invalidateTileSetsForNewDevicePostureCountry:newDevicePostureRegion:oldDevicePostureCountry:oldDevicePostureRegion:", v9, v10, v36[5], v30[5]);
  }
  if (!-[__CFString isEqual:](v9, "isEqual:", v36[5])
    || !-[__CFString isEqual:](v10, "isEqual:", v30[5])
    || (-[__CFString isEqualToString:](v11, "isEqualToString:", v24[5]) & 1) == 0)
  {
    v12 = self->_db;
    v13 = v11;
    v14 = v11;
    v15 = v8;
    v16 = v9;
    v17 = v10;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__5;
    v41[4] = __Block_byref_object_dispose__5;
    v42 = 0;
    *(_QWORD *)buf = v15;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __SetDevicePosture_block_invoke;
    v44 = &unk_1E1C01B78;
    v18 = v12;
    v45 = v18;
    v19 = v14;
    v46 = v19;
    v49 = v41;
    v20 = v16;
    v47 = v20;
    v21 = v17;
    v48 = v21;
    -[GEOSQLiteDB executeStatement:statementBlock:](v18, "executeStatement:statementBlock:", CFSTR("SetDevicePosture"), buf);

    v11 = v13;
    _Block_object_dispose(v41, 8);

  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

}

void __33__GEOTileDB__updateDevicePosture__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v5;

  v8 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 96);
  *(_QWORD *)(v9 + 96) = v8;

}

- (void)_invalidateTileSetsForNewDevicePostureCountry:(id)a3 newDevicePostureRegion:(id)a4 oldDevicePostureCountry:(id)a5 oldDevicePostureRegion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  GEOTileDB *v25;
  char v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[GEOTileDB _flushPendingWrites](self, "_flushPendingWrites");
  if (objc_msgSend(v10, "isEqual:", v12))
    v14 = objc_msgSend(v11, "isEqualToString:", v13) ^ 1;
  else
    v14 = 1;
  -[GEOResourceManifestManager activeTileGroup](self->_manifestManager, "activeTileGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __129__GEOTileDB__invalidateTileSetsForNewDevicePostureCountry_newDevicePostureRegion_oldDevicePostureCountry_oldDevicePostureRegion___block_invoke;
  v20[3] = &unk_1E1C00E60;
  v21 = v10;
  v22 = v11;
  v26 = v14;
  v23 = v12;
  v24 = v13;
  v25 = self;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v15, "iterateActiveTileSets:", v20);

}

void __129__GEOTileDB__invalidateTileSetsForNewDevicePostureCountry_newDevicePostureRegion_oldDevicePostureCountry_oldDevicePostureRegion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isDisputedBordersAllowlistedForCountry:region:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)) & 1) != 0
    || *(_BYTE *)(a1 + 72)
    && objc_msgSend(v6, "isDisputedBordersAllowlistedForCountry:region:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)))
  {
    objc_msgSend(*(id *)(a1 + 64), "_invalidateTileSet:", a4);
  }

}

- (void)_invalidateTileSet:(id)a3
{
  unsigned int var0;
  GEOSQLiteDB *v5;
  uint64_t v6;
  GEOSQLiteDB *v7;
  _QWORD v8[5];
  unsigned int v9;
  _QWORD v10[4];
  GEOSQLiteDB *v11;
  _QWORD *v12;
  unsigned int v13;
  _QWORD v14[5];
  id v15;

  var0 = a3.var0;
  -[GEOTileDB _flushPendingWrites](self, "_flushPendingWrites");
  v5 = self->_db;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__5;
  v14[4] = __Block_byref_object_dispose__5;
  v15 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __InvalidateTileSet_block_invoke;
  v10[3] = &unk_1E1C01BA0;
  v7 = v5;
  v13 = var0;
  v11 = v7;
  v12 = v14;
  -[GEOSQLiteDB executeStatement:statementBlock:](v7, "executeStatement:statementBlock:", CFSTR("InvalidateTileSet"), v10);

  _Block_object_dispose(v14, 8);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __32__GEOTileDB__invalidateTileSet___block_invoke;
  v8[3] = &unk_1E1C00E88;
  v8[4] = self;
  v9 = var0;
  _GEOEnumerateMapDataSubscriptionTileDataTypes(v8);
}

uint64_t __32__GEOTileDB__invalidateTileSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTileSubscriptionStatesForDataType:dataSubtype:", a2, *(unsigned int *)(a1 + 40));
}

- (BOOL)_deleteTileSet:(id)a3 deletedExternalResources:(BOOL *)a4
{
  unsigned int var0;
  GEOSQLiteDB *db;
  uint64_t v7;
  GEOSQLiteDB *v8;
  _QWORD *v9;
  GEOSQLiteDB *v10;
  uint64_t *v11;
  _BOOL4 v12;
  GEOSQLiteDB *v13;
  GEOSQLiteDB *v14;
  _QWORD *v15;
  GEOSQLiteDB *v16;
  uint64_t *v17;
  GEOSQLiteDB *v18;
  GEOSQLiteDB *v19;
  GEOSQLiteDB *v20;
  GEOSQLiteDB *v21;
  unint64_t tileDataSize;
  unint64_t v23;
  BOOL v24;
  unint64_t v25;
  _QWORD v28[5];
  unsigned int v29;
  _QWORD v30[6];
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  GEOSQLiteDB *v48;
  uint64_t *v49;
  uint64_t *v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  var0 = a3.var0;
  -[GEOTileDB _flushPendingWrites](self, "_flushPendingWrites");
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  db = self->_db;
  v7 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __53__GEOTileDB__deleteTileSet_deletedExternalResources___block_invoke;
  v31[3] = &unk_1E1C00EB0;
  v31[4] = &v36;
  v31[5] = &v32;
  v8 = db;
  v9 = v31;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__5;
  v56 = __Block_byref_object_dispose__5;
  v57 = 0;
  v44 = v7;
  v45 = 3221225472;
  v46 = __CalculateSizeOfTileSet_block_invoke;
  v47 = &unk_1E1C01BC8;
  v10 = v8;
  v51 = var0;
  v48 = v10;
  v50 = &v52;
  v11 = v9;
  v49 = v11;
  v12 = -[GEOSQLiteDB statementForKey:statementBlock:](v10, "statementForKey:statementBlock:", CFSTR("CalculateSizeOfTileSet"), &v44);

  _Block_object_dispose(&v52, 8);
  if (*((_BYTE *)v33 + 24))
  {
    v13 = self->_db;
    v30[0] = v7;
    v30[1] = 3221225472;
    v30[2] = __53__GEOTileDB__deleteTileSet_deletedExternalResources___block_invoke_2;
    v30[3] = &unk_1E1C00AA0;
    v30[4] = self;
    v30[5] = &v40;
    v14 = v13;
    v15 = v30;
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__5;
    v56 = __Block_byref_object_dispose__5;
    v57 = 0;
    v44 = v7;
    v45 = 3221225472;
    v46 = __GetExternalResourcesForTileSet_block_invoke;
    v47 = &unk_1E1C01BC8;
    v16 = v14;
    v51 = var0;
    v48 = v16;
    v50 = &v52;
    v17 = v15;
    v49 = v17;
    -[GEOSQLiteDB statementForKey:statementBlock:](v16, "statementForKey:statementBlock:", CFSTR("GetExternalResourcesForTileSet"), &v44);

    _Block_object_dispose(&v52, 8);
  }
  v18 = self->_db;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__5;
  v56 = __Block_byref_object_dispose__5;
  v57 = 0;
  v44 = v7;
  v45 = 3221225472;
  v46 = __DeleteTileSet_block_invoke;
  v47 = &unk_1E1C01BA0;
  v19 = v18;
  LODWORD(v50) = var0;
  v48 = v19;
  v49 = &v52;
  -[GEOSQLiteDB executeStatement:statementBlock:](v19, "executeStatement:statementBlock:", CFSTR("DeleteTileSet"), &v44);

  _Block_object_dispose(&v52, 8);
  v20 = self->_db;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__5;
  v56 = __Block_byref_object_dispose__5;
  v57 = 0;
  v44 = v7;
  v45 = 3221225472;
  v46 = __DeleteFailedTilesForTileSet_block_invoke;
  v47 = &unk_1E1C01BA0;
  v21 = v20;
  LODWORD(v50) = var0;
  v48 = v21;
  v49 = &v52;
  -[GEOSQLiteDB executeStatement:statementBlock:](v21, "executeStatement:statementBlock:", CFSTR("DeleteFailedTilesForTileSet"), &v44);

  _Block_object_dispose(&v52, 8);
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __53__GEOTileDB__deleteTileSet_deletedExternalResources___block_invoke_3;
  v28[3] = &unk_1E1C00E88;
  v28[4] = self;
  v29 = var0;
  _GEOEnumerateMapDataSubscriptionTileDataTypes(v28);
  if (v12)
  {
    if (self->_tileDataSizeIsValid)
    {
      tileDataSize = self->_tileDataSize;
      v23 = v37[3];
      v24 = tileDataSize >= v23;
      v25 = tileDataSize - v23;
      if (v24)
      {
        self->_tileDataSize = v25;
        if (!a4)
          goto LABEL_11;
      }
      else
      {
        self->_tileDataSize = 0;
        if (!a4)
          goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else
  {
    self->_tileDataSizeIsValid = 0;
  }
  if (a4)
LABEL_10:
    *a4 = *((_BYTE *)v41 + 24);
LABEL_11:
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  return 1;
}

uint64_t __53__GEOTileDB__deleteTileSet_deletedExternalResources___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 != 0;
  return 1;
}

uint64_t __53__GEOTileDB__deleteTileSet_deletedExternalResources___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (a2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    objc_msgSend(a2, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteExternalResourceAtURL:error:", v5, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  }
  return 1;
}

uint64_t __53__GEOTileDB__deleteTileSet_deletedExternalResources___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTileSubscriptionStatesForDataType:dataSubtype:", a2, *(unsigned int *)(a1 + 40));
}

- (void)_setEdition:(unsigned int)a3 forTileSet:(id)a4
{
  unsigned int var0;
  uint64_t v5;
  NSMutableDictionary *editionsMap;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  GEOSQLiteDB *v13;
  GEOSQLiteDB *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  unsigned int v18;
  _QWORD v19[5];
  id v20;
  _BYTE buf[24];
  void *v22;
  GEOSQLiteDB *v23;
  _QWORD *v24;
  unsigned int v25;
  int v26;
  uint64_t v27;

  var0 = a4.var0;
  v5 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  v18 = a4.var0;
  editionsMap = self->_editionsMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](editionsMap, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_6:
    v13 = self->_db;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__5;
    v19[4] = __Block_byref_object_dispose__5;
    v20 = 0;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __SetEdition_block_invoke;
    v22 = &unk_1E1BFF770;
    v14 = v13;
    v23 = v14;
    v24 = v19;
    v25 = var0;
    v26 = v5;
    -[GEOSQLiteDB executeStatement:statementBlock:](v14, "executeStatement:statementBlock:", CFSTR("SetEdition"), buf);

    _Block_object_dispose(v19, 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_editionsMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v17);

    goto LABEL_7;
  }
  if (objc_msgSend(v9, "unsignedIntValue") != (_DWORD)v5)
  {
    GEOGetTileDBLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      GEOTileDBTileSetShortDescription((unsigned __int8 *)&v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "unsignedIntValue");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v12;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v5;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_INFO, "Tile edition upgrade for tileSet %@: %d=>%d", buf, 0x18u);

    }
    var0 = v18;
    goto LABEL_6;
  }
LABEL_7:

}

- (BOOL)_dropAllTileData
{
  GEOSQLiteDB *db;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  -[GEOTileDB _flushPendingWrites](self, "_flushPendingWrites");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  db = self->_db;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__GEOTileDB__dropAllTileData__block_invoke;
  v6[3] = &unk_1E1C00F00;
  v6[4] = self;
  v6[5] = &v7;
  v4 = -[GEOSQLiteDB executeInTransaction:](db, "executeInTransaction:", v6);
  self->_tileDataSizeIsValid = 1;
  self->_tileDataSize = 0;
  if (*((_BYTE *)v8 + 24))
    -[GEOObserverHashTable tileDBDidDeleteExternalResource:](self->_observers, "tileDBDidDeleteExternalResource:", self);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __29__GEOTileDB__dropAllTileData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  void *v4;
  id v5;
  _QWORD *v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v11[5];
  _QWORD v12[4];
  __int128 v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v2 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v12[1] = 3221225472;
  v12[2] = __29__GEOTileDB__dropAllTileData__block_invoke_2;
  v12[3] = &unk_1E1C00AA0;
  v13 = v3;
  v5 = v4;
  v6 = v12;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__5;
  v18[4] = __Block_byref_object_dispose__5;
  v19 = 0;
  v14[0] = v2;
  v14[1] = 3221225472;
  v14[2] = __GetAllTileExternalResources_block_invoke;
  v14[3] = &unk_1E1BFF998;
  v7 = v5;
  v15 = v7;
  v8 = v6;
  v16 = v8;
  v17 = v18;
  objc_msgSend(v7, "statementForKey:statementBlock:", CFSTR("GetAllTileExternalResources"), v14);

  _Block_object_dispose(v18, 8);
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeStatement:statementBlock:", CFSTR("DeleteAllTiles"), &__block_literal_global_1005);
  v11[0] = v2;
  v11[1] = 3221225472;
  v11[2] = __29__GEOTileDB__dropAllTileData__block_invoke_3;
  v11[3] = &unk_1E1C00ED8;
  v11[4] = *(_QWORD *)(a1 + 32);
  _GEOEnumerateMapDataSubscriptionTileDataTypes(v11);
  return v9;
}

uint64_t __29__GEOTileDB__dropAllTileData__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (a2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    objc_msgSend(a2, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteExternalResourceAtURL:error:", v5, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  }
  return 1;
}

void __29__GEOTileDB__dropAllTileData__block_invoke_3(uint64_t a1, int a2)
{
  BulkUpdateSubscriptionDataStateAllSubtypes(*(void **)(*(_QWORD *)(a1 + 32) + 8), a2);
}

- (void)_invalidateAllTileData
{
  _QWORD v3[5];

  -[_GEOTileDBWriteQueue dropAllPendingOperations](self->_writeQueue, "dropAllPendingOperations");
  -[GEOSQLiteDB executeStatement:statementBlock:](self->_db, "executeStatement:statementBlock:", CFSTR("InvalidateAllData"), &__block_literal_global_1009);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__GEOTileDB__invalidateAllTileData__block_invoke;
  v3[3] = &unk_1E1C00ED8;
  v3[4] = self;
  _GEOEnumerateMapDataSubscriptionTileDataTypes(v3);
}

void __35__GEOTileDB__invalidateAllTileData__block_invoke(uint64_t a1, int a2)
{
  BulkUpdateSubscriptionDataStateAllSubtypes(*(void **)(*(_QWORD *)(a1 + 32) + 8), a2);
}

- (void)_invalidateTileSubscriptionStatesForDataType:(unsigned int)a3 dataSubtype:(unsigned int)a4
{
  GEOSQLiteDB *v6;
  GEOSQLiteDB *v7;
  _QWORD v8[4];
  GEOSQLiteDB *v9;
  _QWORD *v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  char v14;
  _QWORD v15[5];
  id v16;

  v6 = self->_db;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__5;
  v15[4] = __Block_byref_object_dispose__5;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __BulkUpdateSubscriptionDataState_block_invoke;
  v8[3] = &unk_1E1C01C58;
  v7 = v6;
  v9 = v7;
  v10 = v15;
  v12 = a3;
  v13 = a4;
  v11 = 1;
  v14 = 0;
  -[GEOSQLiteDB executeStatement:statementBlock:](v7, "executeStatement:statementBlock:", CFSTR("BulkUpdateSubscriptionDataState"), v8);

  _Block_object_dispose(v15, 8);
}

- (void)_invalidatedTilesReferencedBySubscription:(int64_t)a3 tileSet:(unsigned int)a4
{
  _QWORD v4[6];
  unsigned int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__GEOTileDB__invalidatedTilesReferencedBySubscription_tileSet___block_invoke;
  v4[3] = &unk_1E1C00F28;
  v4[4] = self;
  v4[5] = a3;
  v5 = a4;
  _GEOEnumerateMapDataSubscriptionTileDataTypes(v4);
}

void __63__GEOTileDB__invalidatedTilesReferencedBySubscription_tileSet___block_invoke(uint64_t a1, int a2)
{
  SetSubscriptionDataState(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40), a2, *(_DWORD *)(a1 + 48), 1, 0, 0, 0);
}

- (void)evictVeryOldTilesWithGroup:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  GEOSQLiteDB *db;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  _QWORD v11[5];
  NSObject *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
    dispatch_group_enter(v4);
  v6 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__GEOTileDB_evictVeryOldTilesWithGroup___block_invoke;
  v11[3] = &unk_1E1C00738;
  v11[4] = self;
  v12 = v5;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __40__GEOTileDB_evictVeryOldTilesWithGroup___block_invoke_2;
  v9[3] = &unk_1E1C00E10;
  v10 = v12;
  v8 = v12;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v11, v9);

}

void __40__GEOTileDB_evictVeryOldTilesWithGroup___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "_evictVeryOldTiles:", 0);
  v2 = *(NSObject **)(a1 + 40);
  if (v2)
    dispatch_group_leave(v2);
}

void __40__GEOTileDB_evictVeryOldTilesWithGroup___block_invoke_2(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 32);
  if (v1)
    dispatch_group_leave(v1);
}

- (void)_evictVeryOldTiles:(BOOL *)a3
{
  CFAbsoluteTime Current;
  double v6;
  unint64_t v7;
  GEOSQLiteDB *db;
  uint64_t v9;
  GEOSQLiteDB *v10;
  uint64_t *v11;
  GEOSQLiteDB *v12;
  uint64_t *v13;
  GEOSQLiteDB *v14;
  GEOSQLiteDB *v15;
  unint64_t v16;
  GEOSQLiteDB *v17;
  GEOSQLiteDB *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  GEOTileDB *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  GEOSQLiteDB *v33;
  uint64_t *v34;
  uint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  Current = CFAbsoluteTimeGetCurrent();
  v6 = *MEMORY[0x1E0C9ADF8];
  v7 = (unint64_t)(Current + -15552000.0 + *MEMORY[0x1E0C9ADF8]);
  -[GEOTileDB _invalidateSubscriptionsReferencingTilesOlderThan:forTileSet:](self, "_invalidateSubscriptionsReferencingTilesOlderThan:forTileSet:", v7, 0);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  db = self->_db;
  v9 = MEMORY[0x1E0C809B0];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __32__GEOTileDB__evictVeryOldTiles___block_invoke;
  v22 = &unk_1E1C00AA0;
  v23 = self;
  v24 = &v25;
  v10 = db;
  v11 = &v19;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__5;
  v41 = __Block_byref_object_dispose__5;
  v42 = 0;
  v29 = v9;
  v30 = 3221225472;
  v31 = __GetOldTileExternalResources_block_invoke;
  v32 = &unk_1E1C019E8;
  v12 = v10;
  v35 = &v37;
  v36 = v7;
  v33 = v12;
  v13 = v11;
  v34 = v13;
  -[GEOSQLiteDB statementForKey:statementBlock:](v12, "statementForKey:statementBlock:", CFSTR("GetOldTileExternalResources"), &v29, v19, v20, v21, v22, v23, v24);

  _Block_object_dispose(&v37, 8);
  v14 = self->_db;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__5;
  v41 = __Block_byref_object_dispose__5;
  v42 = 0;
  v29 = v9;
  v30 = 3221225472;
  v31 = __DeleteOldTileData_block_invoke;
  v32 = &unk_1E1BFF770;
  v15 = v14;
  v34 = &v37;
  v35 = (uint64_t *)v7;
  v33 = v15;
  -[GEOSQLiteDB executeStatement:statementBlock:](v15, "executeStatement:statementBlock:", CFSTR("DeleteOldTileData"), &v29);

  _Block_object_dispose(&v37, 8);
  v16 = (unint64_t)(v6 + CFAbsoluteTimeGetCurrent() + -1209600.0);
  v17 = self->_db;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__5;
  v41 = __Block_byref_object_dispose__5;
  v42 = 0;
  v29 = v9;
  v30 = 3221225472;
  v31 = __DeleteOldFailedTiles_block_invoke;
  v32 = &unk_1E1BFF770;
  v18 = v17;
  v34 = &v37;
  v35 = (uint64_t *)v16;
  v33 = v18;
  -[GEOSQLiteDB executeStatement:statementBlock:](v18, "executeStatement:statementBlock:", CFSTR("DeleteOldFailedTiles"), &v29);

  _Block_object_dispose(&v37, 8);
  self->_tileDataSizeIsValid = 0;
  if (a3)
    *a3 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v25, 8);
}

uint64_t __32__GEOTileDB__evictVeryOldTiles___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (a2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    objc_msgSend(a2, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteExternalResourceAtURL:error:", v5, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  }
  return 1;
}

- (void)_invalidateSubscriptionsReferencingTilesOlderThan:(unint64_t)a3 forTileSet:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  GEOSQLiteDB *db;
  id v11;
  id v12;
  GEOSQLiteDB *v13;
  _QWORD *v14;
  GEOSQLiteDB *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  $BEA7584F61CD05F8F8BF60F665CAC5DB *v27;
  uint8_t buf[8];
  uint64_t v29;
  uint64_t (*v30)(uint64_t, sqlite3_stmt *);
  void *v31;
  GEOSQLiteDB *v32;
  id v33;
  _QWORD *v34;
  unint64_t v35;
  _QWORD v36[5];
  id v37;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __74__GEOTileDB__invalidateSubscriptionsReferencingTilesOlderThan_forTileSet___block_invoke;
  v24[3] = &unk_1E1C00F50;
  v27 = a4;
  v11 = v7;
  v25 = v11;
  v12 = v8;
  v26 = v12;
  v13 = db;
  v14 = v24;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__5;
  v36[4] = __Block_byref_object_dispose__5;
  v37 = 0;
  *(_QWORD *)buf = v9;
  v29 = 3221225472;
  v30 = __FindSubscriptionsReferencingOldTiles_block_invoke;
  v31 = &unk_1E1C019E8;
  v15 = v13;
  v34 = v36;
  v35 = a3;
  v32 = v15;
  v16 = v14;
  v33 = v16;
  -[GEOSQLiteDB statementForKey:statementBlock:](v15, "statementForKey:statementBlock:", CFSTR("FindSubscriptionsReferencingOldTiles"), buf);

  _Block_object_dispose(v36, 8);
  v17 = objc_msgSend(v11, "count");
  if (v17 != objc_msgSend(v12, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: subscriptionPKs.count == subscriptionTileSets.count", buf, 2u);
  }
  v18 = objc_msgSend(v11, "count");
  if (v18 == objc_msgSend(v12, "count") && objc_msgSend(v11, "count"))
  {
    v19 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "longLongValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntValue");

      -[GEOTileDB _invalidatedTilesReferencedBySubscription:tileSet:](self, "_invalidatedTilesReferencedBySubscription:tileSet:", v21, v23);
      ++v19;
    }
    while (v19 < objc_msgSend(v11, "count"));
  }

}

uint64_t __74__GEOTileDB__invalidateSubscriptionsReferencingTilesOlderThan_forTileSet___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  _DWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (_DWORD *)a1[6];
  if (!v6)
  {
    if (!a4)
      return 1;
    goto LABEL_4;
  }
  if (*v6 == (_DWORD)a3 && (a4 & 1) != 0)
  {
LABEL_4:
    v7 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v9 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  return 1;
}

- (void)_invalidateSubscriptionsReferencingOldestTilesWithLimit:(unint64_t)a3
{
  void *v5;
  void *v6;
  GEOSQLiteDB *db;
  uint64_t v8;
  id v9;
  id v10;
  GEOSQLiteDB *v11;
  uint64_t *v12;
  GEOSQLiteDB *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t, int);
  void *v25;
  id v26;
  id v27;
  uint8_t buf[8];
  uint64_t v29;
  uint64_t (*v30)(uint64_t, sqlite3_stmt *);
  void *v31;
  GEOSQLiteDB *v32;
  uint64_t *v33;
  _QWORD *v34;
  unint64_t v35;
  _QWORD v36[5];
  id v37;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v8 = MEMORY[0x1E0C809B0];
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __69__GEOTileDB__invalidateSubscriptionsReferencingOldestTilesWithLimit___block_invoke;
  v25 = &unk_1E1C00F78;
  v9 = v5;
  v26 = v9;
  v10 = v6;
  v27 = v10;
  v11 = db;
  v12 = &v22;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__5;
  v36[4] = __Block_byref_object_dispose__5;
  v37 = 0;
  *(_QWORD *)buf = v8;
  v29 = 3221225472;
  v30 = __FindSubscriptionsReferencingOldestNTiles_block_invoke;
  v31 = &unk_1E1C019E8;
  v13 = v11;
  v34 = v36;
  v35 = a3;
  v32 = v13;
  v14 = v12;
  v33 = v14;
  -[GEOSQLiteDB statementForKey:statementBlock:](v13, "statementForKey:statementBlock:", CFSTR("FindSubscriptionsReferencingOldestNTiles"), buf, v22, v23, v24, v25);

  _Block_object_dispose(v36, 8);
  v15 = objc_msgSend(v9, "count");
  if (v15 != objc_msgSend(v10, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: subscriptionPKs.count == subscriptionTileSets.count", buf, 2u);
  }
  v16 = objc_msgSend(v9, "count");
  if (v16 == objc_msgSend(v10, "count") && objc_msgSend(v9, "count"))
  {
    v17 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "longLongValue");

      objc_msgSend(v10, "objectAtIndexedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "unsignedIntValue");

      -[GEOTileDB _invalidatedTilesReferencedBySubscription:tileSet:](self, "_invalidatedTilesReferencedBySubscription:tileSet:", v19, v21);
      ++v17;
    }
    while (v17 < objc_msgSend(v9, "count"));
  }

}

uint64_t __69__GEOTileDB__invalidateSubscriptionsReferencingOldestTilesWithLimit___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    v8 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  return 1;
}

- (void)_enumerateAllKeysOnQueueIncludingData:(BOOL)a3 dataHandler:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  GEOSQLiteDB *db;
  uint64_t v11;
  id v12;
  id v13;
  GEOSQLiteDB *v14;
  _QWORD *v15;
  GEOSQLiteDB *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  BOOL v21;
  _QWORD v22[4];
  GEOSQLiteDB *v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;

  v8 = a4;
  v9 = a5;
  db = self->_db;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__GEOTileDB__enumerateAllKeysOnQueueIncludingData_dataHandler_callbackQueue___block_invoke;
  v18[3] = &unk_1E1C00FC8;
  v21 = a3;
  v18[4] = self;
  v12 = v9;
  v19 = v12;
  v13 = v8;
  v20 = v13;
  v14 = db;
  v15 = v18;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__5;
  v26[4] = __Block_byref_object_dispose__5;
  v27 = 0;
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __GetDataForAllKeys_block_invoke;
  v22[3] = &unk_1E1BFF998;
  v16 = v14;
  v23 = v16;
  v17 = v15;
  v24 = v17;
  v25 = v26;
  -[GEOSQLiteDB statementForKey:statementBlock:](v16, "statementForKey:statementBlock:", CFSTR("GetDataForAllKeys"), v22);

  _Block_object_dispose(v26, 8);
}

uint64_t __77__GEOTileDB__enumerateAllKeysOnQueueIncludingData_dataHandler_callbackQueue___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, unint64_t a7, void *a8, void *a9, char a10, __int16 a11, char a12)
{
  id v17;
  id v18;
  double Current;
  double *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  GEOTileData *v25;
  double v26;
  unint64_t v27;
  char v28;
  NSObject *v29;
  id v30;
  id v31;
  GEOTileData *v32;
  uint64_t v33;
  void *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _QWORD block[4];
  GEOTileData *v43;
  id v44;
  id v45;
  uint64_t *v46;
  double v47;
  unint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v17 = a8;
  v18 = a9;
  Current = CFAbsoluteTimeGetCurrent();
  v20 = (double *)MEMORY[0x1E0C9ADF8];
  v37 = v17;
  if (*(_BYTE *)(a1 + 56))
  {
    v21 = v17;
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v21 = 0;
  }
  v22 = v21;
LABEL_6:
  v23 = v22;
  v24 = *v20;
  if (v22)
    v25 = -[GEOTileData initWithData:]([GEOTileData alloc], "initWithData:", v22);
  else
    v25 = 0;
  v26 = Current + v24 - (double)a7;
  v27 = a4 | (unint64_t)(a5 << 32);
  v28 = a10 & ~objc_msgSend(*(id *)(a1 + 32), "_isTileSetTTLExpired:age:", a6, v26);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__GEOTileDB__enumerateAllKeysOnQueueIncludingData_dataHandler_callbackQueue___block_invoke_2;
  block[3] = &unk_1E1C00FA0;
  v46 = &v38;
  v29 = *(NSObject **)(a1 + 40);
  v30 = *(id *)(a1 + 48);
  v44 = v18;
  v45 = v30;
  v48 = a2 | (unint64_t)(a3 << 32);
  v49 = v27;
  v50 = v28;
  v43 = v25;
  v51 = a12;
  v47 = v26;
  v31 = v18;
  v32 = v25;
  dispatch_sync(v29, block);
  v33 = *((unsigned __int8 *)v39 + 24);

  _Block_object_dispose(&v38, 8);
  return v33;
}

uint64_t __77__GEOTileDB__enumerateAllKeysOnQueueIncludingData_dataHandler_callbackQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 48) + 16))(*(double *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  GEOSQLiteDB *db;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  NSObject *v22;
  id v23;
  BOOL v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatch_group_enter(v11);
  db = self->_db;
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __69__GEOTileDB_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke;
  v20[3] = &unk_1E1C00FF0;
  v24 = a3;
  v23 = v12;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __69__GEOTileDB_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke_2;
  v18[3] = &unk_1E1C00E10;
  v19 = v22;
  v15 = v22;
  v16 = v10;
  v17 = v12;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v20, v18);

}

void __69__GEOTileDB_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_flushPendingWrites");
  objc_msgSend(*(id *)(a1 + 32), "_enumerateAllKeysOnQueueIncludingData:dataHandler:callbackQueue:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __69__GEOTileDB_enumerateAllKeysIncludingData_onQueue_group_dataHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_allFullyDownloadedOfflineSubscriptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  GEOSQLiteDB *db;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  -[GEOOfflineDataConfiguration activeVersions](self->_offlineDataConfiguration, "activeVersions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    db = self->_db;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__GEOTileDB__allFullyDownloadedOfflineSubscriptions__block_invoke;
    v12[3] = &unk_1E1C01018;
    v13 = v4;
    v7 = v4;
    FetchSubscriptions(db, 0, v12);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __52__GEOTileDB__allFullyDownloadedOfflineSubscriptions__block_invoke_2;
    v10[3] = &unk_1E1C01068;
    v10[4] = self;
    v11 = v3;
    objc_msgSend(v7, "_geo_filtered:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

uint64_t __52__GEOTileDB__allFullyDownloadedOfflineSubscriptions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  void *v5;
  void *v6;

  if ((a5 & 0x400) != 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  return 1;
}

uint64_t __52__GEOTileDB__allFullyDownloadedOfflineSubscriptions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = objc_msgSend(v3, "longLongValue");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__GEOTileDB__allFullyDownloadedOfflineSubscriptions__block_invoke_3;
  v16[3] = &unk_1E1C01040;
  v17 = *(id *)(a1 + 40);
  v18 = &v19;
  GetSubscriptionDataStates(v4, v5, v16);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend((id)v20[5], "containsObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12) & 1) == 0)
        {
          v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v25, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __52__GEOTileDB__allFullyDownloadedOfflineSubscriptions__block_invoke_3(uint64_t a1, __int16 a2, uint64_t a3, uint64_t a4, int a5)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  if ((a2 & 0x400) != 0)
  {
    if (a5)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "unsignedLongLongValue");

        if (v14 == a4)
        {
          v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v16);

        }
      }
    }
  }
  return 1;
}

- (void)_enumerateSubscriptionExpirationDates:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t Uint64;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  double v13;
  void *v14;
  GEOSQLiteDB *db;
  uint64_t v16;
  id v17;
  id v18;
  GEOSQLiteDB *v19;
  uint64_t *v20;
  GEOSQLiteDB *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD *, uint64_t, void *, __int16, unint64_t, uint64_t, uint64_t);
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD v32[4];
  GEOSQLiteDB *v33;
  uint64_t *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;

  v4 = a3;
  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  Uint64 = GEOConfigGetUint64(GeoOfflineConfig_OptimizeStorageLastUsedDeleteInterval, (uint64_t)off_1EDF4EA48);
  v7 = GEOConfigGetUint64(GeoOfflineConfig_OptimizeStorageNeverUsedDeleteInterval, (uint64_t)off_1EDF4EA58);
  v8 = GEOConfigGetUint64(GeoOfflineConfig_UpdateRequiredExpirationInterval, (uint64_t)off_1EDF4EA78);
  -[GEOOfflineDataConfiguration lastUpdatedDate](self->_offlineDataConfiguration, "lastUpdatedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = -1;
  if (v9 && v8)
  {
    objc_msgSend(v9, "dateByAddingTimeInterval:", (double)(unint64_t)v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v11 = (unint64_t)v13;

  }
  -[GEOTileDB _allFullyDownloadedOfflineSubscriptions](self, "_allFullyDownloadedOfflineSubscriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v16 = MEMORY[0x1E0C809B0];
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __51__GEOTileDB__enumerateSubscriptionExpirationDates___block_invoke;
  v26 = &unk_1E1C01090;
  v29 = Uint64;
  v30 = v7;
  v31 = v11;
  v17 = v14;
  v27 = v17;
  v18 = v4;
  v28 = v18;
  v19 = db;
  v20 = &v23;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__5;
  v36[4] = __Block_byref_object_dispose__5;
  v37 = 0;
  v32[0] = v16;
  v32[1] = 3221225472;
  v32[2] = __GetAllSubscriptionTimestamps_block_invoke;
  v32[3] = &unk_1E1BFF998;
  v21 = v19;
  v33 = v21;
  v22 = v20;
  v34 = v22;
  v35 = v36;
  -[GEOSQLiteDB statementForKey:statementBlock:](v21, "statementForKey:statementBlock:", CFSTR("GetAllSubscriptionTimestamps"), v32, v23, v24, v25, v26);

  _Block_object_dispose(v36, 8);
}

uint64_t __51__GEOTileDB__enumerateSubscriptionExpirationDates___block_invoke(_QWORD *a1, uint64_t a2, void *a3, __int16 a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  double v20;

  v13 = a3;
  if ((a4 & 0x400) != 0)
  {
    if (GEOConfigGetBOOL(GeoOfflineConfig_OptimizeStorageEnabled, (uint64_t)off_1EDF4EA38))
    {
      v15 = 6;
      if (a7)
      {
        v16 = a7;
      }
      else
      {
        v15 = 7;
        v16 = a6;
      }
      v14 = a1[v15] + v16;
    }
    else
    {
      v14 = -1;
    }
    if (a1[8] != -1)
    {
      v17 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "containsObject:", v18) & 1) != 0)
      {
        if (v14 == -1)
        {

        }
        else
        {
          v19 = a1[8];

          if (v19 >= v14)
            goto LABEL_17;
        }
        v14 = a1[8];
      }
      else
      {

      }
    }
  }
  else
  {
    v14 = -1;
  }
LABEL_17:
  if (a5)
  {
    v20 = *MEMORY[0x1E0C9ADF8] + (double)a5;
    if (v14 == -1 || v14 > (unint64_t)v20)
      v14 = (unint64_t)v20;
  }
  if (v14 != -1)
    (*(void (**)(double))(a1[5] + 16))((double)v14 - *MEMORY[0x1E0C9ADF8]);

  return 1;
}

- (void)_removeExpiredSubscriptions
{
  NSObject *v3;
  GEOSQLiteDB *db;
  _QWORD v5[5];

  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__GEOTileDB__removeExpiredSubscriptions__block_invoke;
  v5[3] = &unk_1E1C00938;
  v5[4] = self;
  -[GEOSQLiteDB ensureInTransaction:](db, "ensureInTransaction:", v5);
}

uint64_t __40__GEOTileDB__removeExpiredSubscriptions__block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v49;
  void *v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  int v58;
  void *v59;
  _QWORD v61[4];
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[6];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[5];
  _QWORD v80[5];
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  CFAbsoluteTime v85;
  _QWORD v86[5];
  id v87;
  _BYTE v88[128];
  uint8_t v89[128];
  __int128 buf;
  uint64_t (*v91)(uint64_t, sqlite3_stmt *);
  void *v92;
  id v93;
  id v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_2;
  v82[3] = &unk_1E1C010B8;
  v85 = Current;
  v5 = v2;
  v83 = v5;
  v54 = v3;
  v84 = v54;
  objc_msgSend(v4, "_enumerateSubscriptionExpirationDates:", v82);
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = __Block_byref_object_copy__5;
  v80[4] = __Block_byref_object_dispose__5;
  v81 = 0;
  if (objc_msgSend(v5, "count"))
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_445;
    v79[3] = &unk_1E1C010E0;
    v79[4] = v80;
    ReadGlobalOfflineMetadata(v6, v79);
  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (!v7)
  {
    LOBYTE(v58) = 0;
    goto LABEL_20;
  }
  v58 = 0;
  v52 = *(_QWORD *)v76;
  v8 = MEMORY[0x1E0C809B0];
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v76 != v52)
        objc_enumerationMutation(obj);
      v56 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
      v10 = objc_msgSend(v56, "unsignedLongLongValue");
      v69 = 0;
      v70 = &v69;
      v71 = 0x3032000000;
      v72 = __Block_byref_object_copy__5;
      v73 = __Block_byref_object_dispose__5;
      v74 = 0;
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v68[0] = v8;
      v68[1] = 3221225472;
      v68[2] = __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_2_447;
      v68[3] = &unk_1E1C01108;
      v68[4] = &v69;
      v68[5] = v80;
      v12 = v11;
      v13 = v68;
      v86[0] = 0;
      v86[1] = v86;
      v86[2] = 0x3032000000;
      v86[3] = __Block_byref_object_copy__5;
      v86[4] = __Block_byref_object_dispose__5;
      v87 = 0;
      *(_QWORD *)&buf = v8;
      *((_QWORD *)&buf + 1) = 3221225472;
      v91 = __FetchSubscriptionForPK_block_invoke;
      v92 = &unk_1E1C019E8;
      v14 = v12;
      v95 = v86;
      v96 = v10;
      v93 = v14;
      v15 = v13;
      v94 = v15;
      objc_msgSend(v14, "statementForKey:statementBlock:", CFSTR("FetchSubscriptionForPK"), &buf);

      _Block_object_dispose(v86, 8);
      v16 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend((id)v70[5], "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = RemoveSubscription(v16, 0, v17);

      if ((v16 & 1) != 0)
      {
        v18 = objc_msgSend((id)v70[5], "policy");
        v19 = v55;
        if (!v18)
          goto LABEL_12;
        if (v18 == 1)
        {
          v19 = v50;
LABEL_12:
          objc_msgSend(v19, "addObject:", v70[5]);
        }
        objc_msgSend(v54, "objectForKeyedSubscript:", v56);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "integerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23 == 0;

        if (v24)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setObject:forKeyedSubscript:", v25, v26);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v70[5]);

        v58 |= ((unint64_t)objc_msgSend((id)v70[5], "dataTypes") >> 10) & 1;
      }
      _Block_object_dispose(&v69, 8);

    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  }
  while (v7);
LABEL_20:

  if (objc_msgSend(v55, "count"))
  {
    GEOGetTileDBLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = objc_msgSend(v55, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v30;
      _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_INFO, "Expired %llu opportunistic subscriptions", (uint8_t *)&buf, 0xCu);
    }

  }
  if (objc_msgSend(v50, "count"))
  {
    GEOGetTileDBLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = objc_msgSend(v50, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v32;
      _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_INFO, "Expired %llu user-initiated subscriptions", (uint8_t *)&buf, 0xCu);
    }

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v49 = v50;
    v33 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v64, v88, 16);
    if (v33)
    {
      v53 = *(_QWORD *)v65;
      while (2)
      {
        v34 = 0;
        v57 = v33;
        do
        {
          if (*(_QWORD *)v65 != v53)
            objc_enumerationMutation(v49);
          v35 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v34);
          objc_msgSend(v35, "regulatoryRegionID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "unsignedIntValue");

          v38 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
          objc_msgSend(v35, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_originatingBundleIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v35, "dataTypes");
          v42 = objc_msgSend(v35, "policy");
          objc_msgSend(v35, "region");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "data");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "displayName");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v37) = InsertExpiredSubscription(v38, v39, v40, v41, v42, v44, v45, v37);

          if ((v37 & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              LOWORD(buf) = 0;
              _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: InsertExpiredSubscription(_db, ((void *)0), subscription.identifier, subscription.originatingBundleIdentifier, (uint64_t)subscription.dataTypes, (uint64_t)subscription.policy, subscription.region.data, subscription.displayName, regulatoryRegionID)", (uint8_t *)&buf, 2u);
            }

            v47 = 0;
            goto LABEL_42;
          }
          ++v34;
        }
        while (v57 != v34);
        v33 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v64, v88, 16);
        if (v33)
          continue;
        break;
      }
    }

  }
  if (objc_msgSend(v55, "count") || objc_msgSend(v50, "count"))
  {
    if ((v58 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_cleanUpDataForRemovedOfflineSubscriptionsWithError:", 0);
    objc_initWeak((id *)&buf, *(id *)(a1 + 32));
    v46 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_450;
    v61[3] = &unk_1E1C01158;
    objc_copyWeak(&v63, (id *)&buf);
    v62 = v59;
    objc_msgSend(v46, "addTransactionPostCommitAction:", v61);

    objc_destroyWeak(&v63);
    objc_destroyWeak((id *)&buf);
  }
  v47 = 1;
LABEL_42:
  _Block_object_dispose(v80, 8);

  return v47;
}

void __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, double a5)
{
  id v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (*(double *)(a1 + 48) > a5)
  {
    switch(a4)
    {
      case 1:
        GEOGetTileDBLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        *(_DWORD *)v17 = 141558275;
        *(_QWORD *)&v17[4] = 1752392040;
        *(_WORD *)&v17[12] = 2113;
        *(_QWORD *)&v17[14] = v9;
        v11 = "Will expire subscription '%{private,mask.hash}@' because its expirationDate has passed";
        break;
      case 2:
        GEOGetTileDBLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        *(_DWORD *)v17 = 141558275;
        *(_QWORD *)&v17[4] = 1752392040;
        *(_WORD *)&v17[12] = 2113;
        *(_QWORD *)&v17[14] = v9;
        v11 = "Will expire subscription '%{private,mask.hash}@' because it hasn't been used recently";
        break;
      case 3:
        GEOGetTileDBLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        *(_DWORD *)v17 = 141558275;
        *(_QWORD *)&v17[4] = 1752392040;
        *(_WORD *)&v17[12] = 2113;
        *(_QWORD *)&v17[14] = v9;
        v11 = "Will expire subscription '%{private,mask.hash}@' because it was never used";
        break;
      case 6:
        GEOGetTileDBLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        *(_DWORD *)v17 = 141558275;
        *(_QWORD *)&v17[4] = 1752392040;
        *(_WORD *)&v17[12] = 2113;
        *(_QWORD *)&v17[14] = v9;
        v11 = "Will expire subscription '%{private,mask.hash}@' because it has not been updated within the required interval";
        break;
      default:
        goto LABEL_13;
    }
    _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_INFO, v11, v17, 0x16u);
LABEL_12:

LABEL_13:
    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    v14 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, v16);

  }
}

uint64_t __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_445(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

uint64_t __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_2_447(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9)
{
  id v15;
  id v16;
  id v17;
  id v18;
  GEOMapRegion *v19;
  GEOMapDataSubscription *v20;
  uint64_t v21;
  void *v22;

  v15 = a9;
  v16 = a8;
  v17 = a4;
  v18 = a3;
  v19 = -[GEOMapRegion initWithData:]([GEOMapRegion alloc], "initWithData:", v16);

  v20 = -[GEOMapDataSubscription initWithIdentifier:originatingBundleIdentifier:dataTypes:policy:expirationDate:region:displayName:regulatoryRegionID:]([GEOMapDataSubscription alloc], "initWithIdentifier:originatingBundleIdentifier:dataTypes:policy:expirationDate:region:displayName:regulatoryRegionID:", v18, v17, a5, a6, 0, v19, v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  return 1;
}

void __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_450(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanUpDeletedExternalDataIfNecessary");
    v3 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_2_451;
    v5[3] = &unk_1E1C01130;
    v5[4] = v4;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
    WeakRetained = v4;
  }

}

void __40__GEOTileDB__removeExpiredSubscriptions__block_invoke_2_451(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "tileDB:didExpireSubscriptions:forReason:", *(_QWORD *)(a1 + 32), v5, objc_msgSend(a2, "integerValue"));

}

- (void)_supportsOfflineDidChange:(id)a3
{
  GEOSQLiteDB *db;
  _QWORD v4[5];

  db = self->_db;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__GEOTileDB__supportsOfflineDidChange___block_invoke;
  v4[3] = &unk_1E1BFF6F8;
  v4[4] = self;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v4);
}

uint64_t __39__GEOTileDB__supportsOfflineDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_expireOfflineSubscriptionsForRegulatoryRegionIfNecessary");
}

- (void)_expireOfflineSubscriptionsForRegulatoryRegionIfNecessary
{
  NSObject *v3;
  unsigned int v4;
  uint64_t v5;
  GEOSQLiteDB *db;
  BOOL v7;
  GEOSQLiteDB *v9;
  _QWORD v10[6];
  unsigned int v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[GEOOfflineDataConfiguration regulatoryRegionID](self->_offlineDataConfiguration, "regulatoryRegionID");
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v5 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke;
  v12[3] = &unk_1E1C010E0;
  v12[4] = &v13;
  ReadGlobalOfflineMetadata(db, v12);
  v7 = GEOSupportsOfflineMaps();
  if (v4 != *((_DWORD *)v14 + 6) || !v7)
  {
    v9 = self->_db;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_2;
    v10[3] = &unk_1E1C011F0;
    v10[4] = self;
    v10[5] = &v13;
    v11 = v4;
    -[GEOSQLiteDB ensureInTransaction:](v9, "ensureInTransaction:", v10);
  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD *v6;
  id v7;
  uint64_t *v8;
  int v9;
  id v10;
  id v11;
  int v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v33;
  id obj;
  uint64_t v35;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  id v40;
  int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t v55[128];
  __int128 buf;
  void *v57;
  void *v58;
  id v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_3;
  v46[3] = &unk_1E1C01180;
  v48 = v3;
  v33 = v1;
  v47 = v33;
  v5 = v4;
  v6 = v46;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__5;
  v53 = __Block_byref_object_dispose__5;
  v54 = 0;
  *(_QWORD *)&buf = v2;
  *((_QWORD *)&buf + 1) = 3221225472;
  v57 = __RemoveAllSubscriptionsForDataType_block_invoke;
  v58 = &unk_1E1C019E8;
  v7 = v5;
  v61 = &v49;
  v62 = 1024;
  v59 = v7;
  v8 = v6;
  v60 = v8;
  LOBYTE(v6) = objc_msgSend(v7, "statementForKey:statementBlock:", CFSTR("RemoveAllSubscriptionsForDataType"), &buf);

  _Block_object_dispose(&v49, 8);
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: RemoveAllSubscriptionsForDataType(_db, ((void *)0), (uint64_t)GEOMapDataSubscriptionDataTypeOffline, ^BOOL(int64_t rowid, NSString *identifier, NSString *originating_bundle_id, uint64_t data_types, uint64_t policy, uint64_t expiration_timestamp, NSData *map_region, NSString *display_name, uint64_t insert_timestamp) { GEOMapRegion *region = [[GEOMapRegion alloc] initWithData:map_region]; GEOMapDataSubscription *subscription = ["
        "[GEOMapDataSubscription alloc] initWithIdentifier:identifier originatingBundleIdentifier:originating_bundle_id d"
        "ataTypes:(GEOMapDataSubscriptionDataType)data_types policy:(GEOMapDataSubscriptionPolicy)policy expirationDate:("
        "(void *)0) region:region displayName:display_name regulatoryRegionID:@(existingRegulatoryRegionID)]; [expiredSub"
        "scriptions addObject:subscription]; return __objc_yes; })",
        (uint8_t *)&buf,
        2u);
    }

    goto LABEL_25;
  }

  v9 = *(_DWORD *)(a1 + 48);
  v10 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__5;
  v53 = __Block_byref_object_dispose__5;
  v54 = 0;
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v57 = __SetGlobalOfflineMetadata_block_invoke;
  v58 = &unk_1E1C01BA0;
  v11 = v10;
  LODWORD(v61) = v9;
  v59 = v11;
  v60 = &v49;
  LOBYTE(v9) = objc_msgSend(v11, "executeStatement:statementBlock:", CFSTR("SetGlobalOfflineMetadata"), &buf);

  _Block_object_dispose(&v49, 8);
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: SetGlobalOfflineMetadata(_db, ((void *)0), regulatoryRegionID)", (uint8_t *)&buf, 2u);
    }
LABEL_25:
    v31 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(v33, "count"))
  {
    v12 = *(_DWORD *)(a1 + 48);
    v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    GEOGetTileDBLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v12 == v13)
    {
      if (v15)
      {
        v16 = objc_msgSend(v33, "count");
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v16;
        v17 = "Removed %llu subscriptions due to offline feature being disabled";
LABEL_9:
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_INFO, v17, (uint8_t *)&buf, 0xCu);
      }
    }
    else if (v15)
    {
      v18 = objc_msgSend(v33, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v18;
      v17 = "Removed %llu subscriptions due to offline regulatory region ID change";
      goto LABEL_9;
    }

    objc_msgSend(*(id *)(a1 + 32), "_cleanUpDataForRemovedOfflineSubscriptionsWithError:", 0);
    objc_msgSend(v33, "_geo_filtered:", &__block_literal_global_456);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    if (v19)
    {
      v35 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v22 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
          objc_msgSend(v21, "identifier", v33);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "_originatingBundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v21, "dataTypes");
          v26 = objc_msgSend(v21, "policy");
          objc_msgSend(v21, "region");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "data");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "displayName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          InsertExpiredSubscription(v22, v23, v24, v25, v26, v28, v29, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      }
      while (v19);
    }

    objc_initWeak((id *)&buf, *(id *)(a1 + 32));
    v30 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_2_457;
    v37[3] = &unk_1E1C011C8;
    objc_copyWeak(&v40, (id *)&buf);
    v41 = *(_DWORD *)(a1 + 48);
    v39 = *(_QWORD *)(a1 + 40);
    v38 = v33;
    objc_msgSend(v30, "addTransactionPostCommitAction:", v37);

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)&buf);
  }
  v31 = 1;
LABEL_19:

  return v31;
}

uint64_t __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9)
{
  id v15;
  id v16;
  id v17;
  id v18;
  GEOMapRegion *v19;
  GEOMapDataSubscription *v20;
  void *v21;
  GEOMapDataSubscription *v22;

  v15 = a9;
  v16 = a8;
  v17 = a4;
  v18 = a3;
  v19 = -[GEOMapRegion initWithData:]([GEOMapRegion alloc], "initWithData:", v16);

  v20 = [GEOMapDataSubscription alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[GEOMapDataSubscription initWithIdentifier:originatingBundleIdentifier:dataTypes:policy:expirationDate:region:displayName:regulatoryRegionID:](v20, "initWithIdentifier:originatingBundleIdentifier:dataTypes:policy:expirationDate:region:displayName:regulatoryRegionID:", v18, v17, a5, a6, 0, v19, v15, v21);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v22);
  return 1;
}

BOOL __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_454(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "policy") == 1;
}

void __70__GEOTileDB__expireOfflineSubscriptionsForRegulatoryRegionIfNecessary__block_invoke_2_457(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanUpDeletedExternalDataIfNecessary");
    if (*(_DWORD *)(a1 + 56) == *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v3 = 5;
    else
      v3 = 4;
    objc_msgSend(v4[20], "tileDB:didExpireSubscriptions:forReason:", v4, *(_QWORD *)(a1 + 32), v3);
    WeakRetained = v4;
  }

}

- (void)expireSubscriptionsIfNecessaryWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  GEOSQLiteDB *db;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke;
  v15[3] = &unk_1E1BFFC90;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke_3;
  v12[3] = &unk_1E1C00A28;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v15, v12);

}

void __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_removeExpiredSubscriptions");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke_2;
  block[3] = &unk_1E1C01F48;
  v2 = *(NSObject **)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

uint64_t __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __71__GEOTileDB_expireSubscriptionsIfNecessaryWithQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getNextSubscriptionExpirationDateWithQueue:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  GEOSQLiteDB *db;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke;
  v15[3] = &unk_1E1BFFC90;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_4;
  v12[3] = &unk_1E1C00A28;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v15, v12);

}

void __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_2;
  v11[3] = &unk_1E1C01218;
  v11[4] = &v12;
  v11[5] = &v16;
  objc_msgSend(v2, "_enumerateSubscriptionExpirationDates:", v11);
  if (*((_BYTE *)v13 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v17[3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_3;
  v8[3] = &unk_1E1BFF970;
  v5 = *(NSObject **)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(v5, v8);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

uint64_t __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_2(uint64_t result, double a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) || *(double *)(v2 + 24) > a2)
  {
    *(double *)(v2 + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_5;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __65__GEOTileDB_getNextSubscriptionExpirationDateWithQueue_callback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)addSubscription:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  GEOSQLiteDB *db;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = MEMORY[0x1E0C809B0];
    db = self->_db;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __44__GEOTileDB_addSubscription_queue_callback___block_invoke;
    v16[3] = &unk_1E1C01268;
    v16[4] = self;
    v17 = v8;
    v18 = v9;
    v19 = v10;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __44__GEOTileDB_addSubscription_queue_callback___block_invoke_3;
    v13[3] = &unk_1E1C00A28;
    v14 = v18;
    v15 = v19;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v16, v13);

  }
}

void __44__GEOTileDB_addSubscription_queue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  v4 = objc_msgSend(v2, "_addSubscriptionOnDBQueue:error:", v3, &v13);
  v5 = v13;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__GEOTileDB_addSubscription_queue_callback___block_invoke_2;
  v9[3] = &unk_1E1C01240;
  v6 = *(NSObject **)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v12 = v4;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, v9);

}

uint64_t __44__GEOTileDB_addSubscription_queue_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
    v3 = 0;
  else
    v3 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(v2 + 16))(v2, *(_BYTE *)(a1 + 48) != 0, v3);
}

void __44__GEOTileDB_addSubscription_queue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__GEOTileDB_addSubscription_queue_callback___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __44__GEOTileDB_addSubscription_queue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (BOOL)_addSubscriptionOnDBQueue:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  GEOSQLiteDB *db;
  id v13;
  id v14;
  BOOL v15;
  BOOL v16;
  char v17;
  _QWORD v19[5];
  id v20;
  id v21;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  GEOGetTileDBLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "Adding subscription '%{private}@'", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(v6, "region");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  db = self->_db;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __45__GEOTileDB__addSubscriptionOnDBQueue_error___block_invoke;
  v19[3] = &unk_1E1C012E0;
  v19[4] = self;
  v13 = v6;
  v20 = v13;
  v14 = v11;
  v21 = v14;
  p_buf = &buf;
  v15 = -[GEOSQLiteDB ensureInTransaction:](db, "ensureInTransaction:", v19);
  v16 = v15;
  if (a4)
    v17 = v15;
  else
    v17 = 1;
  if ((v17 & 1) == 0)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);
  return v16;
}

uint64_t __45__GEOTileDB__addSubscriptionOnDBQueue_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  double Current;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  unint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _BYTE *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  NSObject *v49;
  NSObject *v50;
  uint64_t v51;
  id v52;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[5];
  _QWORD v58[4];
  id v59;
  id v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  _BYTE *v76;
  id v77;
  id v78;
  _BYTE *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  _BYTE buf[24];
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = -1;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __45__GEOTileDB__addSubscriptionOnDBQueue_error___block_invoke_2;
  v58[3] = &unk_1E1C01290;
  v61 = &v67;
  v59 = *(id *)(a1 + 40);
  v60 = *(id *)(a1 + 48);
  v62 = &v63;
  FetchSubscription(v2, v3, v58);

  v5 = (void *)v68[3];
  if (*((_BYTE *)v64 + 24))
  {
    if (v5 == (void *)-1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        LOWORD(v71) = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: existingSubscriptionPK != InvalidRowID", (uint8_t *)&v71, 2u);
      }
      v15 = 0;
    }
    else
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(*(id *)(a1 + 40), "expirationDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v9 = v8;
      objc_msgSend(*(id *)(a1 + 40), "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v6;
      v12 = v10;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v85 = __Block_byref_object_copy__5;
      v86 = __Block_byref_object_dispose__5;
      v87 = 0;
      *(_QWORD *)&v71 = v4;
      *((_QWORD *)&v71 + 1) = 3221225472;
      v72 = (uint64_t)__UpdateSubscriptionExpirationAndDisplayName_block_invoke;
      v73 = (uint64_t)&unk_1E1C01CD0;
      v13 = v11;
      v74 = v13;
      v76 = buf;
      v77 = v5;
      v78 = (id)v9;
      v14 = v12;
      v75 = v14;
      v15 = objc_msgSend(v13, "executeStatement:statementBlock:", CFSTR("UpdateSubscriptionExpirationAndDisplayName"), &v71);
      v16 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v16)
        v17 = objc_retainAutorelease(v16);

      _Block_object_dispose(buf, 8);
      v18 = v16;

      if ((_DWORD)v15)
      {
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(void **)(v19 + 160);
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "tileDB:didUpdateSubscriptionWithIdentifier:", v19, v21);
      }
      else
      {
        GEOGetTileDBLog();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v71) = 138543362;
          *(_QWORD *)((char *)&v71 + 4) = v18;
          _os_log_impl(&dword_1885A9000, v50, OS_LOG_TYPE_ERROR, "Failed to update subscription: %{public}@", (uint8_t *)&v71, 0xCu);
        }

        v51 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v52 = v18;
        v21 = *(void **)(v51 + 40);
        *(_QWORD *)(v51 + 40) = v52;
      }

    }
  }
  else
  {
    if (v5 == (void *)-1)
    {
      *(_QWORD *)&v71 = 0;
      *((_QWORD *)&v71 + 1) = &v71;
      v72 = 0x2020000000;
      v73 = -1;
      v22 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v4;
      v57[1] = 3221225472;
      v57[2] = __45__GEOTileDB__addSubscriptionOnDBQueue_error___block_invoke_458;
      v57[3] = &unk_1E1C012B8;
      v57[4] = &v71;
      FetchExpiredSubscription(v22, v23, v57);

      if (*(_QWORD *)(*((_QWORD *)&v71 + 1) + 24) != -1)
      {
        GEOGetTileDBLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 141558275;
          *(_QWORD *)&buf[4] = 1752392040;
          *(_WORD *)&buf[12] = 2113;
          *(_QWORD *)&buf[14] = v25;
          _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_INFO, "Subscription '%{private, mask.hash}@' was previously expired. Removing it from the expired list", buf, 0x16u);

        }
        RemoveExpiredSubscription(*(void **)(*(_QWORD *)(a1 + 32) + 8), 0, *(_QWORD *)(*((_QWORD *)&v71 + 1) + 24));
      }
      _Block_object_dispose(&v71, 8);
    }
    Current = CFAbsoluteTimeGetCurrent();
    v27 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_originatingBundleIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(*(id *)(a1 + 40), "dataTypes");
    v55 = objc_msgSend(*(id *)(a1 + 40), "policy");
    objc_msgSend(*(id *)(a1 + 40), "expirationDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeIntervalSinceReferenceDate");
    v32 = v31;
    v33 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "displayName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v30;
    v35 = (unint64_t)(Current + *MEMORY[0x1E0C9ADF8]);
    v36 = v27;
    v37 = v28;
    v38 = v29;
    v39 = v33;
    v40 = v34;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v85 = __Block_byref_object_copy__5;
    v86 = __Block_byref_object_dispose__5;
    v87 = 0;
    *(_QWORD *)&v71 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v71 + 1) = 3221225472;
    v72 = (uint64_t)__InsertSubscription_block_invoke;
    v73 = (uint64_t)&unk_1E1C01CF8;
    v41 = v36;
    v74 = v41;
    v42 = v37;
    v75 = v42;
    v79 = buf;
    v43 = v38;
    v76 = v43;
    v80 = v56;
    v81 = v55;
    v82 = (unint64_t)v32;
    v44 = v39;
    v77 = v44;
    v45 = v40;
    v78 = v45;
    v83 = v35;
    v15 = objc_msgSend(v41, "executeStatement:statementBlock:", CFSTR("InsertSubscription"), &v71);
    v46 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v46)
      v47 = objc_retainAutorelease(v46);

    _Block_object_dispose(buf, 8);
    v48 = v46;

    if ((v15 & 1) == 0)
    {
      GEOGetTileDBLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v71) = 138543362;
        *(_QWORD *)((char *)&v71 + 4) = v48;
        _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_ERROR, "Failed to insert subscription: %{public}@", (uint8_t *)&v71, 0xCu);
      }

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v46);
    }

  }
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  return v15;
}

uint64_t __45__GEOTileDB__addSubscriptionOnDBQueue_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  void *v8;
  id v14;
  id v15;
  id v16;
  int v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a8;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_msgSend(*(id *)(a1 + 32), "_originatingBundleIdentifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16 != v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "_originatingBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "isEqualToString:", v8))
    {
LABEL_9:

      goto LABEL_15;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "dataTypes") != a5 || objc_msgSend(*(id *)(a1 + 32), "policy") != a6)
  {
    if (v16 == v14)
    {

      goto LABEL_15;
    }
    goto LABEL_9;
  }
  v17 = objc_msgSend(v15, "isEqualToData:", *(_QWORD *)(a1 + 40));
  if (v16 == v14)
  {

    if (!v17)
      goto LABEL_15;
  }
  else
  {

    if ((v17 & 1) == 0)
      goto LABEL_15;
  }
  GEOGetTileDBLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138477827;
    v22 = v19;
    _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_INFO, "New subscription '%{private}@' is identical to existing one, except for expiration date and/or display name. Updating existing record.", (uint8_t *)&v21, 0xCu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_15:

  return 1;
}

uint64_t __45__GEOTileDB__addSubscriptionOnDBQueue_error___block_invoke_458(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)removeSubscriptionWithIdentifier:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOSQLiteDB *db;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  db = self->_db;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke;
  v19[3] = &unk_1E1C01268;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke_3;
  v16[3] = &unk_1E1C00A28;
  v17 = v21;
  v18 = v22;
  v13 = v22;
  v14 = v21;
  v15 = v8;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v19, v16);

}

void __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  v4 = objc_msgSend(v2, "_removeSubscriptionOnDBQueue:error:", v3, &v13);
  v5 = v13;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke_2;
  v9[3] = &unk_1E1C01240;
  v6 = *(NSObject **)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v12 = v4;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, v9);

}

uint64_t __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
    v3 = 0;
  else
    v3 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(v2 + 16))(v2, *(_BYTE *)(a1 + 48) != 0, v3);
}

void __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __61__GEOTileDB_removeSubscriptionWithIdentifier_queue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (BOOL)_removeSubscriptionOnDBQueue:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  GEOSQLiteDB *db;
  uint64_t v9;
  GEOSQLiteDB *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  GEOSQLiteDB *v15;
  id v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  _BYTE *v24;
  uint64_t *v25;
  _QWORD *v26;
  _QWORD v27[7];
  _QWORD v28[6];
  _QWORD v29[4];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t v38[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = -1;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  db = self->_db;
  v9 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __48__GEOTileDB__removeSubscriptionOnDBQueue_error___block_invoke;
  v28[3] = &unk_1E1C01108;
  v28[4] = &v30;
  v28[5] = v29;
  FetchSubscription(db, v6, v28);
  if (v31[3] != -1)
    goto LABEL_3;
  v10 = self->_db;
  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = __48__GEOTileDB__removeSubscriptionOnDBQueue_error___block_invoke_2;
  v27[3] = &unk_1E1C01308;
  v27[4] = &v30;
  v27[5] = v29;
  v27[6] = &v34;
  FetchExpiredSubscription(v10, v6, v27);
  if (v31[3] != -1)
  {
LABEL_3:
    v11 = *((unsigned __int8 *)v35 + 24);
    GEOGetTileDBLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)buf = 141558275;
        *(_QWORD *)&buf[4] = 1752392040;
        *(_WORD *)&buf[12] = 2113;
        *(_QWORD *)&buf[14] = v6;
        v14 = "Removing expired subscription '%{private, mask.hash}@'";
LABEL_8:
        _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, v14, buf, 0x16u);
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 141558275;
      *(_QWORD *)&buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v6;
      v14 = "Removing subscription '%{private, mask.hash}@'";
      goto LABEL_8;
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v43 = __Block_byref_object_copy__5;
    v44 = __Block_byref_object_dispose__5;
    v45 = 0;
    v15 = self->_db;
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __48__GEOTileDB__removeSubscriptionOnDBQueue_error___block_invoke_460;
    v21[3] = &unk_1E1C01330;
    v23 = &v34;
    v24 = buf;
    v21[4] = self;
    v25 = &v30;
    v16 = v6;
    v22 = v16;
    v26 = v29;
    v17 = -[GEOSQLiteDB executeInTransaction:](v15, "executeInTransaction:", v21);
    GEOGetTileDBLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v38 = 141558275;
      v39 = 1752392040;
      v40 = 2113;
      v41 = v16;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, "Done removing subscription '%{private, mask.hash}@'", v38, 0x16u);
    }

    if (v17)
    {
      -[GEOTileDB _cleanUpDeletedExternalDataIfNecessary](self, "_cleanUpDeletedExternalDataIfNecessary");
    }
    else if (a4)
    {
      *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_16;
  }
  GEOGetTileDBLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 141558275;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_INFO, "Could not remove subscription '%{private, mask.hash}@', as that is not a known identifier", buf, 0x16u);
  }

  LOBYTE(v17) = 0;
LABEL_16:
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v17;
}

uint64_t __48__GEOTileDB__removeSubscriptionOnDBQueue_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a5;
  return 0;
}

uint64_t __48__GEOTileDB__removeSubscriptionOnDBQueue_error___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  return 0;
}

BOOL __48__GEOTileDB__removeSubscriptionOnDBQueue_error___block_invoke_460(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  void *v8;
  char v9;
  _BOOL8 result;
  NSObject *v11;
  const char *v12;
  char v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;
  id v18;
  uint8_t buf[8];
  id obj;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v2 + 8);
  v8 = *(void **)(v5 + 40);
  v7 = (id *)(v5 + 40);
  v6 = v8;
  if (v3)
  {
    obj = v6;
    v9 = RemoveExpiredSubscription(v4, &obj, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    objc_storeStrong(v7, obj);
    if ((v9 & 1) == 0)
    {
      result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (result)
      {
        *(_WORD *)buf = 0;
        v11 = MEMORY[0x1E0C81028];
        v12 = "Assertion failed: RemoveExpiredSubscription(_db, &error, subscriptionPK)";
LABEL_12:
        _os_log_fault_impl(&dword_1885A9000, v11, OS_LOG_TYPE_FAULT, v12, buf, 2u);
        return 0;
      }
      return result;
    }
    return 1;
  }
  v18 = v6;
  v13 = RemoveSubscription(v4, &v18, *(void **)(a1 + 40));
  objc_storeStrong(v7, v18);
  if ((v13 & 1) != 0)
  {
    if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 25) & 4) != 0)
    {
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v17 = *(id *)(v15 + 40);
      v16 = objc_msgSend(v14, "_cleanUpDataForRemovedOfflineSubscriptionsWithError:", &v17);
      objc_storeStrong((id *)(v15 + 40), v17);
      if (!v16)
        return 0;
    }
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
  if (result)
  {
    *(_WORD *)buf = 0;
    v11 = MEMORY[0x1E0C81028];
    v12 = "Assertion failed: RemoveSubscription(_db, &error, identifier)";
    goto LABEL_12;
  }
  return result;
}

- (BOOL)_cleanUpDataForRemovedOfflineSubscriptionsWithError:(id *)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;

  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[GEOSQLiteDB executeStatement:statementBlock:](self->_db, "executeStatement:statementBlock:", CFSTR("MarkForDeletionExternalDataForOfflineBatchesNotAssociatedWithSubscription"), &__block_literal_global_1021))
  {
    if (-[GEOSQLiteDB executeStatement:statementBlock:](self->_db, "executeStatement:statementBlock:", CFSTR("DeleteOfflineBatchRefsNotAssociatedWithSubscription"), &__block_literal_global_1022))
    {
      if (-[GEOSQLiteDB executeStatement:statementBlock:](self->_db, "executeStatement:statementBlock:", CFSTR("DeleteOfflineDataNotAssociatedWithSubscription"), &__block_literal_global_1023))
      {
        if (-[GEOSQLiteDB executeStatement:statementBlock:](self->_db, "executeStatement:statementBlock:", CFSTR("DeleteOfflineBatchesNotAssociatedWithSubscription"), &__block_literal_global_1024))
        {
          if (-[GEOSQLiteDB executeStatement:statementBlock:](self->_db, "executeStatement:statementBlock:", CFSTR("MarkForDeletionExternalDataForOfflineDataNotAssociatedWithBatch"), &__block_literal_global_1025))
          {
            if (-[GEOSQLiteDB executeStatement:statementBlock:](self->_db, "executeStatement:statementBlock:", CFSTR("DeleteOfflineDataNotAssociatedWithBatch"), &__block_literal_global_1026))
            {
              LOBYTE(v5) = 1;
              return v5;
            }
            v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
            if (!v5)
              return v5;
            v10 = 0;
            v6 = MEMORY[0x1E0C81028];
            v7 = "Assertion failed: DeleteOfflineDataNotAssociatedWithBatch(_db, error)";
            v8 = (uint8_t *)&v10;
          }
          else
          {
            v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
            if (!v5)
              return v5;
            v11 = 0;
            v6 = MEMORY[0x1E0C81028];
            v7 = "Assertion failed: MarkForDeletionExternalDataForOfflineDataNotAssociatedWithBatch(_db, error)";
            v8 = (uint8_t *)&v11;
          }
        }
        else
        {
          v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
          if (!v5)
            return v5;
          v12 = 0;
          v6 = MEMORY[0x1E0C81028];
          v7 = "Assertion failed: DeleteOfflineBatchesNotAssociatedWithSubscription(_db, error)";
          v8 = (uint8_t *)&v12;
        }
      }
      else
      {
        v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
        if (!v5)
          return v5;
        v13 = 0;
        v6 = MEMORY[0x1E0C81028];
        v7 = "Assertion failed: DeleteOfflineDataNotAssociatedWithSubscription(_db, error)";
        v8 = (uint8_t *)&v13;
      }
    }
    else
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (!v5)
        return v5;
      v14 = 0;
      v6 = MEMORY[0x1E0C81028];
      v7 = "Assertion failed: DeleteOfflineBatchRefsNotAssociatedWithSubscription(_db, error)";
      v8 = (uint8_t *)&v14;
    }
  }
  else
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (!v5)
      return v5;
    v15 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Assertion failed: MarkForDeletionExternalDataForOfflineBatchesNotAssociatedWithSubscription(_db, error)";
    v8 = (uint8_t *)&v15;
  }
  _os_log_fault_impl(&dword_1885A9000, v6, OS_LOG_TYPE_FAULT, v7, v8, 2u);
  LOBYTE(v5) = 0;
  return v5;
}

- (void)fetchAllSubscriptionsWithQueue:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  GEOSQLiteDB *db;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    db = self->_db;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke;
    v14[3] = &unk_1E1BFFC90;
    v14[4] = self;
    v15 = v6;
    v16 = v8;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke_3;
    v11[3] = &unk_1E1C00A28;
    v12 = v15;
    v13 = v16;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v14, v11);

  }
}

void __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend(v2, "_fetchSubscriptionsWithIdentifiers:error:", 0, &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke_2;
  v9[3] = &unk_1E1C01358;
  v5 = *(NSObject **)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v11 = v4;
  v12 = v6;
  v10 = v3;
  v7 = v4;
  v8 = v3;
  dispatch_async(v5, v9);

}

uint64_t __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __53__GEOTileDB_fetchAllSubscriptionsWithQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)fetchSubscriptionsMatchingIdentifiers:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  GEOSQLiteDB *db;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9 && v10)
  {
    v12 = MEMORY[0x1E0C809B0];
    db = self->_db;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke;
    v17[3] = &unk_1E1C01268;
    v17[4] = self;
    v18 = v8;
    v19 = v9;
    v20 = v11;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_3;
    v14[3] = &unk_1E1C00A28;
    v15 = v19;
    v16 = v20;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v17, v14);

  }
}

void __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  objc_msgSend(v2, "_fetchSubscriptionsWithIdentifiers:error:", v3, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_2;
  v10[3] = &unk_1E1C01358;
  v6 = *(NSObject **)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v12 = v5;
  v13 = v7;
  v11 = v4;
  v8 = v5;
  v9 = v4;
  dispatch_async(v6, v10);

}

uint64_t __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __66__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)_fetchSubscriptionsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  double Current;
  void *v10;
  GEOSQLiteDB *db;
  id v12;
  id v13;
  int Subscriptions;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, void *, void *, uint64_t, uint64_t, void *, void *, void *);
  void *v21;
  id v22;
  id v23;
  __int128 *p_buf;
  unint64_t v25;
  __int128 buf;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  GEOGetTileDBLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Fetching subscriptions matching identifiers: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x2020000000;
  v28 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __54__GEOTileDB__fetchSubscriptionsWithIdentifiers_error___block_invoke;
  v21 = &unk_1E1C01380;
  p_buf = &buf;
  v25 = (unint64_t)Current;
  v12 = v6;
  v22 = v12;
  v13 = v10;
  v23 = v13;
  Subscriptions = FetchSubscriptions(db, a4, &v18);
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    -[GEOTileDB _removeExpiredSubscriptions](self, "_removeExpiredSubscriptions", v18, v19, v20, v21, v22);
  if (Subscriptions)
    v15 = v13;
  else
    v15 = 0;
  v16 = v15;

  _Block_object_dispose(&buf, 8);
  return v16;
}

uint64_t __54__GEOTileDB__fetchSubscriptionsWithIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  GEOMapRegion *v28;
  GEOMapDataSubscription *v29;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a8;
  v18 = a9;
  if (a7 && *(_QWORD *)(a1 + 56) > (unint64_t)a7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v19 = *(void **)(a1 + 32);
    if (v19)
    {
      v31 = a5;
      v32 = a6;
      v33 = v16;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v35 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            if (_GEOMapDataSubscriptionIdentifierIsCompatible(v25, v15))
            {
              GEOGetTileDBLog();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138478083;
                v39 = v15;
                v40 = 2113;
                v41 = v25;
                _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_DEBUG, "Subscription '%{private}@' matches requested identifier '%{private}@", buf, 0x16u);
              }

              a6 = v32;
              v16 = v33;
              a5 = v31;
              goto LABEL_19;
            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v22)
            continue;
          break;
        }
      }

      GEOGetTileDBLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        v39 = v15;
        _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_DEBUG, "Subscription '%{private}@' does not match requested identifiers", buf, 0xCu);
      }

      v16 = v33;
    }
    else
    {
LABEL_19:
      if (a7)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)a7);
        a7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v28 = -[GEOMapRegion initWithData:]([GEOMapRegion alloc], "initWithData:", v17);
      if (v28)
      {
        v29 = -[GEOMapDataSubscription initWithIdentifier:originatingBundleIdentifier:dataTypes:policy:expirationDate:region:displayName:]([GEOMapDataSubscription alloc], "initWithIdentifier:originatingBundleIdentifier:dataTypes:policy:expirationDate:region:displayName:", v15, v16, a5, a6, a7, v28, v18);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v29);
      }
      else
      {
        GEOGetTileDBLog();
        v29 = (GEOMapDataSubscription *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v29->super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138477827;
          v39 = v15;
          _os_log_impl(&dword_1885A9000, &v29->super, OS_LOG_TYPE_ERROR, "Invalid region associated with subscription '%{private}@'", buf, 0xCu);
        }
      }

    }
  }

  return 1;
}

- (void)fetchAllExpiredSubscriptionsWithQueue:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  GEOSQLiteDB *db;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    db = self->_db;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke;
    v14[3] = &unk_1E1BFFC90;
    v14[4] = self;
    v15 = v6;
    v16 = v8;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke_3;
    v11[3] = &unk_1E1C00A28;
    v12 = v15;
    v13 = v16;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v14, v11);

  }
}

void __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend(v2, "_fetchExpiredSubscriptionsWithIdentifiers:error:", 0, &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke_2;
  v9[3] = &unk_1E1C01358;
  v5 = *(NSObject **)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v11 = v4;
  v12 = v6;
  v10 = v3;
  v7 = v4;
  v8 = v3;
  dispatch_async(v5, v9);

}

uint64_t __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __60__GEOTileDB_fetchAllExpiredSubscriptionsWithQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)fetchExpiredSubscriptionsMatchingIdentifiers:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  GEOSQLiteDB *db;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9 && v10)
  {
    v12 = MEMORY[0x1E0C809B0];
    db = self->_db;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke;
    v17[3] = &unk_1E1C01268;
    v17[4] = self;
    v18 = v8;
    v19 = v9;
    v20 = v11;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_3;
    v14[3] = &unk_1E1C00A28;
    v15 = v19;
    v16 = v20;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v17, v14);

  }
}

void __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  objc_msgSend(v2, "_fetchExpiredSubscriptionsWithIdentifiers:error:", v3, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_2;
  v10[3] = &unk_1E1C01358;
  v6 = *(NSObject **)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v12 = v5;
  v13 = v7;
  v11 = v4;
  v8 = v5;
  v9 = v4;
  dispatch_async(v6, v10);

}

uint64_t __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __73__GEOTileDB_fetchExpiredSubscriptionsMatchingIdentifiers_queue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)_fetchExpiredSubscriptionsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  GEOSQLiteDB *db;
  uint64_t v11;
  id v12;
  id v13;
  GEOSQLiteDB *v14;
  uint64_t *v15;
  GEOSQLiteDB *v16;
  uint64_t *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *, void *, uint64_t, uint64_t, void *, void *, uint64_t);
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  __int128 buf;
  BOOL (*v36)(uint64_t, sqlite3_stmt *);
  void *v37;
  GEOSQLiteDB *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  GEOGetTileDBLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Fetching expired subscriptions matching identifiers: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v11 = MEMORY[0x1E0C809B0];
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __61__GEOTileDB__fetchExpiredSubscriptionsWithIdentifiers_error___block_invoke;
  v26 = &unk_1E1C013A8;
  v12 = v6;
  v27 = v12;
  v13 = v9;
  v28 = v13;
  v14 = db;
  v15 = &v23;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__5;
  v33 = __Block_byref_object_dispose__5;
  v34 = 0;
  *(_QWORD *)&buf = v11;
  *((_QWORD *)&buf + 1) = 3221225472;
  v36 = __FetchExpiredSubscriptions_block_invoke;
  v37 = &unk_1E1BFF998;
  v16 = v14;
  v38 = v16;
  v17 = v15;
  v39 = v17;
  v40 = &v29;
  v18 = -[GEOSQLiteDB statementForKey:statementBlock:](v16, "statementForKey:statementBlock:", CFSTR("FetchExpiredSubscriptions"), &buf, v23, v24, v25, v26);
  if (a4)
  {
    v19 = (void *)v30[5];
    if (v19)
      *a4 = objc_retainAutorelease(v19);
  }

  _Block_object_dispose(&v29, 8);
  if (v18)
    v20 = v13;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

uint64_t __61__GEOTileDB__fetchExpiredSubscriptionsWithIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  GEOMapRegion *v26;
  NSObject *v27;
  GEOMapDataSubscription *v28;
  void *v29;
  NSObject *v30;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = a3;
  v17 = a6;
  v18 = a7;
  v19 = *(void **)(a1 + 32);
  if (v19)
  {
    v32 = a8;
    v33 = a4;
    v34 = a5;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v36 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (_GEOMapDataSubscriptionIdentifierIsCompatible(v25, v15))
          {
            GEOGetTileDBLog();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138478083;
              v40 = v15;
              v41 = 2113;
              v42 = v25;
              _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_DEBUG, "Subscription '%{private}@' matches requested identifier '%{private}@", buf, 0x16u);
            }

            a4 = v33;
            a5 = v34;
            a8 = v32;
            goto LABEL_15;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v22)
          continue;
        break;
      }
    }

    GEOGetTileDBLog();
    v26 = (GEOMapRegion *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v26->super.super, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v40 = v15;
      _os_log_impl(&dword_1885A9000, &v26->super.super, OS_LOG_TYPE_DEBUG, "Subscription '%{private}@' does not match requested identifiers", buf, 0xCu);
    }
  }
  else
  {
LABEL_15:
    v26 = -[GEOMapRegion initWithData:]([GEOMapRegion alloc], "initWithData:", v17);
    if (v26)
    {
      v28 = [GEOMapDataSubscription alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[GEOMapDataSubscription initWithIdentifier:originatingBundleIdentifier:dataTypes:policy:expirationDate:region:displayName:regulatoryRegionID:](v28, "initWithIdentifier:originatingBundleIdentifier:dataTypes:policy:expirationDate:region:displayName:regulatoryRegionID:", v15, v16, a4, a5, 0, v26, v18, v29);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v30);
    }
    else
    {
      GEOGetTileDBLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v40 = v15;
        _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_ERROR, "Invalid region associated with subscription '%{private}@'", buf, 0xCu);
      }
    }

  }
  return 1;
}

- (void)fetchSubscriptionMetadataWithIdentifier:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOSQLiteDB *db;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  db = self->_db;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__GEOTileDB_fetchSubscriptionMetadataWithIdentifier_queue_callback___block_invoke;
  v19[3] = &unk_1E1C01268;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __68__GEOTileDB_fetchSubscriptionMetadataWithIdentifier_queue_callback___block_invoke_2;
  v16[3] = &unk_1E1C00A28;
  v17 = v21;
  v18 = v22;
  v13 = v22;
  v14 = v21;
  v15 = v8;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v19, v16);

}

uint64_t __68__GEOTileDB_fetchSubscriptionMetadataWithIdentifier_queue_callback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSubscriptionMetadataWithIdentifierOnQueue:queue:callback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __68__GEOTileDB_fetchSubscriptionMetadataWithIdentifier_queue_callback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__GEOTileDB_fetchSubscriptionMetadataWithIdentifier_queue_callback___block_invoke_3;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __68__GEOTileDB_fetchSubscriptionMetadataWithIdentifier_queue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)_fetchSubscriptionMetadataWithIdentifierOnQueue:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  GEOSQLiteDB *db;
  void *v13;
  GEOSQLiteDB *v14;
  uint64_t v15;
  id v16;
  GEOSQLiteDB *v17;
  uint64_t v18;
  GEOSQLiteDB *v19;
  _QWORD *v20;
  GEOSQLiteDB *v21;
  _QWORD *v22;
  GEOTileDBSubscriptionMetadata *v23;
  GEOTileDBSubscriptionMetadata *v24;
  GEOTileDBSubscriptionMetadata *v25;
  id v26;
  _QWORD v27[4];
  GEOTileDBSubscriptionMetadata *v28;
  id v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  _QWORD block[4];
  id v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  GEOSQLiteDB *v45;
  id v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD v49[5];
  id v50;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = -1;
  v11 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke;
  v39[3] = &unk_1E1C00C30;
  v39[4] = &v40;
  GetSubscriptionPK(db, v8, v39);
  if (v41[3] == -1)
  {
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_2;
    block[3] = &unk_1E1C01F48;
    v38 = v10;
    v16 = v10;
    dispatch_async(v9, block);
    v26 = v38;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_db;
    v15 = v41[3];
    v35[0] = v11;
    v35[1] = 3221225472;
    v35[2] = __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_3;
    v35[3] = &unk_1E1C013D0;
    v16 = v13;
    v36 = v16;
    GetSubscriptionDataStates(v14, v15, v35);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v17 = self->_db;
    v18 = v41[3];
    v30[0] = v11;
    v30[1] = 3221225472;
    v30[2] = __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_4;
    v30[3] = &unk_1E1C010E0;
    v30[4] = &v31;
    v19 = v17;
    v20 = v30;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3032000000;
    v49[3] = __Block_byref_object_copy__5;
    v49[4] = __Block_byref_object_dispose__5;
    v50 = 0;
    v44[0] = v11;
    v44[1] = 3221225472;
    v44[2] = __GetSubscriptionDownloadState_block_invoke;
    v44[3] = &unk_1E1C019E8;
    v21 = v19;
    v47 = v49;
    v48 = v18;
    v45 = v21;
    v22 = v20;
    v46 = v22;
    -[GEOSQLiteDB statementForKey:statementBlock:](v21, "statementForKey:statementBlock:", CFSTR("GetSubscriptionDownloadState"), v44);

    _Block_object_dispose(v49, 8);
    v23 = [GEOTileDBSubscriptionMetadata alloc];
    v24 = -[GEOTileDBSubscriptionMetadata initWithDataStates:downloadState:](v23, "initWithDataStates:downloadState:", v16, v32[3]);
    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_5;
    v27[3] = &unk_1E1BFF970;
    v28 = v24;
    v29 = v10;
    v25 = v24;
    v26 = v10;
    dispatch_async(v9, v27);

    _Block_object_dispose(&v31, 8);
  }

  _Block_object_dispose(&v40, 8);
}

uint64_t __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_3(uint64_t a1, int a2, int a3, uint64_t a4, char a5, unsigned int a6, uint64_t a7)
{
  _GEOTileDBSubscriptionMetadataDataState *v14;
  id v15;
  void *v16;
  objc_super v18;

  v14 = [_GEOTileDBSubscriptionMetadataDataState alloc];
  if (v14)
  {
    v18.receiver = v14;
    v18.super_class = (Class)_GEOTileDBSubscriptionMetadataDataState;
    v15 = objc_msgSendSuper2(&v18, sel_init);
    v16 = v15;
    if (v15)
    {
      *((_DWORD *)v15 + 4) = a2;
      *((_DWORD *)v15 + 5) = a3;
      *((_QWORD *)v15 + 1) = a4;
      *((_BYTE *)v15 + 24) = a5;
      *((_QWORD *)v15 + 4) = a6;
      *((_QWORD *)v15 + 5) = a7;
    }
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);

  return 1;
}

uint64_t __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_4(uint64_t a1, unsigned int a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __76__GEOTileDB__fetchSubscriptionMetadataWithIdentifierOnQueue_queue_callback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)setSubscriptionWithIdentifier:(id)a3 isFullyLoaded:(BOOL)a4 forDataType:(unsigned int)a5 dataSubtype:(unsigned int)a6 version:(unint64_t)a7
{
  id v12;
  GEOSQLiteDB *db;
  id v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;

  v12 = a3;
  db = self->_db;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__GEOTileDB_setSubscriptionWithIdentifier_isFullyLoaded_forDataType_dataSubtype_version___block_invoke;
  v15[3] = &unk_1E1C013F8;
  v15[4] = self;
  v16 = v12;
  v20 = a4;
  v18 = a5;
  v19 = a6;
  v17 = a7;
  v14 = v12;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v15);

}

uint64_t __89__GEOTileDB_setSubscriptionWithIdentifier_isFullyLoaded_forDataType_dataSubtype_version___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_flushPendingWrites");
  return objc_msgSend(*(id *)(a1 + 32), "_setSubscriptionWithIdentifierOnQueue:isFullyLoaded:forDataType:dataSubtype:version:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(_QWORD *)(a1 + 48));
}

- (void)_setSubscriptionWithIdentifierOnQueue:(id)a3 isFullyLoaded:(BOOL)a4 forDataType:(unsigned int)a5 dataSubtype:(unsigned int)a6 version:(unint64_t)a7
{
  _BOOL4 v10;
  id v12;
  uint64_t v13;
  GEOSQLiteDB *db;
  uint64_t v15;
  GEOSQLiteDB *v16;
  GEOSQLiteDB *v17;
  _QWORD *v18;
  GEOSQLiteDB *v19;
  _QWORD *v20;
  NSObject *v21;
  GEOSQLiteDB *v22;
  _QWORD *v23;
  GEOSQLiteDB *v24;
  _QWORD *v25;
  _QWORD v26[6];
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  __int128 buf;
  uint64_t (*v48)(uint64_t, sqlite3_stmt *);
  void *v49;
  GEOSQLiteDB *v50;
  id v51;
  uint64_t *v52;
  uint64_t v53;
  unint64_t v54;
  unsigned int v55;
  uint64_t v56;

  v10 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = -1;
  v13 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __97__GEOTileDB__setSubscriptionWithIdentifierOnQueue_isFullyLoaded_forDataType_dataSubtype_version___block_invoke;
  v36[3] = &unk_1E1C00C30;
  v36[4] = &v37;
  GetSubscriptionPK(db, v12, v36);
  v15 = v38[3];
  if (v15 == -1)
  {
    GEOGetTileDBLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "Unknown subscription identifier: %{private}@", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    if (v10)
    {
      v16 = self->_db;
      if (a5 == 1024)
      {
        v27[0] = v13;
        v27[1] = 3221225472;
        v27[2] = __97__GEOTileDB__setSubscriptionWithIdentifierOnQueue_isFullyLoaded_forDataType_dataSubtype_version___block_invoke_464;
        v27[3] = &unk_1E1C00EB0;
        v27[4] = &v32;
        v27[5] = &v28;
        v17 = v16;
        v18 = v27;
        v41 = 0;
        v42 = &v41;
        v43 = 0x3032000000;
        v44 = __Block_byref_object_copy__5;
        v45 = __Block_byref_object_dispose__5;
        v46 = 0;
        *(_QWORD *)&buf = v13;
        *((_QWORD *)&buf + 1) = 3221225472;
        v48 = __GetSubscriptionSizeForOfflineLayer_block_invoke;
        v49 = &unk_1E1C01DE0;
        v19 = v17;
        v50 = v19;
        v52 = &v41;
        v53 = v15;
        v55 = a6;
        v54 = a7;
        v20 = v18;
        v51 = v20;
        -[GEOSQLiteDB statementForKey:statementBlock:](v19, "statementForKey:statementBlock:", CFSTR("GetSubscriptionSizeForOfflineLayer"), &buf);

        _Block_object_dispose(&v41, 8);
      }
      else
      {
        v26[0] = v13;
        v26[1] = 3221225472;
        v26[2] = __97__GEOTileDB__setSubscriptionWithIdentifierOnQueue_isFullyLoaded_forDataType_dataSubtype_version___block_invoke_2;
        v26[3] = &unk_1E1C00EB0;
        v26[4] = &v32;
        v26[5] = &v28;
        v22 = v16;
        v23 = v26;
        v41 = 0;
        v42 = &v41;
        v43 = 0x3032000000;
        v44 = __Block_byref_object_copy__5;
        v45 = __Block_byref_object_dispose__5;
        v46 = 0;
        *(_QWORD *)&buf = v13;
        *((_QWORD *)&buf + 1) = 3221225472;
        v48 = __GetSubscriptionSizeForTileset_block_invoke;
        v49 = &unk_1E1C01E08;
        v24 = v22;
        v50 = v24;
        v52 = &v41;
        v53 = v15;
        LODWORD(v54) = a6;
        BYTE4(v54) = a7 == 1;
        v25 = v23;
        v51 = v25;
        -[GEOSQLiteDB statementForKey:statementBlock:](v24, "statementForKey:statementBlock:", CFSTR("GetSubscriptionSizeForTileset"), &buf);

        _Block_object_dispose(&v41, 8);
      }
    }
    SetSubscriptionDataState(self->_db, v38[3], a5, a6, a7, v10, *((_DWORD *)v33 + 6), v29[3]);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  _Block_object_dispose(&v37, 8);

}

uint64_t __97__GEOTileDB__setSubscriptionWithIdentifierOnQueue_isFullyLoaded_forDataType_dataSubtype_version___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __97__GEOTileDB__setSubscriptionWithIdentifierOnQueue_isFullyLoaded_forDataType_dataSubtype_version___block_invoke_464(uint64_t a1, uint64_t a2, unsigned int a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a2;
  return 1;
}

uint64_t __97__GEOTileDB__setSubscriptionWithIdentifierOnQueue_isFullyLoaded_forDataType_dataSubtype_version___block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a2;
  return 1;
}

- (void)setDownloadState:(int64_t)a3 forSubscriptionWithIdentifier:(id)a4
{
  id v6;
  GEOSQLiteDB *db;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__GEOTileDB_setDownloadState_forSubscriptionWithIdentifier___block_invoke;
  v9[3] = &unk_1E1C01420;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v9);

}

void __60__GEOTileDB_setDownloadState_forSubscriptionWithIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  uint64_t v17;
  int v18;
  _QWORD v19[5];
  id v20;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  v2 = (void *)a1[5];
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(void **)(a1[4] + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__GEOTileDB_setDownloadState_forSubscriptionWithIdentifier___block_invoke_2;
  v9[3] = &unk_1E1C00C30;
  v9[4] = &v10;
  GetSubscriptionPK(v4, v2, v9);
  v5 = v11[3];
  if (v5 != -1)
  {
    v6 = a1[6];
    v7 = *(id *)(a1[4] + 8);
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__5;
    v19[4] = __Block_byref_object_dispose__5;
    v20 = 0;
    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __SetSubscriptionDownloadState_block_invoke;
    v14[3] = &unk_1E1C01A38;
    v8 = v7;
    v16 = v19;
    v17 = v5;
    v15 = v8;
    v18 = v6;
    objc_msgSend(v8, "executeStatement:statementBlock:", CFSTR("SetSubscriptionDownloadState"), v14);

    _Block_object_dispose(v19, 8);
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __60__GEOTileDB_setDownloadState_forSubscriptionWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)clearDownloadStateForSubscriptionWithIdentifier:(id)a3
{
  id v4;
  GEOSQLiteDB *db;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__GEOTileDB_clearDownloadStateForSubscriptionWithIdentifier___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v7);

}

void __61__GEOTileDB_clearDownloadStateForSubscriptionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = -1;
  v2 = *(void **)(a1 + 40);
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__GEOTileDB_clearDownloadStateForSubscriptionWithIdentifier___block_invoke_2;
  v8[3] = &unk_1E1C00C30;
  v8[4] = &v9;
  GetSubscriptionPK(v4, v2, v8);
  v5 = v10[3];
  if (v5 != -1)
  {
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__5;
    v17[4] = __Block_byref_object_dispose__5;
    v18 = 0;
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __ClearSubscriptionDownloadState_block_invoke;
    v13[3] = &unk_1E1BFF770;
    v7 = v6;
    v15 = v17;
    v16 = v5;
    v14 = v7;
    objc_msgSend(v7, "executeStatement:statementBlock:", CFSTR("ClearSubscriptionDownloadState"), v13);

    _Block_object_dispose(v17, 8);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __61__GEOTileDB_clearDownloadStateForSubscriptionWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)fetchAllSubscriptionsToSyncToPairedDevice:(id)a3 queue:(id)a4 callback:(id)a5
{
  -[GEOTileDB fetchSubscriptionsMatchingIdentifiers:toSyncToPairedDevice:queue:callback:](self, "fetchSubscriptionsMatchingIdentifiers:toSyncToPairedDevice:queue:callback:", 0, a3, a4, a5);
}

- (void)fetchSubscriptionsMatchingIdentifiers:(id)a3 toSyncToPairedDevice:(id)a4 queue:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GEOSQLiteDB *db;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  db = self->_db;
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke;
  v23[3] = &unk_1E1C01498;
  v23[4] = self;
  v24 = v10;
  v25 = v12;
  v26 = v11;
  v27 = v13;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_8;
  v20[3] = &unk_1E1C00A28;
  v21 = v25;
  v22 = v27;
  v16 = v27;
  v17 = v25;
  v18 = v11;
  v19 = v10;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v23, v20);

}

void __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v35 = 0;
  objc_msgSend(v2, "_fetchSubscriptionsWithIdentifiers:error:", v3, &v35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v35;
  if (v4)
  {
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
      v9 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_4;
      v27[3] = &unk_1E1C01448;
      v10 = v6;
      v28 = v10;
      GetSubscriptionsForSyncToPairedDevice(v7, v8, v27);

      v11 = *(void **)(a1 + 56);
      if (v11)
      {
        v12 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        v25[0] = v9;
        v25[1] = 3221225472;
        v25[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_5;
        v25[3] = &unk_1E1C01448;
        v26 = v10;
        GetSubscriptionsForSyncToPairedDevice(v12, v11, v25);

      }
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_6;
      v23[3] = &unk_1E1C01470;
      v24 = v10;
      v13 = v10;
      objc_msgSend(v4, "_geo_filtered:", v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(NSObject **)(a1 + 48);
      v20[0] = v9;
      v20[1] = 3221225472;
      v20[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_7;
      v20[3] = &unk_1E1BFF970;
      v16 = *(id *)(a1 + 64);
      v21 = v14;
      v22 = v16;
      v17 = v14;
      dispatch_async(v15, v20);

    }
    else
    {
      v19 = *(NSObject **)(a1 + 48);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_3;
      v29[3] = &unk_1E1BFF970;
      v31 = *(id *)(a1 + 64);
      v30 = v4;
      dispatch_async(v19, v29);

      v13 = v31;
    }
  }
  else
  {
    v18 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_2;
    block[3] = &unk_1E1BFF970;
    v34 = *(id *)(a1 + 64);
    v33 = v5;
    dispatch_async(v18, block);

    v13 = v34;
  }

}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithBool:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

  return 1;
}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithBool:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

  return 1;
}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_9;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __87__GEOTileDB_fetchSubscriptionsMatchingIdentifiers_toSyncToPairedDevice_queue_callback___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)setSubscriptionWithIdentifier:(id)a3 shouldSync:(BOOL)a4 toPairedDevice:(id)a5
{
  -[GEOTileDB setSubscriptionWithIdentifier:shouldSync:toPairedDevice:shouldOverwriteExistingValue:](self, "setSubscriptionWithIdentifier:shouldSync:toPairedDevice:shouldOverwriteExistingValue:", a3, a4, a5, 1);
}

- (void)setSubscriptionWithIdentifier:(id)a3 shouldSync:(BOOL)a4 toPairedDevice:(id)a5 shouldOverwriteExistingValue:(BOOL)a6
{
  id v10;
  id v11;
  GEOSQLiteDB *db;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a5;
  db = self->_db;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__GEOTileDB_setSubscriptionWithIdentifier_shouldSync_toPairedDevice_shouldOverwriteExistingValue___block_invoke;
  v15[3] = &unk_1E1C014C0;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = a6;
  v19 = a4;
  v13 = v11;
  v14 = v10;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v15);

}

void __98__GEOTileDB_setSubscriptionWithIdentifier_shouldSync_toPairedDevice_shouldOverwriteExistingValue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  __int128 buf;
  uint64_t (*v30)(uint64_t, uint64_t);
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -1;
  v2 = *(void **)(a1 + 40);
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__GEOTileDB_setSubscriptionWithIdentifier_shouldSync_toPairedDevice_shouldOverwriteExistingValue___block_invoke_2;
  v18[3] = &unk_1E1C00C30;
  v18[4] = &v19;
  GetSubscriptionPK(v4, v2, v18);
  v5 = v20;
  if (v20[3] == -1)
  {
    GEOGetTileDBLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Unknown subscription identifier: %{private}@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v6 = *(void **)(a1 + 48);
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
      v5 = v20;
    }
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v11 = v5[3];
    v12 = *(_BYTE *)(a1 + 57);
    if (*(_BYTE *)(a1 + 56))
    {
      v13 = v10;
      v14 = v7;
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__5;
      v27 = __Block_byref_object_dispose__5;
      v28 = 0;
      *(_QWORD *)&buf = v3;
      *((_QWORD *)&buf + 1) = 3221225472;
      v30 = __SetSubscriptionShouldSyncToPairedDevice_block_invoke;
      v31 = &unk_1E1C01E30;
      v15 = v13;
      v34 = &v23;
      v35 = v11;
      v32 = v15;
      v8 = v14;
      v33 = v8;
      v36 = v12;
      objc_msgSend(v15, "executeStatement:statementBlock:", CFSTR("SetSubscriptionShouldSyncToPairedDevice"), &buf);
    }
    else
    {
      v16 = v10;
      v17 = v7;
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__5;
      v27 = __Block_byref_object_dispose__5;
      v28 = 0;
      *(_QWORD *)&buf = v3;
      *((_QWORD *)&buf + 1) = 3221225472;
      v30 = __SetSubscriptionShouldSyncToPairedDeviceNoOverwrite_block_invoke;
      v31 = &unk_1E1C01E30;
      v15 = v16;
      v34 = &v23;
      v35 = v11;
      v32 = v15;
      v8 = v17;
      v33 = v8;
      v36 = v12;
      objc_msgSend(v15, "executeStatement:statementBlock:", CFSTR("SetSubscriptionShouldSyncToPairedDeviceNoOverwrite"), &buf);
    }

    _Block_object_dispose(&v23, 8);
  }

  _Block_object_dispose(&v19, 8);
}

uint64_t __98__GEOTileDB_setSubscriptionWithIdentifier_shouldSync_toPairedDevice_shouldOverwriteExistingValue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)clearShouldSyncSubscriptionsForPairedDevice:(id)a3
{
  id v4;
  GEOSQLiteDB *db;
  id v6;
  _QWORD v7[4];
  id v8;
  GEOTileDB *v9;

  v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__GEOTileDB_clearShouldSyncSubscriptionsForPairedDevice___block_invoke;
  v7[3] = &unk_1E1C00738;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v7);

}

void __57__GEOTileDB_clearShouldSyncSubscriptionsForPairedDevice___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v2 = *(void **)(a1 + 32);
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  v4 = v3;
  v5 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = v4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__5;
  v13[4] = __Block_byref_object_dispose__5;
  v14 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __ClearSubscriptionsForSyncToPairedDevice_block_invoke;
  v9[3] = &unk_1E1BFFB28;
  v7 = v5;
  v10 = v7;
  v8 = v6;
  v11 = v8;
  v12 = v13;
  objc_msgSend(v7, "executeStatement:statementBlock:", CFSTR("ClearSubscriptionsForSyncToPairedDevice"), v9);

  _Block_object_dispose(v13, 8);
}

- (void)addData:(id)a3 forOfflineDataBatchKey:(id)a4 version:(unint64_t)a5 etag:(id)a6 containedKeys:(id)a7 forSubscriptionIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  GEOSQLiteDB *db;
  NSObject *v37;
  NSObject *v38;
  unint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  unint64_t v51;
  id v52;
  id v53;
  uint8_t buf[4];
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v14)
  {
    objc_msgSend(v14, "fileURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v39 = a5;
      v42 = v18;
      v43 = v16;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fileURLWithPath:isDirectory:", v22, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "fileExistsAtPath:", v25);

      if ((v26 & 1) != 0)
      {
        v40 = v17;
        v41 = v15;
        v27 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0;
        v29 = objc_msgSend(v28, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v23, 1, 0, &v53);
        v27 = v53;

        if ((v29 & 1) == 0)
        {
          GEOGetTileDBLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v55 = v27;
            _os_log_impl(&dword_1885A9000, v38, OS_LOG_TYPE_ERROR, "Failed to create temporary directory: %{public}@", buf, 0xCu);
          }

          v18 = v42;
          goto LABEL_17;
        }
        v40 = v17;
        v41 = v15;
      }
      objc_msgSend(v20, "UUIDString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLByAppendingPathComponent:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v27;
      v34 = objc_msgSend(v32, "moveItemAtURL:toURL:error:", v33, v31, &v52);
      v35 = v52;

      if ((v34 & 1) == 0)
      {
        GEOGetTileDBLog();
        v37 = objc_claimAutoreleasedReturnValue();
        v16 = v43;
        v17 = v40;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v55 = v35;
          _os_log_impl(&dword_1885A9000, v37, OS_LOG_TYPE_ERROR, "Failed to move external file to temporary directory: %{public}@", buf, 0xCu);
        }

        v15 = v41;
        v18 = v42;
        goto LABEL_17;
      }
      objc_msgSend(v14, "_replaceFileURL:", v31);

      v17 = v40;
      v15 = v41;
      v18 = v42;
      v16 = v43;
      a5 = v39;
    }
    else
    {
      v20 = 0;
    }
    db = self->_db;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __97__GEOTileDB_addData_forOfflineDataBatchKey_version_etag_containedKeys_forSubscriptionIdentifier___block_invoke;
    v44[3] = &unk_1E1C014E8;
    v44[4] = self;
    v20 = v20;
    v45 = v20;
    v46 = v14;
    v47 = v15;
    v51 = a5;
    v48 = v16;
    v49 = v17;
    v50 = v18;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v44);

LABEL_17:
  }

}

void __97__GEOTileDB_addData_forOfflineDataBatchKey_version_etag_containedKeys_forSubscriptionIdentifier___block_invoke(uint64_t a1)
{
  uint8_t buf[16];

  if ((MarkExternalDataForDeletion(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 40)) & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_prepareDataForPersistence:isIdenticalToExistingStaleData:preferredExternalResourceUUID:externalResourceUUID:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40), 0))objc_msgSend(*(id *)(a1 + 32), "_addDataOnDBQueueWithData:forOfflineBatchKey:version:etag:externalResourceUUID:containedKeys:subscriptionIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: MarkExternalDataForDeletion(_db, ((void *)0), newExternalResourceUUID)", buf, 2u);
  }
}

- (void)_addDataOnDBQueueWithData:(id)a3 forOfflineBatchKey:(id)a4 version:(unint64_t)a5 etag:(id)a6 externalResourceUUID:(id)a7 containedKeys:(id)a8 subscriptionIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  GEOSQLiteDB *db;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  unint64_t v35;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  db = self->_db;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __129__GEOTileDB__addDataOnDBQueueWithData_forOfflineBatchKey_version_etag_externalResourceUUID_containedKeys_subscriptionIdentifier___block_invoke;
  v28[3] = &unk_1E1C01538;
  v28[4] = self;
  v29 = v16;
  v30 = v20;
  v31 = v15;
  v32 = v18;
  v33 = v17;
  v34 = v19;
  v35 = a5;
  v22 = v19;
  v23 = v17;
  v24 = v18;
  v25 = v15;
  v26 = v20;
  v27 = v16;
  -[GEOSQLiteDB executeInTransaction:](db, "executeInTransaction:", v28);

}

uint64_t __129__GEOTileDB__addDataOnDBQueueWithData_forOfflineBatchKey_version_etag_externalResourceUUID_containedKeys_subscriptionIdentifier___block_invoke(uint64_t a1)
{
  double Current;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD *v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  int v38;
  uint64_t *v39;
  id v40;
  uint64_t *v41;
  id v42;
  uint64_t *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t v56;
  NSObject *v58;
  const char *v59;
  NSObject *v60;
  const char *v61;
  unint64_t v62;
  id obj;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[5];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[5];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint8_t buf[8];
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t *v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = -1;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = objc_msgSend(*(id *)(a1 + 40), "layer");
  v5 = *(_QWORD *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 40), "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __129__GEOTileDB__addDataOnDBQueueWithData_forOfflineBatchKey_version_etag_externalResourceUUID_containedKeys_subscriptionIdentifier___block_invoke_2;
  v77[3] = &unk_1E1C01510;
  v77[4] = &v78;
  CheckExistenceOfOfflineBatchKey(v3, v4, v5, v6, v77);

  if (v79[3] != -1)
  {
    GEOGetTileDBLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Adding offline batch which already exists in DB. Ignoring.", buf, 2u);
    }

    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 32), "_markDataAtRow:associatedWithSubscriptionIdentifier:", v79[3]);
    goto LABEL_21;
  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "_insertDataRowForData:ETag:externalResourceUUID:timestamp:subscriptionIdentifier:", *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 48));
  v67 = a1;
  if (v8 == -1)
    goto LABEL_31;
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v10 = objc_msgSend(*(id *)(a1 + 40), "layer");
  objc_msgSend(*(id *)(a1 + 40), "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 88);
  v13 = *(void **)(a1 + 72);
  v14 = v9;
  v15 = v11;
  v16 = v13;
  v94 = 0;
  v95 = &v94;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__5;
  v98 = __Block_byref_object_dispose__5;
  v99 = 0;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  v83 = 3221225472;
  v84 = __InsertOfflineDataBatch_block_invoke;
  v85 = &unk_1E1C01E80;
  v17 = v14;
  LODWORD(v92) = v10;
  v86 = v17;
  v89 = &v94;
  v18 = (uint64_t *)v15;
  v87 = v18;
  v90 = v12;
  v19 = (uint64_t *)v16;
  v88 = v19;
  v91 = v8;
  v20 = objc_msgSend(v17, "executeStatement:statementBlock:", CFSTR("InsertOfflineDataBatch"), buf);

  _Block_object_dispose(&v94, 8);
  if ((v20 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_31;
    *(_WORD *)buf = 0;
    v60 = MEMORY[0x1E0C81028];
    v61 = "Assertion failed: InsertOfflineDataBatch(_db, ((void *)0), (uint32_t)key.layer, key.key, version, etag, pk)";
LABEL_38:
    _os_log_fault_impl(&dword_1885A9000, v60, OS_LOG_TYPE_FAULT, v61, buf, 2u);
    goto LABEL_31;
  }
  v21 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lastInsertRowID");
  if (v21 == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_31;
    *(_WORD *)buf = 0;
    v60 = MEMORY[0x1E0C81028];
    v61 = "Assertion failed: batchPK != InvalidRowID";
    goto LABEL_38;
  }
  v65 = (uint64_t *)v21;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = *(id *)(a1 + 80);
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v100, 16);
  if (!v22)
    goto LABEL_20;
  v62 = (unint64_t)(Current + *MEMORY[0x1E0C9ADF8]);
  v64 = *(_QWORD *)v74;
  while (2)
  {
    v66 = v22;
    for (i = 0; i != v66; ++i)
    {
      if (*(_QWORD *)v74 != v64)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
      objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0;
      v70 = &v69;
      v71 = 0x2020000000;
      v72 = -1;
      v26 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v27 = objc_msgSend(*(id *)(a1 + 40), "layer");
      v28 = *(_QWORD *)(a1 + 88);
      v29 = MEMORY[0x1E0C809B0];
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __129__GEOTileDB__addDataOnDBQueueWithData_forOfflineBatchKey_version_etag_externalResourceUUID_containedKeys_subscriptionIdentifier___block_invoke_467;
      v68[3] = &unk_1E1C00C30;
      v68[4] = &v69;
      v30 = v26;
      v31 = v24;
      v32 = v68;
      v94 = 0;
      v95 = &v94;
      v96 = 0x3032000000;
      v97 = __Block_byref_object_copy__5;
      v98 = __Block_byref_object_dispose__5;
      v99 = 0;
      *(_QWORD *)buf = v29;
      v83 = 3221225472;
      v84 = __GetOfflineDataPKForKey_block_invoke;
      v85 = &unk_1E1C01E58;
      v33 = v30;
      LODWORD(v91) = v27;
      v86 = v33;
      v89 = &v94;
      v90 = v28;
      v34 = (uint64_t *)v31;
      v87 = v34;
      v35 = v32;
      v88 = v35;
      objc_msgSend(v33, "statementForKey:statementBlock:", CFSTR("GetOfflineDataPKForKey"), buf);

      _Block_object_dispose(&v94, 8);
      v36 = v70[3];
      if (v36 == -1)
      {
        v37 = *(void **)(*(_QWORD *)(v67 + 32) + 8);
        v38 = objc_msgSend(*(id *)(v67 + 40), "layer");
        v39 = *(uint64_t **)(v67 + 88);
        v40 = v37;
        v41 = v34;
        v94 = 0;
        v95 = &v94;
        v96 = 0x3032000000;
        v97 = __Block_byref_object_copy__5;
        v98 = __Block_byref_object_dispose__5;
        v99 = 0;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        v83 = 3221225472;
        v84 = __InsertOfflineData_block_invoke;
        v85 = &unk_1E1C01EA8;
        v42 = v40;
        LODWORD(v91) = v38;
        v86 = v42;
        v88 = &v94;
        v43 = v41;
        v87 = v43;
        v89 = v39;
        v90 = v62;
        LOBYTE(v41) = objc_msgSend(v42, "executeStatement:statementBlock:", CFSTR("InsertOfflineData"), buf);

        _Block_object_dispose(&v94, 8);
        if ((v41 & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            v58 = MEMORY[0x1E0C81028];
            v59 = "Assertion failed: InsertOfflineData(_db, ((void *)0), (uint32_t)key.layer, serviceKey, version, ((0) >"
                  " (timestamp) ? (0) : (timestamp)))";
            goto LABEL_29;
          }
          goto LABEL_30;
        }
        v36 = objc_msgSend(*(id *)(*(_QWORD *)(v67 + 32) + 8), "lastInsertRowID");
        v70[3] = v36;
        if (v36 == -1)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            v58 = MEMORY[0x1E0C81028];
            v59 = "Assertion failed: offlineDataPK != InvalidRowID";
LABEL_29:
            _os_log_fault_impl(&dword_1885A9000, v58, OS_LOG_TYPE_FAULT, v59, buf, 2u);
          }
LABEL_30:
          _Block_object_dispose(&v69, 8);

          goto LABEL_31;
        }
      }
      v44 = *(void **)(*(_QWORD *)(v67 + 32) + 8);
      v45 = objc_msgSend(v25, "offset");
      v46 = objc_msgSend(v25, "length");
      v47 = objc_msgSend(*(id *)(v67 + 40), "layer");
      v48 = *(_QWORD *)(v67 + 88);
      v49 = v44;
      v94 = 0;
      v95 = &v94;
      v96 = 0x3032000000;
      v97 = __Block_byref_object_copy__5;
      v98 = __Block_byref_object_dispose__5;
      v99 = 0;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v83 = 3221225472;
      v84 = __InsertOfflineDataBatchReference_block_invoke;
      v85 = &unk_1E1C01ED0;
      v50 = v49;
      v86 = v50;
      v87 = &v94;
      v88 = v65;
      v89 = (uint64_t *)v36;
      v90 = v45;
      v91 = v46;
      v93 = v47;
      v92 = v48;
      LOBYTE(v46) = objc_msgSend(v50, "executeStatement:statementBlock:", CFSTR("InsertOfflineDataBatchReference"), buf);

      a1 = v67;
      _Block_object_dispose(&v94, 8);

      if ((v46 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v58 = MEMORY[0x1E0C81028];
          v59 = "Assertion failed: InsertOfflineDataBatchReference(_db, ((void *)0), batchPK, offlineDataPK, (int64_t)fil"
                "eInfo.offset, (int64_t)fileInfo.length, (uint32_t)key.layer, version)";
          goto LABEL_29;
        }
        goto LABEL_30;
      }
      _Block_object_dispose(&v69, 8);

    }
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v100, 16);
    if (v22)
      continue;
    break;
  }
LABEL_20:

  v51 = *(void **)(a1 + 64);
  v52 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v53 = v51;
  v94 = 0;
  v95 = &v94;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__5;
  v98 = __Block_byref_object_dispose__5;
  v99 = 0;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  v83 = 3221225472;
  v84 = __ClearExternalDataPendingDeletion_block_invoke;
  v85 = &unk_1E1BFFB28;
  v54 = v52;
  v86 = v54;
  v55 = (uint64_t *)v53;
  v87 = v55;
  v88 = &v94;
  LOBYTE(v53) = objc_msgSend(v54, "executeStatement:statementBlock:", CFSTR("ClearExternalDataPendingDeletion"), buf);

  _Block_object_dispose(&v94, 8);
  if ((v53 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v60 = MEMORY[0x1E0C81028];
      v61 = "Assertion failed: ClearExternalDataPendingDeletion(_db, ((void *)0), externalResourceUUID)";
      goto LABEL_38;
    }
LABEL_31:
    v56 = 0;
    goto LABEL_22;
  }
LABEL_21:
  v56 = 1;
LABEL_22:
  _Block_object_dispose(&v78, 8);
  return v56;
}

uint64_t __129__GEOTileDB__addDataOnDBQueueWithData_forOfflineBatchKey_version_etag_externalResourceUUID_containedKeys_subscriptionIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a4;
  return 0;
}

uint64_t __129__GEOTileDB__addDataOnDBQueueWithData_forOfflineBatchKey_version_etag_externalResourceUUID_containedKeys_subscriptionIdentifier___block_invoke_467(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)getDataForOfflineKey:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  GEOSQLiteDB *db;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  BOOL v28;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  db = self->_db;
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke;
  v23[3] = &unk_1E1C01560;
  v23[4] = self;
  v24 = v12;
  v27 = a4;
  v28 = a5;
  v25 = v13;
  v26 = v14;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_3;
  v20[3] = &unk_1E1C00A28;
  v21 = v25;
  v22 = v26;
  v17 = v26;
  v18 = v25;
  v19 = v12;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v23, v20);

}

void __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(unsigned __int8 *)(a1 + 72);
  v16 = 0;
  objc_msgSend(v2, "_dataForOfflineKeyOnDBQueue:version:associatedWithFullyLoadedSubscription:error:", v3, v4, v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_2;
  v12[3] = &unk_1E1C01358;
  v8 = *(NSObject **)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v14 = v7;
  v15 = v9;
  v13 = v6;
  v10 = v7;
  v11 = v6;
  dispatch_async(v8, v12);

}

uint64_t __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __103__GEOTileDB_getDataForOfflineKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)dataForOfflineKey:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 error:(id *)a6
{
  id v10;
  GEOSQLiteDB *db;
  uint64_t v12;
  id v13;
  uint64_t *v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v10 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  v29 = 0;
  db = self->_db;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__GEOTileDB_dataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke;
  v18[3] = &unk_1E1C01588;
  v20 = &v30;
  v18[4] = self;
  v13 = v10;
  v21 = &v24;
  v22 = a4;
  v23 = a5;
  v19 = v13;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __83__GEOTileDB_dataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke_2;
  v17[3] = &unk_1E1C015B0;
  v17[4] = &v24;
  -[GEOSQLiteDB executeSync:errorHandler:](db, "executeSync:errorHandler:", v18, v17);
  v14 = v31;
  if (a6)
  {
    if (v31[5])
    {
      *a6 = 0;
    }
    else
    {
      *a6 = objc_retainAutorelease((id)v25[5]);
      v14 = v31;
    }
  }
  v15 = (id)v14[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __83__GEOTileDB_dataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "_dataForOfflineKeyOnDBQueue:version:associatedWithFullyLoadedSubscription:error:", v3, v5, v4, &obj);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __83__GEOTileDB_dataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_dataForOfflineKeyOnDBQueue:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  NSObject *v11;
  GEOSQLiteDB *db;
  int v13;
  void *v14;
  char DataForOfflineKeyInFullyLoadedSubscription;
  int v16;
  void *v17;
  uint64_t *v18;
  void *v19;
  NSURL *externalDataDirectory;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  GEOTileData *v26;
  id v27;
  void *v28;
  GEOSQLiteDB *v29;
  uint64_t v30;
  uint64_t v31;
  GEOSQLiteDB *v32;
  _QWORD *v33;
  GEOSQLiteDB *v34;
  _QWORD *v35;
  id *v36;
  GEOTileDB *v37;
  NSObject *v38;
  NSURL *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  GEOSQLiteDB *v47;
  uint64_t v48;
  void *v49;
  GEOSQLiteDB *v50;
  id v51;
  GEOSQLiteDB *v52;
  id v53;
  NSObject *v55;
  const char *v56;
  NSObject *v57;
  const char *v58;
  void *v59;
  GEOTileDB *v60;
  _QWORD v61[9];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[6];
  _QWORD v85[6];
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  __int128 buf;
  void *v103;
  void *v104;
  GEOSQLiteDB *v105;
  id v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;

  v7 = a5;
  v109 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v95 = -1;
  v86 = 0;
  v87 = &v86;
  v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__5;
  v90 = __Block_byref_object_dispose__5;
  v91 = 0;
  db = self->_db;
  if (v7)
  {
    v13 = objc_msgSend(v10, "layer");
    objc_msgSend(v10, "serviceKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __93__GEOTileDB__dataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke;
    v85[3] = &unk_1E1C00DE8;
    v85[4] = &v92;
    v85[5] = &v86;
    DataForOfflineKeyInFullyLoadedSubscription = GetDataForOfflineKeyInFullyLoadedSubscription(db, a6, v13, a4, v14, v85);

  }
  else
  {
    v16 = objc_msgSend(v10, "layer");
    objc_msgSend(v10, "serviceKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __93__GEOTileDB__dataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke_2;
    v84[3] = &unk_1E1C00DE8;
    v84[4] = &v92;
    v84[5] = &v86;
    DataForOfflineKeyInFullyLoadedSubscription = GetDataForOfflineKey(db, a6, v16, a4, v17, v84);

  }
  if ((DataForOfflineKeyInFullyLoadedSubscription & 1) != 0)
  {
    if (a6)
      *a6 = 0;
    v18 = v93;
    if (v93[3] != -1)
    {
      v19 = (void *)v87[5];
      if (v19)
      {
        externalDataDirectory = self->_externalDataDirectory;
        objc_msgSend(v19, "UUIDString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL URLByAppendingPathComponent:isDirectory:](externalDataDirectory, "URLByAppendingPathComponent:isDirectory:", v21, objc_msgSend(v10, "layer") == 12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "fileExistsAtPath:", v24);

        if (v25)
        {
          if (objc_msgSend(v10, "layer") == 12)
          {
            v26 = -[GEOTileData initWithFileURL:]([GEOTileData alloc], "initWithFileURL:", v22);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v22, 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
              v26 = -[GEOTileData initWithFileHandle:]([GEOTileData alloc], "initWithFileHandle:", v28);
            else
              v26 = 0;

          }
        }
        else
        {
          v26 = 0;
        }

        v27 = v10;
        v18 = v93;
      }
      else
      {
        v27 = v10;
        v26 = 0;
      }
      v80 = 0;
      v81 = &v80;
      v82 = 0x2020000000;
      v83 = -1;
      v74 = 0;
      v75 = &v74;
      v76 = 0x3032000000;
      v77 = __Block_byref_object_copy__5;
      v78 = __Block_byref_object_dispose__5;
      v79 = 0;
      v70 = 0;
      v71 = &v70;
      v72 = 0x2020000000;
      v73 = 0;
      v66 = 0;
      v67 = &v66;
      v68 = 0x2020000000;
      v69 = 0;
      v62 = 0;
      v63 = &v62;
      v64 = 0x2020000000;
      v65 = 0;
      v60 = self;
      v29 = self->_db;
      v30 = v18[3];
      v31 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __93__GEOTileDB__dataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke_3;
      v61[3] = &unk_1E1C015D8;
      v61[4] = &v80;
      v61[5] = &v74;
      v61[6] = &v70;
      v61[7] = &v66;
      v61[8] = &v62;
      v32 = v29;
      v33 = v61;
      v96 = 0;
      v97 = &v96;
      v98 = 0x3032000000;
      v99 = __Block_byref_object_copy__5;
      v100 = __Block_byref_object_dispose__5;
      v101 = 0;
      *(_QWORD *)&buf = v31;
      *((_QWORD *)&buf + 1) = 3221225472;
      v103 = __GetBatchDataForOfflineDataPK_block_invoke;
      v104 = &unk_1E1C019E8;
      v34 = v32;
      v107 = &v96;
      v108 = v30;
      v105 = v34;
      v35 = v33;
      v106 = v35;
      -[GEOSQLiteDB statementForKey:statementBlock:](v34, "statementForKey:statementBlock:", CFSTR("GetBatchDataForOfflineDataPK"), &buf);

      v10 = v27;
      v36 = a6;
      v37 = self;

      _Block_object_dispose(&v96, 8);
      if (v26)
        goto LABEL_32;
      if (!v75[5])
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          goto LABEL_52;
        LOWORD(buf) = 0;
        v55 = MEMORY[0x1E0C81028];
        v56 = "Assertion failed: batchUUID != ((void *)0)";
        goto LABEL_37;
      }
      if (v63[3] + v67[3] > (unint64_t)v71[3])
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          goto LABEL_52;
        LOWORD(buf) = 0;
        v55 = MEMORY[0x1E0C81028];
        v56 = "Assertion failed: offsetIntoBatch + sizeInBatch <= batchSize";
        goto LABEL_37;
      }
      GEOGetTileDBLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138477827;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_1885A9000, v38, OS_LOG_TYPE_DEBUG, "Extracting key %{private}@ from containing batch", (uint8_t *)&buf, 0xCu);
      }

      v39 = self->_externalDataDirectory;
      objc_msgSend((id)v75[5], "UUIDString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL URLByAppendingPathComponent:isDirectory:](v39, "URLByAppendingPathComponent:isDirectory:", v40, 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v59, v36);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
      {
        if ((objc_msgSend(v41, "seekToOffset:error:", v67[3], v36) & 1) != 0)
        {
          -[GEOTileDB extractDataForOfflineKey:fromBatchFileHandle:batchSize:sizeInBatch:externalDataDirectory:error:]((uint64_t)self, v10, v42, v71[3], v63[3], self->_externalDataDirectory, v36);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (v43)
          {
            objc_msgSend(v43, "externalResourceUUID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v45 == 0;

            if (!v46)
            {
              v47 = self->_db;
              v48 = v93[3];
              objc_msgSend(v44, "externalResourceUUID");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v47;
              v51 = v49;
              v96 = 0;
              v97 = &v96;
              v98 = 0x3032000000;
              v99 = __Block_byref_object_copy__5;
              v100 = __Block_byref_object_dispose__5;
              v101 = 0;
              *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
              *((_QWORD *)&buf + 1) = 3221225472;
              v103 = __SetOfflineDataExtUUID_block_invoke;
              v104 = &unk_1E1BFF748;
              v52 = v50;
              v107 = &v96;
              v108 = v48;
              v105 = v52;
              v53 = v51;
              v106 = v53;
              -[GEOSQLiteDB executeStatement:statementBlock:](v52, "executeStatement:statementBlock:", CFSTR("SetOfflineDataExtUUID"), &buf);

              v37 = v60;
              _Block_object_dispose(&v96, 8);

            }
            objc_msgSend(v44, "data");
            v26 = (GEOTileData *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v42, "closeAndReturnError:", v36) & 1) != 0)
            {

              if (v26)
              {
LABEL_32:
                -[GEOTileDB _setLastAccessTime:forMostRecentlyUsedSubscriptionReferencingDataRow:](v37, "_setLastAccessTime:forMostRecentlyUsedSubscriptionReferencingDataRow:", v81[3], CFAbsoluteTimeGetCurrent());
LABEL_33:
                _Block_object_dispose(&v62, 8);
                _Block_object_dispose(&v66, 8);
                _Block_object_dispose(&v70, 8);
                _Block_object_dispose(&v74, 8);

                _Block_object_dispose(&v80, 8);
                goto LABEL_34;
              }
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
              {
LABEL_52:
                v26 = 0;
                goto LABEL_33;
              }
              LOWORD(buf) = 0;
              v55 = MEMORY[0x1E0C81028];
              v56 = "Assertion failed: result != ((void *)0)";
LABEL_37:
              _os_log_fault_impl(&dword_1885A9000, v55, OS_LOG_TYPE_FAULT, v56, (uint8_t *)&buf, 2u);
              goto LABEL_52;
            }
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              LOWORD(buf) = 0;
              _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [fileHandle closeAndReturnError:errorPtr]", (uint8_t *)&buf, 2u);
            }

          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            LOWORD(buf) = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: extracted != ((void *)0)", (uint8_t *)&buf, 2u);
          }

          goto LABEL_52;
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
LABEL_45:

          goto LABEL_52;
        }
        LOWORD(buf) = 0;
        v57 = MEMORY[0x1E0C81028];
        v58 = "Assertion failed: [fileHandle seekToOffset:offsetIntoBatch error:errorPtr]";
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          goto LABEL_45;
        LOWORD(buf) = 0;
        v57 = MEMORY[0x1E0C81028];
        v58 = "Assertion failed: fileHandle != ((void *)0)";
      }
      _os_log_fault_impl(&dword_1885A9000, v57, OS_LOG_TYPE_FAULT, v58, (uint8_t *)&buf, 2u);
      goto LABEL_45;
    }
  }
  v26 = 0;
LABEL_34:
  _Block_object_dispose(&v86, 8);

  _Block_object_dispose(&v92, 8);
  return v26;
}

uint64_t __93__GEOTileDB__dataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  return 0;
}

uint64_t __93__GEOTileDB__dataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  return 0;
}

uint64_t __93__GEOTileDB__dataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v13;

  v13 = a4;
  if (((a7 | a6) & 0x8000000000000000) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a4);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a5;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a6;
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = a7;
  }

  return 0;
}

- (void)determineIfOfflineDataExistsForKey:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  GEOSQLiteDB *db;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  BOOL v28;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  db = self->_db;
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke;
  v23[3] = &unk_1E1C01560;
  v23[4] = self;
  v24 = v12;
  v27 = a4;
  v28 = a5;
  v25 = v13;
  v26 = v14;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_3;
  v20[3] = &unk_1E1C00A28;
  v21 = v25;
  v22 = v26;
  v17 = v26;
  v18 = v25;
  v19 = v12;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v23, v20);

}

void __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(unsigned __int8 *)(a1 + 72);
  v15 = 0;
  v6 = objc_msgSend(v2, "_hasDataForOfflineKeyOnDBQueue:version:associatedWithFullyLoadedSubscription:error:", v3, v4, v5, &v15);
  v7 = v15;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_2;
  v11[3] = &unk_1E1C01240;
  v8 = *(NSObject **)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v14 = v6;
  v12 = v7;
  v13 = v9;
  v10 = v7;
  dispatch_async(v8, v11);

}

uint64_t __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __117__GEOTileDB_determineIfOfflineDataExistsForKey_version_associatedWithFullyLoadedSubscription_callbackQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (BOOL)hasDataForOfflineKey:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 error:(id *)a6
{
  id v10;
  GEOSQLiteDB *db;
  uint64_t v12;
  id v13;
  uint64_t *v14;
  void *v15;
  char v16;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v10 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5;
  v29 = __Block_byref_object_dispose__5;
  v30 = 0;
  db = self->_db;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__GEOTileDB_hasDataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke;
  v19[3] = &unk_1E1C01588;
  v21 = &v31;
  v19[4] = self;
  v13 = v10;
  v22 = &v25;
  v23 = a4;
  v24 = a5;
  v20 = v13;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __86__GEOTileDB_hasDataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke_2;
  v18[3] = &unk_1E1C015B0;
  v18[4] = &v25;
  -[GEOSQLiteDB executeSync:errorHandler:](db, "executeSync:errorHandler:", v19, v18);
  v14 = v32;
  if (a6)
  {
    if (*((_BYTE *)v32 + 24) || (v15 = (void *)v26[5]) == 0)
    {
      *a6 = 0;
    }
    else
    {
      *a6 = objc_retainAutorelease(v15);
      v14 = v32;
    }
  }
  v16 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __86__GEOTileDB_hasDataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v2, "_hasDataForOfflineKeyOnDBQueue:version:associatedWithFullyLoadedSubscription:error:", v3, v5, v4, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
}

void __86__GEOTileDB_hasDataForOfflineKey_version_associatedWithFullyLoadedSubscription_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)_hasDataForOfflineKeyOnDBQueue:(id)a3 version:(unint64_t)a4 associatedWithFullyLoadedSubscription:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  NSObject *v11;
  GEOSQLiteDB *db;
  int v13;
  void *v14;
  char DataForOfflineKeyInFullyLoadedSubscription;
  NSObject *v16;
  const char *v17;
  int v18;
  void *v19;
  char DataForOfflineKey;
  BOOL v21;
  _QWORD v23[5];
  uint8_t buf[8];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v7 = a5;
  v10 = a3;
  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = -1;
  db = self->_db;
  if (v7)
  {
    v13 = objc_msgSend(v10, "layer");
    objc_msgSend(v10, "serviceKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __96__GEOTileDB__hasDataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke;
    v25[3] = &unk_1E1C01600;
    v25[4] = &v26;
    DataForOfflineKeyInFullyLoadedSubscription = GetDataForOfflineKeyInFullyLoadedSubscription(db, a6, v13, a4, v14, v25);

    if ((DataForOfflineKeyInFullyLoadedSubscription & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v16 = MEMORY[0x1E0C81028];
        v17 = "Assertion failed: GetDataForOfflineKeyInFullyLoadedSubscription(_db, errorPtr, key.layer, version, key.ser"
              "viceKey, ^BOOL(int64_t offline_data_pk, NSUUID *externalDataUUID) { offlineDataPK = offline_data_pk; return __objc_no; })";
LABEL_11:
        _os_log_fault_impl(&dword_1885A9000, v16, OS_LOG_TYPE_FAULT, v17, buf, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v18 = objc_msgSend(v10, "layer");
    objc_msgSend(v10, "serviceKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __96__GEOTileDB__hasDataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke_470;
    v23[3] = &unk_1E1C01600;
    v23[4] = &v26;
    DataForOfflineKey = GetDataForOfflineKey(db, a6, v18, a4, v19, v23);

    if ((DataForOfflineKey & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v16 = MEMORY[0x1E0C81028];
        v17 = "Assertion failed: GetDataForOfflineKey(_db, errorPtr, key.layer, version, key.serviceKey, ^BOOL(int64_t of"
              "fline_data_pk, NSUUID *externalDataUUID) { offlineDataPK = offline_data_pk; return __objc_no; })";
        goto LABEL_11;
      }
LABEL_9:
      v21 = 0;
      goto LABEL_7;
    }
  }
  v21 = v27[3] != -1;
LABEL_7:
  _Block_object_dispose(&v26, 8);

  return v21;
}

uint64_t __96__GEOTileDB__hasDataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

uint64_t __96__GEOTileDB__hasDataForOfflineKeyOnDBQueue_version_associatedWithFullyLoadedSubscription_error___block_invoke_470(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 0;
}

- (void)_setLastAccessTime:(double)a3 forMostRecentlyUsedSubscriptionReferencingDataRow:(int64_t)a4
{
  GEOSQLiteDB *db;
  uint64_t v8;
  GEOSQLiteDB *v9;
  uint64_t *v10;
  GEOSQLiteDB *v11;
  uint64_t *v12;
  uint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  GEOSQLiteDB *v16;
  GEOSQLiteDB *v17;
  NSObject *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, unint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  __int128 buf;
  void *v41;
  void *v42;
  GEOSQLiteDB *v43;
  uint64_t *v44;
  uint64_t *v45;
  int64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = -1;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  db = self->_db;
  v8 = MEMORY[0x1E0C809B0];
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __82__GEOTileDB__setLastAccessTime_forMostRecentlyUsedSubscriptionReferencingDataRow___block_invoke;
  v23 = &unk_1E1C01628;
  v24 = &v30;
  v25 = &v26;
  v9 = db;
  v10 = &v20;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__5;
  v38 = __Block_byref_object_dispose__5;
  v39 = 0;
  *(_QWORD *)&buf = v8;
  *((_QWORD *)&buf + 1) = 3221225472;
  v41 = __FetchSubscriptionsReferencingData_block_invoke;
  v42 = &unk_1E1C019E8;
  v11 = v9;
  v45 = &v34;
  v46 = a4;
  v43 = v11;
  v12 = v10;
  v44 = v12;
  -[GEOSQLiteDB statementForKey:statementBlock:](v11, "statementForKey:statementBlock:", CFSTR("FetchSubscriptionsReferencingData"), &buf, v20, v21, v22, v23, v24, v25);

  _Block_object_dispose(&v34, 8);
  v13 = (uint64_t *)v31[3];
  if (v13 != (uint64_t *)-1)
  {
    v14 = (unint64_t)(*MEMORY[0x1E0C9ADF8] + a3);
    v15 = v27[3];
    if (v14 < v15)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: newTimestamp >= mostRecentlyUsedSubscriptionTimestamp", (uint8_t *)&buf, 2u);
      }
    }
    else if (v15 && self->_timestampDeltaWriteThreshold >= (double)(v14 - v15))
    {
      GEOGetTileDBLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = v14 - v27[3];
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, "Subscription last-access timestamp has not changed sufficiently (only %llu). Not writing.", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {
      v16 = self->_db;
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__5;
      v38 = __Block_byref_object_dispose__5;
      v39 = 0;
      *(_QWORD *)&buf = v8;
      *((_QWORD *)&buf + 1) = 3221225472;
      v41 = __SetSubscriptionLastAccessTime_block_invoke;
      v42 = &unk_1E1C01AB0;
      v17 = v16;
      v43 = v17;
      v44 = &v34;
      v45 = v13;
      v46 = v14;
      -[GEOSQLiteDB executeStatement:statementBlock:](v17, "executeStatement:statementBlock:", CFSTR("SetSubscriptionLastAccessTime"), &buf);

      _Block_object_dispose(&v34, 8);
    }
  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

uint64_t __82__GEOTileDB__setLastAccessTime_forMostRecentlyUsedSubscriptionReferencingDataRow___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  BOOL v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_QWORD *)(v3 + 24) == -1
    || ((v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) != 0 ? (v5 = v4 >= a3) : (v5 = 0), !v5))
  {
    *(_QWORD *)(v3 + 24) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  return 1;
}

- (void)getOfflineKeysForLayer:(unsigned int)a3 version:(unint64_t)a4 callbackQueue:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  GEOSQLiteDB *db;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  unint64_t v22;
  unsigned int v23;

  v10 = a5;
  v11 = a6;
  db = self->_db;
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke;
  v19[3] = &unk_1E1C01650;
  v23 = a3;
  v19[4] = self;
  v22 = a4;
  v20 = v10;
  v21 = v11;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke_3;
  v16[3] = &unk_1E1C00A28;
  v17 = v20;
  v18 = v21;
  v14 = v21;
  v15 = v20;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v19, v16);

}

void __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned int *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 56);
  v15 = 0;
  objc_msgSend(v2, "_getOfflineKeysForLayerOnDBQueue:version:error:", v3, v4, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke_2;
  v11[3] = &unk_1E1C01358;
  v7 = *(NSObject **)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __67__GEOTileDB_getOfflineKeysForLayer_version_callbackQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)_getOfflineKeysForLayerOnDBQueue:(unsigned int)a3 version:(unint64_t)a4 error:(id *)a5
{
  GEOSQLiteDB *db;
  uint64_t v10;
  GEOSQLiteDB *v11;
  _QWORD *v12;
  GEOSQLiteDB *v13;
  _QWORD *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  unsigned int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[4];
  GEOSQLiteDB *v28;
  id v29;
  uint64_t *v30;
  unint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  db = self->_db;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__GEOTileDB__getOfflineKeysForLayerOnDBQueue_version_error___block_invoke;
  v19[3] = &unk_1E1C01678;
  v20 = a3;
  v19[4] = &v21;
  v11 = db;
  v12 = v19;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5;
  v37 = __Block_byref_object_dispose__5;
  v38 = 0;
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __GetAvailableOfflineKeys_block_invoke;
  v27[3] = &unk_1E1C01A10;
  v13 = v11;
  v32 = a3;
  v28 = v13;
  v30 = &v33;
  v31 = a4;
  v14 = v12;
  v29 = v14;
  v15 = -[GEOSQLiteDB statementForKey:statementBlock:](v13, "statementForKey:statementBlock:", CFSTR("GetAvailableOfflineKeys"), v27);
  if (a5)
  {
    v16 = (void *)v34[5];
    if (v16)
      *a5 = objc_retainAutorelease(v16);
  }

  _Block_object_dispose(&v33, 8);
  if (v15)
    v17 = (id)v22[5];
  else
    v17 = 0;
  _Block_object_dispose(&v21, 8);

  return v17;
}

uint64_t __60__GEOTileDB__getOfflineKeysForLayerOnDBQueue_version_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOOfflineDataKey *v4;

  v3 = a2;
  v4 = -[GEOOfflineDataKey initWithLayer:serviceKey:]([GEOOfflineDataKey alloc], "initWithLayer:serviceKey:", *(unsigned int *)(a1 + 40), v3);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);
  return 1;
}

- (void)determineIfOfflineDataBatchExistsForKey:(id)a3 version:(unint64_t)a4 associatingWithSubscriptionIdentifier:(id)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  GEOSQLiteDB *db;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  db = self->_db;
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke;
  v25[3] = &unk_1E1C016F0;
  v25[4] = self;
  v26 = v12;
  v30 = a4;
  v27 = v13;
  v28 = v14;
  v29 = v15;
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_4;
  v22[3] = &unk_1E1C00A28;
  v23 = v28;
  v24 = v29;
  v18 = v29;
  v19 = v28;
  v20 = v13;
  v21 = v12;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v25, v22);

}

void __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -1;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__5;
  v17[4] = __Block_byref_object_dispose__5;
  v18 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = -1;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(*(id *)(a1 + 40), "layer");
  v4 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 40), "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_2;
  v12[3] = &unk_1E1C016A0;
  v12[4] = &v19;
  v12[5] = v17;
  v12[6] = &v13;
  CheckExistenceOfOfflineBatchKey(v2, v3, v4, v5, v12);

  if (v20[3] != -1 && *(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_markDataAtRow:associatedWithSubscriptionIdentifier:", v14[3]);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_3;
  v8[3] = &unk_1E1C016C8;
  v7 = *(NSObject **)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = &v19;
  v11 = v17;
  dispatch_async(v7, v8);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(&v19, 8);
}

uint64_t __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_2(_QWORD *a1, uint64_t a2, id obj, uint64_t a4)
{
  id v7;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
  v7 = obj;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;

  return 0;
}

uint64_t __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != -1, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 0);
}

void __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_5;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __122__GEOTileDB_determineIfOfflineDataBatchExistsForKey_version_associatingWithSubscriptionIdentifier_callbackQueue_callback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)calculateSizeOfAllOfflineDataWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  GEOSQLiteDB *db;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke;
  v15[3] = &unk_1E1BFFC90;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke_3;
  v12[3] = &unk_1E1C00A28;
  v13 = v16;
  v14 = v17;
  v10 = v17;
  v11 = v16;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v15, v12);

}

void __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v3 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __CalculateTotalOfflineDataSize_block_invoke;
  v15[3] = &unk_1E1C019C0;
  v17 = &v19;
  v4 = v2;
  v16 = v4;
  v18 = &v23;
  objc_msgSend(v4, "statementForKey:statementBlock:", CFSTR("CalculateTotalOfflineDataSize"), v15);
  v5 = (void *)v24[5];
  if (v5)
    v6 = objc_retainAutorelease(v5);
  v7 = v20[3];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  v8 = v5;
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke_2;
  v11[3] = &unk_1E1C01718;
  v9 = *(NSObject **)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v14 = v7;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, v11);

}

uint64_t __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __69__GEOTileDB_calculateSizeOfAllOfflineDataWithCallbackQueue_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)_deleteOfflineDataNotMatchingVersions:(id)a3 orVersions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  GEOSQLiteDB *db;
  uint64_t v30;
  id obj;
  void *v32;
  _QWORD v33[8];
  int v34;
  uint8_t v35[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[8];
  uint8_t *v41;
  uint64_t v42;
  char v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v32 = v6;
  v8 = objc_msgSend(v6, "count");
  if (v8 + objc_msgSend(v7, "count"))
  {
    GEOGetTileDBLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Deleting offline data not matching active or latest versions", buf, 2u);
    }

    v10 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v6, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v13);

    }
    *(_QWORD *)buf = 0;
    v41 = buf;
    v42 = 0x2020000000;
    v43 = 0;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v12;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v37;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v16);
          v18 = objc_msgSend(v17, "unsignedIntValue");
          objc_msgSend(v32, "objectForKeyedSubscript:", v17);
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v17);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          if (v19 | v20)
          {
            v22 = v20 == 0;
            if (v19)
              v23 = (void *)v19;
            else
              v23 = (void *)v20;
            v24 = v23;

            if (v22)
              v25 = (void *)v19;
            else
              v25 = v21;
            v26 = v25;

            v27 = objc_msgSend(v24, "unsignedLongLongValue");
            v28 = objc_msgSend(v26, "unsignedLongLongValue");
            db = self->_db;
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __62__GEOTileDB__deleteOfflineDataNotMatchingVersions_orVersions___block_invoke;
            v33[3] = &unk_1E1C01768;
            v34 = v18;
            v33[6] = v27;
            v33[7] = v28;
            v33[4] = self;
            v33[5] = buf;
            -[GEOSQLiteDB executeInTransaction:](db, "executeInTransaction:", v33);

          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v35 = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: versionNumber != nil || otherVersionNumber != nil", v35, 2u);
          }
          ++v16;
        }
        while (v14 != v16);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        v14 = v30;
      }
      while (v30);
    }

    if (v41[24])
      -[GEOTileDB _cleanUpDeletedExternalDataIfNecessary](self, "_cleanUpDeletedExternalDataIfNecessary");
    _Block_object_dispose(buf, 8);

  }
}

uint64_t __62__GEOTileDB__deleteOfflineDataNotMatchingVersions_orVersions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  NSObject *v8;
  uint64_t *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  NSObject *v18;
  int v19;
  id v20;
  NSObject *v21;
  int v22;
  id v23;
  NSObject *v24;
  int v25;
  id v26;
  NSObject *v27;
  int v28;
  id v29;
  NSObject *v30;
  int v31;
  id v32;
  NSObject *v33;
  int v34;
  id v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v42;
  const char *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[5];
  __int128 v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _BYTE buf[24];
  void *v64;
  NSObject *v65;
  uint64_t *v66;
  __int128 v67;
  int v68;
  int v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D764E2C]();
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_DWORD *)(a1 + 64);
  v5 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __62__GEOTileDB__deleteOfflineDataNotMatchingVersions_orVersions___block_invoke_2;
  v51[3] = &unk_1E1C01740;
  v52 = *(_OWORD *)(a1 + 48);
  v51[4] = &v53;
  v6 = v3;
  v7 = v51;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__5;
  v61 = __Block_byref_object_dispose__5;
  v62 = 0;
  *(_QWORD *)buf = v5;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __GetAllOfflineDataBatchVersionsForLayer_block_invoke;
  v64 = &unk_1E1C01BC8;
  v8 = v6;
  DWORD2(v67) = v4;
  v65 = v8;
  *(_QWORD *)&v67 = &v57;
  v9 = v7;
  v66 = v9;
  LOBYTE(v7) = -[NSObject statementForKey:statementBlock:](v8, "statementForKey:statementBlock:", CFSTR("GetAllOfflineDataBatchVersionsForLayer"), buf);

  _Block_object_dispose(&v57, 8);
  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v42 = MEMORY[0x1E0C81028];
    v43 = "Assertion failed: GetAllOfflineDataBatchVersionsForLayer(_db, ((void *)0), layer, ^BOOL(uint64_t version) { if"
          " (version != versionToPreserve && version != otherVersionToPreserve) { hasVersionToDelete = __objc_yes; } retu"
          "rn !hasVersionToDelete; })";
    goto LABEL_33;
  }
  v10 = *((unsigned __int8 *)v54 + 24);
  GEOGetTileDBLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = *(unsigned int *)(a1 + 64);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2050;
      v64 = v15;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "Deleting offline data for layer %llu not matching versions %{public}llu/%{public}llu", buf, 0x20u);
    }

    v16 = *(_DWORD *)(a1 + 64);
    v44 = *(_OWORD *)(a1 + 48);
    v17 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__5;
    v61 = __Block_byref_object_dispose__5;
    v62 = 0;
    *(_QWORD *)buf = v5;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __MarkForDeletionExternalDataForOfflineBatchesNotMatchingVersions_block_invoke;
    v64 = &unk_1E1C01A88;
    v18 = v17;
    v68 = v16;
    v65 = v18;
    v66 = &v57;
    v67 = v44;
    LOBYTE(v16) = -[NSObject executeStatement:statementBlock:](v18, "executeStatement:statementBlock:", CFSTR("MarkForDeletionExternalDataForOfflineBatchesNotMatchingVersions"), buf);

    _Block_object_dispose(&v57, 8);
    if ((v16 & 1) != 0)
    {
      v19 = *(_DWORD *)(a1 + 64);
      v45 = *(_OWORD *)(a1 + 48);
      v20 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
      v57 = 0;
      v58 = &v57;
      v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__5;
      v61 = __Block_byref_object_dispose__5;
      v62 = 0;
      *(_QWORD *)buf = v5;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __MarkForDeletionExternalDataForOfflineDataNotMatchingVersions_block_invoke;
      v64 = &unk_1E1C01A88;
      v21 = v20;
      v68 = v19;
      v65 = v21;
      v66 = &v57;
      v67 = v45;
      LOBYTE(v19) = -[NSObject executeStatement:statementBlock:](v21, "executeStatement:statementBlock:", CFSTR("MarkForDeletionExternalDataForOfflineDataNotMatchingVersions"), buf);

      _Block_object_dispose(&v57, 8);
      if ((v19 & 1) != 0)
      {
        v22 = *(_DWORD *)(a1 + 64);
        v46 = *(_OWORD *)(a1 + 48);
        v23 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
        v57 = 0;
        v58 = &v57;
        v59 = 0x3032000000;
        v60 = __Block_byref_object_copy__5;
        v61 = __Block_byref_object_dispose__5;
        v62 = 0;
        *(_QWORD *)buf = v5;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __DeleteOfflineDataBatchRefsNotMatchingVersions_block_invoke;
        v64 = &unk_1E1C01A88;
        v24 = v23;
        v68 = v22;
        v65 = v24;
        v66 = &v57;
        v67 = v46;
        LOBYTE(v22) = -[NSObject executeStatement:statementBlock:](v24, "executeStatement:statementBlock:", CFSTR("DeleteOfflineDataBatchRefsNotMatchingVersions"), buf);

        _Block_object_dispose(&v57, 8);
        if ((v22 & 1) != 0)
        {
          v25 = *(_DWORD *)(a1 + 64);
          v47 = *(_OWORD *)(a1 + 48);
          v26 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
          v57 = 0;
          v58 = &v57;
          v59 = 0x3032000000;
          v60 = __Block_byref_object_copy__5;
          v61 = __Block_byref_object_dispose__5;
          v62 = 0;
          *(_QWORD *)buf = v5;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __DeleteOfflineDataNotMatchingVersions_block_invoke;
          v64 = &unk_1E1C01A88;
          v27 = v26;
          v68 = v25;
          v65 = v27;
          v66 = &v57;
          v67 = v47;
          LOBYTE(v25) = -[NSObject executeStatement:statementBlock:](v27, "executeStatement:statementBlock:", CFSTR("DeleteOfflineDataNotMatchingVersions"), buf);

          _Block_object_dispose(&v57, 8);
          if ((v25 & 1) != 0)
          {
            v28 = *(_DWORD *)(a1 + 64);
            v48 = *(_OWORD *)(a1 + 48);
            v29 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
            v57 = 0;
            v58 = &v57;
            v59 = 0x3032000000;
            v60 = __Block_byref_object_copy__5;
            v61 = __Block_byref_object_dispose__5;
            v62 = 0;
            *(_QWORD *)buf = v5;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __DeleteDataForOfflineBatchesNotMatchingVersions_block_invoke;
            v64 = &unk_1E1C01A88;
            v30 = v29;
            v68 = v28;
            v65 = v30;
            v66 = &v57;
            v67 = v48;
            LOBYTE(v28) = -[NSObject executeStatement:statementBlock:](v30, "executeStatement:statementBlock:", CFSTR("DeleteDataForOfflineBatchesNotMatchingVersions"), buf);

            _Block_object_dispose(&v57, 8);
            if ((v28 & 1) != 0)
            {
              v31 = *(_DWORD *)(a1 + 64);
              v49 = *(_OWORD *)(a1 + 48);
              v32 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
              v57 = 0;
              v58 = &v57;
              v59 = 0x3032000000;
              v60 = __Block_byref_object_copy__5;
              v61 = __Block_byref_object_dispose__5;
              v62 = 0;
              *(_QWORD *)buf = v5;
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __DeleteOfflineDataBatchNotMatchingVersions_block_invoke;
              v64 = &unk_1E1C01A88;
              v33 = v32;
              v68 = v31;
              v65 = v33;
              v66 = &v57;
              v67 = v49;
              LOBYTE(v31) = -[NSObject executeStatement:statementBlock:](v33, "executeStatement:statementBlock:", CFSTR("DeleteOfflineDataBatchNotMatchingVersions"), buf);

              _Block_object_dispose(&v57, 8);
              if ((v31 & 1) != 0)
              {
                v34 = *(_DWORD *)(a1 + 64);
                v50 = *(_OWORD *)(a1 + 48);
                v35 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
                v57 = 0;
                v58 = &v57;
                v59 = 0x3032000000;
                v60 = __Block_byref_object_copy__5;
                v61 = __Block_byref_object_dispose__5;
                v62 = 0;
                *(_QWORD *)buf = v5;
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = __ClearSubscriptionDataStatesNotMatchingVersions_block_invoke;
                v64 = &unk_1E1C01EF8;
                v12 = v35;
                v65 = v12;
                v66 = &v57;
                v68 = 1024;
                v69 = v34;
                v67 = v50;
                LOBYTE(v34) = -[NSObject executeStatement:statementBlock:](v12, "executeStatement:statementBlock:", CFSTR("ClearSubscriptionDataStatesNotMatchingVersions"), buf);

                _Block_object_dispose(&v57, 8);
                if ((v34 & 1) != 0)
                {
                  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                  v37 = 1;
                  *(_BYTE *)(v36 + 24) = 1;
                  goto LABEL_16;
                }
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  v42 = MEMORY[0x1E0C81028];
                  v43 = "Assertion failed: ClearSubscriptionDataStatesNotMatchingVersions(_db, ((void *)0), (uint32_t)GEO"
                        "MapDataSubscriptionDataTypeOffline, layer, versionToPreserve, otherVersionToPreserve)";
                  goto LABEL_33;
                }
LABEL_34:
                v37 = 0;
                LODWORD(v12) = 0;
                goto LABEL_16;
              }
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                goto LABEL_34;
              *(_WORD *)buf = 0;
              v42 = MEMORY[0x1E0C81028];
              v43 = "Assertion failed: DeleteOfflineDataBatchNotMatchingVersions(_db, ((void *)0), layer, versionToPreser"
                    "ve, otherVersionToPreserve)";
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                goto LABEL_34;
              *(_WORD *)buf = 0;
              v42 = MEMORY[0x1E0C81028];
              v43 = "Assertion failed: DeleteDataForOfflineBatchesNotMatchingVersions(_db, ((void *)0), layer, versionToP"
                    "reserve, otherVersionToPreserve)";
            }
          }
          else
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
              goto LABEL_34;
            *(_WORD *)buf = 0;
            v42 = MEMORY[0x1E0C81028];
            v43 = "Assertion failed: DeleteOfflineDataNotMatchingVersions(_db, ((void *)0), layer, versionToPreserve, oth"
                  "erVersionToPreserve)";
          }
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            goto LABEL_34;
          *(_WORD *)buf = 0;
          v42 = MEMORY[0x1E0C81028];
          v43 = "Assertion failed: DeleteOfflineDataBatchRefsNotMatchingVersions(_db, ((void *)0), layer, versionToPreser"
                "ve, otherVersionToPreserve)";
        }
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          goto LABEL_34;
        *(_WORD *)buf = 0;
        v42 = MEMORY[0x1E0C81028];
        v43 = "Assertion failed: MarkForDeletionExternalDataForOfflineDataNotMatchingVersions(_db, ((void *)0), layer, ve"
              "rsionToPreserve, otherVersionToPreserve)";
      }
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v42 = MEMORY[0x1E0C81028];
      v43 = "Assertion failed: MarkForDeletionExternalDataForOfflineBatchesNotMatchingVersions(_db, ((void *)0), layer, v"
            "ersionToPreserve, otherVersionToPreserve)";
    }
LABEL_33:
    _os_log_fault_impl(&dword_1885A9000, v42, OS_LOG_TYPE_FAULT, v43, buf, 2u);
    goto LABEL_34;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v38 = *(unsigned int *)(a1 + 64);
    v39 = *(_QWORD *)(a1 + 48);
    v40 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = v39;
    *(_WORD *)&buf[22] = 2050;
    v64 = v40;
    _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "Database contains no data for layer %llu not matching versions %{public}llu/%{public}llu. Nothing to delete.", buf, 0x20u);
  }

  v37 = 0;
  LODWORD(v12) = 1;
LABEL_16:
  _Block_object_dispose(&v53, 8);
  objc_autoreleasePoolPop(v2);
  return (v37 | v12) & 1;
}

BOOL __62__GEOTileDB__deleteOfflineDataNotMatchingVersions_orVersions___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  if (a1[5] != a2 && a1[6] != a2)
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  return *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) == 0;
}

- (void)offlineDataConfiguration:(id)a3 didChangeActiveVersions:(id)a4
{
  id v6;
  id v7;
  GEOSQLiteDB *db;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  db = self->_db;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__GEOTileDB_offlineDataConfiguration_didChangeActiveVersions___block_invoke;
  v11[3] = &unk_1E1C01790;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[GEOSQLiteDB executeFromIsolationQueue:](db, "executeFromIsolationQueue:", v11);

}

void __62__GEOTileDB_offlineDataConfiguration_didChangeActiveVersions___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "latestAvailableVersions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_deleteOfflineDataNotMatchingVersions:orVersions:", v2, v3);

}

- (void)offlineDataConfiguration:(id)a3 didChangeLatestAvailableVersions:(id)a4
{
  id v6;
  id v7;
  GEOSQLiteDB *db;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  db = self->_db;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__GEOTileDB_offlineDataConfiguration_didChangeLatestAvailableVersions___block_invoke;
  v11[3] = &unk_1E1C01790;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[GEOSQLiteDB executeFromIsolationQueue:](db, "executeFromIsolationQueue:", v11);

}

void __71__GEOTileDB_offlineDataConfiguration_didChangeLatestAvailableVersions___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activeVersions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_deleteOfflineDataNotMatchingVersions:orVersions:", v3, *(_QWORD *)(a1 + 48));

}

- (void)offlineDataConfiguration:(id)a3 didChangeRegulatoryRegionID:(unsigned int)a4
{
  GEOSQLiteDB *db;
  _QWORD v5[5];

  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__GEOTileDB_offlineDataConfiguration_didChangeRegulatoryRegionID___block_invoke;
  v5[3] = &unk_1E1BFF6F8;
  v5[4] = self;
  -[GEOSQLiteDB executeFromIsolationQueue:](db, "executeFromIsolationQueue:", v5, *(_QWORD *)&a4);
}

uint64_t __66__GEOTileDB_offlineDataConfiguration_didChangeRegulatoryRegionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_expireOfflineSubscriptionsForRegulatoryRegionIfNecessary");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDataConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideLocale, 0);
  objc_storeStrong(&self->_tileElevationConfigListener, 0);
  objc_storeStrong(&self->_timestampDeltaWriteThresholdConfigListener, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_createdExternalDataDirectoryIsolater, 0);
  objc_storeStrong((id *)&self->_externalDataDirectory, 0);
  objc_storeStrong((id *)&self->_dbDirectory, 0);
  objc_storeStrong((id *)&self->_editionsMap, 0);
  objc_storeStrong((id *)&self->_devicePostureRegion, 0);
  objc_storeStrong((id *)&self->_devicePostureCountry, 0);
  objc_storeStrong((id *)&self->_devicePostureLocale, 0);
  objc_storeStrong((id *)&self->_infrequentlyChangingMetadataIsolater, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_countryConfiguration, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)storeShiftResponse:(id)a3
{
  -[GEOTileDB storeShiftResponse:forSubscription:](self, "storeShiftResponse:forSubscription:", a3, 0);
}

- (void)storeShiftResponse:(id)a3 forSubscription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  unint64_t v11;
  GEOSQLiteDB *db;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = (unint64_t)v10;

    db = self->_db;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__GEOTileDB_GEOLocationShifterPersistence__storeShiftResponse_forSubscription___block_invoke;
    v14[3] = &unk_1E1C017E0;
    v14[4] = self;
    v15 = v6;
    v16 = v8;
    v18 = v11;
    v17 = v7;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v14);

  }
  else
  {
    GEOGetTileDBLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "unable to store response, data length == 0", buf, 2u);
    }

  }
}

void __79__GEOTileDB_GEOLocationShifterPersistence__storeShiftResponse_forSubscription___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__GEOTileDB_GEOLocationShifterPersistence__storeShiftResponse_forSubscription___block_invoke_2;
  v8[3] = &unk_1E1C017B8;
  v8[4] = v2;
  v9 = v3;
  v5 = *(id *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v10 = v5;
  v12 = v6;
  v11 = v7;
  objc_msgSend(v4, "executeInTransaction:", v8);

}

uint64_t __79__GEOTileDB_GEOLocationShifterPersistence__storeShiftResponse_forSubscription___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t result;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(double *, uint64_t);
  void *v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "originalCoordinate");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "originalCoordinate");
  v6 = v5;
  v7 = v2;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__5;
  v40 = __Block_byref_object_dispose__5;
  v41 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __RemoveExactShiftEntry_block_invoke;
  v28 = &unk_1E1C01AB0;
  v9 = v7;
  v29 = v9;
  v30 = &v36;
  v31 = v4;
  v32 = v6;
  objc_msgSend(v9, "executeStatement:statementBlock:", CFSTR("RemoveExactShiftEntry"), &v25);

  _Block_object_dispose(&v36, 8);
  result = InsertData(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 48), 0, objc_msgSend(*(id *)(a1 + 48), "length"), 0);
  if ((_DWORD)result)
  {
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lastInsertRowID");
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "originalCoordinate");
    v15 = v14;
    objc_msgSend(*(id *)(a1 + 40), "originalCoordinate");
    v17 = v16;
    objc_msgSend(*(id *)(a1 + 40), "radius");
    v19 = v18;
    v20 = v12;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__5;
    v40 = __Block_byref_object_dispose__5;
    v41 = 0;
    v25 = v8;
    v26 = 3221225472;
    v27 = __AddShiftEntry_block_invoke;
    v28 = &unk_1E1C01B00;
    v21 = v20;
    v30 = &v36;
    v31 = v13;
    v29 = v21;
    v32 = v15;
    v33 = v17;
    v34 = v19;
    v35 = v11;
    v22 = objc_msgSend(v21, "executeStatement:statementBlock:", CFSTR("AddShiftEntry"), &v25);

    _Block_object_dispose(&v36, 8);
    if (v22)
    {
      v23 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 56), "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_markDataAtRow:associatedWithSubscriptionIdentifier:", v11, v24);

      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)findShiftResponseForCoordinate:(id)a3 reduceRadius:(double)a4 queue:(id)a5 completion:(id)a6
{
  double var1;
  double var0;
  NSObject *v11;
  void *v12;
  void *v13;
  GEOSQLiteDB *db;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  NSObject *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  _QWORD block[4];
  NSObject *v27;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v12 = (void *)objc_msgSend(a6, "copy");
  v13 = v12;
  db = self->_db;
  if (db)
  {
    v15 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_2;
    v20[3] = &unk_1E1C01858;
    v20[4] = self;
    v23 = var0;
    v24 = var1;
    v25 = a4;
    v21 = v11;
    v22 = v13;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_5;
    v17[3] = &unk_1E1C00A28;
    v18 = v21;
    v19 = v22;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v20, v17);

    v16 = v21;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke;
    block[3] = &unk_1E1C01F48;
    v27 = v12;
    dispatch_async(v11, block);
    v16 = v27;
  }

}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  NSObject *v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[7];
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = -1;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__5;
  v21[4] = __Block_byref_object_dispose__5;
  v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__5;
  v19[4] = __Block_byref_object_dispose__5;
  v20 = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_3;
  v18[3] = &unk_1E1C01808;
  v18[4] = v23;
  v18[5] = v21;
  v18[6] = v19;
  v12 = *(_OWORD *)(a1 + 56);
  v5 = v2;
  v6 = v18;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v35 = 0;
  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __FindShiftEntry_block_invoke;
  v24[3] = &unk_1E1C01F20;
  v7 = v5;
  v25 = v7;
  v27 = &v30;
  v28 = v12;
  v29 = v3;
  v8 = v6;
  v26 = v8;
  objc_msgSend(v7, "statementForKey:statementBlock:", CFSTR("FindShiftEntry"), v24);
  v9 = (void *)v31[5];
  if (v9)
    v10 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v30, 8);
  objc_storeStrong(&v20, v9);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_4;
  block[3] = &unk_1E1C01830;
  v11 = *(NSObject **)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = v21;
  v16 = v23;
  v17 = v19;
  dispatch_async(v11, block);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;

  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v6 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v6 + 40);
  v7 = (id *)(v6 + 40);
  obj = v8;
  v9 = v5;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &obj);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -17, CFSTR("empty blob"));
    v11 = 0;
    obj = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_storeStrong(v7, obj);
  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  return 0;
}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
}

void __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_6;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_reduceRadius_queue_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, -1, *(_QWORD *)(a1 + 32));
}

- (void)findShiftResponseForCoordinate:(id)a3 withinRadius:(double)a4 queue:(id)a5 completion:(id)a6
{
  double var1;
  double var0;
  NSObject *v11;
  void *v12;
  void *v13;
  GEOSQLiteDB *db;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  NSObject *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  _QWORD block[4];
  NSObject *v27;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v12 = (void *)objc_msgSend(a6, "copy");
  v13 = v12;
  db = self->_db;
  if (db)
  {
    v15 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_2;
    v20[3] = &unk_1E1C01858;
    v20[4] = self;
    v23 = var0;
    v24 = var1;
    v25 = a4;
    v21 = v11;
    v22 = v13;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_5;
    v17[3] = &unk_1E1C00A28;
    v18 = v21;
    v19 = v22;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v20, v17);

    v16 = v21;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke;
    block[3] = &unk_1E1C01F48;
    v27 = v12;
    dispatch_async(v11, block);
    v16 = v27;
  }

}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  NSObject *v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[7];
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = -1;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__5;
  v21[4] = __Block_byref_object_dispose__5;
  v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__5;
  v19[4] = __Block_byref_object_dispose__5;
  v20 = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_3;
  v18[3] = &unk_1E1C01808;
  v18[4] = v23;
  v18[5] = v21;
  v18[6] = v19;
  v12 = *(_OWORD *)(a1 + 56);
  v5 = v2;
  v6 = v18;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v35 = 0;
  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __FindShiftEntryWithin_block_invoke;
  v24[3] = &unk_1E1C01F20;
  v7 = v5;
  v25 = v7;
  v27 = &v30;
  v28 = v12;
  v29 = v3;
  v8 = v6;
  v26 = v8;
  objc_msgSend(v7, "statementForKey:statementBlock:", CFSTR("FindShiftEntryWithin"), v24);
  v9 = (void *)v31[5];
  if (v9)
    v10 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v30, 8);
  objc_storeStrong(&v20, v9);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_4;
  block[3] = &unk_1E1C01830;
  v11 = *(NSObject **)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = v21;
  v16 = v23;
  v17 = v19;
  dispatch_async(v11, block);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;

  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v6 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v6 + 40);
  v7 = (id *)(v6 + 40);
  obj = v8;
  v9 = v5;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &obj);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -17, CFSTR("empty blob"));
    v11 = 0;
    obj = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_storeStrong(v7, obj);
  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  return 0;
}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
}

void __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_6;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __105__GEOTileDB_GEOLocationShifterPersistence__findShiftResponseForCoordinate_withinRadius_queue_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, -1, *(_QWORD *)(a1 + 32));
}

- (void)linkShiftResponse:(int64_t)a3 toSubscription:(id)a4
{
  id v6;
  GEOSQLiteDB *db;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__GEOTileDB_GEOLocationShifterPersistence__linkShiftResponse_toSubscription___block_invoke;
  v9[3] = &unk_1E1C01420;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v9);

}

void __77__GEOTileDB_GEOLocationShifterPersistence__linkShiftResponse_toSubscription___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_markDataAtRow:associatedWithSubscriptionIdentifier:", v2, v3);

}

- (void)pruneShiftEntries
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -GEOConfigGetDouble(GeoServicesConfig_LocationShiftMaxCacheAgeSeconds, (uint64_t)off_1EDF4D188));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOTileDB pruneShiftEntriesOlderThan:maximumEntriesToKeep:](self, "pruneShiftEntriesOlderThan:maximumEntriesToKeep:", v3, GEOConfigGetUInteger(GeoServicesConfig_LocationShiftMaxCacheCount, (uint64_t)off_1EDF4D198));

}

- (void)pruneShiftEntriesOlderThan:(id)a3 maximumEntriesToKeep:(int)a4
{
  id v6;
  GEOSQLiteDB *db;
  id v8;
  _QWORD v9[5];
  id v10;
  int v11;

  v6 = a3;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__GEOTileDB_GEOLocationShifterPersistence__pruneShiftEntriesOlderThan_maximumEntriesToKeep___block_invoke;
  v9[3] = &unk_1E1BFFBA0;
  v11 = a4;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v9);

}

void __92__GEOTileDB_GEOLocationShifterPersistence__pruneShiftEntriesOlderThan_maximumEntriesToKeep___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  double v13;
  uint64_t v14;
  double v15;
  unint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  __int128 buf;
  void *v30;
  void *v31;
  id v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 48);
  v3 = MEMORY[0x1E0C809B0];
  if (v2 >= 1)
  {
    if (v2 >= 0x2710)
      v4 = 10000;
    else
      v4 = *(_DWORD *)(a1 + 48);
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__5;
    v27 = __Block_byref_object_dispose__5;
    v28 = 0;
    *(_QWORD *)&buf = v3;
    *((_QWORD *)&buf + 1) = 3221225472;
    v30 = __PruneCachedShiftEntriesByCount_block_invoke;
    v31 = &unk_1E1C01BA0;
    v6 = v5;
    LODWORD(v34) = v4;
    v32 = v6;
    v33 = &v23;
    objc_msgSend(v6, "executeStatement:statementBlock:", CFSTR("PruneCachedShiftEntriesByCount"), &buf);
    v7 = (void *)v24[5];
    if (v7)
    {
      v8 = objc_retainAutorelease(v7);

      _Block_object_dispose(&v23, 8);
      v9 = v8;
      GEOGetTileDBLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "Unable to prune locsh cache entries: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {

      _Block_object_dispose(&v23, 8);
    }

  }
  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v12, "timeIntervalSinceNow");
    if (v13 < -15552000.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v14;
    }
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v16 = (unint64_t)v15;
    v17 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__5;
    v27 = __Block_byref_object_dispose__5;
    v28 = 0;
    *(_QWORD *)&buf = v3;
    *((_QWORD *)&buf + 1) = 3221225472;
    v30 = __PruneCachedShiftEntriesByDate_block_invoke;
    v31 = &unk_1E1BFF770;
    v18 = v17;
    v33 = &v23;
    v34 = v16;
    v32 = v18;
    objc_msgSend(v18, "executeStatement:statementBlock:", CFSTR("PruneCachedShiftEntriesByDate"), &buf);
    v19 = (void *)v24[5];
    if (v19)
    {
      v20 = objc_retainAutorelease(v19);

      _Block_object_dispose(&v23, 8);
      v21 = v20;
      GEOGetTileDBLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_ERROR, "Unable to prune locsh cache entries: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {

      _Block_object_dispose(&v23, 8);
    }

  }
}

- (void)removeAllShiftEntries
{
  GEOSQLiteDB *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__GEOTileDB_GEOLocationShifterPersistence__removeAllShiftEntries__block_invoke;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = self;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v3);
}

uint64_t __65__GEOTileDB_GEOLocationShifterPersistence__removeAllShiftEntries__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS shiftresponse(   time INT NOT NULL,    lat REAL NOT NULL,    lng REAL NOT NULL,    rad REAL NOT NULL,    data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE   );",
           "DROP TABLE shiftresponse");
}

- (void)removeAllShiftEntriesSync
{
  GEOSQLiteDB *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__GEOTileDB_GEOLocationShifterPersistence__removeAllShiftEntriesSync__block_invoke;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v3);
}

uint64_t __69__GEOTileDB_GEOLocationShifterPersistence__removeAllShiftEntriesSync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS shiftresponse(   time INT NOT NULL,    lat REAL NOT NULL,    lng REAL NOT NULL,    rad REAL NOT NULL,    data_pk INT NOT NULL REFERENCES data(rowid) ON UPDATE CASCADE ON DELETE CASCADE   );",
           "DROP TABLE shiftresponse");
}

- (void)getAllShiftEntries:(id)a3 queue:(id)a4 handler:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  GEOSQLiteDB *db;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  NSObject *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_group_enter(v8);
  db = self->_db;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__GEOTileDB_GEOLocationShifterPersistence__getAllShiftEntries_queue_handler___block_invoke;
  v15[3] = &unk_1E1C018D0;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v15);

}

void __77__GEOTileDB_GEOLocationShifterPersistence__getAllShiftEntries_queue_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__GEOTileDB_GEOLocationShifterPersistence__getAllShiftEntries_queue_handler___block_invoke_2;
  v9[3] = &unk_1E1C018A8;
  v10 = v2;
  v11 = *(id *)(a1 + 56);
  v5 = v3;
  v6 = v9;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__5;
  v16[4] = __Block_byref_object_dispose__5;
  v17 = 0;
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __ListAllShiftEntries_block_invoke;
  v12[3] = &unk_1E1BFF998;
  v7 = v5;
  v13 = v7;
  v8 = v6;
  v14 = v8;
  v15 = v16;
  objc_msgSend(v7, "statementForKey:statementBlock:", CFSTR("ListAllShiftEntries"), v12);

  _Block_object_dispose(v16, 8);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __77__GEOTileDB_GEOLocationShifterPersistence__getAllShiftEntries_queue_handler___block_invoke_2(uint64_t a1, unint64_t a2, double a3, double a4, double a5)
{
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__GEOTileDB_GEOLocationShifterPersistence__getAllShiftEntries_queue_handler___block_invoke_3;
  block[3] = &unk_1E1C01880;
  v10 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v15 = v9;
  v16 = v11;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v12 = v9;
  dispatch_async_and_wait(v10, block);

  return 1;
}

uint64_t __77__GEOTileDB_GEOLocationShifterPersistence__getAllShiftEntries_queue_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (GEOTileDBExtractedData)extractDataForOfflineKey:(void *)a3 fromBatchFileHandle:(size_t)a4 batchSize:(unint64_t)a5 sizeInBatch:(void *)a6 externalDataDirectory:(_QWORD *)a7 error:
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  GEOTileData *v36;
  GEOTileDBExtractedData *v37;
  id v38;
  id v39;
  int v40;
  unint64_t UInteger;
  NSObject *v42;
  uint8_t *v43;
  uint8_t *v44;
  id v45;
  uint8_t *v46;
  size_t v47;
  size_t v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  GEOTileData *v57;
  uint64_t v58;
  GEOTileData *v59;
  GEOTileData *v60;
  id v61;
  int v62;
  int v63;
  NSObject *v64;
  uint64_t v66;
  void *v67;
  GEOTileData *v68;
  NSObject *v69;
  const char *v70;
  NSObject *v71;
  const char *v72;
  uint8_t *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  uint8_t v80[16];
  _BYTE buf[18];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a6;
  if (!a1)
  {
    v37 = 0;
    goto LABEL_70;
  }
  v16 = v14;
  *(_QWORD *)buf = 0;
  if ((objc_msgSend(v16, "getOffset:error:", buf, a7) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v80 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [fileHandle getOffset:&originalOffset error:outError]", v80, 2u);
    }
    goto LABEL_82;
  }
  if (a5 <= 3)
  {
    v17 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v16, "readDataUpToLength:error:", 4, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if ((objc_msgSend(v16, "seekToOffset:error:", *(_QWORD *)buf, a7) & 1) != 0)
    {
      v19 = objc_retainAutorelease(v18);
      v20 = *(_QWORD *)objc_msgSend(v19, "bytes");
      v17 = 2049;
      if (v20 > 846755425)
      {
        if (v20 != 846755426)
        {
          v21 = 1853388386;
LABEL_12:
          if (v20 != v21)
            v17 = 0;
        }
      }
      else if (v20 != 762869346)
      {
        v21 = 829978210;
        goto LABEL_12;
      }

LABEL_15:
      v78 = v14;

      v74 = v13;
      v77 = v15;
      if (objc_msgSend(v13, "layer") == 12)
      {
        v79 = v16;
        v22 = v15;
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0C99E98];
        NSTemporaryDirectory();
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUIDString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v25, "stringByAppendingPathComponent:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fileURLWithPath:isDirectory:", v27, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v25) = objc_msgSend(v29, "writeToURL:atomically:", v28, 0);

        if ((v25 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", v28, a7);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            if ((-[GEOTileDB _extractDataFromFileHandle:sizeInBatch:toFileHandle:compressionAlgorithm:error:](v79, a5, v30, v17, a7) & 1) != 0)
            {
              objc_msgSend(v23, "UUIDString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "URLByAppendingPathComponent:isDirectory:", v31, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              GEOGetTileDBLog_0();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = +[GEOUnarchiver unarchiveDataAtURL:toURL:log:error:](GEOUnarchiver, "unarchiveDataAtURL:toURL:log:error:", v28, v32, v33, a7);

              if ((objc_msgSend(v30, "closeAndReturnError:", 0) & 1) == 0
                && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [writeHandle closeAndReturnError:NULL]", buf, 2u);
              }
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v74);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "removeItemAtURL:error:", v28, 0);

              if (v34)
              {
                v36 = -[GEOTileData initWithFileURL:]([GEOTileData alloc], "initWithFileURL:", v32);
                v37 = -[GEOTileDBExtractedData initWithData:externalResourceUUID:]([GEOTileDBExtractedData alloc], "initWithData:externalResourceUUID:", v36, v23);

                v13 = v75;
              }
              else
              {
                v13 = v75;
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: unarchived", buf, 2u);
                }
                v37 = 0;
              }

            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: decompressed", buf, 2u);
              }
              objc_msgSend(v30, "closeAndReturnError:", 0, v74);
              v37 = 0;
              v13 = v76;
            }
          }
          else
          {
            v13 = v74;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: writeHandle != ((void *)0)", buf, 2u);
            }
            v37 = 0;
          }

        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [[NSData data] writeToURL:tempURL atomically:__objc_no]", buf, 2u);
          }
          v37 = 0;
          v13 = v74;
        }

        goto LABEL_25;
      }
      v39 = v13;
      v22 = v16;
      v23 = v15;
      v79 = v39;
      v40 = objc_msgSend(v39, "layer");
      if (v40 == 12)
      {
        if (v17 != 2049)
          goto LABEL_42;
      }
      else
      {
        UInteger = GEOConfigGetUInteger(GeoOfflineConfig_DataExternalResourceSizeThreshold, (uint64_t)off_1EDF4E8D8);
        if (v17 != 2049)
        {
          if (UInteger <= a5)
            goto LABEL_42;
          objc_msgSend(v22, "readDataUpToLength:error:", a5, a7);
          v66 = objc_claimAutoreleasedReturnValue();
          if (v66)
          {
            v67 = (void *)v66;
            v68 = -[GEOTileData initWithData:]([GEOTileData alloc], "initWithData:", v66);
            v37 = -[GEOTileDBExtractedData initWithData:]([GEOTileDBExtractedData alloc], "initWithData:", v68);

LABEL_25:
            v38 = 0;
            goto LABEL_61;
          }
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            goto LABEL_101;
          *(_WORD *)buf = 0;
          v71 = MEMORY[0x1E0C81028];
          v72 = "Assertion failed: data != ((void *)0)";
          v73 = buf;
          goto LABEL_108;
        }
      }
      GEOGetTileDBLog_0();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v42, OS_LOG_TYPE_DEBUG, "Data appears to be LZFSE-compressed", buf, 2u);
      }

      if (3 * a5 >= GEOConfigGetUInteger(GeoOfflineConfig_DataExternalResourceSizeThreshold, (uint64_t)off_1EDF4E8D8))
        goto LABEL_42;
      *(_QWORD *)buf = 0;
      if ((objc_msgSend(v22, "getOffset:error:", buf, 0, v13) & 1) != 0)
      {
        v43 = (uint8_t *)mmap(0, a4, 1, 2, objc_msgSend(v22, "fileDescriptor"), 0);
        if (v43)
        {
          v44 = v43;
          v45 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 3 * a5));
          v46 = (uint8_t *)objc_msgSend(v45, "mutableBytes");
          v47 = objc_msgSend(v45, "length");
          v48 = compression_decode_buffer(v46, v47, &v44[*(_QWORD *)buf], a5, 0, (compression_algorithm)v17);
          if (v48 != objc_msgSend(v45, "length"))
          {
            objc_msgSend(v45, "setLength:", v48);
            v60 = -[GEOTileData initWithData:]([GEOTileData alloc], "initWithData:", v45);
            v37 = -[GEOTileDBExtractedData initWithData:]([GEOTileDBExtractedData alloc], "initWithData:", v60);

            munmap(v44, a4);
LABEL_60:
            v38 = 0;
            v13 = v74;
LABEL_61:

            v61 = v38;
            v16 = v61;
            if (v37)
            {
              v15 = v77;
              if (v61)
              {
                *(_QWORD *)v80 = 66053;
                v16 = objc_retainAutorelease(v61);
                v62 = fsctl((const char *)objc_msgSend(v16, "fileSystemRepresentation"), 0xC0084A44uLL, v80, 0);
                if (v62)
                {
                  v63 = v62;
                  GEOGetTileDBLog_0();
                  v64 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = v63;
                    *(_WORD *)&buf[8] = 2114;
                    *(_QWORD *)&buf[10] = v16;
                    _os_log_impl(&dword_1885A9000, v64, OS_LOG_TYPE_ERROR, "Failed to mark external resource as purgeable: %i -- %{public}@", buf, 0x12u);
                  }

                }
              }
              v14 = v78;
            }
            else
            {
              v15 = v77;
              v14 = v78;
            }
            goto LABEL_69;
          }
          GEOGetTileDBLog_0();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v80 = 0;
            _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_DEBUG, "In-memory decompression required too much memory. Will write to file instead", v80, 2u);
          }

          munmap(v44, a4);
LABEL_42:
          GEOGetTileDBLog_0();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138477827;
            *(_QWORD *)&buf[4] = v79;
            _os_log_impl(&dword_1885A9000, v50, OS_LOG_TYPE_DEBUG, "Will cache extracted key %{private}@ on-disk", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "UUIDString");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "URLByAppendingPathComponent:isDirectory:", v52, 0);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D50], "data");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "writeToURL:atomically:", v53, 0);

          if ((v55 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", v53, a7);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (v56)
            {
              if ((-[GEOTileDB _extractDataFromFileHandle:sizeInBatch:toFileHandle:compressionAlgorithm:error:](v22, a5, v56, v17, a7) & 1) != 0)
              {
                if (v40 == 12)
                {
                  v57 = -[GEOTileData initWithFileURL:]([GEOTileData alloc], "initWithFileURL:", v53);
                  v37 = -[GEOTileDBExtractedData initWithData:externalResourceUUID:]([GEOTileDBExtractedData alloc], "initWithData:externalResourceUUID:", v57, v51);
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v53, 0);
                  v58 = objc_claimAutoreleasedReturnValue();
                  if (v58)
                  {
                    v57 = (GEOTileData *)v58;
                    v59 = -[GEOTileData initWithFileHandle:]([GEOTileData alloc], "initWithFileHandle:", v58);
                    v37 = -[GEOTileDBExtractedData initWithData:externalResourceUUID:]([GEOTileDBExtractedData alloc], "initWithData:externalResourceUUID:", v59, v51);

                  }
                  else
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: readHandle != nil", buf, 2u);
                    }
                    v57 = 0;
                    v37 = 0;
                  }
                }

                v13 = v74;
                if ((objc_msgSend(v56, "closeAndReturnError:", 0) & 1) == 0
                  && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [writeHandle closeAndReturnError:NULL]", buf, 2u);
                }
                if (v37)
                  v38 = objc_retainAutorelease(v53);
                else
                  v38 = 0;

                goto LABEL_61;
              }
              objc_msgSend(v56, "closeAndReturnError:", 0);
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: writeHandle != ((void *)0)", buf, 2u);
            }

          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [[NSData data] writeToURL:newExternalResourceFileURL atomically:__objc_no]", buf, 2u);
          }

          v37 = 0;
          goto LABEL_60;
        }
        goto LABEL_101;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
LABEL_101:
        v37 = 0;
        goto LABEL_25;
      }
      *(_WORD *)v80 = 0;
      v71 = MEMORY[0x1E0C81028];
      v72 = "Assertion failed: [fileHandle getOffset:&offset error:((void *)0)]";
      v73 = v80;
LABEL_108:
      _os_log_fault_impl(&dword_1885A9000, v71, OS_LOG_TYPE_FAULT, v72, v73, 2u);
      goto LABEL_101;
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_81;
    *(_WORD *)v80 = 0;
    v69 = MEMORY[0x1E0C81028];
    v70 = "Assertion failed: [fileHandle seekToOffset:originalOffset error:outError]";
    goto LABEL_111;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v80 = 0;
    v69 = MEMORY[0x1E0C81028];
    v70 = "Assertion failed: firstFourBytes != ((void *)0)";
LABEL_111:
    _os_log_fault_impl(&dword_1885A9000, v69, OS_LOG_TYPE_FAULT, v70, v80, 2u);
  }
LABEL_81:

LABEL_82:
  v37 = 0;
LABEL_69:

LABEL_70:
  return v37;
}

- (uint64_t)_extractDataFromFileHandle:(void *)a1 sizeInBatch:(unint64_t)a2 toFileHandle:(void *)a3 compressionAlgorithm:(uint64_t)a4 error:(_QWORD *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  char v12;
  char v13;
  uint64_t v14;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  int v21;
  id v22;
  id v23;
  uint8_t v24[16];
  uint8_t buf[8];

  v9 = a1;
  v10 = a3;
  if (!a4)
  {
    if (!a2)
      goto LABEL_9;
    v16 = 0;
    while (1)
    {
      v17 = (void *)MEMORY[0x18D764E2C]();
      v18 = a2 >= 0x8000 ? 0x8000 : a2;
      v23 = 0;
      objc_msgSend(v9, "readDataUpToLength:error:", v18, &v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v23;

      if (a5)
      {
        if (!v19)
          break;
      }
      if (!v19)
        goto LABEL_27;
      if (objc_msgSend(v19, "length") != v18)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: bytes.length == bytesToRead", buf, 2u);
        }

        goto LABEL_29;
      }
      v22 = 0;
      v21 = objc_msgSend(v10, "writeData:error:", v19, &v22);
      v16 = v22;

      if (a5 && !v21)
        *a5 = objc_retainAutorelease(v16);
      if ((v21 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: wrote", buf, 2u);
        }

        v20 = v16;
        goto LABEL_29;
      }
      a2 -= v18;

      objc_autoreleasePoolPop(v17);
      if (!a2)
      {

        goto LABEL_9;
      }
    }
    *a5 = objc_retainAutorelease(v20);
LABEL_27:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: bytes != ((void *)0)", buf, 2u);
    }
LABEL_29:
    objc_autoreleasePoolPop(v17);

LABEL_30:
    v14 = 0;
    goto LABEL_10;
  }
  GEOGetTileDBLog_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Decompressing data to external file", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v12 = GEODecompressFileHandleToFileHandle(v9, a2, v10, (compression_algorithm)a4, (id *)buf);
  v13 = v12;
  if (a5 && (v12 & 1) == 0)
    *a5 = objc_retainAutorelease(*(id *)buf);
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: decompressed", v24, 2u);
    }

    goto LABEL_30;
  }

LABEL_9:
  v14 = 1;
LABEL_10:

  return v14;
}

@end
