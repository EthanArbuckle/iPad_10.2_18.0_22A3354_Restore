@implementation DNDSBaseLifetimeMonitor

- (DNDSBaseLifetimeMonitor)init
{
  DNDSBaseLifetimeMonitor *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSArray *activeLifetimeAssertionUUIDs;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DNDSBaseLifetimeMonitor;
  v2 = -[DNDSBaseLifetimeMonitor init](&v14, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.donotdisturb.lifetime-monitor.%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_retainAutorelease(v6);
    v8 = (const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    activeLifetimeAssertionUUIDs = v2->_activeLifetimeAssertionUUIDs;
    v2->_activeLifetimeAssertionUUIDs = (NSArray *)MEMORY[0x1E0C9AA60];

    DNDSRegisterSysdiagnoseDataProvider(v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSBaseLifetimeMonitor;
  -[DNDSBaseLifetimeMonitor dealloc](&v3, sel_dealloc);
}

+ (Class)lifetimeClass
{
  return (Class)objc_opt_class();
}

- (id)updateForModeAssertions:(id)a3 date:(id)a4
{
  DNDSLifetimeMonitorResult *v4;

  v4 = [DNDSLifetimeMonitorResult alloc];
  return -[DNDSLifetimeMonitorResult initWithActiveUUIDs:expiredUUIDs:](v4, "initWithActiveUUIDs:expiredUUIDs:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (void)refreshMonitorForDate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__DNDSBaseLifetimeMonitor_refreshMonitorForDate___block_invoke;
  block[3] = &unk_1E86A59E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __49__DNDSBaseLifetimeMonitor_refreshMonitorForDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshMonitorFromQueueForDate:", *(_QWORD *)(a1 + 40));
}

- (void)refreshMonitorFromQueueForDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *activeLifetimeAssertionUUIDs;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[DNDSBaseLifetimeMonitor dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lifetimeMonitor:modeAssertionsWithLifetimeClass:", self, objc_msgSend((id)objc_opt_class(), "lifetimeClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[NSArray copy](self->_activeLifetimeAssertionUUIDs, "copy");
  -[DNDSBaseLifetimeMonitor updateForModeAssertions:date:](self, "updateForModeAssertions:date:", v5, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSArray *)objc_msgSend(v8, "copy");
  activeLifetimeAssertionUUIDs = self->_activeLifetimeAssertionUUIDs;
  self->_activeLifetimeAssertionUUIDs = v9;

  -[DNDSBaseLifetimeMonitor delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expiredUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    objc_msgSend(v7, "expiredUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lifetimeMonitor:lifetimeDidExpireForAssertionUUIDs:expirationDate:", self, v14, v15);

  }
  if ((objc_msgSend(v6, "isEqual:", self->_activeLifetimeAssertionUUIDs) & 1) == 0)
    objc_msgSend(v11, "activeAssertionsDidChangeForLifetimeMonitor:", self);

}

- (NSString)sysdiagnoseDataIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.donotdisturb.lifetime-monitor.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  id v5;
  NSObject *queue;
  void *v7;
  void *v8;
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__DNDSBaseLifetimeMonitor_sysdiagnoseDataForDate_redacted___block_invoke;
  block[3] = &unk_1E86A5948;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(queue, block);
  objc_msgSend((id)v12[5], "bs_mapNoNulls:", &__block_literal_global_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("active-uuids");
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v11, 8);
  return v8;
}

void __59__DNDSBaseLifetimeMonitor_sysdiagnoseDataForDate_redacted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "activeLifetimeAssertionUUIDs");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __59__DNDSBaseLifetimeMonitor_sysdiagnoseDataForDate_redacted___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSArray)activeLifetimeAssertionUUIDs
{
  return self->_activeLifetimeAssertionUUIDs;
}

- (DNDSLifetimeMonitorDataSource)dataSource
{
  return (DNDSLifetimeMonitorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (DNDSLifetimeMonitorDelegate)delegate
{
  return (DNDSLifetimeMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_activeLifetimeAssertionUUIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
