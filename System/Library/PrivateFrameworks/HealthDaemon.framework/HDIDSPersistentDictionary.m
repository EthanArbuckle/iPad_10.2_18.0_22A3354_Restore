@implementation HDIDSPersistentDictionary

- (void)didSendRequest:(id)a3 deviceID:(id)a4 type:(int)a5 length:(int64_t)a6
{
  -[HDIDSPersistentDictionary _recordMessage:deviceID:type:outgoing:request:length:]((uint64_t)self, a3, a4, a5, 1, 1, a6);
}

- (void)_recordMessage:(void *)a3 deviceID:(int)a4 type:(int)a5 outgoing:(int)a6 request:(uint64_t)a7 length:
{
  id v13;
  id v14;
  CFAbsoluteTime Current;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  char v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  CFAbsoluteTime v39;
  uint64_t v40;
  int v41;
  char v42;
  char v43;
  id v44;
  uint8_t buf[4];
  CFAbsoluteTime v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  if (a1)
  {
    Current = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219522;
      v46 = Current;
      v47 = 2112;
      v48 = v13;
      v49 = 2112;
      v50 = v14;
      v51 = 1024;
      v52 = a4;
      v53 = 1024;
      v54 = a5;
      v55 = 1024;
      v56 = a6;
      v57 = 2048;
      v58 = a7;
      _os_log_debug_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEBUG, "#IDSMessage (%lf) message='%@' deviceID:'%@' type=%d outgoing=%d request=%d length=%lld", buf, 0x3Cu);
    }
    v17 = *(void **)(a1 + 24);
    v44 = 0;
    v18 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __82__HDIDSPersistentDictionary__recordMessage_deviceID_type_outgoing_request_length___block_invoke;
    v36[3] = &unk_1E6CF3058;
    v37 = v13;
    v41 = a4;
    v39 = Current;
    v42 = a5;
    v43 = a6;
    v40 = a7;
    v38 = v14;
    v19 = objc_msgSend(v17, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT OR IGNORE INTO message_records (uuid, type, timestamp, outgoing, is_request, length, device_id) VALUES (?, ?, ?, ?, ?, ?, ?)"), &v44, v36, 0);
    v25 = v44;
    if ((v19 & 1) == 0)
      -[HDIDSPersistentDictionary _handleError:format:](a1, v25, CFSTR("failed to record message event"), v20, v21, v22, v23, v24, v34[0]);
    v26 = *(void **)(a1 + 24);
    v35 = v25;
    v34[0] = v18;
    v34[1] = 3221225472;
    v34[2] = (uint64_t)__82__HDIDSPersistentDictionary__recordMessage_deviceID_type_outgoing_request_length___block_invoke_2;
    v34[3] = (uint64_t)&__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    *(CFAbsoluteTime *)&v34[4] = Current;
    v27 = objc_msgSend(v26, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM message_records WHERE timestamp < ?"), &v35, v34, 0);
    v28 = v35;

    if ((v27 & 1) == 0)
      -[HDIDSPersistentDictionary _handleError:format:](a1, v28, CFSTR("failed to prune message event database"), v29, v30, v31, v32, v33, v34[0]);

  }
}

uint64_t __82__HDIDSPersistentDictionary__recordMessage_deviceID_type_outgoing_request_length___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int(a2, 2, *(_DWORD *)(a1 + 64));
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));
  sqlite3_bind_int(a2, 4, *(unsigned __int8 *)(a1 + 68));
  sqlite3_bind_int(a2, 5, *(unsigned __int8 *)(a1 + 69));
  sqlite3_bind_int64(a2, 6, *(_QWORD *)(a1 + 56));
  return HDSQLiteBindFoundationValueToStatement();
}

- (void)setObject:(id)a3 forKey:(id)a4 expires:(double)a5
{
  id v9;
  id v10;
  void *v11;
  HDSQLiteDatabase *database;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  HDIDSPersistentDictionary *v26;
  id v27;
  double v28;
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSPersistentDictionary.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSPersistentDictionary.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

LABEL_3:
  database = self->_database;
  v29 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __54__HDIDSPersistentDictionary_setObject_forKey_expires___block_invoke;
  v24[3] = &unk_1E6CE9118;
  v13 = v11;
  v28 = a5;
  v25 = v13;
  v26 = self;
  v14 = v9;
  v27 = v14;
  v15 = -[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](database, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT OR REPLACE INTO key_value_store (key, expiration, value) VALUES (?, ?, ?)"), &v29, v24, 0);
  v21 = v29;
  if ((v15 & 1) == 0)
    -[HDIDSPersistentDictionary _handleError:format:]((uint64_t)self, v21, CFSTR("failed to store value for key '%@'"), v16, v17, v18, v19, v20, (uint64_t)v13);

}

void __54__HDIDSPersistentDictionary_setObject_forKey_expires___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 56));
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = *(void **)(a1 + 48);
    v5 = (objc_class *)MEMORY[0x1E0CB36F8];
    v6 = v4;
    v7 = (void *)objc_msgSend([v5 alloc], "initRequiringSecureCoding:", 1);
    objc_msgSend(v6, "encodeWithCoder:", v7);

    objc_msgSend(v7, "encodedData");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  HDSQLiteBindFoundationValueToStatement();

}

- (id)objectForKey:(id)a3
{
  id v5;
  HDSQLiteDatabase *database;
  uint64_t v7;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSPersistentDictionary.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__62;
  v27 = __Block_byref_object_dispose__62;
  v28 = 0;
  database = self->_database;
  v22 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __42__HDIDSPersistentDictionary_objectForKey___block_invoke;
  v20[3] = &unk_1E6CE9508;
  v8 = v5;
  v21 = v8;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __42__HDIDSPersistentDictionary_objectForKey___block_invoke_2;
  v19[3] = &unk_1E6CE8540;
  v19[4] = &v23;
  v9 = -[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](database, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT value FROM key_value_store WHERE key = ?"), &v22, v20, v19);
  v15 = v22;
  if ((v9 & 1) == 0)
    -[HDIDSPersistentDictionary _handleError:format:]((uint64_t)self, v15, CFSTR("failed to lookup value for key '%@'"), v10, v11, v12, v13, v14, (uint64_t)v8);
  -[HDIDSPersistentDictionary _objectFromData:]((uint64_t)self, (void *)v24[5]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v23, 8);
  return v16;
}

uint64_t __42__HDIDSPersistentDictionary_objectForKey___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

- (id)_objectFromData:(uint64_t)a1
{
  void *v2;
  objc_class *v4;
  id v5;
  void *v6;

  v2 = 0;
  if (a1 && a2)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3710];
    v5 = a2;
    v6 = (void *)objc_msgSend([v4 alloc], "initForReadingFromData:error:", v5, 0);

    v2 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 8)), "initWithCoder:", v6);
    objc_msgSend(v6, "finishDecoding");

  }
  return v2;
}

- (void)didFinishSending:(id)a3
{
  id v4;
  CFAbsoluteTime Current;
  NSObject *v6;
  HDSQLiteDatabase *database;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  CFAbsoluteTime v19;
  id v20;
  uint8_t buf[4];
  CFAbsoluteTime v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v22 = Current;
    v23 = 2112;
    v24 = v4;
    _os_log_debug_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEBUG, "#IDSMessage (%lf) sent message='%@'", buf, 0x16u);
  }
  database = self->_database;
  v20 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__HDIDSPersistentDictionary_didFinishSending___block_invoke;
  v17[3] = &unk_1E6CE82D8;
  v19 = Current;
  v8 = v4;
  v18 = v8;
  v9 = -[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](database, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE message_records SET send_timestamp=? WHERE uuid=?"), &v20, v17, 0);
  v15 = v20;
  if ((v9 & 1) == 0)
    -[HDIDSPersistentDictionary _handleError:format:]((uint64_t)self, v15, CFSTR("failed to record message sent"), v10, v11, v12, v13, v14, v16);

}

uint64_t __46__HDIDSPersistentDictionary_didFinishSending___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_double(a2, 1, *(double *)(a1 + 40));
  return HDSQLiteBindFoundationValueToStatement();
}

- (void)didReceiveResponse:(id)a3 toRequest:(id)a4 deviceID:(id)a5 type:(int)a6 length:(int64_t)a7
{
  id v12;
  id v13;

  v12 = a4;
  v13 = a3;
  -[HDIDSPersistentDictionary _recordMessage:deviceID:type:outgoing:request:length:]((uint64_t)self, v13, a5, a6, 0, 0, a7);
  -[HDIDSPersistentDictionary _recordMappingOfRequest:toResponse:]((uint64_t)self, v12, v13);

}

- (void)_recordMappingOfRequest:(void *)a3 toResponse:
{
  id v5;
  id v6;
  CFAbsoluteTime Current;
  NSObject *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  CFAbsoluteTime v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    Current = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v23 = Current;
      v24 = 2112;
      v25 = v5;
      v26 = 2112;
      v27 = v6;
      _os_log_debug_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEBUG, "#IDSMessage (%lf) request='%@' response='%@'", buf, 0x20u);
    }
    v9 = *(void **)(a1 + 24);
    v21 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __64__HDIDSPersistentDictionary__recordMappingOfRequest_toResponse___block_invoke;
    v18[3] = &unk_1E6CE7750;
    v19 = v5;
    v20 = v6;
    v10 = objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO request_response_mappings (request, response) VALUES (?, ?)"), &v21, v18, 0);
    v16 = v21;
    if ((v10 & 1) == 0)
      -[HDIDSPersistentDictionary _handleError:format:](a1, v16, CFSTR("failed to record message response mapping"), v11, v12, v13, v14, v15, v17);

  }
}

uint64_t __64__HDIDSPersistentDictionary__recordMappingOfRequest_toResponse___block_invoke()
{
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

- (void)removeObjectForKey:(id)a3
{
  id v5;
  HDSQLiteDatabase *database;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSPersistentDictionary.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  database = self->_database;
  v18 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__HDIDSPersistentDictionary_removeObjectForKey___block_invoke;
  v16[3] = &unk_1E6CE9508;
  v7 = v5;
  v17 = v7;
  v8 = -[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](database, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM key_value_store WHERE key = ?"), &v18, v16, 0);
  v14 = v18;
  if ((v8 & 1) == 0)
    -[HDIDSPersistentDictionary _handleError:format:]((uint64_t)self, v14, CFSTR("failed to delete value for key '%@'"), v9, v10, v11, v12, v13, (uint64_t)v7);

}

uint64_t __48__HDIDSPersistentDictionary_removeObjectForKey___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

- (void)didReceiveRequest:(id)a3 deviceID:(id)a4 type:(int)a5 length:(int64_t)a6
{
  -[HDIDSPersistentDictionary _recordMessage:deviceID:type:outgoing:request:length:]((uint64_t)self, a3, a4, a5, 0, 1, a6);
}

- (HDIDSPersistentDictionary)initWithURL:(id)a3 objectClass:(Class)a4
{
  id v8;
  HDIDSPersistentDictionary *v9;
  HDIDSPersistentDictionary *v10;
  HDSQLiteDatabase *database;
  HDSQLiteDatabase *v12;
  int v13;
  id v14;
  HDSQLiteDatabase *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSPersistentDictionary.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseURL"));

  }
  if ((-[objc_class supportsSecureCoding](a4, "supportsSecureCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSPersistentDictionary.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[objectClass supportsSecureCoding]"));

  }
  v26.receiver = self;
  v26.super_class = (Class)HDIDSPersistentDictionary;
  v9 = -[HDIDSPersistentDictionary init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseURL, a3);
    v10->_objectClass = a4;
    if ((-[HDIDSPersistentDictionary _openDB]((uint64_t)v10) & 1) == 0)
    {
      database = v10->_database;
      v10->_database = 0;

      -[HDIDSPersistentDictionary _obliterateWithReason:preserveCopy:generateStackshot:]((uint64_t)v10, CFSTR("Failed to open database"), 0, 1);
    }
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v12 = v10->_database;
    v20[4] = &v22;
    v21 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53__HDIDSPersistentDictionary_initWithURL_objectClass___block_invoke;
    v20[3] = &unk_1E6CF3008;
    v13 = -[HDSQLiteDatabase performIntegrityCheckOnDatabase:error:integrityErrorHandler:](v12, "performIntegrityCheckOnDatabase:error:integrityErrorHandler:", CFSTR("main"), &v21, v20);
    v14 = v21;
    if (v13)
    {
      if (*((_BYTE *)v23 + 24))
      {
        -[HDSQLiteDatabase close](v10->_database, "close");
        v15 = v10->_database;
        v10->_database = 0;

        -[HDIDSPersistentDictionary _obliterateWithReason:preserveCopy:generateStackshot:]((uint64_t)v10, CFSTR("Found integrity issues in IDS message database."), 0, 1);
      }
    }
    else
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v14;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_INFO, "Failed to check IDS message database integrity: %{public}@", buf, 0xCu);
      }
    }
    if (!v10->_database)
    {

      v10 = 0;
    }
    _Block_object_dispose(&v22, 8);

  }
  return v10;
}

- (uint64_t)_openDB
{
  id v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  unsigned __int8 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(*(id *)(a1 + 16), "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v4 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v28);
  v5 = v28;
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v23 = v6;
      objc_msgSend(v3, "absoluteString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v24;
      v36 = 2114;
      v37 = v5;
      _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "failed to create directory '%{public}@': %{public}@", buf, 0x16u);

    }
  }
  if (!-[HDIDSPersistentDictionary _reallyOpenDB](a1))
    goto LABEL_31;
  v7 = *(void **)(a1 + 24);
  v27 = v5;
  v8 = objc_msgSend(v7, "userVersionWithDatabaseName:error:", 0, &v27);
  v9 = v27;

  if (v8 != 3)
  {
    if (v8 < 1)
    {
      if (v8 < 0)
      {
        _HKInitializeLogging();
        v12 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v9;
          _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Failed to look up existing schema version for IDS persistent database: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 24), "close");
      v10 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Re-creating IDS persistent database with version %ld"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDIDSPersistentDictionary _obliterateWithReason:preserveCopy:generateStackshot:](a1, v11, 0, 0);

      if (!-[HDIDSPersistentDictionary _reallyOpenDB](a1))
      {
        v29 = 0;
        goto LABEL_7;
      }
    }
    v26 = v9;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v13 = objc_msgSend(&unk_1E6DF8DC8, "countByEnumeratingWithState:objects:count:", &v30, buf, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(&unk_1E6DF8DC8);
          if (!objc_msgSend(*(id *)(a1 + 24), "executeUncachedSQL:error:bindingHandler:enumerationHandler:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v16), &v26, 0, 0))
          {
            v17 = 0;
            goto LABEL_24;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(&unk_1E6DF8DC8, "countByEnumeratingWithState:objects:count:", &v30, buf, 16);
        if (v14)
          continue;
        break;
      }
    }
    v17 = 1;
LABEL_24:
    v5 = v26;

    if ((v17 & 1) != 0)
    {
      v18 = *(void **)(a1 + 24);
      v25 = v5;
      v19 = objc_msgSend(v18, "setUserVersion:withDatabaseName:error:", 3, 0, &v25);
      v9 = v25;

      if ((v19 & 1) == 0)
      {
        _HKInitializeLogging();
        v20 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v9;
          _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Failed to update schema version for IDS persistent database: %{public}@", buf, 0xCu);
        }
      }
      goto LABEL_6;
    }
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v5;
      _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "failed to create schema: %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 24), "close");
LABEL_31:
    v29 = 0;
    goto LABEL_32;
  }
LABEL_6:
  v29 = 1;
LABEL_7:
  v5 = v9;
LABEL_32:

  return v29;
}

- (BOOL)_reallyOpenDB
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  void *v9;
  id v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__reallyOpenDB, a1, CFSTR("HDIDSPersistentDictionary.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_database == nil"));

  }
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D29850]), "initWithDatabaseURL:", *(_QWORD *)(a1 + 16));
  v3 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v2;

  v4 = *(void **)(a1 + 24);
  v10 = 0;
  v5 = objc_msgSend(v4, "openWithError:", &v10);
  v6 = v10;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 24), "close");
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      _os_log_fault_impl(&dword_1B7802000, v7, OS_LOG_TYPE_FAULT, "Failed to create database for IDS persistent storage (%d): %{public}@", buf, 0x12u);
    }
  }

  return v5 == 0;
}

- (void)enumerateObjectsSortedByExpirationDate:(id)a3
{
  id v5;
  HDSQLiteDatabase *database;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("iterator");
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSPersistentDictionary.m"), 257, CFSTR("Invalid parameter not satisfying: %@"));

  }
  database = self->_database;
  v19 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__HDIDSPersistentDictionary_enumerateObjectsSortedByExpirationDate___block_invoke;
  v17[3] = &unk_1E6CF3030;
  v7 = v5;
  v17[4] = self;
  v18 = v7;
  v8 = -[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](database, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT key, value, expiration FROM key_value_store ORDER BY expiration ASC"), &v19, 0, v17);
  v14 = v19;
  if ((v8 & 1) == 0)
    -[HDIDSPersistentDictionary _handleError:format:]((uint64_t)self, v14, CFSTR("failed to iterate over all keys and values"), v9, v10, v11, v12, v13, (uint64_t)v16);

}

- (void)didSendResponse:(id)a3 toRequest:(id)a4 deviceID:(id)a5 type:(int)a6 length:(int64_t)a7
{
  id v12;
  id v13;

  v12 = a4;
  v13 = a3;
  -[HDIDSPersistentDictionary _recordMessage:deviceID:type:outgoing:request:length:]((uint64_t)self, v13, a5, a6, 1, 0, a7);
  -[HDIDSPersistentDictionary _recordMappingOfRequest:toResponse:]((uint64_t)self, v12, v13);

}

- (void)_obliterateWithReason:(uint64_t)a3 preserveCopy:(int)a4 generateStackshot:
{
  id v7;
  int v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (!a1)
    goto LABEL_15;
  v8 = _HDIsUnitTesting;
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E0CB5370];
  v10 = *MEMORY[0x1E0CB5370];
  if (v8)
    v11 = 1;
  else
    v11 = a4 == 0;
  if (v11)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v12 = *(void **)(a1 + 16);
    v13 = v9;
    objc_msgSend(v12, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    v22 = 2114;
    v23 = v7;
    _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "Obliterating NanoSync persistent dictionary at \"%{public}@\": %{public}@", buf, 0x16u);
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    v18 = *(void **)(a1 + 16);
    v13 = v9;
    objc_msgSend(v18, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    v22 = 2114;
    v23 = v7;
    _os_log_fault_impl(&dword_1B7802000, v13, OS_LOG_TYPE_FAULT, "Obliterating NanoSync persistent dictionary at \"%{public}@\": %{public}@", buf, 0x16u);
  }

LABEL_11:
  v16 = *(void **)(a1 + 24);
  if (v16 && objc_msgSend(v16, "isOpen"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__obliterateWithReason_preserveCopy_generateStackshot_, a1, CFSTR("HDIDSPersistentDictionary.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(_database == nil) || ([_database isOpen] == NO)"));

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hd_removeSQLiteDatabaseAtURL:preserveCopy:", *(_QWORD *)(a1 + 16), a3);

LABEL_15:
}

void __53__HDIDSPersistentDictionary_initWithURL_objectClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "Found integrity issues in IDS message database: %{public}@.", (uint8_t *)&v5, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

}

- (void)dealloc
{
  objc_super v3;

  -[HDIDSPersistentDictionary invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDIDSPersistentDictionary;
  -[HDIDSPersistentDictionary dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[HDSQLiteDatabase close](self->_database, "close");
}

- (void)obliterateWithReason:(id)a3 preserveCopy:(BOOL)a4
{
  -[HDIDSPersistentDictionary _obliterateWithReason:preserveCopy:generateStackshot:]((uint64_t)self, a3, a4, 0);
}

- (void)_handleError:(void *)a3 format:(uint64_t)a4
{
  id v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  os_log_t *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = v11;
  if (a1 && v11)
  {
    v13 = (objc_class *)MEMORY[0x1E0CB3940];
    v14 = a3;
    v15 = (void *)objc_msgSend([v13 alloc], "initWithFormat:arguments:", v14, &a9);

    _HKInitializeLogging();
    v16 = (os_log_t *)MEMORY[0x1E0CB5370];
    v17 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      v22 = 2114;
      v23 = v12;
      _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
    }
    if (objc_msgSend(v12, "hd_isDatabaseCorruptionError"))
    {
      objc_msgSend(*(id *)(a1 + 24), "close");
      v18 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

      -[HDIDSPersistentDictionary _obliterateWithReason:preserveCopy:generateStackshot:](a1, CFSTR("Corrupt database"), 0, 1);
      if ((-[HDIDSPersistentDictionary _openDB](a1) & 1) == 0)
      {
        _HKInitializeLogging();
        v19 = *v16;
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "failed to re-create database", buf, 2u);
        }
      }
    }

  }
}

uint64_t __42__HDIDSPersistentDictionary_objectForKey___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB18C](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

- (void)removeAllObjects
{
  HDSQLiteDatabase *database;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;

  database = self->_database;
  v12 = 0;
  v4 = -[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](database, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM key_value_store"), &v12, 0, 0);
  v10 = v12;
  if ((v4 & 1) == 0)
    -[HDIDSPersistentDictionary _handleError:format:]((uint64_t)self, v10, CFSTR("failed to delete all keys and values"), v5, v6, v7, v8, v9, v11);

}

BOOL __68__HDIDSPersistentDictionary_enumerateObjectsSortedByExpirationDate___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  char v11;

  MEMORY[0x1BCCAB1D4](a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB18C](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1BCCAB1A4](a2, 2);
  v11 = 0;
  v7 = *(_QWORD *)(a1 + 40);
  -[HDIDSPersistentDictionary _objectFromData:](*(_QWORD *)(a1 + 32), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, char *, double))(v7 + 16))(v7, v4, v8, &v11, v6);

  v9 = v11 == 0;
  return v9;
}

uint64_t __82__HDIDSPersistentDictionary__recordMessage_deviceID_type_outgoing_request_length___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_double(a2, 1, *(double *)(a1 + 32) + -2592000.0);
}

- (void)didReceiveError:(id)a3 forMessageID:(id)a4
{
  id v6;
  id v7;
  CFAbsoluteTime Current;
  void *v9;
  HDSQLiteDatabase *database;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22[4];
  id v23;
  id v24;
  CFAbsoluteTime v25;
  id v26;
  uint8_t buf[4];
  CFAbsoluteTime v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
  {
    v20 = v9;
    objc_msgSend(v6, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v28 = Current;
    v29 = 2112;
    v30 = v7;
    v31 = 2112;
    v32 = v21;
    v33 = 2048;
    v34 = objc_msgSend(v6, "code");
    _os_log_debug_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEBUG, "#IDSMessage (%lf) message='%@' error domain='%@' code=%ld", buf, 0x2Au);

  }
  database = self->_database;
  v26 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = (uint64_t)__58__HDIDSPersistentDictionary_didReceiveError_forMessageID___block_invoke;
  v22[3] = (uint64_t)&unk_1E6CF0080;
  v11 = v6;
  v23 = v11;
  v25 = Current;
  v12 = v7;
  v24 = v12;
  v13 = -[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](database, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE message_records SET error_domain=?, error_code=?, error_timestamp=? WHERE uuid=?"), &v26, v22, 0);
  v19 = v26;
  if ((v13 & 1) == 0)
    -[HDIDSPersistentDictionary _handleError:format:]((uint64_t)self, v11, CFSTR("failed to record message error"), v14, v15, v16, v17, v18, v22[0]);

}

uint64_t __58__HDIDSPersistentDictionary_didReceiveError_forMessageID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "code"));
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));
  return HDSQLiteBindFoundationValueToStatement();
}

- (void)didCancel:(id)a3
{
  id v4;
  CFAbsoluteTime Current;
  HDSQLiteDatabase *database;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  CFAbsoluteTime v17;
  id v18;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    Current = CFAbsoluteTimeGetCurrent();
    database = self->_database;
    v18 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__HDIDSPersistentDictionary_didCancel___block_invoke;
    v15[3] = &unk_1E6CF3080;
    v16 = v4;
    v17 = Current;
    v7 = -[HDSQLiteDatabase performTransactionWithType:error:usingBlock:](database, "performTransactionWithType:error:usingBlock:", 1, &v18, v15);
    v13 = v18;
    if ((v7 & 1) == 0)
      -[HDIDSPersistentDictionary _handleError:format:]((uint64_t)self, v13, CFSTR("failed to mark messages as canceled"), v8, v9, v10, v11, v12, v14);

  }
}

uint64_t __39__HDIDSPersistentDictionary_didCancel___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D298B8]), "initWithSQL:database:", CFSTR("UPDATE message_records SET canceled=1 WHERE uuid=?"), v5);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        _HKInitializeLogging();
        v13 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
        {
          v14 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 134218242;
          v24 = v14;
          v25 = 2112;
          v26 = v12;
          _os_log_debug_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEBUG, "#IDSMessage (%lf) canceled message='%@'", buf, 0x16u);
        }
        v18[0] = v10;
        v18[1] = 3221225472;
        v18[2] = __39__HDIDSPersistentDictionary_didCancel___block_invoke_278;
        v18[3] = &unk_1E6CE9508;
        v18[4] = v12;
        if (!objc_msgSend(v6, "performStatementWithError:bindingHandler:", a3, v18))
        {
          v15 = 0;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v8)
        continue;
      break;
    }
    v15 = 1;
  }
  else
  {
    v15 = 1;
  }
LABEL_14:

  objc_msgSend(v6, "finish");
  return v15;
}

uint64_t __39__HDIDSPersistentDictionary_didCancel___block_invoke_278()
{
  return HDSQLiteBindFoundationValueToStatement();
}

- (id)messageIDsForPendingOutgoingMessagesWithType:(int)a3 deviceID:(id)a4
{
  void *v6;
  HDSQLiteDatabase *database;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  int v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", *(_QWORD *)&a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v17 = 0;
  v14 = v6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__HDIDSPersistentDictionary_messageIDsForPendingOutgoingMessagesWithType_deviceID___block_invoke;
  v15[3] = &__block_descriptor_36_e23_v16__0__sqlite3_stmt__8l;
  v16 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__HDIDSPersistentDictionary_messageIDsForPendingOutgoingMessagesWithType_deviceID___block_invoke_2;
  v13[3] = &unk_1E6CE8CF8;
  v8 = v6;
  LODWORD(database) = -[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](database, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT uuid FROM message_records WHERE type=? AND outgoing=1 AND canceled=0 AND send_timestamp IS NULL AND error_timestamp IS NULL"), &v17, v15, v13);
  v9 = v17;
  if ((_DWORD)database)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

uint64_t __83__HDIDSPersistentDictionary_messageIDsForPendingOutgoingMessagesWithType_deviceID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int(a2, 1, *(_DWORD *)(a1 + 32));
}

uint64_t __83__HDIDSPersistentDictionary_messageIDsForPendingOutgoingMessagesWithType_deviceID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;

  MEMORY[0x1BCCAB1D4](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end
