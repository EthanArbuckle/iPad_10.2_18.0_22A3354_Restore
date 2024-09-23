@implementation SpeedTestConfig

- (SpeedTestConfig)init
{
  SpeedTestConfig *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unsigned int v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  NPTPerformanceTest *performanceTest;
  SpeedTestConfig *v15;
  NSObject *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)SpeedTestConfig;
  v2 = -[SpeedTestConfig init](&v19, sel_init);
  v2->inProgress = 0;
  DiagnosticsKitLogHandleForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C698000, v3, OS_LOG_TYPE_INFO, "CellularThroughput: CellularTest init", buf, 2u);
  }

  NSLog(CFSTR("CellularThroughput: CellularTest init"));
  DiagnosticsKitLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C698000, v4, OS_LOG_TYPE_INFO, "CellularThroughput: Creating Configuration", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE6B290], "defaultConfigurationCellular");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    DiagnosticsKitLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C698000, v16, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig is nil", buf, 2u);
    }

    NSLog(CFSTR("CellularThroughput: performanceTestWithConfig is nil"));
    goto LABEL_20;
  }
  objc_msgSend(v5, "setDownloadSize:", 50);
  DiagnosticsKitLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(v6, "downloadSize");
    *(_DWORD *)buf = 134217984;
    v21 = v8;
    _os_log_impl(&dword_21C698000, v7, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig.downloadSize: %lu", buf, 0xCu);
  }

  objc_msgSend(v6, "setStopAtFileSize:", 1);
  objc_msgSend(v6, "setTestDuration:", 30);
  DiagnosticsKitLogHandleForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v6, "testDuration");
    *(_DWORD *)buf = 134217984;
    v21 = v10;
    _os_log_impl(&dword_21C698000, v9, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig.testDuration: %lu", buf, 0xCu);
  }

  objc_msgSend(v6, "setCollectWRMMetrics:", 1);
  objc_msgSend(v6, "setInterfaceType:", 0);
  DiagnosticsKitLogHandleForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(v6, "interfaceType");
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = v12;
    _os_log_impl(&dword_21C698000, v11, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig.interfaceType: %d", buf, 8u);
  }

  objc_msgSend(v6, "setClientName:", CFSTR("CellularDataDiagnosticsSuite"));
  objc_msgSend(v6, "setLegacyMode:", 0);
  objc_msgSend(MEMORY[0x24BE6B288], "performanceTestWithConfiguration:", v6);
  v13 = objc_claimAutoreleasedReturnValue();
  performanceTest = v2->performanceTest;
  v2->performanceTest = (NPTPerformanceTest *)v13;

  if (!v2->performanceTest)
  {
    DiagnosticsKitLogHandleForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C698000, v17, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTest is nil", buf, 2u);
    }

LABEL_20:
    v15 = 0;
    goto LABEL_21;
  }
  v15 = v2;
LABEL_21:

  return v15;
}

- (void)startDownloadTest:(id)a3
{
  void (**v4)(id, const __CFString *);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  NPTPerformanceTest *performanceTest;
  uint64_t v12;
  NSObject *v13;
  NPTPerformanceTest *v14;
  void (**v15)(id, const __CFString *);
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  SpeedTestConfig *v19;
  void (**v20)(id, const __CFString *);
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[16];

  v4 = (void (**)(id, const __CFString *))a3;
  if (!self->performanceTest)
  {
    DiagnosticsKitLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C698000, v5, OS_LOG_TYPE_INFO, "CellularThroughput: NPTPerformanceTest instance nil, bailing out", buf, 2u);
    }

    if (v4)
      v4[2](v4, CFSTR("NO"));
  }
  if (self->inProgress)
  {
    DiagnosticsKitLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C698000, v6, OS_LOG_TYPE_INFO, "CellularThroughput: Download task already started", buf, 2u);
    }

    if (v4)
      v4[2](v4, CFSTR("NO"));
  }
  self->inProgress = 1;
  v7 = (void *)MEMORY[0x220780AD8]();
  DiagnosticsKitLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C698000, v8, OS_LOG_TYPE_INFO, "CellularThroughput: Call RPM Test", buf, 2u);
  }

  v9 = dispatch_semaphore_create(0);
  DiagnosticsKitLogHandleForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C698000, v10, OS_LOG_TYPE_INFO, "CellularThroughput: Metadata collection starting", buf, 2u);
  }

  performanceTest = self->performanceTest;
  v12 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __37__SpeedTestConfig_startDownloadTest___block_invoke;
  v21[3] = &unk_24E06F888;
  v13 = v9;
  v22 = v13;
  -[NPTPerformanceTest startMetadataCollectionWithCompletion:](performanceTest, "startMetadataCollectionWithCompletion:", v21);
  v14 = self->performanceTest;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __37__SpeedTestConfig_startDownloadTest___block_invoke_9;
  v17[3] = &unk_24E06F900;
  v18 = v13;
  v19 = self;
  v15 = v4;
  v20 = v15;
  v16 = v13;
  -[NPTPerformanceTest startDownloadWithCompletion:](v14, "startDownloadWithCompletion:", v17);

  objc_autoreleasePoolPop(v7);
}

void __37__SpeedTestConfig_startDownloadTest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  DiagnosticsKitLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v10 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_21C698000, v5, OS_LOG_TYPE_INFO, "CellularThroughput: Error count in startMetadataCollectionWithCompletion: %{public}lu", buf, 0xCu);
  }

  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    do
    {
      DiagnosticsKitLogHandleForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v10 = (uint64_t)v8;
        _os_log_impl(&dword_21C698000, v7, OS_LOG_TYPE_INFO, "CellularThroughput: Error in startMetadataCollectionWithCompletion: %{public}@", buf, 0xCu);

      }
      ++v6;
    }
    while (objc_msgSend(v4, "count") > v6);
  }

}

void __37__SpeedTestConfig_startDownloadTest___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  dispatch_time_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  uint64_t v27;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  DiagnosticsKitLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C698000, v7, OS_LOG_TYPE_INFO, "CellularThroughput: Download task starting", buf, 2u);
  }

  DiagnosticsKitLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C698000, v8, OS_LOG_TYPE_INFO, "CellularThroughput: Metadata collection arrived at semaphore", buf, 2u);
  }

  v9 = *(NSObject **)(a1 + 32);
  v10 = dispatch_walltime(0, 10000000000);
  dispatch_semaphore_wait(v9, v10);
  DiagnosticsKitLogHandleForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C698000, v11, OS_LOG_TYPE_INFO, "CellularThroughput: Metadata collection after semaphore wait", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "stopMetadataCollection");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "saveToAWD");
  v12 = MEMORY[0x24BDAC760];
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __37__SpeedTestConfig_startDownloadTest___block_invoke_12;
  v26 = &unk_24E06F8B0;
  v27 = *(_QWORD *)(a1 + 40);
  AnalyticsSendEventLazy();
  v13 = dispatch_queue_create("com.apple.wirelessdataanalytics.CellularDataDiagnosticsSuite", 0);
  v14 = dispatch_time(0, 10000000000);
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __37__SpeedTestConfig_startDownloadTest___block_invoke_2;
  block[3] = &unk_24E06F8D8;
  v19 = v6;
  v20 = v5;
  v15 = *(id *)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 40);
  v22 = v15;
  v16 = v5;
  v17 = v6;
  dispatch_after(v14, v13, block);

}

uint64_t __37__SpeedTestConfig_startDownloadTest___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getTransformedDataForCoreAnalytics");
}

uint64_t __37__SpeedTestConfig_startDownloadTest___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t result;
  uint64_t (*v8)(void);
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_21C698000, v2, OS_LOG_TYPE_INFO, "CellularThroughput: save results to AWD", (uint8_t *)&v10, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  DiagnosticsKitLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_21C698000, v4, OS_LOG_TYPE_INFO, "CellularThroughput: Download task errored out: %{public}@", (uint8_t *)&v10, 0xCu);

    }
    result = *(_QWORD *)(a1 + 56);
    if (result)
    {
      v8 = *(uint64_t (**)(void))(result + 16);
LABEL_12:
      result = v8();
    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "speed");
      v10 = 134217984;
      v11 = v9;
      _os_log_impl(&dword_21C698000, v4, OS_LOG_TYPE_INFO, "CellularThroughput: Download task completed, throughput %f Mbps", (uint8_t *)&v10, 0xCu);
    }

    result = *(_QWORD *)(a1 + 56);
    if (result)
    {
      v8 = *(uint64_t (**)(void))(result + 16);
      goto LABEL_12;
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 8) = 0;
  return result;
}

- (void)abort
{
  -[NPTPerformanceTest cancelAllNetworking](self->performanceTest, "cancelAllNetworking");
  self->inProgress = 0;
}

- (BOOL)inProgress
{
  return self->inProgress;
}

- (void)dealloc
{
  NPTPerformanceTest *performanceTest;
  objc_super v4;

  performanceTest = self->performanceTest;
  self->performanceTest = 0;

  v4.receiver = self;
  v4.super_class = (Class)SpeedTestConfig;
  -[SpeedTestConfig dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->performanceTest, 0);
}

@end
