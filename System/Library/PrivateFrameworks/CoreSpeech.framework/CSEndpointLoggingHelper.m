@implementation CSEndpointLoggingHelper

+ (id)getMHClientEventByMhUUID:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99A60]);
    v5 = objc_alloc(MEMORY[0x1E0D9A500]);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
    v7 = (void *)objc_msgSend(v5, "initWithNSUUID:", v6);

    v8 = objc_alloc_init(MEMORY[0x1E0D99A68]);
    objc_msgSend(v8, "setMhId:", v7);
    objc_msgSend(v4, "setEventMetadata:", v8);

  }
  else
  {
    v9 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v13 = 136315650;
      v14 = "+[CSEndpointLoggingHelper getMHClientEventByMhUUID:]";
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = (id)objc_opt_class();
      v11 = v18;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s mhUUID = %@, class = %@", (uint8_t *)&v13, 0x20u);

    }
    v4 = 0;
  }

  return v4;
}

+ (id)getMHStatisticDistributionInfoFromDictionary:(id)a3
{
  return +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:withScaleFactor:](CSEndpointLoggingHelper, "getMHStatisticDistributionInfoFromDictionary:withScaleFactor:", a3, 1.0);
}

+ (id)getMHStatisticDistributionInfoFromDictionary:(id)a3 withScaleFactor:(double)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  void *v26;
  float v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  double v33;

  v5 = (objc_class *)MEMORY[0x1E0D99AD8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "objectForKey:", CFSTR("Num"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNum:", objc_msgSend(v8, "intValue"));

  v9 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v6, "objectForKey:", CFSTR("Avg"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11 * a4;
  *(float *)&v12 = v12;
  objc_msgSend(v7, "setAvg:", objc_msgSend(v9, "millisecondsToNs:", v12));

  v13 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v6, "objectForKey:", CFSTR("Max"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15 * a4;
  *(float *)&v16 = v16;
  objc_msgSend(v7, "setMax:", objc_msgSend(v13, "millisecondsToNs:", v16));

  v17 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v6, "objectForKey:", CFSTR("Min"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19 * a4;
  *(float *)&v20 = v20;
  objc_msgSend(v7, "setMin:", objc_msgSend(v17, "millisecondsToNs:", v20));

  v21 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v6, "objectForKey:", CFSTR("P95"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v24 = v23 * a4;
  *(float *)&v24 = v24;
  objc_msgSend(v7, "setP95:", objc_msgSend(v21, "millisecondsToNs:", v24));

  v25 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v6, "objectForKey:", CFSTR("Median"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  v28 = v27 * a4;
  *(float *)&v28 = v28;
  objc_msgSend(v7, "setMedian:", objc_msgSend(v25, "millisecondsToNs:", v28));

  objc_msgSend(v6, "objectForKey:", CFSTR("Std"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  objc_msgSend(v7, "setStd:");

  objc_msgSend(v6, "objectForKey:", CFSTR("Warmup"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = (void *)MEMORY[0x1E0D19118];
    objc_msgSend(v30, "floatValue");
    v33 = v32 * a4;
    *(float *)&v33 = v33;
    objc_msgSend(v7, "setWarmup:", objc_msgSend(v31, "millisecondsToNs:", v33));
  }

  return v7;
}

+ (void)reportMHEndpointerAccessibleContextEventWithThresholdType:(id)a3 MhId:(id)a4
{
  __CFString *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D99AB0]);
    v8 = v7;
    if (v5 == CFSTR("accessible-extended"))
      v9 = 1;
    else
      v9 = 2 * (v5 == CFSTR("accessible-maximum"));
    objc_msgSend(v7, "setAccessibleEndpointerLevel:", v9);
    +[CSEndpointLoggingHelper getMHClientEventByMhUUID:](CSEndpointLoggingHelper, "getMHClientEventByMhUUID:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEndpointerAccessibleContext:", v8);
    objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "emitMessage:", v10);

    v12 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315394;
      v15 = "+[CSEndpointLoggingHelper reportMHEndpointerAccessibleContextEventWithThresholdType:MhId:]";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointerAccessibleContextEvent to SELF for MH ID: %@", (uint8_t *)&v14, 0x16u);
    }

  }
  else
  {
    v13 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = "+[CSEndpointLoggingHelper reportMHEndpointerAccessibleContextEventWithThresholdType:MhId:]";
      _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v14, 0xCu);
    }
  }

}

+ (void)reportServerEndpointWithMhId:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99A98]);
    objc_msgSend(v4, "setEndpointerType:", 5);
    +[CSEndpointLoggingHelper getMHClientEventByMhUUID:](CSEndpointLoggingHelper, "getMHClientEventByMhUUID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEndpointDetected:", v4);
    objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emitMessage:", v5);

    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "+[CSEndpointLoggingHelper reportServerEndpointWithMhId:]";
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointDetectedEvent to SELF for MH ID: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  else
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "+[CSEndpointLoggingHelper reportServerEndpointWithMhId:]";
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v9, 0xCu);
    }
  }

}

@end
