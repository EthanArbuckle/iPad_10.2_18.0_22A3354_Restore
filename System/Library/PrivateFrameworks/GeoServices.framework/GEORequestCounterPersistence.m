@implementation GEORequestCounterPersistence

- (void)addPlaceCacheResultForApp:(id)a3 timestamp:(id)a4 requestTypeRaw:(int)a5 result:(unsigned __int8)a6
{
  id v10;
  id v11;
  void *v12;
  GEOSQLiteDB *db;
  _QWORD v14[5];
  id v15;
  id v16;
  int v17;
  unsigned __int8 v18;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (self->_enabled)
  {
    db = self->_db;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90__GEORequestCounterPersistence_addPlaceCacheResultForApp_timestamp_requestTypeRaw_result___block_invoke;
    v14[3] = &unk_1E1C14F40;
    v14[4] = self;
    v15 = v11;
    v16 = v10;
    v17 = a5;
    v18 = a6;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v14);

  }
}

+ (GEORequestCounterPersistence)sharedInstance
{
  if (qword_1ECDBC800 != -1)
    dispatch_once(&qword_1ECDBC800, &__block_literal_global_174);
  return (GEORequestCounterPersistence *)(id)_MergedGlobals_310;
}

void __46__GEORequestCounterPersistence_sharedInstance__block_invoke()
{
  GEORequestCounterPersistence *v0;
  void *v1;

  v0 = objc_alloc_init(GEORequestCounterPersistence);
  v1 = (void *)_MergedGlobals_310;
  _MergedGlobals_310 = (uint64_t)v0;

}

- (GEORequestCounterPersistence)init
{
  void *v3;
  GEORequestCounterPersistence *v4;

  +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GEORequestCounterPersistence initWithDBFilePath:maxCountAge:](self, "initWithDBFilePath:maxCountAge:", v3, 2592000.0);

  return v4;
}

- (GEORequestCounterPersistence)initWithDBFilePath:(id)a3 maxCountAge:(double)a4
{
  id v6;
  GEORequestCounterPersistence *v7;
  GEORequestCounterPersistence *v8;
  GEOSQLiteDB *v9;
  GEOSQLiteDB *db;
  GEORequestCounterPersistence *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEORequestCounterPersistence;
  v7 = -[GEORequestCounterPersistence init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_maxAge = fabs(a4);
    v9 = -[GEOSQLiteDB initWithQueueName:logFacility:dbFilePath:sqliteFlags:pragmas:setupBlock:]([GEOSQLiteDB alloc], "initWithQueueName:logFacility:dbFilePath:sqliteFlags:pragmas:setupBlock:", "com.apple.geo.requestcounter", "GEORequestCounter", v6, 0, 0, &__block_literal_global_43_0);
    db = v8->_db;
    v8->_db = v9;

    v11 = v8;
  }

  return v8;
}

uint64_t __63__GEORequestCounterPersistence_initWithDBFilePath_maxCountAge___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "user_version");
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 9)
  {
    setupGYBStatements(v2, 0);

  }
  else
  {
    setupGYBStatements(v2, 1);

    objc_msgSend(v2, "setUser_version:", 9);
    v4 = v2;
  }

  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[GEORequestCounterPersistence _tearDown](self, "_tearDown");
  v3.receiver = self;
  v3.super_class = (Class)GEORequestCounterPersistence;
  -[GEORequestCounterPersistence dealloc](&v3, sel_dealloc);
}

- (void)_tearDown
{
  GEOSQLiteDB *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__GEORequestCounterPersistence__tearDown__block_invoke;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v3);
}

uint64_t __41__GEORequestCounterPersistence__tearDown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tearDown");
}

- (void)incrementForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 requestType:(int)a6 result:(unsigned __int8)a7 xmitBytes:(int64_t)a8 recvBytes:(int64_t)a9 usedInterfaces:(unint64_t)a10 withCompletion:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  GEOSQLiteDB *db;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  GEORequestCounterPersistence *v31;
  id v32;
  id v33;
  int64_t v34;
  int64_t v35;
  unint64_t v36;
  int v37;
  unsigned __int8 v38;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a11;
  if (self->_enabled && objc_msgSend(v17, "length"))
  {
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v19)
      v21 = v19;
    else
      v21 = v18;
    v22 = v21;

    v23 = (void *)objc_msgSend(v20, "copy");
    db = self->_db;
    v24 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __135__GEORequestCounterPersistence_incrementForApp_startTime_endTime_requestType_result_xmitBytes_recvBytes_usedInterfaces_withCompletion___block_invoke;
    v28[3] = &unk_1E1C14CF8;
    v18 = v18;
    v29 = v18;
    v19 = v22;
    v30 = v19;
    v31 = self;
    v37 = a6;
    v38 = a7;
    v32 = v17;
    v34 = a8;
    v35 = a9;
    v36 = a10;
    v33 = v23;
    v26[0] = v24;
    v26[1] = 3221225472;
    v26[2] = __135__GEORequestCounterPersistence_incrementForApp_startTime_endTime_requestType_result_xmitBytes_recvBytes_usedInterfaces_withCompletion___block_invoke_2;
    v26[3] = &unk_1E1C03638;
    v27 = v33;
    v20 = v33;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v28, v26);

    goto LABEL_11;
  }
  if (v20)
  {
    (*((void (**)(id, _QWORD))v20 + 2))(v20, 0);
LABEL_11:

  }
}

void __135__GEORequestCounterPersistence_incrementForApp_startTime_endTime_requestType_result_xmitBytes_recvBytes_usedInterfaces_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(double *, uint64_t);
  void *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  v5 = v4;
  v6 = *(void **)(a1 + 56);
  v7 = *(int *)(a1 + 96);
  v8 = *(unsigned __int8 *)(a1 + 100);
  v9 = *(_QWORD *)(a1 + 88);
  v19 = *(_OWORD *)(a1 + 72);
  v10 = *(id *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = v6;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__83;
  v37 = __Block_byref_object_dispose__83;
  v38 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __reqcountdata_insert_block_invoke;
  v23 = &unk_1E1C14FE0;
  v12 = v10;
  v24 = v12;
  v26 = &v33;
  v27 = v3;
  v28 = v5;
  v13 = v11;
  v25 = v13;
  v29 = v7;
  v30 = v8;
  v31 = v19;
  v32 = v9;
  objc_msgSend(v12, "executeStatement:statementBlock:", CFSTR("reqcountdata_insert"), &v20);
  v14 = (void *)v34[5];
  if (v14)
    v15 = objc_retainAutorelease(v14);

  _Block_object_dispose(&v33, 8);
  v16 = v14;
  v17 = *(_QWORD *)(a1 + 64);
  if (v17)
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v16);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -*(double *)(*(_QWORD *)(a1 + 48) + 16), v19, v20, v21, v22, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_purgeOlderThan:", v18);

}

uint64_t __135__GEORequestCounterPersistence_incrementForApp_startTime_endTime_requestType_result_xmitBytes_recvBytes_usedInterfaces_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)countsDuring:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  GEOSQLiteDB *db;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  if (v7 && self->_db)
  {
    if (v6)
    {
      objc_msgSend(v6, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      v10 = v9;

      objc_msgSend(v6, "endDate");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      v10 = v12;

      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    v15 = v14;

    db = self->_db;
    v17 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke;
    v20[3] = &unk_1E1C14D70;
    v20[4] = self;
    v22 = v10;
    v23 = v15;
    v21 = v7;
    v18[0] = v17;
    v18[1] = 3221225472;
    v18[2] = __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke_2_55;
    v18[3] = &unk_1E1C03638;
    v19 = v21;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v20, v18);

  }
}

void __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  _QWORD *v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  __int128 buf;
  uint64_t (*v30)(uint64_t, sqlite3_stmt *);
  void *v31;
  id v32;
  id v33;
  uint64_t *v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke_2;
  v21[3] = &unk_1E1C14D20;
  v18 = *(_OWORD *)(a1 + 48);
  v5 = v2;
  v22 = v5;
  v6 = v4;
  v7 = v21;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__83;
  v27 = __Block_byref_object_dispose__83;
  v28 = 0;
  *(_QWORD *)&buf = v3;
  *((_QWORD *)&buf + 1) = 3221225472;
  v30 = __reqcountdata_readcounts_block_invoke;
  v31 = &unk_1E1C01A60;
  v8 = v6;
  v32 = v8;
  v34 = &v23;
  v35 = v18;
  v9 = v7;
  v33 = v9;
  v10 = objc_msgSend(v8, "statementForKey:statementBlock:", CFSTR("reqcountdata_readcounts"), &buf);
  v11 = (void *)v24[5];
  if (v11)
    v12 = objc_retainAutorelease(v11);

  _Block_object_dispose(&v23, 8);
  v13 = v11;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19[0] = v3;
    v19[1] = 3221225472;
    v19[2] = __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke_52;
    v19[3] = &unk_1E1C14D48;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v20;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v19);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = (void *)objc_msgSend(v14, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v15 + 16))(v15, v16, 0);

  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "error reading request counter table (%@)", (uint8_t *)&buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9)
{
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  GEORequestCounterStatistics *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v19, v17);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    v23 = objc_alloc_init(GEORequestCounterStatistics);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v20);

  }
  if (a9 <= a8)
    v25 = 0.0;
  else
    v25 = a9 - a8;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "incrementBytesTransmitted:", a5);
  objc_msgSend(v27, "incrementBytesReceived:", a6);
  objc_msgSend(v27, "incrementCountForResult:", a4);
  objc_msgSend(v27, "incrementDuration:", v25);
  objc_msgSend(v27, "addUsedInterfaces:", a7);

  return 1;
}

void __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  GEORequestCounterInfo *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[GEORequestCounterInfo initWithDictionary:]([GEORequestCounterInfo alloc], "initWithDictionary:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

uint64_t __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke_2_55(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)logsDuring:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  GEOSQLiteDB *db;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  GEORequestCounterPersistence *v16;
  id v17;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  db = self->_db;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__GEORequestCounterPersistence_logsDuring_withCompletion___block_invoke;
  v14[3] = &unk_1E1BFFC90;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __58__GEORequestCounterPersistence_logsDuring_withCompletion___block_invoke_3;
  v12[3] = &unk_1E1C03638;
  v13 = v17;
  v10 = v17;
  v11 = v6;
  -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v14, v12);

}

void __58__GEORequestCounterPersistence_logsDuring_withCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t *v15;
  id v16;
  uint64_t *v17;
  char v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double, double);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)a1[4];
  if (v3)
    objc_msgSend(v3, "startDate");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  v7 = (void *)a1[4];
  if (v7)
    objc_msgSend(v7, "endDate");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  v11 = *(void **)(a1[5] + 8);
  v12 = MEMORY[0x1E0C809B0];
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __58__GEORequestCounterPersistence_logsDuring_withCompletion___block_invoke_2;
  v27 = &unk_1E1C14D98;
  v13 = v2;
  v28 = v13;
  v14 = v11;
  v15 = &v24;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__83;
  v39 = __Block_byref_object_dispose__83;
  v40 = 0;
  v29[0] = v12;
  v29[1] = 3221225472;
  v29[2] = __reqcountdata_readlog_block_invoke;
  v29[3] = &unk_1E1C01A60;
  v16 = v14;
  v30 = v16;
  v32 = &v35;
  v33 = v6;
  v34 = v10;
  v17 = v15;
  v31 = v17;
  v18 = objc_msgSend(v16, "statementForKey:statementBlock:", CFSTR("reqcountdata_readlog"), v29, v24, v25, v26, v27);
  v19 = (void *)v36[5];
  if (v19)
    v20 = objc_retainAutorelease(v19);

  _Block_object_dispose(&v35, 8);
  v21 = v19;
  if ((v18 & 1) == 0)
    (*(void (**)(void))(a1[6] + 16))();
  v22 = a1[6];
  v23 = (void *)objc_msgSend(v13, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v22 + 16))(v22, v23, 0);

}

uint64_t __58__GEORequestCounterPersistence_logsDuring_withCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9)
{
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[8];
  _QWORD v31[10];

  v31[8] = *MEMORY[0x1E0C80C00];
  v31[0] = a2;
  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = a2;
  objc_msgSend(v17, "numberWithInteger:", a3, CFSTR("appID"), CFSTR("type"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v19;
  v30[2] = CFSTR("xmitB");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v20;
  v30[3] = CFSTR("recvB");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v21;
  v30[4] = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v22;
  v30[5] = CFSTR("start");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v23;
  v30[6] = CFSTR("end");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v24;
  v30[7] = CFSTR("iface");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = *(void **)(a1 + 32);
  +[GEORequestCounterLogInfo counterLogInfoWithDictionary:](GEORequestCounterLogInfo, "counterLogInfoWithDictionary:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v28);

  return 1;
}

uint64_t __58__GEORequestCounterPersistence_logsDuring_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_purgeOlderThan:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  GEOSQLiteDB *v8;
  uint64_t v9;
  GEOSQLiteDB *v10;
  BOOL v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  GEOSQLiteDB *v16;
  GEOSQLiteDB *v17;
  BOOL v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  GEOSQLiteDB *v23;
  GEOSQLiteDB *v24;
  BOOL v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  __int128 buf;
  uint64_t (*v37)(double *, uint64_t);
  void *v38;
  GEOSQLiteDB *v39;
  uint64_t *v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_db)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v7 = (double)(uint64_t)v6;
    v8 = self->_db;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__83;
    v34 = __Block_byref_object_dispose__83;
    v35 = 0;
    v9 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v37 = __reqcountdata_prune_block_invoke;
    v38 = &unk_1E1BFF770;
    v10 = v8;
    v41 = v7;
    v39 = v10;
    v40 = &v30;
    v11 = -[GEOSQLiteDB executeStatement:statementBlock:](v10, "executeStatement:statementBlock:", CFSTR("reqcountdata_prune"), &buf);
    v12 = (void *)v31[5];
    if (v12)
      v13 = objc_retainAutorelease(v12);

    _Block_object_dispose(&v30, 8);
    v14 = v12;
    if (!v11)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "something went wrong while purging old request counts: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v16 = self->_db;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__83;
    v34 = __Block_byref_object_dispose__83;
    v35 = 0;
    *(_QWORD *)&buf = v9;
    *((_QWORD *)&buf + 1) = 3221225472;
    v37 = __externalreqcountdata_prune_block_invoke;
    v38 = &unk_1E1BFF770;
    v17 = v16;
    v41 = v7;
    v39 = v17;
    v40 = &v30;
    v18 = -[GEOSQLiteDB executeStatement:statementBlock:](v17, "executeStatement:statementBlock:", CFSTR("externalreqcountdata_prune"), &buf);
    v19 = (void *)v31[5];
    v20 = v14;
    if (v19)
      v20 = objc_retainAutorelease(v19);

    _Block_object_dispose(&v30, 8);
    v21 = v20;

    if (!v18)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_ERROR, "something went wrong while purging old external request counts: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v23 = self->_db;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__83;
    v34 = __Block_byref_object_dispose__83;
    v35 = 0;
    *(_QWORD *)&buf = v9;
    *((_QWORD *)&buf + 1) = 3221225472;
    v37 = __placecache_prune_block_invoke;
    v38 = &unk_1E1BFF770;
    v24 = v23;
    v41 = v7;
    v39 = v24;
    v40 = &v30;
    v25 = -[GEOSQLiteDB executeStatement:statementBlock:](v24, "executeStatement:statementBlock:", CFSTR("placecache_prune"), &buf);
    v26 = (void *)v31[5];
    v27 = v21;
    if (v26)
      v27 = objc_retainAutorelease(v26);

    _Block_object_dispose(&v30, 8);
    v28 = v27;

    if (!v25)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v28;
        _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_ERROR, "something went wrong while purging old place cache counts: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_ERROR, "delete request on uninitialized db; aborting request",
        (uint8_t *)&buf,
        2u);
    }
  }

}

- (void)purgeAllCounts
{
  GEOSQLiteDB *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__GEORequestCounterPersistence_purgeAllCounts__block_invoke;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = self;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v3);
}

uint64_t __46__GEORequestCounterPersistence_purgeAllCounts__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeStatement:statementBlock:", CFSTR("reqcountdata_deleteall"), &__block_literal_global_173);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeStatement:statementBlock:", CFSTR("proactivetile_deleteall"), &__block_literal_global_174_0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeStatement:statementBlock:", CFSTR("externalreqcountdata_deleteall"), &__block_literal_global_175);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeStatement:statementBlock:", CFSTR("placecache_deleteall"), &__block_literal_global_176);
}

- (void)startedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4
{
  id v6;
  void *v7;
  double v8;
  uint64_t v9;
  GEOSQLiteDB *db;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  unsigned __int8 v14;

  v6 = a3;
  if (self->_enabled)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v9 = (uint64_t)v8;

    db = self->_db;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__GEORequestCounterPersistence_startedProactiveTileDownloadForIdentifier_policy___block_invoke;
    v11[3] = &unk_1E1C14DC0;
    v11[4] = self;
    v14 = a4;
    v12 = v6;
    v13 = v9;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v11);

  }
}

void __81__GEORequestCounterPersistence_startedProactiveTileDownloadForIdentifier_policy___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  __int128 buf;
  uint64_t (*v20)(_QWORD *, uint64_t);
  void *v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 40);
  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = v1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__83;
  v17 = __Block_byref_object_dispose__83;
  v18 = 0;
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v20 = __proactivetile_insertstart_block_invoke;
  v21 = &unk_1E1C14FB8;
  v6 = v4;
  v22 = v6;
  v7 = v5;
  v23 = v7;
  v24 = &v13;
  v25 = v2;
  v26 = v3;
  v8 = objc_msgSend(v6, "executeStatement:statementBlock:", CFSTR("proactivetile_insertstart"), &buf);
  v9 = (void *)v14[5];
  if (v9)
    v10 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v13, 8);
  v11 = v9;
  if ((v8 & 1) == 0)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "error inserting proactive tile start into db (%@)", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)finishedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4 tilesConsidered:(unsigned int)a5 tileDownloadAttempts:(unsigned int)a6 successes:(unsigned int)a7 failures:(unsigned int)a8 bytesDownloaded:(unint64_t)a9
{
  id v15;
  void *v16;
  double v17;
  uint64_t v18;
  GEOSQLiteDB *db;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned __int8 v28;

  v15 = a3;
  if (self->_enabled)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v18 = (uint64_t)v17;

    db = self->_db;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __154__GEORequestCounterPersistence_finishedProactiveTileDownloadForIdentifier_policy_tilesConsidered_tileDownloadAttempts_successes_failures_bytesDownloaded___block_invoke;
    v20[3] = &unk_1E1C14DE8;
    v20[4] = self;
    v28 = a4;
    v21 = v15;
    v22 = v18;
    v24 = a5;
    v25 = a6;
    v26 = a7;
    v27 = a8;
    v23 = a9;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v20);

  }
}

void __154__GEORequestCounterPersistence_finishedProactiveTileDownloadForIdentifier_policy_tilesConsidered_tileDownloadAttempts_successes_failures_bytesDownloaded___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v1 = *(void **)(a1 + 40);
  v2 = *(unsigned __int8 *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)&v7 = v5;
  *((_QWORD *)&v7 + 1) = HIDWORD(v5);
  v8 = v7;
  *(_QWORD *)&v7 = v6;
  *((_QWORD *)&v7 + 1) = HIDWORD(v6);
  v15 = v8;
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = v1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__83;
  v29 = __Block_byref_object_dispose__83;
  v30 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __proactivetile_insertend_block_invoke;
  v16[3] = &unk_1E1C14FE0;
  v11 = v9;
  v17 = v11;
  v12 = v10;
  v18 = v12;
  v19 = &v25;
  v20 = v2;
  v21 = v3;
  v22 = v15;
  v23 = v7;
  v24 = v4;
  objc_msgSend(v11, "executeStatement:statementBlock:", CFSTR("proactivetile_insertend"), v16);
  v13 = (void *)v26[5];
  if (v13)
    v14 = objc_retainAutorelease(v13);

  _Block_object_dispose(&v25, 8);
}

- (void)readProactiveTileDownloadsSince:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  GEOSQLiteDB *db;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    db = self->_db;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke;
    v12[3] = &unk_1E1BFFC90;
    v12[4] = self;
    v13 = v6;
    v14 = v7;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke_4;
    v10[3] = &unk_1E1C03638;
    v11 = v14;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v12, v10);

  }
}

void __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  GEORequestCounterProactiveTileDownloadInfo *v19;
  void *v20;
  GEORequestCounterProactiveTileDownloadInfo *v21;
  id v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD v37[5];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  v5 = (uint64_t)v4;
  v6 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke_2;
  v29[3] = &unk_1E1C14E10;
  v7 = v2;
  v30 = v7;
  v8 = v1;
  v31 = v8;
  v9 = v3;
  v10 = v29;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__83;
  v37[4] = __Block_byref_object_dispose__83;
  v38 = 0;
  v32[0] = v6;
  v32[1] = 3221225472;
  v32[2] = __proactivetile_query_block_invoke;
  v32[3] = &unk_1E1C019E8;
  v11 = v9;
  v35 = v37;
  v36 = v5;
  v33 = v11;
  v12 = v10;
  v34 = v12;
  objc_msgSend(v11, "statementForKey:statementBlock:", CFSTR("proactivetile_query"), v32);

  _Block_object_dispose(v37, 8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v19 = [GEORequestCounterProactiveTileDownloadInfo alloc];
        objc_msgSend(v7, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[GEORequestCounterProactiveTileDownloadInfo initWithIdentifier:policies:](v19, "initWithIdentifier:policies:", v18, v20);

        objc_msgSend(v13, "addObject:", v21);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
    }
    while (v15);
  }

  v24 = *(id *)(a1 + 48);
  v22 = v13;
  geo_dispatch_async_qos();

}

uint64_t __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke_2(uint64_t a1, void *a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  GEORequestCounterProactiveTileDownloadPolicyInfo *v22;
  void *v23;
  void *v25;

  v16 = a2;
  v17 = (void *)MEMORY[0x18D764E2C]();
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v17;
    if (a5 < 1)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v21, v16);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);
    }
    v22 = -[GEORequestCounterProactiveTileDownloadPolicyInfo initWithPolicy:startTimestamp:endTimestamp:tilesConsidered:successCount:failureCount:bytesDownloaded:]([GEORequestCounterProactiveTileDownloadPolicyInfo alloc], "initWithPolicy:startTimestamp:endTimestamp:tilesConsidered:successCount:failureCount:bytesDownloaded:", a3, v18, v19, a6, a8, a9, a10);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v22);

    v17 = v25;
  }
  objc_autoreleasePoolPop(v17);

  return 1;
}

uint64_t __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  geo_dispatch_async_qos();

}

uint64_t __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)recordRoutePreloadSessionAt:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7
{
  id v12;
  void *v13;
  double v14;
  unint64_t v15;
  void *v16;
  double v17;
  unint64_t v18;
  GEOSQLiteDB *db;
  _QWORD v20[11];

  v12 = a3;
  objc_msgSend(v12, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v15 = (unint64_t)v14;

  objc_msgSend(v12, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v18 = (unint64_t)v17;

  db = self->_db;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __111__GEORequestCounterPersistence_recordRoutePreloadSessionAt_transportType_tilesPreloaded_tilesUsed_tilesMissed___block_invoke;
  v20[3] = &unk_1E1C14E38;
  v20[4] = self;
  v20[5] = v15;
  v20[6] = v18;
  v20[7] = a4;
  v20[8] = a5;
  v20[9] = a6;
  v20[10] = a7;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v20);
}

void __111__GEORequestCounterPersistence_recordRoutePreloadSessionAt_transportType_tilesPreloaded_tilesUsed_tilesMissed___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  char v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  __int128 buf;
  uint64_t (*v18)(_QWORD *, uint64_t);
  void *v19;
  id v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = *(_OWORD *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 72);
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__83;
  v15 = __Block_byref_object_dispose__83;
  v16 = 0;
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v18 = __routepreload_insert_block_invoke;
  v19 = &unk_1E1C15008;
  v2 = v1;
  v20 = v2;
  v21 = &v11;
  v22 = v10;
  v23 = v9;
  v24 = v8;
  v3 = objc_msgSend(v2, "executeStatement:statementBlock:", CFSTR("routepreload_insert"), &buf);
  v4 = (void *)v12[5];
  if (v4)
    v5 = objc_retainAutorelease(v4);

  _Block_object_dispose(&v11, 8);
  v6 = v4;
  if ((v3 & 1) == 0)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "error writing to route preload sessions table (%@)", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)fetchRoutePreloadSessionsFrom:(id)a3 completion:(id)a4 completionQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOSQLiteDB *db;
  double v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__83;
  v20[4] = __Block_byref_object_dispose__83;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  db = self->_db;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke;
  v15[3] = &unk_1E1C14EC8;
  v18 = v20;
  v19 = (uint64_t)v12;
  v15[4] = self;
  v13 = v10;
  v16 = v13;
  v14 = v9;
  v17 = v14;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v15);

  _Block_object_dispose(v20, 8);
}

void __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  id v7;
  _QWORD *v8;
  char v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  __int128 buf;
  uint64_t (*v28)(uint64_t, sqlite3_stmt *);
  void *v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke_2;
  v20[3] = &unk_1E1C14E60;
  v4 = *(_QWORD *)(a1 + 64);
  v20[4] = *(_QWORD *)(a1 + 56);
  v5 = v2;
  v6 = v20;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__83;
  v25 = __Block_byref_object_dispose__83;
  v26 = 0;
  *(_QWORD *)&buf = v3;
  *((_QWORD *)&buf + 1) = 3221225472;
  v28 = __routepreload_read_block_invoke;
  v29 = &unk_1E1C019E8;
  v7 = v5;
  v32 = &v21;
  v33 = v4;
  v30 = v7;
  v8 = v6;
  v31 = v8;
  v9 = objc_msgSend(v7, "statementForKey:statementBlock:", CFSTR("routepreload_read"), &buf);
  v10 = (void *)v22[5];
  if (v10)
    v11 = objc_retainAutorelease(v10);

  _Block_object_dispose(&v21, 8);
  v12 = v10;
  if ((v9 & 1) == 0)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "error reading from route preload sessions table (%@)", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "sortUsingComparator:", &__block_literal_global_84);
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke_2_85;
  block[3] = &unk_1E1C03F50;
  v14 = *(NSObject **)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 56);
  v18 = v15;
  v19 = v16;
  dispatch_async(v14, block);

}

uint64_t __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  GEORoutePreloaderStatistics *v18;

  v14 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithStartDate:endDate:", v15, v16);

  v18 = -[GEORoutePreloaderStatistics initWithDateInterval:transportType:tilesPreloaded:tilesUsed:tilesMissed:]([GEORoutePreloaderStatistics alloc], "initWithDateInterval:transportType:tilesPreloaded:tilesUsed:tilesMissed:", v17, a4, a5, a6, a7);
  if (v18)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v18);

  return 1;
}

uint64_t __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke_2_85(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  GEOSQLiteDB *db;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  GEORequestCounterPersistence *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  int64_t v33;
  unint64_t v34;

  v23 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  if (self->_enabled)
  {
    db = self->_db;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __143__GEORequestCounterPersistence_incrementExternalForApp_startTime_endTime_xmitBytes_recvBytes_usedInterfaces_requestType_requestSubtype_source___block_invoke;
    v24[3] = &unk_1E1C14EF0;
    v25 = v17;
    v26 = v18;
    v27 = self;
    v32 = a6;
    v33 = a7;
    v34 = a8;
    v28 = v23;
    v29 = v19;
    v30 = v20;
    v31 = v21;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v24, 0);

  }
}

void __143__GEORequestCounterPersistence_incrementExternalForApp_startTime_endTime_xmitBytes_recvBytes_usedInterfaces_requestType_requestSubtype_source___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  v5 = v4;
  v6 = *(void **)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 104);
  v8 = *(void **)(a1 + 64);
  v9 = *(void **)(a1 + 72);
  v10 = *(void **)(a1 + 80);
  v25 = *(_OWORD *)(a1 + 88);
  v11 = *(id *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = v6;
  v13 = v8;
  v14 = v9;
  v15 = v10;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__83;
  v41 = __Block_byref_object_dispose__83;
  v42 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __externalreqcountdata_insert_block_invoke;
  v26[3] = &unk_1E1C15030;
  v16 = v11;
  v27 = v16;
  v32 = &v37;
  v33 = v3;
  v34 = v5;
  v35 = v25;
  v36 = v7;
  v17 = v12;
  v28 = v17;
  v18 = v13;
  v29 = v18;
  v19 = v14;
  v30 = v19;
  v20 = v15;
  v31 = v20;
  objc_msgSend(v16, "executeStatement:statementBlock:", CFSTR("externalreqcountdata_insert"), v26);
  v21 = (void *)v38[5];
  if (v21)
    v22 = objc_retainAutorelease(v21);

  _Block_object_dispose(&v37, 8);
  v23 = v21;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -*(double *)(*(_QWORD *)(a1 + 48) + 16));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_purgeOlderThan:", v24);

}

- (void)externalRequestsCount:(id)a3
{
  id v4;
  void *v5;
  GEOSQLiteDB *db;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    db = self->_db;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__GEORequestCounterPersistence_externalRequestsCount___block_invoke;
    v7[3] = &unk_1E1BFFBF0;
    v7[4] = self;
    v8 = v4;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v7);

  }
}

void __54__GEORequestCounterPersistence_externalRequestsCount___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t *v7;
  id v8;
  uint64_t *v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, void *, void *, double, double);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = MEMORY[0x1E0C809B0];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __54__GEORequestCounterPersistence_externalRequestsCount___block_invoke_2;
  v19 = &unk_1E1C14F18;
  v5 = v2;
  v20 = v5;
  v6 = v3;
  v7 = &v16;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__83;
  v29 = __Block_byref_object_dispose__83;
  v30 = 0;
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __externalreqcountdata_readcounts_block_invoke;
  v21[3] = &unk_1E1BFF998;
  v8 = v6;
  v22 = v8;
  v9 = v7;
  v23 = v9;
  v24 = &v25;
  v10 = objc_msgSend(v8, "statementForKey:statementBlock:", CFSTR("externalreqcountdata_readcounts"), v21, v16, v17, v18, v19);
  v11 = (void *)v26[5];
  if (v11)
    v12 = objc_retainAutorelease(v11);

  _Block_object_dispose(&v25, 8);
  v13 = v11;
  if ((v10 & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v14 = *(_QWORD *)(a1 + 40);
  v15 = (void *)objc_msgSend(v5, "copy");
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

}

uint64_t __54__GEORequestCounterPersistence_externalRequestsCount___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, double a9, double a10)
{
  id v19;
  id v20;
  id v21;
  id v22;
  GEOExternalRequestCounterInfo *v23;
  void *v24;
  void *v25;

  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = objc_alloc_init(GEOExternalRequestCounterInfo);
  -[GEOExternalRequestCounterInfo setAppId:](v23, "setAppId:", v22);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOExternalRequestCounterInfo setStartTime:](v23, "setStartTime:", v24);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOExternalRequestCounterInfo setEndTime:](v23, "setEndTime:", v25);

  -[GEOExternalRequestCounterInfo setXmitBytes:](v23, "setXmitBytes:", a2);
  -[GEOExternalRequestCounterInfo setRecvBytes:](v23, "setRecvBytes:", a3);
  -[GEOExternalRequestCounterInfo setUsedInterface:](v23, "setUsedInterface:", a4);
  -[GEOExternalRequestCounterInfo setRequestType:](v23, "setRequestType:", v21);

  -[GEOExternalRequestCounterInfo setRequestSubtype:](v23, "setRequestSubtype:", v20);
  -[GEOExternalRequestCounterInfo setSource:](v23, "setSource:", v19);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v23);
  return 1;
}

void __90__GEORequestCounterPersistence_addPlaceCacheResultForApp_timestamp_requestTypeRaw_result___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(double *, uint64_t);
  void *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  v4 = v3;
  v5 = *(void **)(a1 + 48);
  v6 = *(int *)(a1 + 56);
  v7 = *(unsigned __int8 *)(a1 + 60);
  v8 = v2;
  v9 = v5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__83;
  v30 = __Block_byref_object_dispose__83;
  v31 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __placecache_insert_block_invoke;
  v19 = &unk_1E1C15058;
  v10 = v8;
  v23 = v4;
  v20 = v10;
  v22 = &v26;
  v11 = v9;
  v21 = v11;
  v24 = v6;
  v25 = v7;
  objc_msgSend(v10, "executeStatement:statementBlock:", CFSTR("placecache_insert"), &v16);
  v12 = (void *)v27[5];
  if (v12)
    v13 = objc_retainAutorelease(v12);

  _Block_object_dispose(&v26, 8);
  v14 = v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -*(double *)(*(_QWORD *)(a1 + 32) + 16), v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_purgeOlderThan:", v15);

}

- (void)getPlaceCacheResultsInTimeRange:(id)a3 rawCounts:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  GEOSQLiteDB *db;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9 && v10)
  {
    if (v8)
    {
      objc_msgSend(v8, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v14 = v13;

      objc_msgSend(v8, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
      v17 = v16;

    }
    else
    {
      v17 = 0x7FEFFFFFFFFFFFFFLL;
      v14 = 0x10000000000000;
    }
    db = self->_db;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __83__GEORequestCounterPersistence_getPlaceCacheResultsInTimeRange_rawCounts_complete___block_invoke;
    v19[3] = &unk_1E1C14F90;
    v19[4] = self;
    v22 = v14;
    v23 = v17;
    v20 = v9;
    v21 = v11;
    -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v19);

  }
}

void __83__GEORequestCounterPersistence_getPlaceCacheResultsInTimeRange_rawCounts_complete___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__GEORequestCounterPersistence_getPlaceCacheResultsInTimeRange_rawCounts_complete___block_invoke_2;
  v13[3] = &unk_1E1C14F68;
  v12 = *(_OWORD *)(a1 + 56);
  v14 = v3;
  v5 = v4;
  v6 = v13;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__83;
  v24 = __Block_byref_object_dispose__83;
  v25 = 0;
  v15[0] = v2;
  v15[1] = 3221225472;
  v15[2] = __placecache_readcounts_block_invoke;
  v15[3] = &unk_1E1C01A60;
  v7 = v5;
  v16 = v7;
  v18 = &v20;
  v19 = v12;
  v8 = v6;
  v17 = v8;
  objc_msgSend(v7, "statementForKey:statementBlock:", CFSTR("placecache_readcounts"), v15);
  v9 = (void *)v21[5];
  if (v9)
    v10 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v20, 8);
  v11 = v9;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __83__GEORequestCounterPersistence_getPlaceCacheResultsInTimeRange_rawCounts_complete___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 a4, double a5)
{
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = (void *)MEMORY[0x1E0C99D68];
  v10 = a2;
  objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, uint64_t, _QWORD))(v8 + 16))(v8, v10, v11, a3, a4);

  return 1;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
