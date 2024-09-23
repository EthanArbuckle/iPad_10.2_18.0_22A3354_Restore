@implementation MKCallHistoryMigrator

- (MKCallHistoryMigrator)init
{
  MKCallHistoryMigrator *v2;
  MKCallHistoryMigrator *v3;
  CHManager *v4;
  CHManager *callHistoryManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKCallHistoryMigrator;
  v2 = -[MKMigrator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MKMigrator setType:](v2, "setType:", 6);
    v4 = (CHManager *)objc_alloc_init(MEMORY[0x24BE14938]);
    callHistoryManager = v3->_callHistoryManager;
    v3->_callHistoryManager = v4;

  }
  return v3;
}

- (void)importDataEncodedInJSON:(id)a3
{
  MKCallHistoryMigrator *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x2207B99F4](v5);
  -[MKCallHistoryMigrator import:](v4, "import:", v7);
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v4);

}

- (void)import:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;

  v4 = a3;
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v6)
  {
    +[MKLog log](MKLog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MKCallHistoryMigrator import:].cold.1((uint64_t)v6, v7);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MKCallHistoryMigrator importNumbers:](self, "importNumbers:", v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MKCallHistoryMigrator importCallHistory:size:](self, "importCallHistory:size:", v5, objc_msgSend(v4, "length"));
  }

}

- (void)importNumbers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  MKCallHistoryNumbers *v9;

  v4 = a3;
  v9 = -[MKCallHistoryNumbers initWithSerializedData:]([MKCallHistoryNumbers alloc], "initWithSerializedData:", v4);

  v5 = (void *)MEMORY[0x24BDBCF20];
  -[MKCallHistoryNumbers numbersInUse](v9, "numbersInUse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  objc_msgSend(WeakRetained, "createLabelsForNumbersInUse:", v7);

}

- (void)importCallHistory:(id)a3 size:(unint64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CHManager *callHistoryManager;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21[3];
  id location;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_label);
    +[MKCallHistory calls:label:](MKCallHistory, "calls:label:", v6, WeakRetained);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v6, "count");
    v10 = v9 - objc_msgSend(v8, "count");
    v11 = (void *)objc_msgSend(v8, "count");
    if (v10 >= 1)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD0FC8];
      v24 = CFSTR("could not parse call history data.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("MKCallHistoryError"), 0, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMigrator migratorDidFailWithImportError:count:](self, "migratorDidFailWithImportError:count:", v14, v10);

    }
    if (v11)
    {
      -[MKMigrator delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "migratorWillExecuteOperation:", self);

      objc_initWeak(&location, self);
      callHistoryManager = self->_callHistoryManager;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __48__MKCallHistoryMigrator_importCallHistory_size___block_invoke;
      v20[3] = &unk_24E3591D8;
      objc_copyWeak(v21, &location);
      v21[1] = v11;
      v21[2] = (id)a4;
      -[CHManager addArrayToCallHistory:withCompletion:](callHistoryManager, "addArrayToCallHistory:withCompletion:", v8, v20);
      objc_destroyWeak(v21);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MKCallHistoryMigrator importCallHistory:size:].cold.1(v17);

    v18 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FC8];
    v26[0] = CFSTR("could not parse call history data.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("MKCallHistoryError"), 0, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v19);

  }
}

void __48__MKCallHistoryMigrator_importCallHistory_size___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didImportCallHistory:size:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)didImportCallHistory:(unint64_t)a3 size:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[MKLog log](MKLog, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_21EC08000, v7, OS_LOG_TYPE_INFO, "did import call history. count=%lu", (uint8_t *)&v9, 0xCu);
  }

  -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", a4);
  -[MKMigrator migratorDidImportWithCount:](self, "migratorDidImportWithCount:", a3);
  -[MKMigrator delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "migratorDidExecuteOperation:", self);

}

- (MKSIMLabel)label
{
  return (MKSIMLabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
}

- (void)import:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "could not deserialize call history data. error=%@", (uint8_t *)&v2, 0xCu);
}

- (void)importCallHistory:(os_log_t)log size:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "could not parse call history data.", v1, 2u);
}

@end
