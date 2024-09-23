@implementation CCDataResourceWriter

- (CCDataResourceWriter)initWithDataResource:(id)a3 accessAssertion:(id)a4
{
  id v7;
  id v8;
  CCDataResourceWriter *v9;
  CCDataResourceWriter *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CCDataResourceWriter;
  v9 = -[CCDataResourceWriter init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataResource, a3);
    objc_storeStrong((id *)&v10->_accessAssertion, a4);
    -[CCDataResourceWriter description](v10, "description");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "cStringUsingEncoding:", 4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create(v12, v13);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v14;

  }
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)CCDataResourceWriter;
  -[CCDataResourceWriter description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, self->_dataResource);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)initializeDatabaseWithLocalDeviceIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__CCDataResourceWriter_initializeDatabaseWithLocalDeviceIdentifier_error___block_invoke;
  block[3] = &unk_250990EC8;
  v10 = v5;
  v11 = &v12;
  block[4] = self;
  v7 = v5;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)queue;
}

uint64_t __74__CCDataResourceWriter_initializeDatabaseWithLocalDeviceIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_createDatabaseIfNotExistsWithLocalDeviceIdentifier:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)submitDatabaseTransactionUsingBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
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
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CCDataResourceWriter_submitDatabaseTransactionUsingBlock___block_invoke;
  block[3] = &unk_250990EF0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __60__CCDataResourceWriter_submitDatabaseTransactionUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_executeDatabaseTransactionUsingBlock:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)performMaintenance:(id *)a3 shouldDefer:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__CCDataResourceWriter_performMaintenance_shouldDefer___block_invoke;
  v11[3] = &unk_250990F18;
  v13 = &v21;
  v14 = &v15;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  dispatch_sync(queue, v11);
  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __55__CCDataResourceWriter_performMaintenance_shouldDefer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v2 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "_didCompleteMaintenance:shouldDefer:", &obj, *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(v2 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
}

- (BOOL)_databaseExists
{
  void *v3;
  id v4;
  BOOL v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CCDataResource databaseURL](self->_dataResource, "databaseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = access((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 0) == 0;

  return v5;
}

- (BOOL)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  CCDataResource *dataResource;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  NSObject *v17;
  char v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  BOOL v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  id v54;
  uint8_t buf[4];
  CCDataResource *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CCDataResource databaseURL](self->_dataResource, "databaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CCDataResourceWriter _databaseExists](self, "_databaseExists");
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.1((uint64_t *)&self->_dataResource, v5, v8);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    dataResource = self->_dataResource;
    objc_msgSend(v5, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v56 = dataResource;
    v57 = 2112;
    v58 = v11;
    _os_log_impl(&dword_237B25000, v8, OS_LOG_TYPE_DEFAULT, "(%@) Creating database at path: %@", buf, 0x16u);

  }
  -[CCDataResource dataSite](self->_dataResource, "dataSite");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCDatabaseConnection connectionToDatabaseAtURL:dataProtectionClass:openMode:accessAssertion:](CCDatabaseConnection, "connectionToDatabaseAtURL:dataProtectionClass:openMode:accessAssertion:", v5, objc_msgSend(v12, "dataProtectionClass"), 3, self->_accessAssertion);
  v8 = objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.2(v15, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_30;
  }
  v54 = 0;
  v13 = -[NSObject openWithError:](v8, "openWithError:", &v54);
  v14 = v54;
  v15 = v14;
  if ((v13 & 1) == 0)
  {
    __biome_log_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.9();
    goto LABEL_29;
  }
  v53 = v14;
  v16 = -[NSObject beginTransactionWithError:](v8, "beginTransactionWithError:", &v53);
  v17 = v53;

  if ((v16 & 1) == 0)
  {
    __biome_log_for_category();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.8();
    goto LABEL_22;
  }
  v52 = v17;
  v18 = -[NSObject prepareWithError:](v8, "prepareWithError:", &v52);
  v15 = v52;

  if ((v18 & 1) == 0)
  {
    __biome_log_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.7();
    goto LABEL_29;
  }
  v19 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSince1970");
  objc_msgSend(v19, "numberWithLongLong:", (uint64_t)(v21 * 1000000.0));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[CCDatabaseUpdater insertResourceVersion:database:](CCDatabaseUpdater, "insertResourceVersion:database:", v22, v8);

  if (!v23)
  {
    __biome_log_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.6(v33, v35, v36, v37, v38, v39, v40, v41);
    goto LABEL_29;
  }
  if (!+[CCDatabaseUpdater insertOrUpdateLocalDeviceIdentifier:database:](CCDatabaseUpdater, "insertOrUpdateLocalDeviceIdentifier:database:", v4, v8))
  {
    __biome_log_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.5(v33, v42, v43, v44, v45, v46, v47, v48);
    goto LABEL_29;
  }
  v51 = v15;
  v24 = -[NSObject commitTransactionWithError:](v8, "commitTransactionWithError:", &v51);
  v17 = v51;

  if ((v24 & 1) == 0)
  {
    __biome_log_for_category();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.4();
LABEL_22:

    v15 = v17;
LABEL_30:

    v9 = 0;
    goto LABEL_31;
  }
  v50 = v17;
  v25 = -[NSObject closeWithError:](v8, "closeWithError:", &v50);
  v15 = v50;

  if ((v25 & 1) == 0)
  {
    __biome_log_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[CCDataResourceWriter _createDatabaseIfNotExistsWithLocalDeviceIdentifier:].cold.3();
LABEL_29:

    goto LABEL_30;
  }

LABEL_4:
  v9 = 1;
LABEL_31:

  return v9;
}

- (BOOL)_tombstoneResource:(id *)a3
{
  CCDataResource *dataResource;
  void *v5;

  dataResource = self->_dataResource;
  v5 = (void *)objc_opt_new();
  LOBYTE(a3) = -[CCDataResource markTombstoned:error:](dataResource, "markTombstoned:error:", v5, a3);

  return (char)a3;
}

- (BOOL)_clearTombstoneStatus:(id *)a3
{
  return -[CCDataResource clearTombstoneStatus:](self->_dataResource, "clearTombstoneStatus:", a3);
}

- (id)_loadDatabase:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CCDataResource databaseURL](self->_dataResource, "databaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CCDataResourceWriter _databaseExists](self, "_databaseExists"))
  {
    -[CCDataResource dataSite](self->_dataResource, "dataSite");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CCDatabaseConnection connectionToDatabaseAtURL:dataProtectionClass:openMode:accessAssertion:](CCDatabaseConnection, "connectionToDatabaseAtURL:dataProtectionClass:openMode:accessAssertion:", v5, objc_msgSend(v6, "dataProtectionClass"), 2, self->_accessAssertion);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "openWithError:", a3))
      v8 = v7;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_executeDatabaseTransactionUsingBlock:(id)a3
{
  unsigned int (**v4)(id, void *, _QWORD *);
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  CCDataResource *dataResource;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  char v18;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  CCDataResource *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned int (**)(id, void *, _QWORD *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v24 = 0;
  -[CCDataResourceWriter _loadDatabase:](self, "_loadDatabase:", &v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v24;
  v7 = v6;
  if (!v5)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CCDataResourceWriter _executeDatabaseTransactionUsingBlock:].cold.1();

LABEL_17:
    v14 = 0;
    goto LABEL_22;
  }
  v23 = v6;
  v8 = objc_msgSend(v5, "beginTransactionWithError:", &v23);
  v9 = v23;

  if ((v8 & 1) != 0)
  {
    v22 = 0;
    if (v4[2](v4, v5, &v22)
      && objc_msgSend((id)objc_opt_class(), "incrementRowsModified:database:", v22, v5))
    {
      v21 = v9;
      v10 = objc_msgSend(v5, "commitTransactionWithError:", &v21);
      v7 = v21;

      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          dataResource = self->_dataResource;
          *(_DWORD *)buf = 138412290;
          v26 = dataResource;
          _os_log_impl(&dword_237B25000, v12, OS_LOG_TYPE_DEFAULT, "(%@) Successfully committed database transaction", buf, 0xCu);
        }
        v14 = 1;
LABEL_21:

        goto LABEL_22;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CCDataResourceWriter _executeDatabaseTransactionUsingBlock:].cold.3();

    }
    else
    {
      v7 = v9;
    }
    v17 = v7;
    v20 = v7;
    v18 = objc_msgSend(v5, "rollbackTransactionWithError:", &v20);
    v7 = v20;

    if ((v18 & 1) == 0)
    {
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CCDataResourceWriter _executeDatabaseTransactionUsingBlock:].cold.2();
      v14 = 0;
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  __biome_log_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[CCDataResourceWriter _executeDatabaseTransactionUsingBlock:].cold.4();

  v14 = 0;
  v7 = v9;
LABEL_22:

  return v14;
}

- (BOOL)_cleanupDatabaseIfRequired
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  unint64_t v9;
  NSObject *v10;
  CCDataResource *dataResource;
  const __CFString *v12;
  int v13;
  id v14;
  NSObject *v15;
  char v16;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  CCDataResource *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v21 = 0;
  -[CCDataResourceWriter _loadDatabase:](self, "_loadDatabase:", &v21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v21;
  if (v3)
  {
    v20 = v4;
    +[CCDatabaseUpdater selectRowsModifiedCountInDatabase:error:](CCDatabaseUpdater, "selectRowsModifiedCountInDatabase:error:", v3, &v20);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v20;

    if (v6)
    {
      __biome_log_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CCDataResourceWriter _cleanupDatabaseIfRequired].cold.5();
      goto LABEL_25;
    }
    v9 = -[NSObject unsignedIntegerValue](v5, "unsignedIntegerValue");
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      dataResource = self->_dataResource;
      v12 = CFSTR("not ");
      *(_DWORD *)buf = 138412802;
      if (v9 > 0x3E8)
        v12 = &stru_250991730;
      v23 = dataResource;
      v24 = 2112;
      v25 = v12;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_237B25000, v10, OS_LOG_TYPE_DEFAULT, "(%@) Database cleanup is %@ required. %@ rows have been modified since last cleanup", buf, 0x20u);
    }

    if (v9 < 0x3E9)
    {
      v14 = 0;
    }
    else
    {
      v19 = 0;
      v13 = objc_msgSend(v3, "cleanup:", &v19);
      v14 = v19;
      if (!v13)
      {
        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CCDataResourceWriter _cleanupDatabaseIfRequired].cold.2();
        goto LABEL_21;
      }
      if (!+[CCDatabaseUpdater insertOrUpdateRowsModified:database:](CCDatabaseUpdater, "insertOrUpdateRowsModified:database:", 0, v3))
      {
        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CCDataResourceWriter _cleanupDatabaseIfRequired].cold.3();
LABEL_21:

        v8 = 0;
        goto LABEL_22;
      }
    }
    v8 = 1;
LABEL_22:
    v18 = v14;
    v16 = objc_msgSend(v3, "closeWithError:", &v18);
    v6 = v18;

    if ((v16 & 1) != 0)
    {
LABEL_26:
      v4 = v6;
      goto LABEL_27;
    }
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CCDataResourceWriter _cleanupDatabaseIfRequired].cold.2();
LABEL_25:

    v8 = 0;
    goto LABEL_26;
  }
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CCDataResourceWriter _executeDatabaseTransactionUsingBlock:].cold.1();
  v8 = 0;
LABEL_27:

  return v8;
}

- (BOOL)_didCompleteMaintenance:(id *)a3 shouldDefer:(id)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  _BOOL4 v9;
  CCDataResource *dataResource;
  unsigned int (**v11)(_QWORD);
  NSObject *v12;
  CCDataResource *v13;
  CCDataResource *v14;
  BOOL v15;
  NSObject *v16;
  CCDataResource *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  CCDataResource *v22;
  NSObject *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  CCDataResource *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = -[CCDataResourceWriter _databaseExists](self, "_databaseExists");
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      dataResource = self->_dataResource;
      *(_DWORD *)buf = 138412290;
      v29 = dataResource;
      _os_log_impl(&dword_237B25000, v8, OS_LOG_TYPE_DEFAULT, "(%@) Starting data resource-specific maintenance", buf, 0xCu);
    }

    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __60__CCDataResourceWriter__didCompleteMaintenance_shouldDefer___block_invoke;
    v26[3] = &unk_250990F40;
    v26[4] = self;
    v11 = (unsigned int (**)(_QWORD))v6;
    v27 = v11;
    if (!-[CCDataResourceWriter _executeDatabaseTransactionUsingBlock:](self, "_executeDatabaseTransactionUsingBlock:", v26))
    {
      __biome_log_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CCDataResourceWriter _didCompleteMaintenance:shouldDefer:].cold.4();

      goto LABEL_29;
    }

    if (v11 && v11[2](v11))
    {
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_dataResource;
        *(_DWORD *)buf = 138412290;
        v29 = v13;
        _os_log_impl(&dword_237B25000, v12, OS_LOG_TYPE_DEFAULT, "(%@) Aborting maintenance due to deferral signal", buf, 0xCu);
      }
LABEL_28:

LABEL_29:
      v15 = 0;
      goto LABEL_30;
    }
    if (!-[CCDataResourceWriter _cleanupDatabaseIfRequired](self, "_cleanupDatabaseIfRequired"))
    {
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CCDataResourceWriter _didCompleteMaintenance:shouldDefer:].cold.3();
      goto LABEL_28;
    }
    if (!-[CCDataResourceWriter _executeDatabaseTransactionUsingBlock:](self, "_executeDatabaseTransactionUsingBlock:", &__block_literal_global_6))
    {
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CCDataResourceWriter _didCompleteMaintenance:shouldDefer:].cold.2();
      goto LABEL_28;
    }
    if (a3)
    {
      v17 = self->_dataResource;
      v25 = 0;
      -[CCDataResource setWithError:](v17, "setWithError:", &v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v25;
      if (!v18)
      {
        __biome_log_for_category();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[CCDataResourceWriter _didCompleteMaintenance:shouldDefer:].cold.1();

        goto LABEL_29;
      }
      v20 = objc_retainAutorelease(v18);
      *a3 = v20;

    }
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_dataResource;
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_impl(&dword_237B25000, v21, OS_LOG_TYPE_DEFAULT, "(%@) Finished database maintenance", buf, 0xCu);
    }

  }
  else
  {
    if (v9)
    {
      v14 = self->_dataResource;
      *(_DWORD *)buf = 138412290;
      v29 = v14;
      _os_log_impl(&dword_237B25000, v8, OS_LOG_TYPE_DEFAULT, "(%@) Database not found", buf, 0xCu);
    }

  }
  v15 = 1;
LABEL_30:

  return v15;
}

uint64_t __60__CCDataResourceWriter__didCompleteMaintenance_shouldDefer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  v6 = objc_msgSend((id)objc_opt_class(), "performMaintenanceOnDatabase:modifiedCount:shouldDefer:", v5, a3, *(_QWORD *)(a1 + 40));

  return v6;
}

BOOL __60__CCDataResourceWriter__didCompleteMaintenance_shouldDefer___block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  v4 = +[CCDatabaseUpdater insertOrUpdateLastMaintenanceDate:database:](CCDatabaseUpdater, "insertOrUpdateLastMaintenanceDate:database:", v3, v2);

  return v4;
}

+ (BOOL)incrementRowsModified:(unint64_t)a3 database:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  BOOL v11;
  uint64_t v13;

  v5 = a4;
  v13 = 0;
  +[CCDatabaseUpdater selectRowsModifiedCountInDatabase:error:](CCDatabaseUpdater, "selectRowsModifiedCountInDatabase:error:", v5, &v13);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = v13;
  v9 = &unk_2509A1CD0;
  if (v6)
    v9 = (void *)v6;
  v10 = v9;

  if (v8)
    v11 = 0;
  else
    v11 = +[CCDatabaseUpdater insertOrUpdateRowsModified:database:](CCDatabaseUpdater, "insertOrUpdateRowsModified:database:", objc_msgSend(v10, "unsignedIntegerValue") + a3, v5);

  return v11;
}

- (CCDataResource)dataResource
{
  return self->_dataResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataResource, 0);
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:(NSObject *)a3 .cold.1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  objc_msgSend(a2, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_237B25000, a3, OS_LOG_TYPE_DEBUG, "(%@) Database already exists at path: %@", (uint8_t *)&v6, 0x16u);

}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_237B25000, a1, a3, "Could not create database, missing local device identifier", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Could not close database connection with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Could not commit database transaction with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_237B25000, a1, a3, "Could not create database, failed to insert local device identifier", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_237B25000, a1, a3, "Could not create database, failed to insert resource version", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Could not prepare database connection with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Could not begin database transaction with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createDatabaseIfNotExistsWithLocalDeviceIdentifier:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "Could not open database connection with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_executeDatabaseTransactionUsingBlock:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5_0(&dword_237B25000, v0, v1, "(%@) Failed to open database: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_executeDatabaseTransactionUsingBlock:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5_0(&dword_237B25000, v0, v1, "(%@) Failed to rollback transaction: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_executeDatabaseTransactionUsingBlock:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5_0(&dword_237B25000, v0, v1, "(%@) Failed to commit transaction: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_executeDatabaseTransactionUsingBlock:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5_0(&dword_237B25000, v0, v1, "(%@) Failed to begin transaction: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_cleanupDatabaseIfRequired
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5_0(&dword_237B25000, v0, v1, "(%@) Failed to select database rows modified with error: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_didCompleteMaintenance:shouldDefer:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5_0(&dword_237B25000, v0, v1, "(%@) Failed to resolve set: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_didCompleteMaintenance:shouldDefer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "(%@) Failed to update last maintenance date", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_didCompleteMaintenance:shouldDefer:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "(%@) Failed to clean database", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_didCompleteMaintenance:shouldDefer:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "(%@) Failed to perform data resource-specific maintenance", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
