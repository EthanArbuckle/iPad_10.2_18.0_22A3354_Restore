@implementation GEOConfigPersistence

void __44__GEOConfigPersistence_getExpireForKeyPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __52__GEOConfigPersistence_defaultForKeyPathComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    _valueForKeyPath(v8, *(void **)(a1 + 32), 0, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v8;
  }
  v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _geoDefaultsToDict(v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _geoDefaultsToArray(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(v4, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
  if (v4)
    goto LABEL_9;
LABEL_10:

}

- (id)defaultForKeyPath:(id)a3
{
  void *v4;
  void *v5;

  GEOConfig_splitKeyPathComponents(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOConfigPersistence defaultForKeyPathComponents:](self, "defaultForKeyPathComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getExpireForKeyPath:(id)a3
{
  id v4;
  _GEOConfigCache *keyExpiryCache;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  keyExpiryCache = self->_keyExpiryCache;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__GEOConfigPersistence_getExpireForKeyPath___block_invoke;
  v9[3] = &unk_1E1BFF810;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[_GEOConfigCache withCache:](keyExpiryCache, "withCache:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)defaultForKeyPathComponents:(id)a3
{
  id v4;
  _GEOConfigDB *configDB;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  configDB = self->_configDB;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__GEOConfigPersistence_defaultForKeyPathComponents___block_invoke;
  v9[3] = &unk_1E1BFF9E8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_GEOConfigCache withCache:](configDB, "withCache:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)xpcDefaultForKeyPath:(id)a3
{
  void *v4;
  void *v5;

  GEOConfig_splitKeyPathComponents(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOConfigPersistence xpcDefaultForKeyPathComponents:](self, "xpcDefaultForKeyPathComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)xpcDefaultForKeyPathComponents:(id)a3
{
  id v4;
  _GEOConfigDB *xpcConfigDB;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  xpcConfigDB = self->_xpcConfigDB;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__GEOConfigPersistence_xpcDefaultForKeyPathComponents___block_invoke;
  v9[3] = &unk_1E1BFF9E8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_GEOConfigCache withCache:](xpcConfigDB, "withCache:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __42__GEOConfigPersistence_getAllExpiringKeys__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setXPCDefault:(id)a3 forKeyPath:(id)a4
{
  _GEOConfigDB *xpcConfigDB;
  id v6;
  id v7;

  xpcConfigDB = self->_xpcConfigDB;
  v6 = a3;
  GEOConfig_splitKeyPathComponents(a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  _setDefault(xpcConfigDB, v6, v7);

}

void __55__GEOConfigPersistence_xpcDefaultForKeyPathComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    _valueForKeyPath(v8, *(void **)(a1 + 32), 0, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v8;
  }
  v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _geoDefaultsToDict(v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _geoDefaultsToArray(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(v4, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
  if (v4)
    goto LABEL_9;
LABEL_10:

}

- (id)getAllExpiringKeys
{
  _GEOConfigCache *keyExpiryCache;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  keyExpiryCache = self->_keyExpiryCache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__GEOConfigPersistence_getAllExpiringKeys__block_invoke;
  v5[3] = &unk_1E1BFF838;
  v5[4] = &v6;
  -[_GEOConfigCache withCache:](keyExpiryCache, "withCache:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setDefault:(id)a3 forKeyPath:(id)a4
{
  _GEOConfigDB *configDB;
  id v6;
  id v7;

  configDB = self->_configDB;
  v6 = a3;
  GEOConfig_splitKeyPathComponents(a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  _setDefault(configDB, v6, v7);

}

- (GEOConfigPersistence)initWithDBPath:(id)a3
{
  id v4;
  GEOConfigPersistence *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  GEOSQLiteDB *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  GEOSQLiteDB *db;
  _GEOConfigDBOperationQueue *v14;
  _GEOConfigDBOperationQueue *operationQueue;
  GEOSQLiteDB *v16;
  GEOConfigPersistence *v17;
  void *v18;
  _QWORD v20[4];
  GEOConfigPersistence *v21;
  os_signpost_id_t v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GEOConfigPersistence;
  v5 = -[GEOConfigPersistence init](&v26, sel_init);
  if (v5)
  {
    j__GEOGetUserDefaultsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_generate(v6);

    objc_initWeak(&location, v5);
    v8 = [GEOSQLiteDB alloc];
    j__GEOGetUserDefaultsLog();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __39__GEOConfigPersistence_initWithDBPath___block_invoke_2;
    v23[3] = &unk_1E1BFF638;
    objc_copyWeak(&v24, &location);
    v12 = -[GEOSQLiteDB initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:](v8, "initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:tearDownBlock:", "com.apple.geo.ConfigPersistence", v9, v10, 0x400000, 0, &__block_literal_global_0, v23);
    db = v5->_db;
    v5->_db = (GEOSQLiteDB *)v12;

    v14 = -[_GEOConfigDBOperationQueue init:]([_GEOConfigDBOperationQueue alloc], "init:", v5->_db);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v14;

    v16 = v5->_db;
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __39__GEOConfigPersistence_initWithDBPath___block_invoke_3;
    v20[3] = &unk_1E1BFF6D0;
    v22 = v7;
    v17 = v5;
    v21 = v17;
    -[GEOSQLiteDB executeSync:](v16, "executeSync:", v20);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v17, sel_flush, CFSTR("GEODaemonShouldTerminateNotification"), 0);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v5;
}

BOOL __39__GEOConfigPersistence_initWithDBPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GEOConfigPersistence _setup:](GEOConfigPersistence, "_setup:", a2);
}

void __39__GEOConfigPersistence_initWithDBPath___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[5], "flushOnDBQueue");
    WeakRetained = v2;
  }

}

void __39__GEOConfigPersistence_initWithDBPath___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  id v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  id v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  NSObject *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD *v46;
  id v47;
  _QWORD *v48;
  id v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  os_signpost_id_t v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  uint8_t buf[8];
  uint64_t v66;
  uint64_t (*v67)(uint64_t, sqlite3_stmt *);
  void *v68;
  id v69;
  id v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;

  j__GEOGetUserDefaultsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ReadConfig", "table=defaults", buf, 2u);
  }

  +[GEODefaultsDBDict dbValue:](GEODefaultsDBDict, "dbValue:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDbId:", 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, &unk_1E1E80A88);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __39__GEOConfigPersistence_initWithDBPath___block_invoke_107;
  v61[3] = &unk_1E1BFF680;
  v64 = &__block_literal_global_102;
  v9 = v5;
  v62 = v9;
  v10 = v6;
  v63 = v10;
  v11 = v7;
  v12 = v61;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy_;
  v76 = __Block_byref_object_dispose_;
  v77 = 0;
  *(_QWORD *)buf = v8;
  v66 = 3221225472;
  v67 = __ListValues_block_invoke;
  v68 = &unk_1E1BFF998;
  v13 = v11;
  v69 = v13;
  v14 = v12;
  v70 = v14;
  v71 = &v72;
  objc_msgSend(v13, "statementForKey:statementBlock:", CFSTR("ListValues"), buf);

  _Block_object_dispose(&v72, 8);
  v15 = -[_GEOConfigDB init:cache:operationQueue:clearFunction:setFunction:addFunction:tableName:]([_GEOConfigDB alloc], "init:cache:operationQueue:clearFunction:setFunction:addFunction:tableName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), ClearValue, SetValue, AddValue, CFSTR("defaults"));
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 16);
  *(_QWORD *)(v16 + 16) = v15;

  j__GEOGetUserDefaultsLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = *(_QWORD *)(a1 + 40);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v19, OS_SIGNPOST_INTERVAL_END, v20, "ReadConfig", "table=defaults", buf, 2u);
  }

  j__GEOGetUserDefaultsLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v23 = *(_QWORD *)(a1 + 40);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v23, "ReadConfig", "table=defaults_xpc", buf, 2u);
  }

  +[GEODefaultsDBDict dbValue:](GEODefaultsDBDict, "dbValue:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDbId:", 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, &unk_1E1E80A88);
  v26 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v57[0] = v8;
  v57[1] = 3221225472;
  v57[2] = __39__GEOConfigPersistence_initWithDBPath___block_invoke_112;
  v57[3] = &unk_1E1BFF680;
  v60 = &__block_literal_global_102;
  v27 = v24;
  v58 = v27;
  v28 = v25;
  v59 = v28;
  v29 = v26;
  v30 = v57;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy_;
  v76 = __Block_byref_object_dispose_;
  v77 = 0;
  *(_QWORD *)buf = v8;
  v66 = 3221225472;
  v67 = __ListXPCValues_block_invoke;
  v68 = &unk_1E1BFF998;
  v31 = v29;
  v69 = v31;
  v32 = v30;
  v70 = v32;
  v71 = &v72;
  objc_msgSend(v31, "statementForKey:statementBlock:", CFSTR("ListXPCValues"), buf);

  _Block_object_dispose(&v72, 8);
  v33 = -[_GEOConfigDB init:cache:operationQueue:clearFunction:setFunction:addFunction:tableName:]([_GEOConfigDB alloc], "init:cache:operationQueue:clearFunction:setFunction:addFunction:tableName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v27, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), ClearXPCValue, SetXPCValue, AddXPCValue, CFSTR("defaults_xpc"));
  v34 = *(_QWORD *)(a1 + 32);
  v35 = *(void **)(v34 + 24);
  *(_QWORD *)(v34 + 24) = v33;

  j__GEOGetUserDefaultsLog();
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = v36;
  v38 = *(_QWORD *)(a1 + 40);
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v37, OS_SIGNPOST_INTERVAL_END, v38, "ReadConfig", "table=defaults_xpc", buf, 2u);
  }

  j__GEOGetUserDefaultsLog();
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = v39;
  v41 = *(_QWORD *)(a1 + 40);
  if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v41, "ReadConfig", "table=key_expiry", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v55[0] = v8;
  v55[1] = 3221225472;
  v55[2] = __39__GEOConfigPersistence_initWithDBPath___block_invoke_115;
  v55[3] = &unk_1E1BFF6A8;
  v44 = v42;
  v56 = v44;
  v45 = v43;
  v46 = v55;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy_;
  v76 = __Block_byref_object_dispose_;
  v77 = 0;
  *(_QWORD *)buf = v8;
  v66 = 3221225472;
  v67 = __GetAllExpired_block_invoke;
  v68 = &unk_1E1BFF998;
  v47 = v45;
  v69 = v47;
  v48 = v46;
  v70 = v48;
  v71 = &v72;
  objc_msgSend(v47, "statementForKey:statementBlock:", CFSTR("GetAllExpired"), buf);

  _Block_object_dispose(&v72, 8);
  v49 = -[_GEOConfigCache init:]([_GEOConfigCache alloc], "init:", v44);
  v50 = *(_QWORD *)(a1 + 32);
  v51 = *(void **)(v50 + 32);
  *(_QWORD *)(v50 + 32) = v49;

  j__GEOGetUserDefaultsLog();
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = v52;
  v54 = *(_QWORD *)(a1 + 40);
  if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v53, OS_SIGNPOST_INTERVAL_END, v54, "ReadConfig", "table=key_expiry", buf, 2u);
  }

}

void __39__GEOConfigPersistence_initWithDBPath___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  __objc2_class *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _BYTE buf[12];
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      j__GEOGetUserDefaultsLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = a8;
        v31 = 2112;
        v32 = v14;
        v33 = 2048;
        v34 = a4;
        _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "Could not find parent %lld for key %@ (%lld)", buf, 0x20u);
      }
      goto LABEL_17;
    }
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("dict")))
    {
      v19 = GEODefaultsDBDict;
LABEL_9:
      -[__objc2_class dbValue:](v19, "dbValue:", v18);
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, v21);

LABEL_16:
      -[NSObject setDbId:](v20, "setDbId:", a4);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, v14);
LABEL_17:

      goto LABEL_18;
    }
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("arr")))
    {
      v19 = GEODefaultsDBArray;
      goto LABEL_9;
    }
    v22 = v16;
    v23 = v15;
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("nil")))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v25 = v24;
LABEL_15:

      +[GEODefaultsDBValue dbValue:type:value:](GEODefaultsDBValue, "dbValue:type:value:", v18, v23, v25);
      v20 = objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("str")))
    {
      v24 = v22;
      goto LABEL_14;
    }
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("int")))
    {
      objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "containsString:", CFSTR("-")))
      {
        *(_QWORD *)buf = 0;
        if (objc_msgSend(v26, "scanLongLong:", buf, v26))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)buf);
          v27 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
      }
      else
      {
        *(_QWORD *)buf = 0;
        if (objc_msgSend(v26, "scanUnsignedLongLong:", buf, v26))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)buf);
          v27 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
      }
      v25 = 0;
      goto LABEL_34;
    }
    if (!objc_msgSend(v23, "isEqualToString:", CFSTR("dbl")))
    {
      if (objc_msgSend(v23, "isEqualToString:", CFSTR("date")))
      {
        objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        v25 = 0;
        if (objc_msgSend(v28, "scanDouble:", buf))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)buf);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_15;
      }
      if (!objc_msgSend(v23, "isEqualToString:", CFSTR("bytes")))
      {
        v25 = 0;
        goto LABEL_15;
      }
      v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v22, 0);
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v22);
    *(_QWORD *)buf = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    if (!objc_msgSend(v29, "scanDouble:", buf))
    {
LABEL_34:

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)buf);
    v27 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    v25 = (void *)v27;
    goto LABEL_34;
  }
LABEL_18:

}

uint64_t __39__GEOConfigPersistence_initWithDBPath___block_invoke_107(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2, a3, a4, a5, a6);
  return 1;
}

uint64_t __39__GEOConfigPersistence_initWithDBPath___block_invoke_112(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2, a3, a4, a5, a6);
  return 1;
}

uint64_t __39__GEOConfigPersistence_initWithDBPath___block_invoke_115(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a2;
  v8 = a4;
  if (a3 < 1
    || (objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)a3),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(v8, "length"))
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  +[GEOConfigExpiringKey expiringKey:withTime:osVersion:](GEOConfigExpiringKey, "expiringKey:withTime:osVersion:", v7, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v7);

  return 1;
}

- (void)flush
{
  -[_GEOConfigDBOperationQueue flush](self->_operationQueue, "flush");
}

- (void)tearDown
{
  GEOSQLiteDB *db;
  GEOSQLiteDB *v4;
  _QWORD v5[5];

  -[_GEOConfigDBOperationQueue flush](self->_operationQueue, "flush");
  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__GEOConfigPersistence_tearDown__block_invoke;
  v5[3] = &unk_1E1BFF6F8;
  v5[4] = self;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v5);
  v4 = self->_db;
  self->_db = 0;

}

uint64_t __32__GEOConfigPersistence_tearDown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tearDown");
}

- (void)dealloc
{
  objc_super v3;

  -[GEOConfigPersistence tearDown](self, "tearDown");
  v3.receiver = self;
  v3.super_class = (Class)GEOConfigPersistence;
  -[GEOConfigPersistence dealloc](&v3, sel_dealloc);
}

+ (BOOL)_migrateDates:(id)a3 withConverter:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  char v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[4];
  id v29;
  char v30;
  char v31;
  char v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "prepareStatement:forKey:", "SELECT rowid, key, value FROM defaults WHERE type = 'date'", CFSTR("find_dates"));
  v8 = objc_msgSend(v5, "prepareStatement:forKey:", "UPDATE defaults SET value = @value WHERE rowid = @rowid ", CFSTR("update_date"));
  v9 = objc_msgSend(v5, "prepareStatement:forKey:", "DELETE FROM defaults    WHERE rowid = @rowid;",
         CFSTR("delete_date"));
  v10 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke;
  v28[3] = &unk_1E1BFF720;
  v30 = v7;
  v11 = v5;
  v29 = v11;
  v31 = v8;
  v32 = v9;
  v12 = MEMORY[0x18D765024](v28);
  v13 = (void (**)(_QWORD))v12;
  if ((v7 & v8 & v9 & 1) != 0)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    v27 = 0;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke_135;
    v18[3] = &unk_1E1BFF798;
    v21 = &v22;
    v19 = v11;
    v20 = v6;
    v14 = objc_msgSend(v19, "statementForKey:statementBlock:", CFSTR("find_dates"), v18);
    if (v23[5])
    {
      j__GEOGetUserDefaultsLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = v23[5];
        *(_DWORD *)buf = 138543362;
        v34 = v16;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Got error during date migration: %{public}@", buf, 0xCu);
      }

    }
    v13[2](v13);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
    v14 = 0;
  }

  return v14;
}

uint64_t __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 40))
    result = objc_msgSend(*(id *)(result + 32), "clearStatement:", CFSTR("find_dates"));
  if (*(_BYTE *)(v1 + 41))
    result = objc_msgSend(*(id *)(v1 + 32), "clearStatement:", CFSTR("update_date"));
  if (*(_BYTE *)(v1 + 42))
    return objc_msgSend(*(id *)(v1 + 32), "clearStatement:", CFSTR("delete_date"));
  return result;
}

BOOL __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke_135(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  void *v21;
  id obj;
  _QWORD v24[4];
  _QWORD v25[3];
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = sqlite3_step(a2);
  if ((_DWORD)v4 == 100)
  {
    v5 = MEMORY[0x1E0C809B0];
    while (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
      objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 1, a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 2, a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = *(void **)(a1 + 32);
        v26[0] = v5;
        v26[1] = 3221225472;
        v26[2] = __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke_2;
        v26[3] = &unk_1E1BFF748;
        v11 = v10;
        v12 = *(_QWORD *)(a1 + 48);
        v27 = v11;
        v29 = v12;
        v30 = v6;
        v28 = v9;
        objc_msgSend(v11, "executeStatement:statementBlock:", CFSTR("update_date"), v26);

        v13 = &v27;
      }
      else
      {
        j__GEOGetUserDefaultsLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v32 = v8;
          v33 = 2112;
          v34 = v7;
          _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "Unable to parse date \"%{public}@\" for key %{publid}@, deleting instead.", buf, 0x16u);
        }

        v15 = *(void **)(a1 + 32);
        v24[0] = v5;
        v24[1] = 3221225472;
        v24[2] = __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke_139;
        v24[3] = &unk_1E1BFF770;
        v16 = v15;
        v17 = *(_QWORD *)(a1 + 48);
        v25[0] = v16;
        v25[1] = v17;
        v25[2] = v6;
        objc_msgSend(v16, "executeStatement:statementBlock:", CFSTR("delete_date"), v24);
        v13 = (id *)v25;
      }

      v4 = sqlite3_step(a2);
      if ((_DWORD)v4 != 100)
        goto LABEL_12;
    }
    v4 = 100;
  }
LABEL_12:
  if ((_DWORD)v4 != 101)
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(_QWORD *)(v18 + 40);
    v19 = (id *)(v18 + 40);
    if (!v20)
    {
      v21 = *(void **)(a1 + 32);
      obj = 0;
      objc_msgSend(v21, "reportSQLiteErrorCode:method:error:", v4, CFSTR("step"), &obj);
      objc_storeStrong(v19, obj);
    }
  }
  return (_DWORD)v4 == 101;
}

uint64_t __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  id obj;

  v4 = (void *)a1[4];
  v5 = a1[7];
  v6 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindInt64Parameter:toValue:inStatement:error:", "@rowid", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = (void *)a1[4];
  v9 = a1[5];
  v10 = *(_QWORD *)(a1[6] + 8);
  v13 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindTextParameter:toValue:inStatement:error:", "@value", v9, a2, &v13);
  objc_storeStrong((id *)(v10 + 40), v13);
  return v11;
}

uint64_t __52__GEOConfigPersistence__migrateDates_withConverter___block_invoke_139(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v2 = a1[6];
  v3 = (void *)a1[4];
  v4 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v3, "bindInt64Parameter:toValue:inStatement:error:", "@rowid", v2, a2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

+ (BOOL)_setup:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  int v16;
  int v17;
  NSObject *v18;
  BOOL v19;
  int v21;
  NSObject *v22;
  char *errmsg;
  _QWORD v24[6];
  uint8_t buf[8];
  __int128 v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "user_version");
  v6 = v5;
  if ((unint64_t)(v5 - 1) < 2)
    goto LABEL_5;
  v7 = 0;
  if (v5 == 3)
    goto LABEL_7;
  if (!v5)
  {
    sqlite3_exec((sqlite3 *)objc_msgSend(v4, "sqliteDB"), "DROP TABLE defaults_from_companion", 0, 0, 0);
LABEL_5:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v26 = buf;
    *((_QWORD *)&v26 + 1) = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    v29 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __31__GEOConfigPersistence__setup___block_invoke;
    v24[3] = &unk_1E1BFF7C0;
    v24[4] = buf;
    v24[5] = v6;
    v8 = objc_msgSend(a1, "_migrateDates:withConverter:", v4, v24);
    _Block_object_dispose(buf, 8);

    v7 = v8 ^ 1;
  }
  objc_msgSend(v4, "setUser_version:", 3);
LABEL_7:
  j__GEOGetUserDefaultsLog();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v11 = v10;
  if (v7)
    v12 = "DROP TABLE defaults";
  else
    v12 = 0;
  if (!objc_msgSend(v10, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS defaults(   rowid INTEGER PRIMARY KEY NOT NULL,    key TEXT NOT NULL,    parent INT REFERENCES defaults(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    type TEXT NOT NULL,    value TEXT,    UNIQUE(key, parent)   );",
                        v12)
    || (!v7 ? (v13 = 0) : (v13 = "DROP TABLE defaults_xpc"),
        !objc_msgSend(v11, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS defaults_xpc(   rowid INTEGER PRIMARY KEY NOT NULL,    key TEXT NOT NULL,    parent INT REFERENCES defaults_xpc(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    type TEXT NOT NULL,    value TEXT,    UNIQUE(key, parent)   );",
                         v13)
     || (!v7 ? (v14 = 0) : (v14 = "DROP TABLE defaults_from_companion"),
         !objc_msgSend(v11, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS defaults_from_companion(   rowid INTEGER PRIMARY KEY NOT NULL,    key TEXT NOT NULL,    parent INT REFERENCES defaults_from_companion(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    type TEXT NOT NULL,    value TEXT,    UNIQUE(key, parent)   );",
                          v14)
      || (!v7 ? (v15 = 0) : (v15 = "DROP TABLE auto_expire"),
          !objc_msgSend(v11, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS auto_expire(   key_path TEXT PRIMARY KEY NOT NULL,    expire_time INT,    expire_os_version TEXT   );",
                           v15)
       || !objc_msgSend(v11, "prepareStatement:forKey:", "INSERT INTO defaults    (rowid, key, parent, type, value)    VALUES (@rowid, @key, @parent, @type, @value);",
                           CFSTR("AddValue"))
       || !objc_msgSend(v11, "prepareStatement:forKey:", "UPDATE defaults    SET type = @type, value = @value    WHERE rowid = @rowid;",
                           CFSTR("SetValue"))
       || !objc_msgSend(v11, "prepareStatement:forKey:", "DELETE FROM defaults    WHERE rowid = @rowid;",
                           CFSTR("ClearValue"))
       || !objc_msgSend(v11, "prepareStatement:forKey:", "SELECT rowid, key, type, value, parent    FROM defaults    ORDER BY parent, rowid;",
                           CFSTR("ListValues"))
       || !objc_msgSend(v11, "prepareStatement:forKey:", "INSERT INTO defaults_xpc    (rowid, key, parent, type, value)    VALUES (@rowid, @key, @parent, @type, @value);",
                           CFSTR("AddXPCValue"))
       || !objc_msgSend(v11, "prepareStatement:forKey:", "UPDATE defaults_xpc    SET type = @type, value = @value    WHERE rowid = @rowid;",
                           CFSTR("SetXPCValue"))
       || !objc_msgSend(v11, "prepareStatement:forKey:", "DELETE FROM defaults_xpc    WHERE rowid = @rowid;",
                           CFSTR("ClearXPCValue"))
       || !objc_msgSend(v11, "prepareStatement:forKey:", "SELECT rowid, key, type, value, parent    FROM defaults_xpc    ORDER BY parent, rowid;",
                           CFSTR("ListXPCValues"))
       || !objc_msgSend(v11, "prepareStatement:forKey:", "INSERT INTO defaults_from_companion    (rowid, key, parent, type, value)    VALUES (@rowid, @key, @parent, @type, @value);",
                           CFSTR("AddCompanionValue"))
       || !objc_msgSend(v11, "prepareStatement:forKey:", "UPDATE defaults_from_companion    SET type = @type, value = @value    WHERE rowid = @rowid;",
                           CFSTR("SetCompanionValue"))
       || !objc_msgSend(v11, "prepareStatement:forKey:", "DELETE FROM defaults_from_companion    WHERE rowid = @rowid;",
                           CFSTR("ClearCompanionValue"))
       || !objc_msgSend(v11, "prepareStatement:forKey:", "SELECT rowid, key, type, value, parent    FROM defaults_from_companion    ORDER BY parent, rowid;",
                           CFSTR("ListCompanionValues"))
       || !objc_msgSend(v11, "prepareStatement:forKey:", "INSERT OR REPLACE INTO auto_expire    (key_path, expire_time, expire_os_version)    VALUES (@key_path, @expire_time, @expire_os_version);",
                           CFSTR("SetExpire"))
       || (objc_msgSend(v11, "prepareStatement:forKey:", "DELETE FROM auto_expire    WHERE key_path = @key_path;",
             CFSTR("ClearExpireForKey")) & 1) == 0))))
  {

    goto LABEL_42;
  }
  v16 = objc_msgSend(v11, "prepareStatement:forKey:", "SELECT key_path, expire_time, expire_os_version    FROM auto_expire;",
          CFSTR("GetAllExpired"));

  if (!v16)
  {
LABEL_42:
    v19 = 0;
    goto LABEL_43;
  }
  errmsg = 0;
  v17 = sqlite3_exec((sqlite3 *)objc_msgSend(v11, "sqliteDB"), "INSERT OR IGNORE INTO defaults (rowid, key, type, value, parent)  VALUES(0, 'root', 'dict', NULL, 0)", 0, 0, &errmsg);
  if (v17)
  {
    j__GEOGetUserDefaultsLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v17;
      LOWORD(v26) = 2080;
      *(_QWORD *)((char *)&v26 + 2) = errmsg;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "Unable to create root node in defaults table %d: %s", buf, 0x12u);
    }

    goto LABEL_42;
  }
  errmsg = 0;
  v21 = sqlite3_exec((sqlite3 *)objc_msgSend(v11, "sqliteDB"), "INSERT OR IGNORE INTO defaults_xpc (rowid, key, type, value, parent)  VALUES(0, 'root', 'dict', NULL, 0)", 0, 0, &errmsg);
  v19 = v21 == 0;
  if (v21)
  {
    j__GEOGetUserDefaultsLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v21;
      LOWORD(v26) = 2080;
      *(_QWORD *)((char *)&v26 + 2) = errmsg;
      _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_ERROR, "Unable to create root node in defaults_xpc table %d: %s", buf, 0x12u);
    }

  }
LABEL_43:

  return v19;
}

id __31__GEOConfigPersistence__setup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    if (*(uint64_t *)(a1 + 40) > 1)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    else
    {
      v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDateFormat:", CFSTR("yyyy.MM.dd HH:mm:ss Z"));
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateFromString:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)setExpire:(id)a3
{
  id v4;
  void *v5;
  _GEOConfigCache *keyExpiryCache;
  id v7;
  _GEOConfigDBOperationQueue *operationQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    keyExpiryCache = self->_keyExpiryCache;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __34__GEOConfigPersistence_setExpire___block_invoke;
    v10[3] = &unk_1E1BFF7E8;
    v7 = v4;
    v11 = v7;
    -[_GEOConfigCache withCache:](keyExpiryCache, "withCache:", v10);
    operationQueue = self->_operationQueue;
    v9 = -[_GEOConfigDBUpdateExpireOperation init:expire:]([_GEOConfigDBUpdateExpireOperation alloc], "init:expire:", self->_db, v7);
    -[_GEOConfigDBOperationQueue enqueueOperation:](operationQueue, "enqueueOperation:", v9);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: expire != ((void *)0)", buf, 2u);
  }

}

void __34__GEOConfigPersistence_setExpire___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "keyPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

}

- (void)clearExpirationForKeyPath:(id)a3
{
  id v4;
  _GEOConfigCache *keyExpiryCache;
  _GEOConfigDBOperationQueue *operationQueue;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  keyExpiryCache = self->_keyExpiryCache;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__GEOConfigPersistence_clearExpirationForKeyPath___block_invoke;
  v9[3] = &unk_1E1BFF7E8;
  v10 = v4;
  v8 = v4;
  -[_GEOConfigCache withCache:](keyExpiryCache, "withCache:", v9);
  operationQueue = self->_operationQueue;
  v7 = -[_GEOConfigDBClearExpireOperation init:keyPath:]([_GEOConfigDBClearExpireOperation alloc], "init:keyPath:", self->_db, v8);
  -[_GEOConfigDBOperationQueue enqueueOperation:](operationQueue, "enqueueOperation:", v7);

}

uint64_t __50__GEOConfigPersistence_clearExpirationForKeyPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
}

- (id)_getExpiredKeyPathsOlderThanTime:(id)a3 osVersion:(id)a4 from:(id)a5
{
  id v7;
  __CFString *v8;
  id v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (__CFString *)a4;
  v9 = a5;
  if (v7)
    goto LABEL_4;
  if (-[__CFString length](v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
    v10 = -[__CFString length](v8, "length");
    v11 = CFSTR("9999Z999999z");
    if (v10)
      v11 = v8;
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v9, "allValues", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v19, "_isExpiredRelativeTo:osVersion:", v7, v12))
          {
            objc_msgSend(v19, "keyPath");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v20);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v16);
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: date != ((void *)0) || osVersion.length > 0", buf, 2u);
  }
  v13 = (void *)MEMORY[0x1E0C9AA60];
  v12 = v8;
LABEL_16:

  return v13;
}

- (id)_getExpiredKeyPathsOlderThanTime:(id)a3 osVersion:(id)a4
{
  id v6;
  id v7;
  _GEOConfigCache *keyExpiryCache;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  keyExpiryCache = self->_keyExpiryCache;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__GEOConfigPersistence__getExpiredKeyPathsOlderThanTime_osVersion___block_invoke;
  v13[3] = &unk_1E1BFF860;
  v16 = &v17;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  -[_GEOConfigCache withCache:](keyExpiryCache, "withCache:", v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __67__GEOConfigPersistence__getExpiredKeyPathsOlderThanTime_osVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_getExpiredKeyPathsOlderThanTime:osVersion:from:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_pruneExpiredKeyPathsOlderThanTime:(id)a3 osVersion:(id)a4
{
  id v6;
  id v7;
  _GEOConfigCache *keyExpiryCache;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  keyExpiryCache = self->_keyExpiryCache;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__GEOConfigPersistence__pruneExpiredKeyPathsOlderThanTime_osVersion___block_invoke;
  v11[3] = &unk_1E1BFF888;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_GEOConfigCache withCache:](keyExpiryCache, "withCache:", v11);

}

void __69__GEOConfigPersistence__pruneExpiredKeyPathsOlderThanTime_osVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_getExpiredKeyPathsOlderThanTime:osVersion:from:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v9);
        v10 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        v11 = -[_GEOConfigDBClearExpireOperation init:keyPath:]([_GEOConfigDBClearExpireOperation alloc], "init:keyPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v9);
        objc_msgSend(v10, "enqueueOperation:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (id)getExpiredKeyPathsOlderThanTime:(id)a3
{
  return -[GEOConfigPersistence _getExpiredKeyPathsOlderThanTime:osVersion:](self, "_getExpiredKeyPathsOlderThanTime:osVersion:", a3, 0);
}

- (void)pruneExpiredKeyPathsOlderThanTime:(id)a3
{
  -[GEOConfigPersistence _pruneExpiredKeyPathsOlderThanTime:osVersion:](self, "_pruneExpiredKeyPathsOlderThanTime:osVersion:", a3, 0);
}

- (id)getExpiredKeyPathsOlderThanOSVersion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buildVersion");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  -[GEOConfigPersistence _getExpiredKeyPathsOlderThanTime:osVersion:](self, "_getExpiredKeyPathsOlderThanTime:osVersion:", 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)pruneExpiredKeyPathsOlderThanOSVersion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    v4 = v7;
  }
  else
  {
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buildVersion");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  v8 = v4;
  -[GEOConfigPersistence _pruneExpiredKeyPathsOlderThanTime:osVersion:](self, "_pruneExpiredKeyPathsOlderThanTime:osVersion:", 0, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_keyExpiryCache, 0);
  objc_storeStrong((id *)&self->_xpcConfigDB, 0);
  objc_storeStrong((id *)&self->_configDB, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
