@implementation MetricsModuleCommon

+ (void)initialize
{
  qword_1ED2BC990 = (uint64_t)NSClassFromString(CFSTR("APMetric"));
  qword_1ED2BC970 = (uint64_t)NSClassFromString(CFSTR("APMetricDaemonDelivery"));
  qword_1ED2BC998 = (uint64_t)NSClassFromString(CFSTR("APMetricNotificationRegistrar"));
}

+ (Class)daemonDeliveryClass
{
  return (Class)(id)qword_1ED2BC970;
}

+ (Class)metricClass
{
  return (Class)(id)qword_1ED2BC990;
}

+ (Class)notificationRegistrarClass
{
  return (Class)(id)qword_1ED2BC998;
}

+ (void)setMetricClass:(Class)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int isRunningTests;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  Protocol *proto;

  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isRunningTests = objc_msgSend_isRunningTests(v5, v6, v7, v8);

  if (isRunningTests)
  {
    proto = &unk_1EFB97050;
    if (objc_msgSend_conformsToProtocol_(a3, v10, (uint64_t)proto, v11))
    {
      qword_1ED2BC990 = (uint64_t)a3;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol(proto);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v12, v15, (uint64_t)CFSTR("Class %@ does not implement the %@!"), v16, v13, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      APSimulateCrash((const char *)5, v17, 0);
    }

  }
}

+ (void)setDaemonDeliveryClass:(Class)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int isRunningTests;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  Protocol *proto;

  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isRunningTests = objc_msgSend_isRunningTests(v5, v6, v7, v8);

  if (isRunningTests)
  {
    proto = &unk_1EFB935F0;
    v10 = &unk_1EFB93730;
    v11 = &unk_1EFB937F8;
    if (objc_msgSend_conformsToProtocol_(a3, v12, (uint64_t)proto, v13)
      && objc_msgSend_conformsToProtocol_(a3, v14, (uint64_t)v10, v15)
      && objc_msgSend_conformsToProtocol_(a3, v16, (uint64_t)v11, v17))
    {
      qword_1ED2BC970 = (uint64_t)a3;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass(a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol(proto);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol((Protocol *)v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol((Protocol *)v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v18, v23, (uint64_t)CFSTR("Class %@ does not implement the %@, %@ or %@ protocols!"), v24, v19, v20, v21, v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      APSimulateCrash((const char *)5, v25, 0);
    }

  }
}

+ (void)setNotificationRegistrarClass:(Class)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int isRunningTests;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  Protocol *proto;

  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isRunningTests = objc_msgSend_isRunningTests(v5, v6, v7, v8);

  if (isRunningTests)
  {
    proto = &unk_1EFB940D8;
    v10 = &unk_1EFB937F8;
    if (objc_msgSend_conformsToProtocol_(a3, v11, (uint64_t)proto, v12)
      && objc_msgSend_conformsToProtocol_(a3, v13, (uint64_t)v10, v14))
    {
      qword_1ED2BC998 = (uint64_t)a3;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass(a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol(proto);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol((Protocol *)v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v15, v19, (uint64_t)CFSTR("Class %@ does not implement both the %@ or %@ protocols!"), v20, v16, v17, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      APSimulateCrash((const char *)5, v21, 0);
    }

  }
}

@end
