@implementation SpeedTestConfig

- (SpeedTestConfig)init
{
  SpeedTestConfig *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  uint64_t v18;
  NPTPerformanceTest *performanceTest;
  SpeedTestConfig *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  objc_super v26;
  uint8_t buf[4];
  unint64_t v28;

  v26.receiver = self;
  v26.super_class = (Class)SpeedTestConfig;
  v2 = -[SpeedTestConfig init](&v26, "init");
  v2->inProgress = 0;
  v3 = DiagnosticsKitLogHandleForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CellularThroughput: CellularTest init", buf, 2u);
  }

  NSLog(CFSTR("CellularThroughput: CellularTest init"));
  v5 = DiagnosticsKitLogHandleForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CellularThroughput: Creating Configuration", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NPTPerformanceTestConfiguration defaultConfigurationCellular](NPTPerformanceTestConfiguration, "defaultConfigurationCellular"));
  v8 = v7;
  if (!v7)
  {
    v21 = DiagnosticsKitLogHandleForCategory(2);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig is nil", buf, 2u);
    }

    NSLog(CFSTR("CellularThroughput: performanceTestWithConfig is nil"));
    goto LABEL_20;
  }
  objc_msgSend(v7, "setDownloadSize:", 50);
  v9 = DiagnosticsKitLogHandleForCategory(2);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend(v8, "downloadSize");
    *(_DWORD *)buf = 134217984;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig.downloadSize: %lu", buf, 0xCu);
  }

  objc_msgSend(v8, "setStopAtFileSize:", 1);
  objc_msgSend(v8, "setTestDuration:", 30);
  v12 = DiagnosticsKitLogHandleForCategory(2);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = objc_msgSend(v8, "testDuration");
    *(_DWORD *)buf = 134217984;
    v28 = (unint64_t)v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig.testDuration: %lu", buf, 0xCu);
  }

  objc_msgSend(v8, "setCollectWRMMetrics:", 1);
  objc_msgSend(v8, "setInterfaceType:", 0);
  v15 = DiagnosticsKitLogHandleForCategory(2);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = objc_msgSend(v8, "interfaceType");
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTestWithConfig.interfaceType: %d", buf, 8u);
  }

  objc_msgSend(v8, "setClientName:", CFSTR("CellularDataDiagnosticsSuite"));
  objc_msgSend(v8, "setLegacyMode:", 0);
  v18 = objc_claimAutoreleasedReturnValue(+[NPTPerformanceTest performanceTestWithConfiguration:](NPTPerformanceTest, "performanceTestWithConfiguration:", v8));
  performanceTest = v2->performanceTest;
  v2->performanceTest = (NPTPerformanceTest *)v18;

  if (!v2->performanceTest)
  {
    v23 = DiagnosticsKitLogHandleForCategory(2);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "CellularThroughput: performanceTest is nil", buf, 2u);
    }

LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  v20 = v2;
LABEL_21:

  return v20;
}

- (void)startDownloadTest:(id)a3
{
  void (**v4)(id, const __CFString *);
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  uint64_t v13;
  NSObject *v14;
  NPTPerformanceTest *performanceTest;
  NSObject *v16;
  NPTPerformanceTest *v17;
  void (**v18)(id, const __CFString *);
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  SpeedTestConfig *v22;
  void (**v23)(id, const __CFString *);
  _QWORD v24[4];
  NSObject *v25;
  uint8_t buf[16];

  v4 = (void (**)(id, const __CFString *))a3;
  if (!self->performanceTest)
  {
    v5 = DiagnosticsKitLogHandleForCategory(2);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CellularThroughput: NPTPerformanceTest instance nil, bailing out", buf, 2u);
    }

    if (v4)
      v4[2](v4, CFSTR("NO"));
  }
  if (self->inProgress)
  {
    v7 = DiagnosticsKitLogHandleForCategory(2);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CellularThroughput: Download task already started", buf, 2u);
    }

    if (v4)
      v4[2](v4, CFSTR("NO"));
  }
  self->inProgress = 1;
  v9 = objc_autoreleasePoolPush();
  v10 = DiagnosticsKitLogHandleForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CellularThroughput: Call RPM Test", buf, 2u);
  }

  v12 = dispatch_semaphore_create(0);
  v13 = DiagnosticsKitLogHandleForCategory(2);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "CellularThroughput: Metadata collection starting", buf, 2u);
  }

  performanceTest = self->performanceTest;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000028BC;
  v24[3] = &unk_100004138;
  v16 = v12;
  v25 = v16;
  -[NPTPerformanceTest startMetadataCollectionWithCompletion:](performanceTest, "startMetadataCollectionWithCompletion:", v24);
  v17 = self->performanceTest;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100002A2C;
  v20[3] = &unk_1000041B0;
  v21 = v16;
  v22 = self;
  v18 = v4;
  v23 = v18;
  v19 = v16;
  -[NPTPerformanceTest startDownloadWithCompletion:](v17, "startDownloadWithCompletion:", v20);

  objc_autoreleasePoolPop(v9);
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
  -[SpeedTestConfig dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->performanceTest, 0);
}

@end
