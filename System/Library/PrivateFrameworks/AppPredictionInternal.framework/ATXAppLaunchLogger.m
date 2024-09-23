@implementation ATXAppLaunchLogger

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_0 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_0, &__block_literal_global_83);
  return (id)sharedInstance__pasExprOnceResult_13;
}

void __36__ATXAppLaunchLogger_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = -[ATXAppLaunchLogger _init]([ATXAppLaunchLogger alloc], "_init");
  v2 = (void *)sharedInstance__pasExprOnceResult_13;
  sharedInstance__pasExprOnceResult_13 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXAppLaunchLogger;
  result = -[ATXAbstractVersionedDatabase initWithDefaultPath:](&v3, sel_initWithDefaultPath_, CFSTR("_ATXLoggerStore.db"));
  if (result)
    *((_BYTE *)result + 33) = 1;
  return result;
}

- (id)createCustomSchema
{
  return &unk_1E83CF9C8;
}

- (int64_t)latestVersion
{
  return 1;
}

- (void)logAppLaunchFrom:(unint64_t)a3 at:(id)a4
{
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;
  _QWORD block[4];
  id v19;
  id v20;

  v7 = a4;
  queue = self->super._queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__ATXAppLaunchLogger_logAppLaunchFrom_at___block_invoke;
  v15[3] = &unk_1E82DEAD0;
  v15[4] = self;
  v16 = v7;
  v17 = a3;
  v10 = v15;
  v11 = queue;
  v12 = v7;
  sel_getName(a2);
  v13 = (void *)os_transaction_create();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_txn_block_invoke;
  block[3] = &unk_1E82DB0F0;
  v19 = v13;
  v20 = v10;
  v14 = v13;
  dispatch_async(v11, block);

}

void __42__ATXAppLaunchLogger_logAppLaunchFrom_at___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[33])
  {
    objc_msgSend(v2, "db");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__ATXAppLaunchLogger_logAppLaunchFrom_at___block_invoke_2;
    v6[3] = &unk_1E82DEA88;
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = v4;
    v8 = v5;
    objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO launches (ts, launchType) VALUES (:ts, :launchType)"), v6, 0, 0);

  }
}

void __42__ATXAppLaunchLogger_logAppLaunchFrom_at___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "timeIntervalSince1970");
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":ts", (uint64_t)(v4 * 1000.0));
  objc_msgSend(v5, "bindNamedParam:toInteger:", ":launchType", *(_QWORD *)(a1 + 40));

}

@end
