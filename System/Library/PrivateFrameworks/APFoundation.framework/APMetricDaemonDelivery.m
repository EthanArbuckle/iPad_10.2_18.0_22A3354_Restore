@implementation APMetricDaemonDelivery

- (APMetricDaemonDelivery)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  APMetricDaemonDelivery *v5;
  APMetricNotificationRegister *v6;
  APMetricNotificationRegister *notificationRegistrar;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)APMetricDaemonDelivery;
  v5 = -[APXPCActionRequester init](&v9, sel_init);
  if (v5)
  {
    v6 = (APMetricNotificationRegister *)objc_alloc_init((Class)objc_msgSend_notificationRegistrarClass(MetricsModuleCommon, v2, v3, v4));
    notificationRegistrar = v5->_notificationRegistrar;
    v5->_notificationRegistrar = v6;

  }
  return v5;
}

- (void)extendCollectionClassesForRemoteInterface:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend_metricClass(MetricsModuleCommon, v5, v6, v7);
  v8 = objc_opt_class();
  objc_msgSend_setWithObjects_(v3, v9, v8, v10, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v11, (uint64_t)v12, (uint64_t)sel_receivedMetric_, 0, 0);

}

+ (APMetricDaemonDeliverer)daemonDelivery
{
  if (qword_1ED2BC948 != -1)
    dispatch_once(&qword_1ED2BC948, &unk_1E8C48030);
  return (APMetricDaemonDeliverer *)(id)qword_1ED2BC950;
}

- (void)receivedMetric:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  objc_msgSend_notificationRegistrar(self, v5, v6, v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_receivedMetric_(v16, v8, (uint64_t)v4, v9);
  objc_msgSend_remoteObjectProxy(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_receivedMetric_(v13, v14, (uint64_t)v4, v15);

}

- (APMetricNotificationRegister)notificationRegistrar
{
  return self->_notificationRegistrar;
}

- (id)remoteObjectInterface
{
  return &unk_1EFB937F8;
}

+ (id)machService
{
  return CFSTR("com.apple.ap.promotedcontent.metrics");
}

+ (BOOL)canShareConnection
{
  return 1;
}

+ (void)setDaemonDelivery:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int isRunningTests;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isRunningTests = objc_msgSend_isRunningTests(v6, v7, v8, v9);

  if (isRunningTests)
  {
    v12 = &unk_1EFB937F8;
    v13 = v23;
    if (v23 && (v14 = objc_msgSend_conformsToProtocol_(v23, (const char *)v23, (uint64_t)v12, v11), v13 = v23, !v14))
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol((Protocol *)v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v17, v21, (uint64_t)CFSTR("Class %@ does not implement protocol %@!"), v22, v19, v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      APSimulateCrash((const char *)5, v16, 0);
    }
    else
    {
      v15 = v13;
      v16 = (void *)qword_1ED2BC950;
      qword_1ED2BC950 = (uint64_t)v15;
    }

  }
}

- (void)connectionInterrupted
{
  NSObject *v2;
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  APLogForCategory(0x1DuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = (id)objc_opt_class();
    v3 = v5;
    _os_log_impl(&dword_1CF251000, v2, OS_LOG_TYPE_DEFAULT, "[%@] Connection from the daemon was interrupted.", (uint8_t *)&v4, 0xCu);

  }
}

- (void)connectionInvalidated
{
  NSObject *v2;
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  APLogForCategory(0x1DuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = (id)objc_opt_class();
    v3 = v5;
    _os_log_impl(&dword_1CF251000, v2, OS_LOG_TYPE_DEFAULT, "[%@] Connection from the daemon was invalidated.", (uint8_t *)&v4, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRegistrar, 0);
}

@end
