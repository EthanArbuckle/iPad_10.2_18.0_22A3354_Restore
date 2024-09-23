void sub_1000028BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v5 = DiagnosticsKitLogHandleForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v12 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CellularThroughput: Error count in startMetadataCollectionWithCompletion: %{public}lu", buf, 0xCu);
  }

  if (objc_msgSend(v4, "count"))
  {
    v7 = 0;
    do
    {
      v8 = DiagnosticsKitLogHandleForCategory(2);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v7));
        *(_DWORD *)buf = 138543362;
        v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CellularThroughput: Error in startMetadataCollectionWithCompletion: %{public}@", buf, 0xCu);

      }
      ++v7;
    }
    while ((unint64_t)objc_msgSend(v4, "count") > v7);
  }

}

void sub_100002A2C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_time_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD v25[5];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = DiagnosticsKitLogHandleForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CellularThroughput: Download task starting", buf, 2u);
  }

  v9 = DiagnosticsKitLogHandleForCategory(2);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CellularThroughput: Metadata collection arrived at semaphore", buf, 2u);
  }

  v11 = *(NSObject **)(a1 + 32);
  v12 = dispatch_walltime(0, 10000000000);
  dispatch_semaphore_wait(v11, v12);
  v13 = DiagnosticsKitLogHandleForCategory(2);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "CellularThroughput: Metadata collection after semaphore wait", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "stopMetadataCollection");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "saveToAWD");
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100002C74;
  v25[3] = &unk_100004160;
  v25[4] = *(_QWORD *)(a1 + 40);
  AnalyticsSendEventLazy(CFSTR("com.apple.speed.networkperformancetester.throughput"), v25);
  v15 = dispatch_queue_create("com.apple.wirelessdataanalytics.CellularDataDiagnosticsSuite", 0);
  v16 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002C80;
  block[3] = &unk_100004188;
  v21 = v6;
  v22 = v5;
  v17 = *(id *)(a1 + 48);
  v23 = *(_QWORD *)(a1 + 40);
  v24 = v17;
  v18 = v5;
  v19 = v6;
  dispatch_after(v16, v15, block);

}

id sub_100002C74(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getTransformedDataForCoreAnalytics");
}

uint64_t sub_100002C80(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t result;
  uint64_t (*v10)(void);
  void *v11;
  int v12;
  void *v13;

  v2 = DiagnosticsKitLogHandleForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CellularThroughput: save results to AWD", (uint8_t *)&v12, 2u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = DiagnosticsKitLogHandleForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedDescription"));
      v12 = 138543362;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CellularThroughput: Download task errored out: %{public}@", (uint8_t *)&v12, 0xCu);

    }
    result = *(_QWORD *)(a1 + 56);
    if (result)
    {
      v10 = *(uint64_t (**)(void))(result + 16);
LABEL_12:
      result = v10();
    }
  }
  else
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "speed");
      v12 = 134217984;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CellularThroughput: Download task completed, throughput %f Mbps", (uint8_t *)&v12, 0xCu);
    }

    result = *(_QWORD *)(a1 + 56);
    if (result)
    {
      v10 = *(uint64_t (**)(void))(result + 16);
      goto LABEL_12;
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 8) = 0;
  return result;
}

id sub_100002F30(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id result;
  int v10;
  void *v11;

  v2 = DiagnosticsKitLogHandleForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CellularThroughput: speed test passed", (uint8_t *)&v10, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  objc_msgSend(v4, "setStatusCode:", &off_1000042F0);

  v5 = DiagnosticsKitLogHandleForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "statusCode"));
    v10 = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CellularThroughput: status code: %@", (uint8_t *)&v10, 0xCu);

  }
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
  return result;
}

id objc_msgSend_cancelAllNetworking(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAllNetworking");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_defaultConfigurationCellular(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConfigurationCellular");
}

id objc_msgSend_downloadSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadSize");
}

id objc_msgSend_interfaceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceType");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_performanceTestWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performanceTestWithConfiguration:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_saveToAWD(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveToAWD");
}

id objc_msgSend_setClientName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientName:");
}

id objc_msgSend_setCollectWRMMetrics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCollectWRMMetrics:");
}

id objc_msgSend_setDownloadSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadSize:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setInterfaceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterfaceType:");
}

id objc_msgSend_setLegacyMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLegacyMode:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setStopAtFileSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStopAtFileSize:");
}

id objc_msgSend_setTestDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestDuration:");
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "speed");
}

id objc_msgSend_startDownloadTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDownloadTest:");
}

id objc_msgSend_startDownloadWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDownloadWithCompletion:");
}

id objc_msgSend_startMetadataCollectionWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMetadataCollectionWithCompletion:");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopMetadataCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMetadataCollection");
}

id objc_msgSend_testDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testDuration");
}
