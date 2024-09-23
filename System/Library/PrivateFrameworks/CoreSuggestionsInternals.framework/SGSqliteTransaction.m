@implementation SGSqliteTransaction

+ (void)readTransactionWithHandle:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SGSqliteTransaction_readTransactionWithHandle_block___block_invoke;
  v9[3] = &unk_1E7DB7578;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "readTransaction:", v9);

}

+ (void)writeTransactionWithHandle:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SGSqliteTransaction_writeTransactionWithHandle_block___block_invoke;
  v9[3] = &unk_1E7DB7578;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "writeTransaction:", v9);

}

void __56__SGSqliteTransaction_writeTransactionWithHandle_block___block_invoke(uint64_t a1)
{
  uint64_t v1;
  SGSqliteWriteTransaction *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[SGSqliteWriteTransaction initWithHandle:]([SGSqliteWriteTransaction alloc], "initWithHandle:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, SGSqliteWriteTransaction *))(v1 + 16))(v1, v2);

}

void __55__SGSqliteTransaction_readTransactionWithHandle_block___block_invoke(uint64_t a1)
{
  uint64_t v1;
  SGSqliteReadTransaction *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[SGSqliteReadTransaction initWithHandle:]([SGSqliteReadTransaction alloc], "initWithHandle:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, SGSqliteReadTransaction *))(v1 + 16))(v1, v2);

}

@end
