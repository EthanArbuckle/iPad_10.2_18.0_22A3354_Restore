@implementation C2Metric

+ (id)generateDeviceInfo
{
  C2MPDeviceInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(C2MPDeviceInfo);
  +[C2DeviceInfo productName](C2DeviceInfo, "productName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPDeviceInfo setProductName:](v2, "setProductName:", v3);

  +[C2DeviceInfo productType](C2DeviceInfo, "productType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPDeviceInfo setProductType:](v2, "setProductType:", v4);

  +[C2DeviceInfo productVersion](C2DeviceInfo, "productVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPDeviceInfo setProductVersion:](v2, "setProductVersion:", v5);

  +[C2DeviceInfo buildVersion](C2DeviceInfo, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPDeviceInfo setProductBuild:](v2, "setProductBuild:", v6);

  +[C2DeviceInfo processName](C2DeviceInfo, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPDeviceInfo setProcessName:](v2, "setProcessName:", v7);

  +[C2DeviceInfo processVersion](C2DeviceInfo, "processVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPDeviceInfo setProcessVersion:](v2, "setProcessVersion:", v8);

  +[C2DeviceInfo processUUID](C2DeviceInfo, "processUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPDeviceInfo setProcessUuid:](v2, "setProcessUuid:", v9);

  +[C2DeviceInfo testName](C2DeviceInfo, "testName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPDeviceInfo setUserDefaultTestName:](v2, "setUserDefaultTestName:", v10);

  -[C2MPDeviceInfo setIsAppleInternal:](v2, "setIsAppleInternal:", +[C2DeviceInfo isAppleInternal](C2DeviceInfo, "isAppleInternal"));
  return v2;
}

+ (id)generateGenericEventWithName:(id)a3 genericMetricType:(int64_t)a4 startTime:(id)a5 endTime:(id)a6 attributes:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  C2MPGenericEvent *v15;
  C2MPGenericEvent *v16;
  uint64_t v17;
  NSObject *v18;
  unint64_t v19;
  unint64_t v20;
  C2MPGenericEvent *v21;
  id v22;
  C2MPGenericEvent *v23;
  C2MPGenericEvent *v24;
  _QWORD v26[4];
  id v27;
  C2MPGenericEvent *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = objc_alloc_init(C2MPGenericEvent);
  -[C2MPGenericEvent setName:](v15, "setName:", v11);
  if (a4 == 2)
  {
    v16 = v15;
    v17 = 201;
  }
  else if (a4 == 1)
  {
    v16 = v15;
    v17 = 101;
  }
  else
  {
    if (C2_DEFAULT_LOG_BLOCK_0 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_0, &__block_literal_global_3);
    v18 = C2_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v30 = v11;
      v31 = 2048;
      v32 = a4;
      _os_log_impl(&dword_1D4DC3000, v18, OS_LOG_TYPE_ERROR, "genericMetric with name %{public}@ had unknown metricType %llu", buf, 0x16u);
    }
    v16 = v15;
    v17 = 0;
  }
  -[C2MPGenericEvent setType:](v16, "setType:", v17);
  if (v12)
  {
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v19 = +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:");
  }
  else
  {
    v19 = 0;
  }
  -[C2MPGenericEvent setTimestampStart:](v15, "setTimestampStart:", v19);
  if (v13)
  {
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    v20 = +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:");
  }
  else
  {
    v20 = 0;
  }
  -[C2MPGenericEvent setTimestampEnd:](v15, "setTimestampEnd:", v20);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __88__C2Metric_generateGenericEventWithName_genericMetricType_startTime_endTime_attributes___block_invoke_11;
  v26[3] = &unk_1E9898980;
  v27 = v11;
  v21 = v15;
  v28 = v21;
  v22 = v11;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v26);

  v23 = v28;
  v24 = v21;

  return v24;
}

+ (id)generateError:(id)a3
{
  id v3;
  C2MPError *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = objc_alloc_init(C2MPError);
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPError setErrorDomain:](v4, "setErrorDomain:", v6);

  -[C2MPError setErrorCode:](v4, "setErrorCode:", objc_msgSend(v3, "code"));
  if (+[C2DeviceInfo isAppleInternal](C2DeviceInfo, "isAppleInternal"))
  {
    objc_msgSend(v3, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CKErrorDescription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MPError setErrorDescription:](v4, "setErrorDescription:", v8);

    -[C2MPError errorDescription](v4, "errorDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v3, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPError setErrorDescription:](v4, "setErrorDescription:", v11);

    }
    -[C2MPError errorDescription](v4, "errorDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v3, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPError setErrorDescription:](v4, "setErrorDescription:", v14);

    }
  }
  objc_msgSend(v3, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    +[C2Metric generateError:](C2Metric, "generateError:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MPError setUnderlyingError:](v4, "setUnderlyingError:", v17);

  }
  return v4;
}

void __88__C2Metric_generateGenericEventWithName_genericMetricType_startTime_endTime_attributes___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_0;
  C2_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __88__C2Metric_generateGenericEventWithName_genericMetricType_startTime_endTime_attributes___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  C2MPGenericEventMetric *v7;
  C2MPGenericEventMetricValue *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(C2MPGenericEventMetric);
  -[C2MPGenericEventMetric setKey:](v7, "setKey:", v5);
  v8 = objc_alloc_init(C2MPGenericEventMetricValue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    -[C2MPGenericEventMetricValue setDateValue:](v8, "setDateValue:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:"));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[C2MPGenericEventMetricValue setDoubleValue:](v8, "setDoubleValue:");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[C2MPGenericEventMetricValue setStringValue:](v8, "setStringValue:", v6);
      }
      else
      {
        if (C2_DEFAULT_LOG_BLOCK_0 != -1)
          dispatch_once(&C2_DEFAULT_LOG_BLOCK_0, &__block_literal_global_17);
        v9 = (void *)C2_DEFAULT_LOG_INTERNAL_0;
        if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
        {
          v10 = *(_QWORD *)(a1 + 32);
          v11 = v9;
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138543874;
          v17 = v10;
          v18 = 2114;
          v19 = v5;
          v20 = 2114;
          v21 = v13;
          _os_log_impl(&dword_1D4DC3000, v11, OS_LOG_TYPE_ERROR, "genericMetric with name %{public}@ had key %{public}@ with unhandled metric type: %{public}@", (uint8_t *)&v16, 0x20u);

        }
        v8 = 0;
      }
    }
  }
  -[C2MPGenericEventMetric setValue:](v7, "setValue:", v8);
  if (v7 && v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "addMetric:", v7);
  }
  else
  {
    if (C2_DEFAULT_LOG_BLOCK_0 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_0, &__block_literal_global_19);
    v14 = C2_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v15;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_1D4DC3000, v14, OS_LOG_TYPE_ERROR, "genericMetric with name %{public}@ encountered error processing key %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }

}

void __88__C2Metric_generateGenericEventWithName_genericMetricType_startTime_endTime_attributes___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_0;
  C2_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __88__C2Metric_generateGenericEventWithName_genericMetricType_startTime_endTime_attributes___block_invoke_18()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_0;
  C2_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

@end
