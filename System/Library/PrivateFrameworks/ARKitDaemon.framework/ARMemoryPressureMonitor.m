@implementation ARMemoryPressureMonitor

- (ARMemoryPressureMonitor)init
{
  id v2;
  dispatch_source_t v3;
  void *v4;
  NSObject *v5;
  ARMemoryPressureMonitor *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  _QWORD handler[4];
  id v12;
  objc_super v13;
  _BYTE location[12];
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)ARMemoryPressureMonitor;
  v2 = -[ARMemoryPressureMonitor init](&v13, sel_init);
  if (!v2)
    goto LABEL_4;
  v3 = dispatch_source_create(MEMORY[0x24BDAC9F0], 0, 0x36uLL, MEMORY[0x24BDAC9B8]);
  v4 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v3;

  if (*((_QWORD *)v2 + 1))
  {
    objc_initWeak((id *)location, v2);
    v5 = *((_QWORD *)v2 + 1);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __31__ARMemoryPressureMonitor_init__block_invoke;
    handler[3] = &unk_2507025E8;
    objc_copyWeak(&v12, (id *)location);
    dispatch_source_set_event_handler(v5, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 1));
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
LABEL_4:
    v6 = (ARMemoryPressureMonitor *)v2;
    goto LABEL_8;
  }
  _ARLogGeneral();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = v9;
    v15 = 2048;
    v16 = v2;
    _os_log_impl(&dword_235C46000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create the dispatch source for monitoring memory pressure.", location, 0x16u);

  }
  v6 = 0;
LABEL_8:

  return v6;
}

void __31__ARMemoryPressureMonitor_init__block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t *v2;
  int64_t data;
  int64_t v4;
  void *v5;
  void *v6;
  dispatch_source_t *v7;
  uint64_t v8;
  void *v9;
  dispatch_source_t *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_17;
  data = dispatch_source_get_data(WeakRetained[1]);
  v4 = data;
  if (data <= 15)
  {
    if (data == 2)
    {
      -[dispatch_source_t delegate](v2, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = v2;
      v8 = 0;
      goto LABEL_13;
    }
    if (data == 4)
    {
      -[dispatch_source_t delegate](v2, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = v2;
      v8 = 1;
LABEL_13:
      objc_msgSend(v5, "memoryPressureMonitor:didUpdateSystemMemoryPressureCondition:", v7, v8);
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_9;
  }
  if (data == 16)
  {
    -[dispatch_source_t delegate](v2, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    v10 = v2;
    v11 = 0;
    goto LABEL_15;
  }
  if (data == 32)
  {
    -[dispatch_source_t delegate](v2, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    v10 = v2;
    v11 = 1;
LABEL_15:
    objc_msgSend(v9, "memoryPressureMonitor:didUpdateProcessMemoryPressureCondition:", v10, v11);
    goto LABEL_16;
  }
LABEL_9:
  _ARLogGeneral();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v14;
    v17 = 2048;
    v18 = v4;
    _os_log_impl(&dword_235C46000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Received an unexpected memory pressure condition value: %lu", (uint8_t *)&v15, 0x16u);

  }
LABEL_17:

}

- (void)dealloc
{
  NSObject *memoryPressureEventSource;
  OS_dispatch_source *v4;
  objc_super v5;

  memoryPressureEventSource = self->_memoryPressureEventSource;
  if (memoryPressureEventSource)
  {
    dispatch_source_cancel(memoryPressureEventSource);
    v4 = self->_memoryPressureEventSource;
    self->_memoryPressureEventSource = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)ARMemoryPressureMonitor;
  -[ARMemoryPressureMonitor dealloc](&v5, sel_dealloc);
}

- (ARMemoryPressureMonitorDelegate)delegate
{
  return (ARMemoryPressureMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_memoryPressureEventSource, 0);
}

@end
