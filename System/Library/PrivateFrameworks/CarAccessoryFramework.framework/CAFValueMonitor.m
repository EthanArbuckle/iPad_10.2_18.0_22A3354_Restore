@implementation CAFValueMonitor

- (CAFValueMonitor)initWithDelegate:(id)a3
{
  id v4;
  CAFValueMonitor *v5;
  CAFValueMonitor *v6;
  uint64_t v7;
  NSMutableSet *monitoringForValue;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *monitorQueue;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAFValueMonitor;
  v5 = -[CAFValueMonitor init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_opt_new();
    monitoringForValue = v6->_monitoringForValue;
    v6->_monitoringForValue = (NSMutableSet *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_opt_class();
    objc_msgSend(v4, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("com.apple.CarAccessoryFramework.%@.%@.valueMonitor"), v12, v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), v10);
    monitorQueue = v6->_monitorQueue;
    v6->_monitorQueue = (OS_dispatch_queue *)v15;

  }
  return v6;
}

- (BOOL)receivedAllValues
{
  CAFValueMonitor *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CAFValueMonitor monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__CAFValueMonitor_receivedAllValues__block_invoke;
  v5[3] = &unk_2508FE4F8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __36__CAFValueMonitor_receivedAllValues__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_locked_receivedAllValues");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_locked_receivedAllValues
{
  void *v3;
  BOOL v4;

  -[CAFValueMonitor monitoringForValue](self, "monitoringForValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = 0;
  else
    v4 = -[CAFValueMonitor signaledReadyToMonitor](self, "signaledReadyToMonitor");

  return v4;
}

- (void)monitorForValue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAFValueMonitor monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__CAFValueMonitor_monitorForValue___block_invoke;
  block[3] = &unk_2508FD240;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __35__CAFValueMonitor_monitorForValue___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "monitoringForValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

  if (objc_msgSend(*v2, "signaledReadyToMonitor"))
  {
    CAFValueMonitorLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __35__CAFValueMonitor_monitorForValue___block_invoke_cold_1(v2);

  }
}

- (void)signalReadyToMonitor
{
  NSObject *v3;
  _QWORD block[5];

  -[CAFValueMonitor monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__CAFValueMonitor_signalReadyToMonitor__block_invoke;
  block[3] = &unk_2508FD218;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __39__CAFValueMonitor_signalReadyToMonitor__block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t result;
  NSObject *v3;

  v1 = (id *)(a1 + 32);
  result = objc_msgSend(*(id *)(a1 + 32), "signaledReadyToMonitor");
  if ((result & 1) == 0)
  {
    CAFValueMonitorLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __39__CAFValueMonitor_signalReadyToMonitor__block_invoke_cold_1(v1, v3);

    return objc_msgSend(*v1, "setSignaledReadyToMonitor:", 1);
  }
  return result;
}

- (BOOL)valueReceivedFor:(id)a3
{
  id v4;
  NSObject *v5;
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
  -[CAFValueMonitor monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__CAFValueMonitor_valueReceivedFor___block_invoke;
  block[3] = &unk_2508FE520;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __36__CAFValueMonitor_valueReceivedFor___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "monitoringForValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

  v5 = *v2;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "monitoringForValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 40));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_locked_receivedAllValues");
    CAFValueMonitorLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __36__CAFValueMonitor_valueReceivedFor___block_invoke_cold_1(v2);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "_locked_receivedAllValues");
  }
}

- (void)setSignaledReadyToMonitor:(BOOL)a3
{
  NSObject *v3;

  if (self->_signaledReadyToMonitor != a3)
  {
    if (a3)
    {
      self->_signaledReadyToMonitor = a3;
    }
    else
    {
      CAFGeneralLogging();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
        -[CAFValueMonitor setSignaledReadyToMonitor:].cold.1(v3);

    }
  }
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_monitorQueue, a3);
}

- (CAFValueMonitorDelegate)delegate
{
  return (CAFValueMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)signaledReadyToMonitor
{
  return self->_signaledReadyToMonitor;
}

- (NSMutableSet)monitoringForValue
{
  return self->_monitoringForValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringForValue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
}

void __35__CAFValueMonitor_monitorForValue___block_invoke_cold_1(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*a1, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "signaledReadyToMonitor");
  objc_msgSend(*a1, "monitoringForValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");
  OUTLINED_FUNCTION_1_1(&dword_237717000, v5, v6, "%s %@%@ added %@ monitoring.count=%ld ", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_0_2();
}

void __39__CAFValueMonitor_signalReadyToMonitor__block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "monitoringForValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(*a1, "monitoringForValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 136315906;
  v12 = "-[CAFValueMonitor signalReadyToMonitor]_block_invoke";
  v13 = 2112;
  v14 = v5;
  v15 = 2048;
  v16 = v7;
  v17 = 2112;
  v18 = v10;
  _os_log_debug_impl(&dword_237717000, a2, OS_LOG_TYPE_DEBUG, "%s %@ %ld [%@]", (uint8_t *)&v11, 0x2Au);

  OUTLINED_FUNCTION_0_2();
}

void __36__CAFValueMonitor_valueReceivedFor___block_invoke_cold_1(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*a1, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "monitoringForValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");
  objc_msgSend(*a1, "signaledReadyToMonitor");
  OUTLINED_FUNCTION_1_1(&dword_237717000, v5, v6, "%s %@ count=%ld signaledReadyToMonitor=%@ recieved %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_0_2();
}

- (void)setSignaledReadyToMonitor:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_237717000, log, OS_LOG_TYPE_FAULT, "signaledReadyToMonitor should not be set to NO", v1, 2u);
}

@end
