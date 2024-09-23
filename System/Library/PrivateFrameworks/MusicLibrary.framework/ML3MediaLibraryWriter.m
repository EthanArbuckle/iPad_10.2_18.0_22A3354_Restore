@implementation ML3MediaLibraryWriter

void __51__ML3MediaLibraryWriter__transactionForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __46__ML3MediaLibraryWriter__registerTransaction___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setObject:forKey:", *(_QWORD *)(a1 + 32), v2);

}

- (id)beginTransactionForLibrary:(id)a3 withClient:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[ML3MediaLibraryWriter _createNewTransactionForLibrary:fromClient:readOnly:](self, "_createNewTransactionForLibrary:fromClient:readOnly:", v10, v11, (a5 >> 1) & 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a5 & 1) != 0)
      objc_msgSend(v12, "setTerminable:", 0);
    objc_msgSend(v13, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "pushTransaction") & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v14, "sqliteError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3MediaLibraryWriter _destroyTransactionForIdentifier:forceRelinquishConnection:](self, "_destroyTransactionForIdentifier:forceRelinquishConnection:", v17, 0);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not begin transaction. %@"), v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 300, v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 100, CFSTR("Could not obtain writer connection for database."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = os_log_create("com.apple.amp.medialibrary", "Writer");
  v20 = v19;
  if (v15)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_ERROR, "Failed to begin transaction for client %{public}@. %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    v25 = 2114;
    v26 = v21;
    _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_DEFAULT, "Successfully began transaction for client %{public}@ with identifier %{public}@.", buf, 0x16u);

  }
  if (a6)
    *a6 = objc_retainAutorelease(v15);

  return v13;
}

void __48__ML3MediaLibraryWriter__unregisterTransaction___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "removeObjectForKey:", v2);

}

- (id)_createNewTransactionForLibrary:(id)a3 fromClient:(id)a4 readOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  ML3ActiveTransaction *v15;
  void *v16;
  NSObject *v17;
  void *v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3MediaLibraryWriter.m"), 624, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  objc_msgSend(v10, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "ml_isValid") & 1) == 0 && !objc_msgSend(v10, "isDaemonClient"))
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = objc_msgSend(v11, "processIdentifier");
      _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "Zombie process with ID %d tried to start a transaction.", buf, 8u);
    }
    goto LABEL_13;
  }
  v12 = objc_msgSend(v10, "isDaemonClient");
  objc_msgSend(v9, "connectionPool");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_connectionForWriting:useThreadConnection:storeThreadLocalConnection:", v5 ^ 1, 0, v12);
  v14 = objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "ml_isValid") & 1) == 0 && !objc_msgSend(v10, "isDaemonClient"))
  {
    v17 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = objc_msgSend(v11, "processIdentifier");
      _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_DEFAULT, "Zombie process with ID %d tried to start a transaction. It already got a connection, but it's being returned.", buf, 8u);
    }

    objc_msgSend(v9, "checkInDatabaseConnection:", v14);
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v15 = -[ML3ActiveTransaction initWithLibrary:connection:client:]([ML3ActiveTransaction alloc], "initWithLibrary:connection:client:", v9, v14, v10);
  -[ML3ActiveTransaction setReadOnly:](v15, "setReadOnly:", v5);
  -[ML3ActiveTransaction identifier](v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setCurrentTransactionID:](v14, "setCurrentTransactionID:", v16);

  -[ML3MediaLibraryWriter _registerTransaction:](self, "_registerTransaction:", v15);
LABEL_14:

  return v15;
}

- (void)_registerTransaction:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  ML3MediaLibraryWriter *v9;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ML3MediaLibraryWriter__registerTransaction___block_invoke;
  block[3] = &unk_1E5B65EB8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __83__ML3MediaLibraryWriter_executeUntrustedUpdate_withParameters_onTransaction_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v2, "executeUpdate:withParameters:onTransaction:error:", v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v7;
}

- (BOOL)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint32_t v27;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[ML3MediaLibraryWriter _transactionForIdentifier:](self, "_transactionForIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v16 = objc_msgSend(v15, "executeUpdate:withParameters:error:", v10, v11, &v29);
    v17 = v29;
    if (v17)
      v18 = 0;
    else
      v18 = v16;
    if ((v18 & 1) != 0)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Database Error: %@"), v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 300, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempted to execute update without a valid transaction (transaction ID = %@). You must start a transaction first before executing an update."), v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 200, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v22 = os_log_create("com.apple.amp.medialibrary", "Writer");
  v23 = v22;
  if (v19)
  {
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 138543618;
    v31 = v10;
    v32 = 2114;
    v33 = v19;
    v24 = "Failed to execute update %{public}@. %{public}@";
    v25 = v23;
    v26 = OS_LOG_TYPE_ERROR;
    v27 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    *(_DWORD *)buf = 138543362;
    v31 = v10;
    v24 = "Successfully executed update %{public}@.";
    v25 = v23;
    v26 = OS_LOG_TYPE_DEBUG;
    v27 = 12;
  }
  _os_log_impl(&dword_1AC149000, v25, v26, v24, buf, v27);
LABEL_16:

  if (a6)
    *a6 = objc_retainAutorelease(v19);

  return v19 == 0;
}

- (void)_destroyTransactionForIdentifier:(id)a3 forceRelinquishConnection:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[ML3MediaLibraryWriter _transactionForIdentifier:](self, "_transactionForIdentifier:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MediaLibraryWriter _destroyTransaction:forceRelinquishConnection:](self, "_destroyTransaction:forceRelinquishConnection:", v6, v4);

}

- (BOOL)endTransaction:(id)a3 shouldCommit:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[ML3MediaLibraryWriter _transactionForIdentifier:](self, "_transactionForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.medialibrary", "Writer");
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v11)
      goto LABEL_7;
    *(_DWORD *)buf = 134217984;
    v20 = v9;
    v12 = "Committing transaction=%p";
  }
  else
  {
    if (!v11)
      goto LABEL_7;
    *(_DWORD *)buf = 134217984;
    v20 = v9;
    v12 = "Rolling back transaction=%p";
  }
  _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
LABEL_7:

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A connection with the transaction ID %@ could not be found."), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 200, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  objc_msgSend(v9, "lock");
  objc_msgSend(v9, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isInTransaction"))
  {
    v15 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_ERROR, "Warning: Tried to end non-existent transaction for local connection.", buf, 2u);
    }
    v14 = 0;
    goto LABEL_18;
  }
  if ((objc_msgSend(v13, "popToRootTransactionAndCommit:", v6) & 1) == 0)
  {
    objc_msgSend(v13, "sqliteError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Unable to end transaction with ID %@."), v8);
    v17 = objc_claimAutoreleasedReturnValue();
    v15 = v17;
    if (v16)
      -[NSObject appendFormat:](v17, "appendFormat:", CFSTR(" %@"), v16);
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 300, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
    goto LABEL_19;
  }
  v14 = 0;
LABEL_19:
  -[ML3MediaLibraryWriter _destroyTransactionForIdentifier:forceRelinquishConnection:](self, "_destroyTransactionForIdentifier:forceRelinquishConnection:", v8, 0);
  objc_msgSend(v9, "unlock");
LABEL_20:

  if (a5)
    *a5 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (BOOL)executeUntrustedUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  BOOL v25;
  void *v27;
  SEL v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  void *v41;
  const __CFString *v42;
  void *v43;
  _BYTE v44[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  -[ML3MediaLibraryWriter _transactionForIdentifier:](self, "_transactionForIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && (objc_msgSend(v14, "connection"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v28 = a2;
    *(_QWORD *)v44 = 0;
    *(_QWORD *)&v44[8] = v44;
    *(_QWORD *)&v44[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__15430;
    v46 = __Block_byref_object_dispose__15431;
    v47 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __83__ML3MediaLibraryWriter_executeUntrustedUpdate_withParameters_onTransaction_error___block_invoke;
    v30[3] = &unk_1E5B63A60;
    v34 = &v36;
    v30[4] = self;
    v17 = v11;
    v31 = v17;
    v32 = v12;
    v33 = v13;
    v35 = v44;
    v18 = objc_msgSend(v16, "_distrustQueriesDuringBlock:", v30);
    if ((_DWORD)v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempted to execute illegal update: %@ (%d)"), v17, v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (a6)
      {
        v42 = CFSTR("action");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3MediaLibraryWriter writerErrorWithCode:description:userInfo:](ML3MediaLibraryWriter, "writerErrorWithCode:description:userInfo:", 301, v29, v20);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v21 = os_log_create("com.apple.amp.medialibrary", "Writer");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v29;
        _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      if (*((_BYTE *)v37 + 24))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v28, self, CFSTR("ML3MediaLibraryWriter.m"), 234, CFSTR("Authorizer failure should have caused executeUpdate: to return NO"));

      }
    }
    else if (a6)
    {
      v24 = *(void **)(*(_QWORD *)&v44[8] + 40);
      if (v24)
        *a6 = objc_retainAutorelease(v24);
    }

    _Block_object_dispose(v44, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempted to execute update without a valid transaction (transaction ID = %@). You must start a transaction first before executing an update."), v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 200, v22);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 138543618;
      *(_QWORD *)&v44[4] = v11;
      *(_WORD *)&v44[12] = 2114;
      *(_QWORD *)&v44[14] = v22;
      _os_log_impl(&dword_1AC149000, v23, OS_LOG_TYPE_ERROR, "Failed to execute update %{public}@. %{public}@", v44, 0x16u);
    }

    v16 = 0;
  }
  v25 = *((_BYTE *)v37 + 24) != 0;

  _Block_object_dispose(&v36, 8);
  return v25;
}

- (id)_transactionForIdentifier:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__15430;
  v16 = __Block_byref_object_dispose__15431;
  v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ML3MediaLibraryWriter__transactionForIdentifier___block_invoke;
  block[3] = &unk_1E5B65CF0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_destroyTransaction:(id)a3 forceRelinquishConnection:(BOOL)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  uint8_t v9[16];

  v5 = a3;
  if (v5)
  {
    -[ML3MediaLibraryWriter _unregisterTransaction:](self, "_unregisterTransaction:", v5);
    objc_msgSend(v5, "_relinquishConnection");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "checkInDatabaseConnection:", v6);

  }
  else
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_ERROR, "Warning: Attempted to destroy non-existent transaction. Possible deadlock.", v9, 2u);
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "mediaLibraryWriter:didDestroyTransaction:", self, v5);

}

- (void)_unregisterTransaction:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  ML3MediaLibraryWriter *v9;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ML3MediaLibraryWriter__unregisterTransaction___block_invoke;
  block[3] = &unk_1E5B65EB8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (ML3MediaLibraryWriter)init
{
  ML3MediaLibraryWriter *v2;
  ML3MediaLibraryWriter *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  NSMutableDictionary *v6;
  NSMutableDictionary *transactionMap;
  NSOperationQueue *v8;
  NSOperationQueue *databaseOperationQueue;
  NSOperationQueue *v10;
  NSOperationQueue *databaseOperationSerialQueue;
  NSOperationQueue *v12;
  NSOperationQueue *databaseOperationLimitedQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ML3MediaLibraryWriter;
  v2 = -[ML3MediaLibraryWriter init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_transactionTimeout = 0.0;
    v4 = dispatch_queue_create("com.apple.ML3MediaLibraryWriter", 0);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    transactionMap = v3->_transactionMap;
    v3->_transactionMap = v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    databaseOperationQueue = v3->_databaseOperationQueue;
    v3->_databaseOperationQueue = v8;

    -[NSOperationQueue setQualityOfService:](v3->_databaseOperationQueue, "setQualityOfService:", 25);
    v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    databaseOperationSerialQueue = v3->_databaseOperationSerialQueue;
    v3->_databaseOperationSerialQueue = v10;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_databaseOperationSerialQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v3->_databaseOperationSerialQueue, "setQualityOfService:", 25);
    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    databaseOperationLimitedQueue = v3->_databaseOperationLimitedQueue;
    v3->_databaseOperationLimitedQueue = v12;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_databaseOperationLimitedQueue, "setMaxConcurrentOperationCount:", 5);
    -[NSOperationQueue setQualityOfService:](v3->_databaseOperationLimitedQueue, "setQualityOfService:", 25);
    if (v3->_transactionTimeout > 0.0)
      -[ML3MediaLibraryWriter _setupWatchdogTimer](v3, "_setupWatchdogTimer");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[ML3MediaLibraryWriter _tearDownWatchdogTimer](self, "_tearDownWatchdogTimer");
  -[ML3MediaLibraryWriter cancelAllActiveTransactions](self, "cancelAllActiveTransactions");
  v3.receiver = self;
  v3.super_class = (Class)ML3MediaLibraryWriter;
  -[ML3MediaLibraryWriter dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *transactionMap;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSOperationQueue *v12;
  const __CFString *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  NSOperationQueue *databaseOperationLimitedQueue;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MediaLibrary Daemon State at %@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", CFSTR("Active Transactions:\n"));
  if (-[NSMutableDictionary count](self->_transactionMap, "count"))
  {
    transactionMap = self->_transactionMap;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __36__ML3MediaLibraryWriter_description__block_invoke;
    v20[3] = &unk_1E5B63A38;
    v21 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](transactionMap, "enumerateKeysAndObjectsUsingBlock:", v20);

  }
  else
  {
    objc_msgSend(v5, "appendString:", CFSTR("(None)\n"));
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v22 = *(_OWORD *)&self->_databaseOperationQueue;
  databaseOperationLimitedQueue = self->_databaseOperationLimitedQueue;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(NSOperationQueue **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        if (v12 == self->_databaseOperationQueue)
        {
          v13 = CFSTR("Enqueued concurrent operations:\n");
        }
        else if (v12 == self->_databaseOperationLimitedQueue)
        {
          v13 = CFSTR("Enqueued operations in limited size queue:\n");
        }
        else
        {
          v13 = CFSTR("Enqueued serial operations:\n");
        }
        objc_msgSend(v5, "appendString:", v13);
        if (-[NSOperationQueue operationCount](v12, "operationCount"))
        {
          -[NSOperationQueue operations](v12, "operations");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v14);

        }
        else
        {
          objc_msgSend(v5, "appendString:", CFSTR("(None)\n"));
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v9);
  }

  return v5;
}

- (void)setTransactionTimeout:(double)a3
{
  self->_transactionTimeout = a3;
  if (a3 > 0.0)
    -[ML3MediaLibraryWriter _setupWatchdogTimer](self, "_setupWatchdogTimer");
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_suspended = a3;
  -[NSOperationQueue setSuspended:](self->_databaseOperationQueue, "setSuspended:");
  -[NSOperationQueue setSuspended:](self->_databaseOperationSerialQueue, "setSuspended:", v3);
  -[NSOperationQueue setSuspended:](self->_databaseOperationLimitedQueue, "setSuspended:", v3);
}

- (id)executeQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _BYTE *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE buf[24];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v38 = a4;
  v11 = a5;
  v12 = a6;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__15430;
  v51 = __Block_byref_object_dispose__15431;
  v52 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  -[ML3MediaLibraryWriter _transactionForIdentifier:](self, "_transactionForIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("MLDatabaseQueryOptionLimitPropertyKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("MLDatabaseQueryOptionLimitValueKey"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && v36)
    {
      objc_msgSend(v15, "executeQuery:withParameters:limitProperty:limitValue:", v39, v38, v16, objc_msgSend(v36, "longLongValue"));
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v15, "executeQuery:withParameters:", v39, v38);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v17;
    if (v17)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("MLDatabaseQueryOptionRangeBeginKey"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
        v22 = objc_msgSend(v20, "integerValue");
      else
        v22 = 0;
      objc_msgSend(v11, "objectForKey:", CFSTR("MLDatabaseQueryOptionCountKey"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
        v25 = objc_msgSend(v23, "integerValue");
      else
        v25 = 0x7FFFFFFFLL;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v54 = 0;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __81__ML3MediaLibraryWriter_executeQuery_withParameters_options_onTransaction_error___block_invoke;
      v40[3] = &unk_1E5B63A88;
      v43 = buf;
      v45 = v22;
      v41 = v37;
      v42 = v15;
      v44 = &v47;
      v46 = v25;
      objc_msgSend(v19, "enumerateRowsWithBlock:", v40);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "sqliteError");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("Database Error: %@"), v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 300, v19);
      v28 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v48[5];
      v48[5] = v28;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempted to execute query without a valid transaction (transaction ID = %@). You must be within an existing transaction first before executing a query."), v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 200, v15);
    v18 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v48[5];
    v48[5] = v18;
  }

  v29 = v48[5];
  v30 = os_log_create("com.apple.amp.medialibrary", "Writer");
  v31 = v30;
  if (v29)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v32 = v48[5];
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v32;
      _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_ERROR, "Error executing query: %{public}@. %{public}@", buf, 0x16u);
    }

    if (a7)
      *a7 = objc_retainAutorelease((id)v48[5]);
  }
  else
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v33 = objc_msgSend(v37, "count");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v33;
      _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_DEBUG, "Successfully executed query \"%{public}@\" with %lu rows returned.", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v47, 8);

  return v37;
}

- (id)executeUntrustedQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  void *v46;
  const __CFString *v47;
  void *v48;
  _BYTE v49[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v31 = a4;
  v14 = a5;
  v15 = a6;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__15430;
  v43 = __Block_byref_object_dispose__15431;
  v44 = (id)MEMORY[0x1E0C9AA60];
  -[ML3MediaLibraryWriter _transactionForIdentifier:](self, "_transactionForIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 && (objc_msgSend(v16, "connection"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    *(_QWORD *)v49 = 0;
    *(_QWORD *)&v49[8] = v49;
    *(_QWORD *)&v49[16] = 0x3032000000;
    v50 = __Block_byref_object_copy__15430;
    v51 = __Block_byref_object_dispose__15431;
    v52 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __90__ML3MediaLibraryWriter_executeUntrustedQuery_withParameters_options_onTransaction_error___block_invoke;
    v32[3] = &unk_1E5B63AB0;
    v37 = &v39;
    v32[4] = self;
    v19 = v13;
    v33 = v19;
    v34 = v31;
    v35 = v14;
    v36 = v15;
    v38 = v49;
    v20 = objc_msgSend(v18, "_distrustQueriesDuringBlock:", v32);
    if ((_DWORD)v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempted to execute illegal query: %@ (%d)"), v19, v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (a7)
      {
        v47 = CFSTR("action");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[ML3MediaLibraryWriter writerErrorWithCode:description:userInfo:](ML3MediaLibraryWriter, "writerErrorWithCode:description:userInfo:", 301, v30, v22);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v23 = os_log_create("com.apple.amp.medialibrary", "Writer");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v46 = v30;
        _os_log_impl(&dword_1AC149000, v23, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      if (v40[5])
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3MediaLibraryWriter.m"), 346, CFSTR("Authorizer failure should have caused executeUpdate: to return NO"));

      }
    }
    else if (a7)
    {
      v26 = *(void **)(*(_QWORD *)&v49[8] + 40);
      if (v26)
        *a7 = objc_retainAutorelease(v26);
    }

    _Block_object_dispose(v49, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempted to execute query without a valid transaction (transaction ID = %@). You must be within an existing transaction first before executing a query."), v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7)
    {
      +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 200, v24);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v49 = 138543618;
      *(_QWORD *)&v49[4] = v13;
      *(_WORD *)&v49[12] = 2114;
      *(_QWORD *)&v49[14] = v24;
      _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_ERROR, "Error executing query: %{public}@. %{public}@", v49, 0x16u);
    }

    v18 = 0;
  }
  v27 = (id)v40[5];

  _Block_object_dispose(&v39, 8);
  return v27;
}

- (void)performDatabaseOperation:(unint64_t)a3 onLibrary:(id)a4 withAttributes:(id)a5 options:(id)a6 fromClient:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *context;
  _QWORD v35[4];
  id v36;
  id v37;
  id location;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  context = (void *)MEMORY[0x1AF43CC0C]();
  +[ML3DatabaseOperation databaseOperationForType:withLibrary:writer:](ML3DatabaseOperation, "databaseOperationForType:withLibrary:writer:", a3, v14, self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "setOriginatingClient:", v17);
    objc_msgSend(v20, "setOptions:", v16);
    objc_msgSend(v20, "setAttributes:", v15);
    objc_initWeak(&location, v20);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __112__ML3MediaLibraryWriter_performDatabaseOperation_onLibrary_withAttributes_options_fromClient_completionHandler___block_invoke;
    v35[3] = &unk_1E5B63AD8;
    objc_copyWeak(&v37, &location);
    v36 = v18;
    objc_msgSend(v20, "setCompletionBlock:", v35);
    objc_msgSend(v16, "objectForKey:", CFSTR("MLDatabaseOperationOptionEnqueueSerially"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v16, "objectForKey:", CFSTR("MLDatabaseOperationOptionUseLimitedQueue"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    v25 = os_log_create("com.apple.amp.medialibrary", "Writer");
    v26 = v25;
    if (v22)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v17, "bundleID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[NSOperationQueue operationCount](self->_databaseOperationQueue, "operationCount");
        *(_DWORD *)buf = 138543874;
        v40 = v27;
        v41 = 2114;
        v42 = v20;
        v43 = 1024;
        v44 = v28;
        _os_log_impl(&dword_1AC149000, v26, OS_LOG_TYPE_DEFAULT, "Enqueueing %{public}@'s database operation to the service's serial queue: %{public}@. current operation count = %d", buf, 0x1Cu);

      }
      v29 = 64;
    }
    else if (v24)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v17, "bundleID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v32;
        v41 = 2114;
        v42 = v20;
        _os_log_impl(&dword_1AC149000, v26, OS_LOG_TYPE_DEFAULT, "Enqueueing %{public}@'s database operation to the service's limited size queue: %{public}@", buf, 0x16u);

      }
      v29 = 72;
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v17, "bundleID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v33;
        v41 = 2114;
        v42 = v20;
        _os_log_impl(&dword_1AC149000, v26, OS_LOG_TYPE_DEBUG, "Enqueueing %{public}@'s database operation to the service's concurrent queue: %{public}@", buf, 0x16u);

      }
      v29 = 56;
    }

    objc_msgSend(*(id *)((char *)&self->super.isa + v29), "addOperation:", v20);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No operation exists for operation type: %lu"), a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 600, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      (*((void (**)(id, _QWORD, void *))v18 + 2))(v18, 0, v31);

  }
  objc_autoreleasePoolPop(context);

}

- (void)cancelActiveTransactionForClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *serialQueue;
  id v8;
  uint64_t v9;
  _QWORD block[5];
  id v11;
  _BYTE *v12;
  _BYTE buf[24];
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "Writer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = objc_msgSend(v4, "processID");
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "Cleaning up any remaining transactions for ended process %{public}@ (process ID = %d)", buf, 0x12u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v14 = __Block_byref_object_copy__15430;
  v15 = __Block_byref_object_dispose__15431;
  v16 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ML3MediaLibraryWriter_cancelActiveTransactionForClient___block_invoke;
  block[3] = &unk_1E5B65CF0;
  block[4] = self;
  v8 = v4;
  v11 = v8;
  v12 = buf;
  dispatch_sync(serialQueue, block);
  v9 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (v9)
    -[ML3MediaLibraryWriter endTransaction:shouldCommit:error:](self, "endTransaction:shouldCommit:error:", v9, 0, 0);

  _Block_object_dispose(buf, 8);
}

- (void)cancelAllActiveTransactions
{
  NSObject *v3;
  void *v4;
  NSObject *serialQueue;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id WeakRetained;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD block[4];
  id v21;
  ML3MediaLibraryWriter *v22;
  uint8_t buf[16];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "Writer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling all active transactions.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ML3MediaLibraryWriter_cancelAllActiveTransactions__block_invoke;
  block[3] = &unk_1E5B65EB8;
  v6 = v4;
  v21 = v6;
  v22 = self;
  dispatch_sync(serialQueue, block);
  +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 900, CFSTR("The media library service cancelled all active database transactions."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "identifier", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ML3MediaLibraryWriter _destroyTransactionForIdentifier:forceRelinquishConnection:](self, "_destroyTransactionForIdentifier:forceRelinquishConnection:", v14, 1);

        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "mediaLibraryWriter:terminatedTransaction:withError:", self, v13, v7);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v10);
  }

}

- (void)cancelAllActiveDatabaseOperationsAndWaitUntilFinished:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "Writer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling all active database operations.", v6, 2u);
  }

  -[NSOperationQueue cancelAllOperations](self->_databaseOperationQueue, "cancelAllOperations");
  -[NSOperationQueue cancelAllOperations](self->_databaseOperationSerialQueue, "cancelAllOperations");
  -[NSOperationQueue cancelAllOperations](self->_databaseOperationLimitedQueue, "cancelAllOperations");
  if (v3)
  {
    -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_databaseOperationQueue, "waitUntilAllOperationsAreFinished");
    -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_databaseOperationSerialQueue, "waitUntilAllOperationsAreFinished");
    -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_databaseOperationLimitedQueue, "waitUntilAllOperationsAreFinished");
  }
}

- (void)cancelActiveTransationAndDatabaseOperationsForClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  ML3MediaLibraryWriter *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "Writer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling database transaction and operations for client %{public}@", buf, 0xCu);
  }

  -[ML3MediaLibraryWriter _allDatabaseOperations](self, "_allDatabaseOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__ML3MediaLibraryWriter_cancelActiveTransationAndDatabaseOperationsForClient___block_invoke;
  block[3] = &unk_1E5B659D0;
  v11 = v6;
  v12 = v4;
  v13 = self;
  v8 = v4;
  v9 = v6;
  dispatch_async(v7, block);

}

- (void)reset
{
  NSObject *serialQueue;
  _QWORD block[5];

  -[ML3MediaLibraryWriter cancelAllActiveTransactions](self, "cancelAllActiveTransactions");
  -[ML3MediaLibraryWriter cancelAllActiveDatabaseOperationsAndWaitUntilFinished:](self, "cancelAllActiveDatabaseOperationsAndWaitUntilFinished:", 1);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__ML3MediaLibraryWriter_reset__block_invoke;
  block[3] = &unk_1E5B65D80;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (id)_allDatabaseOperations
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSOperationQueue operations](self->_databaseOperationQueue, "operations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[NSOperationQueue operations](self->_databaseOperationSerialQueue, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[NSOperationQueue operations](self->_databaseOperationLimitedQueue, "operations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

- (void)_setupWatchdogTimer
{
  id v3;
  void *v4;
  NSTimer *v5;
  NSTimer *watchdogTimer;
  id v7;

  if (self->_watchdogTimer)
    -[ML3MediaLibraryWriter _tearDownWatchdogTimer](self, "_tearDownWatchdogTimer");
  v3 = objc_alloc(MEMORY[0x1E0C99E88]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", self->_transactionTimeout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSTimer *)objc_msgSend(v3, "initWithFireDate:interval:target:selector:userInfo:repeats:", v4, self, sel__watchdogTimerFired_, 0, 1, self->_transactionTimeout);
  watchdogTimer = self->_watchdogTimer;
  self->_watchdogTimer = v5;

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTimer:forMode:", self->_watchdogTimer, *MEMORY[0x1E0C99748]);

}

- (void)_tearDownWatchdogTimer
{
  NSTimer *watchdogTimer;
  NSTimer *v4;

  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    -[NSTimer invalidate](watchdogTimer, "invalidate");
    v4 = self->_watchdogTimer;
    self->_watchdogTimer = 0;

  }
}

- (BOOL)_shouldWatchdogTransaction:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double transactionTimeout;
  char v10;
  BOOL v11;
  int AppBooleanValue;
  char v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(v4, "lastUsedTime");
  v8 = v6 - v7;
  transactionTimeout = self->_transactionTimeout;
  v10 = objc_msgSend(v4, "inUseByOperation");
  v11 = 0;
  if (v8 > transactionTimeout && (v10 & 1) == 0)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.medialibraryd"));
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MediaLibraryWatchdogDisabled"), CFSTR("com.apple.medialibraryd"), 0);
    v13 = objc_msgSend(v4, "terminable");
    if (AppBooleanValue)
      v11 = 0;
    else
      v11 = v13;
  }

  return v11;
}

- (void)_watchdogTimerFired:(id)a3
{
  void *v4;
  NSObject *serialQueue;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id WeakRetained;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[5];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_transactionTimeout != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__ML3MediaLibraryWriter__watchdogTimerFired___block_invoke;
    block[3] = &unk_1E5B65EB8;
    block[4] = self;
    v6 = v4;
    v20 = v6;
    dispatch_sync(serialQueue, block);
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 900, CFSTR("Media library database transaction was terminated due to inactivity."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[ML3MediaLibraryWriter _destroyTransaction:forceRelinquishConnection:](self, "_destroyTransaction:forceRelinquishConnection:", v13, 1, (_QWORD)v15);
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(WeakRetained, "mediaLibraryWriter:terminatedTransaction:withError:", self, v13, v7);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v10);
    }

  }
}

- (ML3MediaLibraryWriterDelegate)delegate
{
  return (ML3MediaLibraryWriterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)transactionTimeout
{
  return self->_transactionTimeout;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSMutableDictionary)transactionMap
{
  return self->_transactionMap;
}

- (NSOperationQueue)databaseOperationQueue
{
  return self->_databaseOperationQueue;
}

- (NSOperationQueue)databaseOperationSerialQueue
{
  return self->_databaseOperationSerialQueue;
}

- (NSOperationQueue)databaseOperationLimitedQueue
{
  return self->_databaseOperationLimitedQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseOperationLimitedQueue, 0);
  objc_storeStrong((id *)&self->_databaseOperationSerialQueue, 0);
  objc_storeStrong((id *)&self->_databaseOperationQueue, 0);
  objc_storeStrong((id *)&self->_transactionMap, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
}

void __45__ML3MediaLibraryWriter__watchdogTimerFired___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__ML3MediaLibraryWriter__watchdogTimerFired___block_invoke_2;
  v4[3] = &unk_1E5B63B28;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __45__ML3MediaLibraryWriter__watchdogTimerFired___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldWatchdogTransaction:", v4))
  {
    objc_msgSend(v4, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "client");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleID");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = CFSTR("<Unknown>");
    }
    v8 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "** WARNING ** Writer daemon transaction was watchdogged for %{public}@. Forcing return of connection. %{public}@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }

}

uint64_t __30__ML3MediaLibraryWriter_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
}

void __78__ML3MediaLibraryWriter_cancelActiveTransationAndDatabaseOperationsForClient___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v16;
    *(_QWORD *)&v4 = 138543362;
    v14 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "originatingClient", v14, (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 40));

        if (v10)
        {
          v11 = os_log_create("com.apple.amp.medialibrary", "Writer");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v8;
            _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "Cancelling operation %{public}@", buf, 0xCu);
          }

          objc_msgSend(v8, "cancel");
          objc_msgSend(v8, "waitUntilFinished");
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 48), "cancelActiveTransactionForClient:", *(_QWORD *)(a1 + 40));
  v12 = os_log_create("com.apple.amp.medialibrary", "Writer");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v20 = v13;
    _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Finished cancelling database operations for client %{public}@", buf, 0xCu);
  }

}

void __52__ML3MediaLibraryWriter_cancelAllActiveTransactions__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "allValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObjectsFromArray:", v2);

}

void __58__ML3MediaLibraryWriter_cancelActiveTransactionForClient___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__ML3MediaLibraryWriter_cancelActiveTransactionForClient___block_invoke_2;
  v6[3] = &unk_1E5B63B00;
  v4 = v2;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __58__ML3MediaLibraryWriter_cancelActiveTransactionForClient___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  v8 = a3;
  objc_msgSend(v8, "client");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v8, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v12)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

void __112__ML3MediaLibraryWriter_performDatabaseOperation_onLibrary_withAttributes_options_fromClient_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "success");
    objc_msgSend(v3, "error");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = os_log_create("com.apple.amp.medialibrary", "Writer");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "originatingClient");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v9;
        v15 = 2114;
        v16 = v6;
        _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "Error executing database operation for %{public}@: %{public}@", (uint8_t *)&v13, 0x16u);

      }
    }
    else
    {
      v7 = os_log_create("com.apple.amp.medialibrary", "Writer_Oversize");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "originatingClient");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v3;
        v15 = 2114;
        v16 = v11;
        _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "Successfully executed database operation %{public}@ for process %{public}@", (uint8_t *)&v13, 0x16u);

      }
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
    v4 = 0;
  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v4, v6);

}

void __90__ML3MediaLibraryWriter_executeUntrustedQuery_withParameters_options_onTransaction_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = *(_QWORD *)(a1[10] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v2, "executeQuery:withParameters:options:onTransaction:error:", v3, v4, v5, v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[9] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __81__ML3MediaLibraryWriter_executeQuery_withParameters_options_onTransaction_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(_QWORD *)(v8 + 24);
  if (v9 >= *(_QWORD *)(a1 + 64))
  {
    if (!v17 || v7)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 40), "sqliteError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Database error while fetching rows: %@"), v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 300, v11);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      *a4 = 1;
    }
    else
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v17, "arrayRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);
    }

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(_QWORD *)(v8 + 24);
  }
  *(_QWORD *)(v8 + 24) = v9 + 1;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - *(_QWORD *)(a1 + 64) >= *(_QWORD *)(a1 + 72))
    *a4 = 1;

}

void __36__ML3MediaLibraryWriter_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "description");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v4);

}

+ (id)writerErrorWithCode:(int64_t)a3 description:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  if (a5)
    v8 = a5;
  else
    v8 = (id)MEMORY[0x1E0C9AA70];
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MLWriterErrorDomain"), a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)writerErrorWithCode:(int64_t)a3 description:(id)a4
{
  return (id)objc_msgSend(a1, "writerErrorWithCode:description:userInfo:", a3, a4, 0);
}

@end
