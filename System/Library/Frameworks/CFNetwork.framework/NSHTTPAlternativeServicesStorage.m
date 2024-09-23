@implementation NSHTTPAlternativeServicesStorage

void __66___NSHTTPAlternativeServicesStorage_HTTPServiceEntriesWithFilter___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;
  sqlite3_stmt *v7;
  id v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  sqlite3_stmt *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  sqlite3_stmt **v20;
  uint64_t v21;
  int v22;
  sqlite3_stmt *v23;
  void *v24;
  uint64_t v25;
  id v26;
  int v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:](*(_QWORD *)(a1 + 32), 1))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 40), "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

    }
    else if (!objc_msgSend(*(id *)(a1 + 40), "port"))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v18 = (id)CFNLog::logger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v27) = 0;
        _os_log_debug_impl(&dword_183ECA000, v18, OS_LOG_TYPE_DEBUG, "Query with empty filter. Returning all entries from the database", (uint8_t *)&v27, 2u);
      }

      v19 = *(_QWORD *)(a1 + 32);
      if (!*(_QWORD *)(v19 + 64))
      {
        v22 = sqlite3_prepare_v2(*(sqlite3 **)(v19 + 48), "SELECT * from alt_services where expires_time > strftime('%s','now')", -1, (sqlite3_stmt **)(v19 + 64), 0);
        if (v22)
        {
          if (CFNLog::onceToken != -1)
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
          v10 = (id)CFNLog::logger;
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          v27 = 67109120;
          LODWORD(v28) = v22;
          v12 = "Failed to get all entries from the alt_services storage. Error = %d";
          v13 = v10;
          v14 = 8;
          goto LABEL_34;
        }
        v19 = *(_QWORD *)(a1 + 32);
      }
      v20 = (sqlite3_stmt **)(v19 + 64);
      goto LABEL_41;
    }
    v4 = *(_QWORD *)(a1 + 32);
    v7 = *(sqlite3_stmt **)(v4 + 72);
    v5 = (sqlite3_stmt **)(v4 + 72);
    v6 = v7;
    if (!v7)
    {
      if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 48), "SELECT * from alt_services WHERE host = ? AND partition = ? AND port = ? AND expires_time > strftime('%s','now')", -1, v5, 0))
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v10 = (id)CFNLog::logger;
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          goto LABEL_46;
        LOWORD(v27) = 0;
        v12 = "Failed to init the selectEntriesStmt statement for alt_services";
        v13 = v10;
        v14 = 2;
        goto LABEL_34;
      }
      v6 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72);
    }
    objc_msgSend(*(id *)(a1 + 40), "host");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = sqlite3_bind_text(v6, 1, (const char *)objc_msgSend(v8, "UTF8String"), -1, 0);

    if (v9)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v10 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_46;
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      v27 = 138412290;
      v28 = v11;
      v12 = "Failed to bind host (%@) to the select statement";
      goto LABEL_33;
    }
    v15 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(*(id *)(a1 + 40), "partition");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LODWORD(v15) = sqlite3_bind_text(v15, 2, (const char *)objc_msgSend(v16, "UTF8String"), -1, 0);

    if ((_DWORD)v15)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v10 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_46;
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      v27 = 138412290;
      v28 = v17;
      v12 = "Failed to bind partition (%@) to the select statement";
      goto LABEL_33;
    }
    if (sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72), 3, objc_msgSend(*(id *)(a1 + 40), "port")))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v10 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_46;
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      v27 = 138412290;
      v28 = v21;
      v12 = "Failed to bind port name (%@) to the select statement";
LABEL_33:
      v13 = v10;
      v14 = 12;
LABEL_34:
      _os_log_error_impl(&dword_183ECA000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v27, v14);
LABEL_46:

      return;
    }
    v20 = (sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 72);
LABEL_41:
    v23 = *v20;
    if (*v20)
    {
      while (sqlite3_step(v23) == 100)
      {
        -[_NSHTTPAlternativeServicesStorage _onqueue_convertSqlRowToHTTPAlternativeServiceEntry:](*(_QWORD *)(a1 + 32), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v24);

      }
      sqlite3_reset(v23);
    }
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v26 = v2;
    v10 = *(NSObject **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v26;
    goto LABEL_46;
  }
}

uint64_t __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  sqlite3_stmt **v4;
  sqlite3_stmt *v5;
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  sqlite3_stmt *v13;
  id v14;
  void *v15;
  sqlite3_stmt *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  sqlite3_int64 v21;
  void *v22;
  void *v23;
  double v24;
  sqlite3_int64 v25;
  NSObject *v27;
  void *v28;
  void *v29;
  const char *v30;
  _QWORD v31[2];
  void (*v32)(double, uint64_t);
  void *v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:](*(_QWORD *)(a1 + 32), 0);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 26))
  {
    __retainStorageAssertion(*(void **)(v2 + 16));
    v2 = *(_QWORD *)(a1 + 32);
  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v32 = __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_3;
  v33 = &unk_1E14FE118;
  v34 = v2;
  v3 = *(id *)(a1 + 40);
  if (v2)
  {
    v4 = (sqlite3_stmt **)(v2 + 88);
    v5 = *(sqlite3_stmt **)(v2 + 88);
    if (!v5)
    {
      if (sqlite3_prepare_v2(*(sqlite3 **)(v2 + 48), "INSERT OR REPLACE INTO alt_services(partition, host, alternateHost, port, alternatePort, type, creation_time, expires_time, rowid) \t\tvalues (?, ?, ?, ?, ?, ?, ?, ?, (SELECT max(rowid) FROM alt_services)+1)", -1, (sqlite3_stmt **)(v2 + 88), 0))
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v8 = (id)CFNLog::logger;
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_53;
        *(_WORD *)buf = 0;
        v10 = "Failed to init the insert statement for alt_services";
        v11 = v8;
        v12 = 2;
        goto LABEL_15;
      }
      v5 = *v4;
    }
    objc_msgSend(v3, "partition");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0);

    if (v7)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v8 = (id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "partition");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = (uint64_t)v9;
        _os_log_error_impl(&dword_183ECA000, v8, OS_LOG_TYPE_ERROR, "Failed to bind partition (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_53;
    }
    v13 = *v4;
    objc_msgSend(v3, "host");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LODWORD(v13) = sqlite3_bind_text(v13, 2, (const char *)objc_msgSend(v14, "UTF8String"), -1, 0);

    if ((_DWORD)v13)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v8 = (id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "host");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = (uint64_t)v15;
        _os_log_error_impl(&dword_183ECA000, v8, OS_LOG_TYPE_ERROR, "Failed to bind host (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_53;
    }
    v16 = *v4;
    objc_msgSend(v3, "alternateHost");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LODWORD(v16) = sqlite3_bind_text(v16, 3, (const char *)objc_msgSend(v17, "UTF8String"), -1, 0);

    if ((_DWORD)v16)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v8 = (id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "alternateHost");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = (uint64_t)v18;
        _os_log_error_impl(&dword_183ECA000, v8, OS_LOG_TYPE_ERROR, "Failed to bind alternateHost (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_53;
    }
    if (sqlite3_bind_int(*v4, 4, objc_msgSend(v3, "port")))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v8 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_53;
      *(_DWORD *)buf = 134217984;
      v36 = objc_msgSend(v3, "port");
      v10 = "Failed to bind port (%lu) to the select statement";
      goto LABEL_42;
    }
    if (sqlite3_bind_int(*v4, 5, objc_msgSend(v3, "alternatePort")))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v8 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_53;
      *(_DWORD *)buf = 134217984;
      v36 = objc_msgSend(v3, "alternatePort");
      v10 = "Failed to bind alternatePort (%lu) to the select statement";
      goto LABEL_42;
    }
    if (sqlite3_bind_int(*v4, 6, objc_msgSend(v3, "serviceType")))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v8 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_53;
      *(_DWORD *)buf = 134217984;
      v36 = objc_msgSend(v3, "serviceType");
      v10 = "Failed to bind serviceType (%lu) to the select statement";
LABEL_42:
      v11 = v8;
      v12 = 12;
LABEL_15:
      _os_log_error_impl(&dword_183ECA000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
LABEL_53:

      goto LABEL_54;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSince1970");
    v21 = vcvtmd_u64_f64(v20);

    if (sqlite3_bind_int64(*v4, 7, v21))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v8 = (id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = (uint64_t)v22;
        _os_log_error_impl(&dword_183ECA000, v8, OS_LOG_TYPE_ERROR, "Failed to bind creationDate (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_53;
    }
    objc_msgSend(v3, "expirationDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSince1970");
    v25 = vcvtmd_u64_f64(v24);

    if (sqlite3_bind_int64(*v4, 8, v25))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v8 = (id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "expirationDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = (uint64_t)v28;
        _os_log_error_impl(&dword_183ECA000, v8, OS_LOG_TYPE_ERROR, "Failed to bind expiryDate (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_53;
    }
    if (sqlite3_step(*v4) != 101)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v27 = (id)CFNLog::logger;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "host");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = sqlite3_errmsg(*(sqlite3 **)(v2 + 48));
        *(_DWORD *)buf = 138412546;
        v36 = (uint64_t)v29;
        v37 = 2080;
        v38 = v30;
        _os_log_error_impl(&dword_183ECA000, v27, OS_LOG_TYPE_ERROR, "Failed to insert alt_service entry %@ into db. Error= %s", buf, 0x16u);

      }
    }
    sqlite3_reset(*v4);
  }
LABEL_54:

  return ((uint64_t (*)(_QWORD *))v32)(v31);
}

void __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_3(double a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(_QWORD *)(a2 + 32) + 26))
    __releaseStorageAssertion(a1);
}

void __60___NSHTTPAlternativeServicesStorage__onqueue_garbageCollect__block_invoke(double a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(_QWORD *)(a2 + 32) + 26))
    __releaseStorageAssertion(a1);
}

void __60___NSHTTPAlternativeServicesStorage__createDBSchemaForPath___block_invoke(double a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(_QWORD *)(a2 + 32) + 26))
    __releaseStorageAssertion(a1);
}

uint64_t __75___NSHTTPAlternativeServicesStorage__onqueue_initializeDatabaseIfNotEmpty___block_invoke(uint64_t a1)
{
  return -[_NSHTTPAlternativeServicesStorage _onqueue_garbageCollect](*(_QWORD *)(a1 + 32));
}

void __58___NSHTTPAlternativeServicesStorage_sharedPersistentStore__block_invoke()
{
  NSObject *v0;
  _NSHTTPAlternativeServicesStorage *v1;
  void *v2;
  uint8_t v3[16];

  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v0 = (id)CFNLog::logger;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_183ECA000, v0, OS_LOG_TYPE_DEFAULT, "Initializing AlternativeServices Storage singleton", v3, 2u);
  }

  v1 = objc_alloc_init(_NSHTTPAlternativeServicesStorage);
  v2 = (void *)sAltServiceSharedInstance;
  sAltServiceSharedInstance = (uint64_t)v1;

}

uint64_t __89___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesCreatedAfterDate___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  double v5;
  sqlite3_int64 v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  uint64_t v12;
  _QWORD v13[2];
  void (*v14)(double, uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = -[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:](*(_QWORD *)(a1 + 32), 1);
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v3 + 26))
    {
      __retainStorageAssertion(*(void **)(v3 + 16));
      v3 = *(_QWORD *)(a1 + 32);
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v14 = __89___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesCreatedAfterDate___block_invoke_2;
    v15 = &unk_1E14FE118;
    v16 = v3;
    if (*(_QWORD *)(v3 + 96)
      || !sqlite3_prepare_v2(*(sqlite3 **)(v3 + 48), "DELETE FROM alt_services WHERE creation_time > ?", -1, (sqlite3_stmt **)(v3 + 96), 0))
    {
      v4 = *(void **)(a1 + 40);
      if (v4)
      {
        objc_msgSend(v4, "timeIntervalSince1970");
        v6 = vcvtmd_u64_f64(v5);
      }
      else
      {
        v6 = 0x8000000000000000;
      }
      if (!sqlite3_bind_int64(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96), 1, v6))
      {
        v11 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
        sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 96));
        if (v11 == 101)
          return ((uint64_t (*)(_QWORD *))v14)(v13);
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v7 = (id)CFNLog::logger;
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
LABEL_24:

          return ((uint64_t (*)(_QWORD *))v14)(v13);
        }
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        v8 = "Failed to delete alt_service entries before date %@";
        v9 = v7;
        v10 = 12;
LABEL_19:
        _os_log_error_impl(&dword_183ECA000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
        goto LABEL_24;
      }
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v7 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v8 = "Failed to bind date to the delte statement";
    }
    else
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v7 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v8 = "Failed to init the deleteStmt statement for alt_services";
    }
    v9 = v7;
    v10 = 2;
    goto LABEL_19;
  }
  return result;
}

void __89___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesCreatedAfterDate___block_invoke_2(double a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(_QWORD *)(a2 + 32) + 26))
    __releaseStorageAssertion(a1);
}

uint64_t __94___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithRegistrableDomain___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  sqlite3_stmt *v4;
  int v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  _QWORD v14[2];
  void (*v15)(double, uint64_t);
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  result = -[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:](*(_QWORD *)(a1 + 32), 1);
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v3 + 26))
    {
      __retainStorageAssertion(*(void **)(v3 + 16));
      v3 = *(_QWORD *)(a1 + 32);
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v15 = __94___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithRegistrableDomain___block_invoke_2;
    v16 = &unk_1E14FE118;
    v17 = v3;
    v4 = *(sqlite3_stmt **)(v3 + 112);
    if (!v4)
    {
      if (sqlite3_prepare_v2(*(sqlite3 **)(v3 + 48), "DELETE FROM alt_services WHERE host LIKE ('%' || ?) OR partition LIKE ('%' || ?)", -1, (sqlite3_stmt **)(v3 + 112), 0))
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v7 = (id)CFNLog::logger;
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        *(_WORD *)buf = 0;
        v9 = "Failed to init the deleteStmt statement for alt_services";
        goto LABEL_15;
      }
      v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112);
    }
    v5 = sqlite3_bind_text(v4, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    v6 = v5 != 0;
    if (v5)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v7 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 1024;
      v21 = v6;
      v9 = "Failed to bind host (%@) to the delete statement. r = %d";
      v10 = v7;
      v11 = 18;
      goto LABEL_21;
    }
    if (sqlite3_bind_text(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112), 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v7 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      v9 = "Failed to bind the partition (%@) to the delete statement";
      v10 = v7;
      v11 = 12;
      goto LABEL_21;
    }
    v13 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112));
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 112));
    if (v13 == 101)
      return ((uint64_t (*)(_QWORD *))v15)(v14);
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v7 = (id)CFNLog::logger;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      return ((uint64_t (*)(_QWORD *))v15)(v14);
    }
    *(_WORD *)buf = 0;
    v9 = "Failed to delete alt_service entries";
LABEL_15:
    v10 = v7;
    v11 = 2;
LABEL_21:
    _os_log_error_impl(&dword_183ECA000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    goto LABEL_27;
  }
  return result;
}

void __94___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithRegistrableDomain___block_invoke_2(double a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(_QWORD *)(a2 + 32) + 26))
    __releaseStorageAssertion(a1);
}

uint64_t __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {

    goto LABEL_5;
  }
  v5 = objc_msgSend(v3, "port");
  v6 = *(_QWORD *)(a1 + 40);

  if (v5 != v6)
  {
LABEL_5:
    v7 = 1;
    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

uint64_t __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  sqlite3_stmt *v4;
  int v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;
  int v15;
  _QWORD v16[2];
  void (*v17)(double, uint64_t);
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  result = -[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:](*(_QWORD *)(a1 + 32), 1);
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v3 + 26))
    {
      __retainStorageAssertion(*(void **)(v3 + 16));
      v3 = *(_QWORD *)(a1 + 32);
    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v17 = __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke_3;
    v18 = &unk_1E14FE118;
    v19 = v3;
    v4 = *(sqlite3_stmt **)(v3 + 104);
    if (!v4)
    {
      if (sqlite3_prepare_v2(*(sqlite3 **)(v3 + 48), "DELETE FROM alt_services WHERE (host = ? AND port = ?)", -1, (sqlite3_stmt **)(v3 + 104), 0))
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v7 = (id)CFNLog::logger;
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_28;
        *(_WORD *)buf = 0;
        v9 = "Failed to init the deleteStmt statement for alt_services";
        goto LABEL_15;
      }
      v4 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104);
    }
    v5 = sqlite3_bind_text(v4, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    v6 = v5 != 0;
    if (v5)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v7 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      v22 = 1024;
      v23 = v6;
      v9 = "Failed to bind host (%@) to the delete statement. r = %d";
      goto LABEL_21;
    }
    v12 = sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104), 2, *(_DWORD *)(a1 + 48));
    v13 = v12 != 0;
    if (v12)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v7 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218240;
      v21 = v14;
      v22 = 1024;
      v23 = v13;
      v9 = "Failed to bind port (%lu) to the delete statement. r = %d";
LABEL_21:
      v10 = v7;
      v11 = 18;
      goto LABEL_22;
    }
    v15 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104));
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 104));
    if (v15 == 101)
      return ((uint64_t (*)(_QWORD *))v17)(v16);
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v7 = (id)CFNLog::logger;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_28:

      return ((uint64_t (*)(_QWORD *))v17)(v16);
    }
    *(_WORD *)buf = 0;
    v9 = "Failed to delete alt_service entries";
LABEL_15:
    v10 = v7;
    v11 = 2;
LABEL_22:
    _os_log_error_impl(&dword_183ECA000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    goto LABEL_28;
  }
  return result;
}

void __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke_3(double a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(_QWORD *)(a2 + 32) + 26))
    __releaseStorageAssertion(a1);
}

uint64_t __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  v4 = v3;
  if (v3)
    v5 = (void *)v3[1];
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", v7))
  {

LABEL_9:
    v10 = 1;
    goto LABEL_10;
  }
  if (v4)
    v8 = v4[2];
  else
    v8 = 0;
  v9 = objc_msgSend(*(id *)(a1 + 32), "port");

  if (v8 != v9)
    goto LABEL_9;
  v10 = 0;
LABEL_10:

  return v10;
}

uint64_t __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = -[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:](*(_QWORD *)(a1 + 32), 1);
  if ((_DWORD)result)
    return -[_NSHTTPAlternativeServicesStorage _onqueue_garbageCollect](*(_QWORD *)(a1 + 32));
  return result;
}

void __44___NSHTTPAlternativeServicesStorage_entries__block_invoke(uint64_t a1)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(sqlite3_stmt **)(v2 + 56);
  if (v3)
  {
LABEL_11:
    while (sqlite3_step(v3) == 100)
    {
      v5 = *(void **)(a1 + 40);
      -[_NSHTTPAlternativeServicesStorage _onqueue_convertSqlRowToHTTPAlternativeServiceEntry:](*(_QWORD *)(a1 + 32), *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

      v3 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56));
    return;
  }
  if (!sqlite3_prepare_v2(*(sqlite3 **)(v2 + 48), "SELECT * from alt_services;", -1, (sqlite3_stmt **)(v2 + 56), 0))
  {
    v3 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 56);
    if (!v3)
      return;
    goto LABEL_11;
  }
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v4 = (id)CFNLog::logger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl(&dword_183ECA000, v4, OS_LOG_TYPE_ERROR, "Failed to init the selectAllEntriesStmt statement for alt_services", v7, 2u);
  }

}

void __77___NSHTTPAlternativeServicesStorage_HTTPServiceEntriesWithRegistrableDomain___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  sqlite3_stmt **v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:](*(_QWORD *)(a1 + 32), 1))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = *(_QWORD *)(a1 + 32);
    v6 = *(sqlite3_stmt **)(v3 + 80);
    v4 = (sqlite3_stmt **)(v3 + 80);
    v5 = v6;
    if (!v6)
    {
      if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 48), "SELECT * from alt_services WHERE host LIKE ('%' || ?) OR partition LIKE ('%' || ?)", -1, v4, 0))
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v8 = (id)CFNLog::logger;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v14) = 0;
          _os_log_error_impl(&dword_183ECA000, v8, OS_LOG_TYPE_ERROR, "Failed to init the selectEntriesStmt statement for alt_services", (uint8_t *)&v14, 2u);
        }

        goto LABEL_24;
      }
      v5 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80);
    }
    if (sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v7 = (id)CFNLog::logger;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
        v14 = 138412290;
        v15 = v12;
        _os_log_error_impl(&dword_183ECA000, v7, OS_LOG_TYPE_ERROR, "Failed to bind host (%@) to the select statement", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      if (!sqlite3_bind_text(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80), 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0))
      {
        while (1)
        {
          v10 = sqlite3_step(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 80));
          v11 = *(_QWORD *)(a1 + 32);
          if (v10 != 100)
            break;
          -[_NSHTTPAlternativeServicesStorage _onqueue_convertSqlRowToHTTPAlternativeServiceEntry:](v11, *(sqlite3_stmt **)(v11 + 80));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v9);

        }
        sqlite3_reset(*(sqlite3_stmt **)(v11 + 80));
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);
        goto LABEL_24;
      }
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v7 = (id)CFNLog::logger;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
        v14 = 138412290;
        v15 = v13;
        _os_log_error_impl(&dword_183ECA000, v7, OS_LOG_TYPE_ERROR, "Failed to bind partition (%@) to the select statement", (uint8_t *)&v14, 0xCu);
      }
    }

LABEL_24:
  }
}

@end
