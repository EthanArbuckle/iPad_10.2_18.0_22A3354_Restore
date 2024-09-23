@implementation CSOSTransactionStat

- (CSOSTransactionStat)init
{
  CSOSTransactionStat *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSOSTransactionStat;
  v2 = -[CSOSTransactionStat init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSOSTransactionStat", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)reportCreation
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CSOSTransactionStat_reportCreation__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reportDestroy
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CSOSTransactionStat_reportDestroy__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (int)numTransaction
{
  NSObject *queue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__CSOSTransactionStat_numTransaction__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int)numTransactionNow
{
  return self->_numTransactionNow;
}

- (void)setNumTransactionNow:(int)a3
{
  self->_numTransactionNow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __37__CSOSTransactionStat_numTransaction__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

void __36__CSOSTransactionStat_reportDestroy__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = 136315394;
    v5 = "-[CSOSTransactionStat reportDestroy]_block_invoke";
    v6 = 1024;
    v7 = v3;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s NumTransactionNow = %d", (uint8_t *)&v4, 0x12u);
  }
}

void __37__CSOSTransactionStat_reportCreation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = 136315394;
    v5 = "-[CSOSTransactionStat reportCreation]_block_invoke";
    v6 = 1024;
    v7 = v3;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s NumTransactionNow = %d", (uint8_t *)&v4, 0x12u);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1899 != -1)
    dispatch_once(&sharedInstance_onceToken_1899, &__block_literal_global_1900);
  return (id)sharedInstance_sharedInstance_1901;
}

void __37__CSOSTransactionStat_sharedInstance__block_invoke()
{
  CSOSTransactionStat *v0;
  void *v1;

  v0 = objc_alloc_init(CSOSTransactionStat);
  v1 = (void *)sharedInstance_sharedInstance_1901;
  sharedInstance_sharedInstance_1901 = (uint64_t)v0;

}

@end
