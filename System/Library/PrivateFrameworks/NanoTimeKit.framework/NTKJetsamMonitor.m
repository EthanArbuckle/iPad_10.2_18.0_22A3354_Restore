@implementation NTKJetsamMonitor

+ (id)sharedJetsamMonitor
{
  if (sharedJetsamMonitor_onceToken != -1)
    dispatch_once(&sharedJetsamMonitor_onceToken, &__block_literal_global_57);
  return (id)sharedJetsamMonitor_monitor;
}

- (void)incrementTransactionCount
{
  NSObject *monitorQ;
  _QWORD block[5];

  monitorQ = self->_monitorQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NTKJetsamMonitor_incrementTransactionCount__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(monitorQ, block);
}

- (void)decrementTransactionCount
{
  NSObject *monitorQ;
  _QWORD block[5];

  monitorQ = self->_monitorQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NTKJetsamMonitor_decrementTransactionCount__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(monitorQ, block);
}

void __45__NTKJetsamMonitor_incrementTransactionCount__block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  dispatch_source_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD v16[3];
  uint8_t buf[4];
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 24);
  *(_DWORD *)(v1 + 24) = v2 + 1;
  if (!v2)
  {
    v4 = objc_opt_new();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    memset(v16, 0, sizeof(v16));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "getInfo:", v16);
    _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = (float)((float)v16[0] * 0.00097656);
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "NTKJetsamMonitor: start logging, footprint = %.3f", buf, 0xCu);
    }

    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 16);
    *(_QWORD *)(v9 + 16) = v8;

    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v12 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v11, v12, 0x3B9ACA00uLL, 0x1DCD6500uLL);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v13 + 16);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__NTKJetsamMonitor_incrementTransactionCount__block_invoke_61;
    v15[3] = &unk_1E6BCD5F0;
    v15[4] = v13;
    dispatch_source_set_event_handler(v14, v15);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  }
}

void __45__NTKJetsamMonitor_decrementTransactionCount__block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[2];
  uint64_t v12;
  uint8_t buf[4];
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 24);
  if (v2 <= 0)
  {
    _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __45__NTKJetsamMonitor_decrementTransactionCount__block_invoke_cold_1(v10);

  }
  else
  {
    v3 = v2 - 1;
    *(_DWORD *)(v1 + 24) = v3;
    if (!v3)
    {
      v11[0] = 0;
      v11[1] = 0;
      v12 = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "getInfo:", v11);
      _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v14 = (float)((float)v11[0] * 0.00097656);
        v15 = 2048;
        v16 = (float)((float)v12 * 0.00097656);
        _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKJetsamMonitor: stop logging, footprint = %.3f, max: %.3f", buf, 0x16u);
      }

      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 16);
      *(_QWORD *)(v6 + 16) = 0;

      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 32);
      *(_QWORD *)(v8 + 32) = 0;

    }
  }
}

void __39__NTKJetsamMonitor_sharedJetsamMonitor__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!sharedJetsamMonitor_monitor)
  {
    v0 = objc_opt_new();
    v1 = (void *)sharedJetsamMonitor_monitor;
    sharedJetsamMonitor_monitor = v0;

  }
}

- (NTKJetsamMonitor)init
{
  NTKJetsamMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *monitorQ;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKJetsamMonitor;
  v2 = -[NTKJetsamMonitor init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("NTKJetsamMonitorQ", v3);
    monitorQ = v2->_monitorQ;
    v2->_monitorQ = (OS_dispatch_queue *)v4;

    v2->_transactionCount = 0;
  }
  return v2;
}

uint64_t __45__NTKJetsamMonitor_incrementTransactionCount__block_invoke_61(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[2];
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  double v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v5[1] = 0;
  v6 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "getInfo:", v5);
  _NTKLoggingObjectForDomain(31, (uint64_t)"NTKLoggingDomainJetsam");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(int *)(*(_QWORD *)(a1 + 32) + 24);
    *(_DWORD *)buf = 134218496;
    v8 = v3;
    v9 = 2048;
    v10 = (float)((float)v5[0] * 0.00097656);
    v11 = 2048;
    v12 = (float)((float)v6 * 0.00097656);
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "NTKJetsamMonitor: %ld transactions, footprint = %.3f, max: %.3f", buf, 0x20u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resetInterval");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_monitorTimer, 0);
  objc_storeStrong((id *)&self->_monitorQ, 0);
}

void __45__NTKJetsamMonitor_decrementTransactionCount__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "NTKJetsamMonitor: trying to decrement beyond zero!", v1, 2u);
}

@end
