@implementation HDSQLiteEntityEnumerateColumns

void __HDSQLiteEntityEnumerateColumns_block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  _BOOL4 HasForeignKey;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  _HDSQLiteEntityColumn *v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *(id *)a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HasForeignKey = HDKeyPathTypeHasForeignKey(*(unsigned __int8 *)(a2 + 16));
  if (v5)
    v7 = 0;
  else
    v7 = HasForeignKey;
  if (v7)
  {
    _HKInitializeLogging();
    v8 = (id)*MEMORY[0x24BDD2FD8];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "databaseTable");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __HDSQLiteEntityEnumerateColumns_block_invoke_cold_1((uint64_t)v4, v9, v11, v8);
    }

  }
  v10 = -[_HDSQLiteEntityColumn initWithName:columnType:keyPathType:foreignKey:]([_HDSQLiteEntityColumn alloc], "initWithName:columnType:keyPathType:foreignKey:", v4, *(_QWORD *)(a2 + 8), *(unsigned __int8 *)(a2 + 16), v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __HDSQLiteEntityEnumerateColumns_block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_210F9A000, log, OS_LOG_TYPE_FAULT, "Expected foreign key for column %@ of table %@ and none found", buf, 0x16u);

}

@end
