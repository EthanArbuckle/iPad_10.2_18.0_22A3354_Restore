@implementation ARDaemonMetrics

- (ARDaemonMetrics)init
{
  ARDaemonMetrics *v2;
  ARDaemonMetrics *v3;
  uint64_t v4;
  OS_dispatch_queue *reportingQueue;
  uint64_t v6;
  NSMutableDictionary *activeServiceCountPerClient;
  uint64_t v8;
  NSMutableDictionary *allServicesUsedPerClient;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ARDaemonMetrics;
  v2 = -[ARDaemonMetrics init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_peakMemoryUsageInMegabytes = 0;
    ARCreateNonFixedPriorityDispatchQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    reportingQueue = v3->_reportingQueue;
    v3->_reportingQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    activeServiceCountPerClient = v3->_activeServiceCountPerClient;
    v3->_activeServiceCountPerClient = (NSMutableDictionary *)v6;

    v8 = objc_opt_new();
    allServicesUsedPerClient = v3->_allServicesUsedPerClient;
    v3->_allServicesUsedPerClient = (NSMutableDictionary *)v8;

  }
  return v3;
}

+ (id)sharedDaemonMetrics
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ARDaemonMetrics_sharedDaemonMetrics__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDaemonMetrics_onceToken != -1)
    dispatch_once(&sharedDaemonMetrics_onceToken, block);
  return (id)sharedDaemonMetrics_sharedARDaemonMetrics;
}

void __38__ARDaemonMetrics_sharedDaemonMetrics__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedDaemonMetrics_sharedARDaemonMetrics;
  sharedDaemonMetrics_sharedARDaemonMetrics = v0;

}

- (void)reportMemoryFootprintInBytes:(unint64_t)a3
{
  NSObject *reportingQueue;
  _QWORD v4[6];

  reportingQueue = self->_reportingQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__ARDaemonMetrics_reportMemoryFootprintInBytes___block_invoke;
  v4[3] = &unk_250702BC8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(reportingQueue, v4);
}

uint64_t __48__ARDaemonMetrics_reportMemoryFootprintInBytes___block_invoke(uint64_t result)
{
  uint64_t v1;
  float v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = (float)((float)*(unint64_t *)(result + 40) * 0.00097656) * 0.00097656;
  if (*(_QWORD *)(v1 + 8) < (unint64_t)v2)
    *(_QWORD *)(v1 + 8) = (unint64_t)v2;
  return result;
}

- (void)setCurrentMemoryFootprintAsPeak
{
  ARGetMemoryFootprint();
  self->_peakMemoryUsageInMegabytes = (unint64_t)(float)((float)((float)0 * 0.00097656) * 0.00097656);
}

- (void)_reportCoreAnalyticsDaemonEventWithServiceName:(id)a3 clientBundleIdentifier:(id)a4 isServiceRemoved:(BOOL)a5 isDisconnectingClient:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[4];
  _QWORD v34[6];

  v6 = a6;
  v7 = a5;
  v34[4] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  -[NSMutableDictionary objectForKey:](self->_allServicesUsedPerClient, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(";"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v33[0] = CFSTR("peakMemory");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_peakMemoryUsageInMegabytes);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v16;
    v33[1] = CFSTR("allClientsCount");
    v17 = (void *)MEMORY[0x24BDD16E0];
    -[NSMutableDictionary allKeys](self->_activeServiceCountPerClient, "allKeys");
    v30 = v14;
    v18 = v10;
    v19 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v20, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v21;
    v34[2] = v11;
    v33[2] = CFSTR("disconnectedClientBundleID");
    v33[3] = CFSTR("allServicesUsed");
    v34[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
    v22 = v11;
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v19;
    v10 = v18;
    v14 = v30;

    ARCoreAnalyticsEventCreateAndReport();
    v11 = v22;
  }
  v31[0] = CFSTR("peakMemory");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_peakMemoryUsageInMegabytes);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v24;
  v31[1] = CFSTR("allClientsCount");
  v25 = (void *)MEMORY[0x24BDD16E0];
  -[NSMutableDictionary allKeys](self->_activeServiceCountPerClient, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v27;
  v32[2] = v15;
  v31[2] = CFSTR("allReportingClientServicesUsed");
  v31[3] = CFSTR("reportedServiceName");
  v32[3] = v10;
  v31[4] = CFSTR("isServiceRemoved");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  ARCoreAnalyticsEventCreateAndReport();
}

- (void)reportServiceRemovedWithName:(id)a3 clientBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *reportingQueue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    reportingQueue = self->_reportingQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__ARDaemonMetrics_reportServiceRemovedWithName_clientBundleIdentifier___block_invoke;
    block[3] = &unk_250702BF0;
    block[4] = self;
    v11 = v7;
    v12 = v6;
    dispatch_async(reportingQueue, block);

  }
}

void __71__ARDaemonMetrics_reportServiceRemovedWithName_clientBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_removeServiceForClient:serviceName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD **)(a1 + 32);
    if (v4[1] || (objc_msgSend(v4, "setCurrentMemoryFootprintAsPeak"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)))
    {
      _ARLogDaemon_6();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(a1 + 40);
        v16 = 138543874;
        v17 = v7;
        v18 = 2048;
        v19 = v8;
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_235C46000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Flushing daemon metrics to CA for disconnected client with ID: %@", (uint8_t *)&v16, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "reportCoreAnalyticsDaemonEventWithServiceName:clientBundleIdentifier:isServiceRemoved:isDisconnectingClient:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 1, v2);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
      if ((_DWORD)v2)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
      }
    }
  }
  else
  {
    _ARLogDaemon_6();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138544130;
      v17 = v12;
      v18 = 2048;
      v19 = v15;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_235C46000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Service '%@' removed for unknown client with ID: %@", (uint8_t *)&v16, 0x2Au);

    }
  }
}

- (void)reportServiceAddedWithName:(id)a3 clientBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *reportingQueue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    reportingQueue = self->_reportingQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__ARDaemonMetrics_reportServiceAddedWithName_clientBundleIdentifier___block_invoke;
    block[3] = &unk_250702BF0;
    block[4] = self;
    v11 = v7;
    v12 = v6;
    dispatch_async(reportingQueue, block);

  }
}

_QWORD *__69__ARDaemonMetrics_reportServiceAddedWithName_clientBundleIdentifier___block_invoke(uint64_t a1)
{
  _QWORD *result;

  objc_msgSend(*(id *)(a1 + 32), "_addServiceForClient:serviceName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(_QWORD **)(a1 + 32);
  if (result[1] || (objc_msgSend(result, "setCurrentMemoryFootprintAsPeak"), result = *(_QWORD **)(a1 + 32), result[1]))
  {
    result = (_QWORD *)objc_msgSend(result, "reportCoreAnalyticsDaemonEventWithServiceName:clientBundleIdentifier:isServiceRemoved:isDisconnectingClient:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, 0);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
  return result;
}

- (void)_reportDaemonHeartbeatForSessionUUID:(id)a3 daemonUpTimeExcludingSleepMinutes:(unint64_t)a4 daemonUpTimeIncludingSleepMinutes:(unint64_t)a5 systemUpTimeMinutes:(unint64_t)a6 memoryFootprintInBytes:(unint64_t)a7
{
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v10 = (unint64_t)(float)((float)((float)a7 * 0.00097656) * 0.00097656);
  v11 = a3;
  v17 = (id)objc_opt_new();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("sessionUUID"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, CFSTR("daemonUpTimeExcludingSleepMinutes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("daemonUpTimeIncludingSleepMinutes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("systemUpTimeMinutes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("currentMemoryFootprint"));

  ARCoreAnalyticsEventCreateAndReport();
}

- (unint64_t)_getPeakMemoryUsageInMegabytes
{
  return self->_peakMemoryUsageInMegabytes;
}

- (id)_getActiveServiceCountPerClient
{
  return self->_activeServiceCountPerClient;
}

- (id)_getAllServicesUsedPerClient
{
  return self->_allServicesUsedPerClient;
}

- (void)_addServiceForClient:(id)a3 serviceName:(id)a4
{
  NSMutableDictionary *activeServiceCountPerClient;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *allServicesUsedPerClient;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  activeServiceCountPerClient = self->_activeServiceCountPerClient;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](activeServiceCountPerClient, "objectForKey:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = self->_activeServiceCountPerClient;
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v19);

  }
  v11 = self->_activeServiceCountPerClient;
  -[NSMutableDictionary objectForKey:](v11, "objectForKey:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "one");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "decimalNumberByAdding:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v14, v19);

  -[NSMutableDictionary objectForKey:](self->_allServicesUsedPerClient, "objectForKey:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    allServicesUsedPerClient = self->_allServicesUsedPerClient;
    v17 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKey:](allServicesUsedPerClient, "setObject:forKey:", v17, v19);

  }
  -[NSMutableDictionary objectForKey:](self->_allServicesUsedPerClient, "objectForKey:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v7);

}

- (BOOL)_removeServiceForClient:(id)a3 serviceName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_activeServiceCountPerClient, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1518], "one");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decimalNumberBySubtracting:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKey:](self->_activeServiceCountPerClient, "setObject:forKey:", v8, v5);
    v9 = (int)objc_msgSend(v8, "intValue") < 1;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSDate)lastDonTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastDonTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDonTime, 0);
  objc_storeStrong((id *)&self->_allServicesUsedPerClient, 0);
  objc_storeStrong((id *)&self->_activeServiceCountPerClient, 0);
  objc_storeStrong((id *)&self->_reportingQueue, 0);
}

@end
