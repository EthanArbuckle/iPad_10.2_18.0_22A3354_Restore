@implementation DNDSDefaultLifetimeMonitor

+ (Class)lifetimeClass
{
  return (Class)objc_opt_class();
}

- (id)updateForModeAssertions:(id)a3 date:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  DNDSLifetimeMonitorResult *v9;
  DNDSLifetimeMonitorResult *v10;
  uint8_t v12[16];

  v5 = a3;
  -[DNDSBaseLifetimeMonitor queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = DNDSLogDefaultLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogDefaultLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Refreshing monitor", v12, 2u);
  }
  objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [DNDSLifetimeMonitorResult alloc];
  v10 = -[DNDSLifetimeMonitorResult initWithActiveUUIDs:expiredUUIDs:](v9, "initWithActiveUUIDs:expiredUUIDs:", v8, MEMORY[0x1E0C9AA60]);

  return v10;
}

uint64_t __59__DNDSDefaultLifetimeMonitor_updateForModeAssertions_date___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

@end
