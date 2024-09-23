@implementation CDMSELFLogUtil

+ (int)getLocaleForAsset:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  int v6;

  objc_msgSend(a3, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("LOCALE_"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_UNKNOWN_LOCALE")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_AR_AE")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_AR_SA")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_CA_ES")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_CS_CZ")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_DA_DK")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_DE_AT")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_DE_CH")) & 1) != 0)
  {
    v6 = 7;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_DE_DE")) & 1) != 0)
  {
    v6 = 8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EL_GR")) & 1) != 0)
  {
    v6 = 9;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_AE")) & 1) != 0)
  {
    v6 = 10;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_AU")) & 1) != 0)
  {
    v6 = 11;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_CA")) & 1) != 0)
  {
    v6 = 12;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_GB")) & 1) != 0)
  {
    v6 = 13;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_ID")) & 1) != 0)
  {
    v6 = 14;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_IE")) & 1) != 0)
  {
    v6 = 15;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_IN")) & 1) != 0)
  {
    v6 = 16;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_MY")) & 1) != 0)
  {
    v6 = 17;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_NZ")) & 1) != 0)
  {
    v6 = 18;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_PH")) & 1) != 0)
  {
    v6 = 19;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_SG")) & 1) != 0)
  {
    v6 = 20;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_SA")) & 1) != 0)
  {
    v6 = 21;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_US")) & 1) != 0)
  {
    v6 = 22;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_EN_ZA")) & 1) != 0)
  {
    v6 = 23;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_ES_CL")) & 1) != 0)
  {
    v6 = 24;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_ES_CO")) & 1) != 0)
  {
    v6 = 25;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_ES_ES")) & 1) != 0)
  {
    v6 = 26;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_ES_MX")) & 1) != 0)
  {
    v6 = 27;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_ES_US")) & 1) != 0)
  {
    v6 = 28;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_FI_FI")) & 1) != 0)
  {
    v6 = 29;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_FR_BE")) & 1) != 0)
  {
    v6 = 30;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_FR_CA")) & 1) != 0)
  {
    v6 = 31;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_FR_CH")) & 1) != 0)
  {
    v6 = 32;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_FR_FR")) & 1) != 0)
  {
    v6 = 33;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_HE_IL")) & 1) != 0)
  {
    v6 = 34;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_HI_IN")) & 1) != 0)
  {
    v6 = 35;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_HR_HR")) & 1) != 0)
  {
    v6 = 36;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_HU_HU")) & 1) != 0)
  {
    v6 = 37;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_ID_ID")) & 1) != 0)
  {
    v6 = 38;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_IT_CH")) & 1) != 0)
  {
    v6 = 39;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_IT_IT")) & 1) != 0)
  {
    v6 = 40;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_JA_JP")) & 1) != 0)
  {
    v6 = 41;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_KO_KR")) & 1) != 0)
  {
    v6 = 42;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_MS_MY")) & 1) != 0)
  {
    v6 = 43;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_NB_NO")) & 1) != 0)
  {
    v6 = 44;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_NL_BE")) & 1) != 0)
  {
    v6 = 45;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_NL_NL")) & 1) != 0)
  {
    v6 = 46;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_PL_PL")) & 1) != 0)
  {
    v6 = 47;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_PT_BR")) & 1) != 0)
  {
    v6 = 48;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_PT_PT")) & 1) != 0)
  {
    v6 = 49;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_RO_RO")) & 1) != 0)
  {
    v6 = 50;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_RU_RU")) & 1) != 0)
  {
    v6 = 51;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_SK_SK")) & 1) != 0)
  {
    v6 = 52;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_SV_SE")) & 1) != 0)
  {
    v6 = 53;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_TH_TH")) & 1) != 0)
  {
    v6 = 54;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_TR_TR")) & 1) != 0)
  {
    v6 = 55;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_UK_UA")) & 1) != 0)
  {
    v6 = 56;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_VI_VN")) & 1) != 0)
  {
    v6 = 57;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_WUU_CN")) & 1) != 0)
  {
    v6 = 58;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_YUE_CN")) & 1) != 0)
  {
    v6 = 59;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_ZH_CN")) & 1) != 0)
  {
    v6 = 60;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_ZH_HK")) & 1) != 0)
  {
    v6 = 61;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("LOCALE_ZH_TW")))
  {
    v6 = 62;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)cdmAllServicesWarmupEnded:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BE9E340];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "createCDMAllServicesWarmupEndedLog:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v10, v9, v8);

  if (!v11)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CDMSELFLogUtil cdmAllServicesWarmupEnded:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM All Services Warmup ended event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }

  }
  return v11;
}

+ (BOOL)cdmAllServicesSetupStarted:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BE9E340];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "createCDMAllServicesSetupStartedLog:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v10, v9, v8);

  if (!v11)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CDMSELFLogUtil cdmAllServicesSetupStarted:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM All Services Setup started event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }

  }
  return v11;
}

+ (BOOL)cdmAllServicesSetupEnded:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BE9E340];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "createCDMAllServicesSetupEndedLog:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v10, v9, v8);

  if (!v11)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CDMSELFLogUtil cdmAllServicesSetupEnded:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM All Services Setup ended event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }

  }
  return v11;
}

+ (BOOL)cdmClientSetupEnded:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BE9E340];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "createCDMClientSetupEndedLog:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v10, v9, v8);

  if (!v11)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CDMSELFLogUtil cdmClientSetupEnded:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Setup ended event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }

  }
  return v11;
}

+ (BOOL)cdmAssetSetupStarted:(id)a3 contextId:(id)a4 serviceNames:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v26 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = +[CDMSELFLogUtil stringServiceTypeToEnum:](CDMSELFLogUtil, "stringServiceTypeToEnum:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), v26);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x24BE9E340], "createCDMAssetSetupStartedLog:serviceTypes:metadata:", v26, v14, v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v22, v12, v13);
  if (!v23)
  {
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "+[CDMSELFLogUtil cdmAssetSetupStarted:contextId:serviceNames:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDMAssetSetup started event, but there was an issue with emission. Log was not emitted!!", buf, 0xCu);
    }

  }
  return v23;
}

+ (BOOL)cdmAssetSetupEnded:(id)a3 contextId:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x24BE9E340];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "createCDMAssetSetupEndedLog:metadata:", a4, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v12, v11, v10);

  if (!v13)
  {
    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 136315138;
      v17 = "+[CDMSELFLogUtil cdmAssetSetupEnded:contextId:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDMAssetSetup ended event, but there was an issue with emission. Log was not emitted!!", (uint8_t *)&v16, 0xCu);
    }

  }
  return v13;
}

+ (BOOL)cdmAssetsReported:(id)a3 metadata:(id)a4 dataDispatcherContext:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v23 = a4;
  v8 = a5;
  v9 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "+[CDMSELFLogUtil cdmAssetsReported:metadata:dataDispatcherContext:]";
    v31 = 2112;
    v32 = CFSTR("assets");
    v33 = 2112;
    v34 = v7;
    _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nAssets available are: %@", buf, 0x20u);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[CDMSELFLogUtil convertNLAssetToSISchemaAsset:nlAsset:](CDMSELFLogUtil, "convertNLAssetToSISchemaAsset:nlAsset:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x24BE9E340], "createCDMAssetsReportedLog:metadata:", v10, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v19, CFSTR("Logging assets information!"), v8);
  if (!v20)
  {
    CDMOSLoggerForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "+[CDMSELFLogUtil cdmAssetsReported:metadata:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDMAssetsReported event, but there was an issue with emission. Log was not emitted!", buf, 0xCu);
    }

  }
  return v20;
}

+ (BOOL)cdmAllServicesWarmupStarted:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BE9E340];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "createCDMAllServicesWarmupStartedLog:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v10, v9, v8);

  if (!v11)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CDMSELFLogUtil cdmAllServicesWarmupStarted:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM All Services Warmup started event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }

  }
  return v11;
}

+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4 dataDispatcherContext:(id)a5
{
  return +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:", a3, a4, 0, CFSTR("LOG_DEBUG"), a5);
}

+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4 machAbsoluteTime:(unint64_t)a5 logLevel:(id)a6 dataDispatcherContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  CDMDataDispatcherContext *v14;
  CDMDataDispatcherContext *v15;
  void *v16;
  NSObject *v17;
  CDMDataDispatcherContext *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  _BOOL4 v25;
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  const char *v33;
  BOOL v34;
  void *v36;
  void *v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = (CDMDataDispatcherContext *)a7;
  v15 = v14;
  if (!v14
    || (-[CDMDataDispatcherContext callingBundleId](v14, "callingBundleId"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        !v16))
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
      _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s No datadispatchercontext found - using default logging policy", buf, 0xCu);
    }

    v18 = objc_alloc_init(CDMDataDispatcherContext);
    v15 = v18;
  }
  if (!+[CDMSELFLoggingPolicy isSELFLoggingAllowed:](CDMSELFLoggingPolicy, "isSELFLoggingAllowed:", -[CDMDataDispatcherContext cdmSELFLoggingPolicyType](v15, "cdmSELFLoggingPolicyType")))
  {
    CDMOSLoggerForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      goto LABEL_29;
    *(_DWORD *)buf = 136315138;
    v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
    v32 = "%s Tried to emit a SELF event, but logging is not allowed!";
LABEL_22:
    _os_log_debug_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_DEBUG, v32, buf, 0xCu);
    goto LABEL_29;
  }
  if (!-[CDMDataDispatcherContext isSampledForEmission](v15, "isSampledForEmission"))
  {
    CDMOSLoggerForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      goto LABEL_29;
    *(_DWORD *)buf = 136315138;
    v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
    v32 = "%s Supressing SELF log emission, not sampled.";
    goto LABEL_22;
  }
  if (v11)
  {
    objc_msgSend(v11, "mainEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_53;
    objc_msgSend(v11, "mainEvent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "hasEventMetadata") & 1) != 0)
    {
      objc_msgSend(v11, "mainEvent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "eventMetadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "hasNlId");

      if ((v23 & 1) != 0)
      {
        objc_msgSend(v11, "mainEvent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = +[CDMSELFLogUtil isEventSampledForEmission:](CDMSELFLogUtil, "isEventSampledForEmission:", v24);

        if (!v25)
        {
          v34 = 0;
          goto LABEL_31;
        }
        v26 = -[CDMDataDispatcherContext cdmSELFLoggingPolicyType](v15, "cdmSELFLoggingPolicyType");
        CDMOSLoggerForCategory(0);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
        if (v26 == 1)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136315138;
            v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
            _os_log_debug_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_DEBUG, "%s CDM Log policy - Siri", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BE909A8], "sharedStream");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "mainEvent");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (a5)
            objc_msgSend(v29, "emitMessage:timestamp:", v30, a5);
          else
            objc_msgSend(v29, "emitMessage:", v30);
        }
        else
        {
          if (v28)
          {
            *(_DWORD *)buf = 136315138;
            v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
            _os_log_debug_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_DEBUG, "%s CDM Log policy - Non Siri", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BE909A8], "sharedAnalytics");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "defaultMessageStream");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "mainEvent");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CDMDataDispatcherContext streamUUID](v15, "streamUUID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (a5)
            objc_msgSend(v30, "emitMessage:timestamp:isolatedStreamUUID:", v36, a5, v37);
          else
            objc_msgSend(v30, "emitMessage:isolatedStreamUUID:", v36, v37);

        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("LOG_DEBUG")))
        {
          CDMOSLoggerForCategory(0);
          v38 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
LABEL_52:

LABEL_53:
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            objc_msgSend(v11, "tier1Events");
            v31 = objc_claimAutoreleasedReturnValue();
            v41 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
            if (v41)
            {
              v42 = v41;
              v48 = v13;
              v43 = *(_QWORD *)v50;
              do
              {
                for (i = 0; i != v42; ++i)
                {
                  if (*(_QWORD *)v50 != v43)
                    objc_enumerationMutation(v31);
                  v45 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
                  if (-[CDMDataDispatcherContext cdmSELFLoggingPolicyType](v15, "cdmSELFLoggingPolicyType") == 1)
                  {
                    objc_msgSend(MEMORY[0x24BE909A8], "sharedStream");
                    v46 = objc_claimAutoreleasedReturnValue();
                    v47 = v46;
                    if (a5)
                      -[NSObject emitMessage:timestamp:](v46, "emitMessage:timestamp:", v45, a5);
                    else
                      -[NSObject emitMessage:](v46, "emitMessage:", v45);
                  }
                  else
                  {
                    CDMOSLoggerForCategory(0);
                    v47 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 136315138;
                      v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataD"
                            "ispatcherContext:]";
                      _os_log_impl(&dword_21A2A0000, v47, OS_LOG_TYPE_INFO, "%s [WARN]: Got a tier1Event for non-siri client", buf, 0xCu);
                    }
                  }

                }
                v42 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
              }
              while (v42);
              v34 = 1;
              v13 = v48;
            }
            else
            {
              v34 = 1;
            }
            goto LABEL_30;
          }
        }
        else
        {
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("LOG_WARN")))
          {
            CDMOSLoggerForCategory(0);
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
              v56 = 2112;
              v57 = v12;
              _os_log_impl(&dword_21A2A0000, v38, OS_LOG_TYPE_INFO, "%s [WARN]: %@", buf, 0x16u);
            }
            goto LABEL_52;
          }
          v39 = objc_msgSend(v13, "isEqualToString:", CFSTR("LOG_ERROR"));
          CDMOSLoggerForCategory(0);
          v40 = objc_claimAutoreleasedReturnValue();
          v38 = v40;
          if (v39)
          {
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
              v56 = 2112;
              v57 = v12;
              _os_log_error_impl(&dword_21A2A0000, v38, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
            }
            goto LABEL_52;
          }
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
            _os_log_impl(&dword_21A2A0000, v38, OS_LOG_TYPE_INFO, "%s [WARN]: Did not get a valid log level for SELF emitEventsFromContainer. Defaulting to debug level.", buf, 0xCu);
          }

          CDMOSLoggerForCategory(0);
          v38 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            goto LABEL_52;
        }
        *(_DWORD *)buf = 136315394;
        v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
        v56 = 2112;
        v57 = v12;
        _os_log_debug_impl(&dword_21A2A0000, v38, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
        goto LABEL_52;
      }
    }
    else
    {

    }
    CDMOSLoggerForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
      v33 = "%s [WARN]: Tried to emit a SELF event, but the event's NL ID was nil! This event is not emitted as it is cre"
            "ated from a test.";
      goto LABEL_28;
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "+[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:]";
      v33 = "%s [WARN]: Tried to emit a SELF event, but the given eventContainer was nil!";
LABEL_28:
      _os_log_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_INFO, v33, buf, 0xCu);
    }
  }
LABEL_29:
  v34 = 0;
LABEL_30:

LABEL_31:
  return v34;
}

+ (BOOL)isEventSampledForEmission:(id)a3
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  unint64_t v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = +[CDMSELFLogUtil getSampleRateForEvent:](CDMSELFLogUtil, "getSampleRateForEvent:", v3);
  if (v4 > 0x63)
    goto LABEL_9;
  v5 = v4;
  objc_msgSend(v3, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nlId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toSafeNSUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringToIndex:", 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  if (v12)
  {
    v13 = strtoul(v12, 0, 16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Invalid NL ID substring"), CFSTR("The substring from NL ID is nil!"));
    v13 = 0;
  }
  CDMOSLoggerForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v18 = 136315394;
    v19 = "+[CDMSELFLogUtil isEventSampledForEmission:]";
    v20 = 2048;
    v21 = v13;
    _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s NLX SELF log sampling value: %lu", (uint8_t *)&v18, 0x16u);
  }

  if (v13 % 0x64 < v5)
  {

LABEL_9:
    v15 = 1;
    goto LABEL_13;
  }
  CDMOSLoggerForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v18 = 136315138;
    v19 = "+[CDMSELFLogUtil isEventSampledForEmission:]";
    _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s NLX SELF log sampled via NL ID", (uint8_t *)&v18, 0xCu);
  }

  v15 = 0;
LABEL_13:

  return v15;
}

+ (unsigned)getSampleRateForEvent:(id)a3
{
  void *v3;

  objc_msgSend(a3, "cdmXpcEventProcessingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 5;
  else
    return 100;
}

+ (id)convertNLAssetToSISchemaAsset:(id)a3 nlAsset:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (objc_class *)MEMORY[0x24BE95AA8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v6, "getAssetSetName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTrialNamespace:", v9);

  objc_msgSend(v6, "getAssetLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil getAssetNameWithLocaleSuffix:locale:](CDMSELFLogUtil, "getAssetNameWithLocaleSuffix:locale:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAssetName:", v11);
  objc_msgSend(v6, "getAssetLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAssetLocale:", +[CDMSELFLogUtil getLocaleForAsset:](CDMSELFLogUtil, "getLocaleForAsset:", v12));

  objc_msgSend(v6, "getAssetVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[CDMSELFLogUtil getVersionForAsset:](CDMSELFLogUtil, "getVersionForAsset:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAssetVersion:", v14);

  return v8;
}

+ (id)getAssetNameWithLocaleSuffix:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6 && !objc_msgSend(v5, "hasSuffix:", v6))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v5, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

+ (id)getVersionForAsset:(id)a3
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x24BE95C88]);
    if ((unint64_t)-[NSObject count](v3, "count") >= 2 && (unint64_t)-[NSObject count](v3, "count") < 4)
    {
      -[NSObject objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMajor:", objc_msgSend(v7, "intValue"));

      -[NSObject objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMinor:", objc_msgSend(v8, "intValue"));

      if (-[NSObject count](v3, "count") == 3)
      {
        -[NSObject objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setPatch:", objc_msgSend(v9, "intValue"));

      }
      v6 = v4;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v11 = 136315394;
        v12 = "+[CDMSELFLogUtil getVersionForAsset:]";
        v13 = 2048;
        v14 = -[NSObject count](v3, "count");
        _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Version info count is %lu", (uint8_t *)&v11, 0x16u);
      }

      v6 = 0;
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "+[CDMSELFLogUtil getVersionForAsset:]";
      _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: NL Asset Version is nil", (uint8_t *)&v11, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

+ (int)stringServiceTypeToEnum:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    +[CDMServiceTypeNames getNameStringToEnumDict](CDMServiceTypeNames, "getNameStringToEnumDict");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      -[NSObject objectForKey:](v4, "objectForKey:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = v6;
        v8 = -[NSObject intValue](v6, "intValue");
LABEL_14:

        goto LABEL_15;
      }
      CDMOSLoggerForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 136315138;
        v12 = "+[CDMSELFLogUtil stringServiceTypeToEnum:]";
        _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to fetch CDMServiceType with string key, but received nil!", (uint8_t *)&v11, 0xCu);
      }

      v7 = 0;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v11 = 136315138;
        v12 = "+[CDMSELFLogUtil stringServiceTypeToEnum:]";
        _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to fetch CDMServiceTypeNames stringToEnumDict, but received nil!", (uint8_t *)&v11, 0xCu);
      }
    }
    v8 = 0;
    goto LABEL_14;
  }
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "+[CDMSELFLogUtil stringServiceTypeToEnum:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Nil given to stringServiceTypeToEnum method!", (uint8_t *)&v11, 0xCu);
  }
  v8 = 0;
LABEL_15:

  return v8;
}

+ (BOOL)cdmClientSetupStarted:(id)a3 logMessage:(id)a4 currentServiceGraph:(int)a5 dataDispatcherContext:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v7 = *(_QWORD *)&a5;
  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  v11 = a4;
  CDMOSLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "nlId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "toSafeNSUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resultCandidateId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trpId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "toSafeNSUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "toSafeNSUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subRequestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "toSafeNSUUID");
    *(_DWORD *)buf = 136316418;
    v27 = "+[CDMSELFLogUtil cdmClientSetupStarted:logMessage:currentServiceGraph:dataDispatcherContext:]";
    v28 = 2112;
    v29 = v22;
    v30 = 2112;
    v31 = v17;
    v32 = 2112;
    v33 = v18;
    v34 = 2112;
    v35 = v19;
    v36 = 2112;
    v37 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v37;
    _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s SELF Metadata for CDMClientSetupStarted \n nlxMetadata.nlId: %@ \n nlxMetadata.rcId: %@ \n nlxMetadata.trpId: %@ \nnlxMetadata.requestId: %@ \n nlxMetadata.subRequestId: %@ \n ", buf, 0x3Eu);

  }
  objc_msgSend(MEMORY[0x24BE9E340], "createCDMClientSetupStartedLog:cdmServiceGraphName:", v9, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v13, v11, v10);

  if (!v14)
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "+[CDMSELFLogUtil cdmClientSetupStarted:logMessage:currentServiceGraph:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Setup started event, but there was an issue with emission. Log was not emitted!", buf, 0xCu);
    }

  }
  return v14;
}

+ (id)createSELFMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithRequestId:(id)a5 andWithResultCandidateId:(id)a6 andWithConnectionId:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  int v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  v28 = 0;
  if (v15)
  {
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("ORCHESTRATOR")))
    {
      v17 = 1;
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("CURARE")))
    {
      v17 = 2;
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("LIGHTHOUSE")))
    {
      v17 = 3;
    }
    else
    {
      if (!objc_msgSend(v16, "isEqualToString:", CFSTR("SPOTLIGHT")))
        goto LABEL_11;
      v17 = 5;
    }
    v28 = v17;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x24BE9E320], "convertFromUUID:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = AFDeviceSupportsSAE();
  CDMOSLoggerForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21)
    {
      *(_DWORD *)buf = 136315138;
      v30 = "+[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:]";
      _os_log_debug_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_DEBUG, "%s Device supports AssistantEngine flow, use incoming requestId as subRequestId for NLX", buf, 0xCu);
    }
    v22 = 0;
    v23 = v18;
  }
  else
  {
    if (v21)
    {
      *(_DWORD *)buf = 136315138;
      v30 = "+[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:]";
      _os_log_debug_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_DEBUG, "%s Device does NOT support AssistantEngine flow, use incoming requestId as is for NLX", buf, 0xCu);
    }
    v23 = 0;
    v22 = v18;
  }

  v24 = (void *)MEMORY[0x24BE9E340];
  v25 = v18;
  objc_msgSend(v24, "createNLXClientEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithSubRequestId:andWithResultCandidateId:andWithRequester:", v11, v12, v22, v23, v14, &v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)createSELFMetadataWithRequestId:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BE9E340], "extractRequestLinkData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "nlId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trpId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultCandidateId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:](CDMSELFLogUtil, "createSELFMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithConnectionId:", v5, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4
{
  return +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:", a3, a4, 0, CFSTR("LOG_DEBUG"));
}

+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4 machAbsoluteTime:(unint64_t)a5 dataDispatcherContext:(id)a6
{
  return +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:", a3, a4, a5, CFSTR("LOG_DEBUG"), a6);
}

+ (BOOL)emitEventsFromContainer:(id)a3 mainEventLogMessage:(id)a4 machAbsoluteTime:(unint64_t)a5 logLevel:(id)a6
{
  return +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:logLevel:dataDispatcherContext:", a3, a4, a5, a6, 0);
}

+ (BOOL)emitNLXRequestLink:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE909A8], "sharedStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "emitMessage:", v6);

    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315394;
      v12 = "+[CDMSELFLogUtil emitNLXRequestLink:logMessage:dataDispatcherContext:]";
      v13 = 2112;
      v14 = v7;
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "+[CDMSELFLogUtil emitNLXRequestLink:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a SELF RequestLink, but the given RequestLink was nil!", (uint8_t *)&v11, 0xCu);
    }
  }

  return v6 != 0;
}

+ (BOOL)orchestratorRequestLink:(id)a3 nlId:(id)a4 metadata:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  BOOL v18;
  const char *v19;
  NSObject *v20;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v11)
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v22 = 136315138;
      v23 = "+[CDMSELFLogUtil orchestratorRequestLink:nlId:metadata:logMessage:dataDispatcherContext:]";
      v19 = "%s [WARN]: Tried to create an orchestrator RequestLink but received nil sourceId (Orchestration Id)!";
LABEL_12:
      _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v22, 0xCu);
    }
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if (!v12)
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v22 = 136315138;
      v23 = "+[CDMSELFLogUtil orchestratorRequestLink:nlId:metadata:logMessage:dataDispatcherContext:]";
      v19 = "%s [WARN]: Tried to create an orchestrator RequestLink but had nil nluRequestId!";
      goto LABEL_12;
    }
    goto LABEL_16;
  }
  if (AFDeviceSupportsSAE())
    v16 = 43;
  else
    v16 = 1;
  objc_msgSend(MEMORY[0x24BE9E340], "createNLXRequestLinkWithTarget:andTargetId:metadata:", v16, v11, v13);
  v17 = objc_claimAutoreleasedReturnValue();
  if (!+[CDMSELFLogUtil emitNLXRequestLink:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitNLXRequestLink:logMessage:dataDispatcherContext:", v17, v14, v15))
  {
    CDMOSLoggerForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v22 = 136315138;
      v23 = "+[CDMSELFLogUtil orchestratorRequestLink:nlId:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit an orchestrator RequestLink, but there was an issue and could not emit!", (uint8_t *)&v22, 0xCu);
    }

    goto LABEL_16;
  }
  v18 = 1;
LABEL_17:

  return v18;
}

+ (BOOL)curareRequestLink:(id)a3 nlId:(id)a4 metadata:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  const char *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v11)
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v21 = 136315138;
      v22 = "+[CDMSELFLogUtil curareRequestLink:nlId:metadata:logMessage:dataDispatcherContext:]";
      v18 = "%s [WARN]: Tried to create a Curare RequestLink but received nil sourceId (Curare Id)!";
LABEL_9:
      _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v21, 0xCu);
    }
LABEL_13:
    v17 = 0;
    goto LABEL_14;
  }
  if (!v12)
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v21 = 136315138;
      v22 = "+[CDMSELFLogUtil curareRequestLink:nlId:metadata:logMessage:dataDispatcherContext:]";
      v18 = "%s [WARN]: Tried to create a Curare RequestLink but had nil nluRequestId!";
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BE9E340], "createNLXRequestLinkWithTarget:andTargetId:metadata:", 16, v11, v13);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!+[CDMSELFLogUtil emitNLXRequestLink:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitNLXRequestLink:logMessage:dataDispatcherContext:", v16, v14, v15))
  {
    CDMOSLoggerForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = 136315138;
      v22 = "+[CDMSELFLogUtil curareRequestLink:nlId:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a Curare RequestLink, but there was an issue and could not emit!", (uint8_t *)&v21, 0xCu);
    }

    goto LABEL_13;
  }
  v17 = 1;
LABEL_14:

  return v17;
}

+ (BOOL)emitCurareContext:(id)a3 metadata:(id)a4 dataDispatcherContext:(id)a5
{
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BE9E340], "createNLXCurareContext:metadata:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v8, CFSTR("SELF emitting CurareContext"), v7);

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "+[CDMSELFLogUtil emitCurareContext:metadata:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_INFO, "%s [WARN]: SELF CurareContext - given curare ID was nil! Not emitting CurareContext log as it is meaningless.", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

+ (BOOL)emitRequestLink:(id)a3 metadata:(id)a4 dataDispatcherContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  const char *v17;
  BOOL v18;
  void *v19;
  int v20;
  void *v21;
  void *v23;
  int v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    v25 = 136315138;
    v26 = "+[CDMSELFLogUtil emitRequestLink:metadata:dataDispatcherContext:]";
    v17 = "%s [WARN]: SELF RequestLink was attemped to be emitted, but the received RequestLinkData was nil! RequestLink not emitted!";
LABEL_9:
    _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v25, 0xCu);
    goto LABEL_10;
  }
  objc_msgSend(v7, "targetName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    v25 = 136315138;
    v26 = "+[CDMSELFLogUtil emitRequestLink:metadata:dataDispatcherContext:]";
    v17 = "%s [WARN]: SELF RequestLink was attempted to be emitted, but the target name was not set in the received Reque"
          "stLinkData! RequestLink not emitted!";
    goto LABEL_9;
  }
  objc_msgSend(v7, "targetName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ORCHESTRATOR"));

  if (v12)
  {
    objc_msgSend(v7, "targetUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nlId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[CDMSELFLogUtil orchestratorRequestLink:nlId:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "orchestratorRequestLink:nlId:metadata:logMessage:dataDispatcherContext:", v13, v14, v8, CFSTR("SELF emitting RequestLink message linking NLX and Orchestrator"), v9);
LABEL_13:
    v18 = v15;

LABEL_14:
    goto LABEL_15;
  }
  objc_msgSend(v7, "targetName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("CURARE"));

  if (v20)
  {
    objc_msgSend(v7, "targetUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil emitCurareContext:metadata:dataDispatcherContext:](CDMSELFLogUtil, "emitCurareContext:metadata:dataDispatcherContext:", v21, v8, v9);

    objc_msgSend(v7, "targetUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nlId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[CDMSELFLogUtil curareRequestLink:nlId:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "curareRequestLink:nlId:metadata:logMessage:dataDispatcherContext:", v13, v14, v8, CFSTR("SELF emitting RequestLink message linking NLX and Curare"), v9);
    goto LABEL_13;
  }
  objc_msgSend(v7, "targetName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("LIGHTHOUSE"));

  if (v24)
  {
    objc_msgSend(v7, "targetUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[CDMSELFLogUtil emitCurareContext:metadata:dataDispatcherContext:](CDMSELFLogUtil, "emitCurareContext:metadata:dataDispatcherContext:", v13, v8, v9);
    goto LABEL_14;
  }
  CDMOSLoggerForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v25 = 136315138;
    v26 = "+[CDMSELFLogUtil emitRequestLink:metadata:dataDispatcherContext:]";
    v17 = "%s [WARN]: SELF RequestLink was attempted to be emitted, but the requestId target was neither ORCHESTRATOR nor"
          " CURARE! RequestLink not emitted!";
    goto LABEL_9;
  }
LABEL_10:

  v18 = 0;
LABEL_15:

  return v18;
}

+ (BOOL)cdmStarted:(id)a3 metadata:(id)a4 logMessage:(id)a5 machAbsoluteTime:(unint64_t)a6 currentServiceGraph:(int)a7 dataDispatcherContext:(id)a8
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v9 = *(_QWORD *)&a7;
  v43 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a8;
  v15 = a5;
  v16 = a3;
  CDMOSLoggerForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "nlId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "toSafeNSUUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resultCandidateId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trpId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "toSafeNSUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "toSafeNSUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subRequestId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "toSafeNSUUID");
    *(_DWORD *)buf = 136316418;
    v32 = "+[CDMSELFLogUtil cdmStarted:metadata:logMessage:machAbsoluteTime:currentServiceGraph:dataDispatcherContext:]";
    v33 = 2112;
    v34 = v30;
    v35 = 2112;
    v36 = v29;
    v37 = 2112;
    v38 = v25;
    v39 = 2112;
    v40 = v22;
    v41 = 2112;
    v42 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v42;
    _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s SELF Metadata for CDMRequestStarted \n nlxMetadata.nlId: %@ \n nlxMetadata.rcId: %@ \n nlxMetadata.trpId: %@ \nnlxMetadata.requestId: %@ \n nlxMetadata.subRequestId: %@ \n ", buf, 0x3Eu);

  }
  objc_msgSend(MEMORY[0x24BE9E340], "createCDMRequestStartedLog:metadata:cdmServiceGraphName:", v16, v13, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:dataDispatcherContext:", v18, v15, a6, v14);
  if (!v19)
  {
    CDMOSLoggerForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "+[CDMSELFLogUtil cdmStarted:metadata:logMessage:machAbsoluteTime:currentServiceGraph:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM started (request) event, but the converted object is nil!", buf, 0xCu);
    }

  }
  return v19;
}

+ (BOOL)cdmEnded:(id)a3 metadata:(id)a4 logMessage:(id)a5 machAbsoluteTime:(unint64_t)a6 dataDispatcherContext:(id)a7
{
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v11 = (void *)MEMORY[0x24BE9E340];
  v12 = a7;
  v13 = a5;
  objc_msgSend(v11, "createCDMRequestEndedLog:metadata:", a3, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:machAbsoluteTime:dataDispatcherContext:", v14, v13, a6, v12);

  if (!v15)
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "+[CDMSELFLogUtil cdmEnded:metadata:logMessage:machAbsoluteTime:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM ended (response) event, but the converted object is nil!", (uint8_t *)&v18, 0xCu);
    }

  }
  return v15;
}

+ (BOOL)cdmFailed:(int)a3 metadata:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6
{
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v8 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x24BE9E340];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "createCDMRequestFailedLog:metadata:", v8, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v12, v11, v10);

  if (!v13)
  {
    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 136315138;
      v17 = "+[CDMSELFLogUtil cdmFailed:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM failed event, but the converted object is nil!", (uint8_t *)&v16, 0xCu);
    }

  }
  return v13;
}

+ (BOOL)cdmFailed:(int)a3 errorDomainString:(id)a4 errorCode:(int)a5 metadata:(id)a6 logMessage:(id)a7 dataDispatcherContext:(id)a8
{
  uint64_t v10;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  int v20;
  const char *v21;
  uint64_t v22;

  v10 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v13 = (void *)MEMORY[0x24BE9E340];
  v14 = a8;
  v15 = a7;
  objc_msgSend(v13, "createCDMRequestFailedLog:errorDomainString:errorCode:metadata:", v12, a4, v10, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v16, v15, v14);

  if (!v17)
  {
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = 136315138;
      v21 = "+[CDMSELFLogUtil cdmFailed:errorDomainString:errorCode:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM failed event, but the converted object is nil!", (uint8_t *)&v20, 0xCu);
    }

  }
  return v17;
}

+ (BOOL)matchingSpanEnded:(id)a3 metadata:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6
{
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = CDMLogContext;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = os_signpost_id_generate(v9);
  v15 = (id)CDMLogContext;
  v16 = v15;
  v17 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v25) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SpanMatcher", "SELFLogSpanMatching", (uint8_t *)&v25, 2u);
  }

  objc_msgSend(MEMORY[0x24BE9E340], "createMatchingSpanEndedLog:spanMatchResponse:metadata:", 0, v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v18, v11, v10);
  if (v19)
  {
    v20 = (id)CDMLogContext;
    v21 = v20;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(v25) = 0;
LABEL_13:
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v21, OS_SIGNPOST_INTERVAL_END, v14, "SpanMatcher", ", (uint8_t *)&v25, 2u);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v25 = 136315138;
      v26 = "+[CDMSELFLogUtil matchingSpanEnded:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM matching span ended (response) event, but the converted object is nil!", (uint8_t *)&v25, 0xCu);
    }

    v23 = (id)CDMLogContext;
    v21 = v23;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(v25) = 0;
      goto LABEL_13;
    }
  }

  return v19;
}

+ (BOOL)tokenizationEnded:(id)a3 inputType:(int)a4 metadata:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v9;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  int v18;
  const char *v19;
  uint64_t v20;

  v9 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v11 = (void *)MEMORY[0x24BE9E340];
  v12 = a7;
  v13 = a6;
  objc_msgSend(v11, "createTokenizationEndedLog:tokenizationResponse:tokenizationInputType:metadata:", 0, a3, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v14, v13, v12);

  if (!v15)
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "+[CDMSELFLogUtil tokenizationEnded:inputType:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM tokenization ended (response) event, but the converted object is nil!", (uint8_t *)&v18, 0xCu);
    }

  }
  return v15;
}

+ (BOOL)tokenizationEndedWithMultiResponses:(id)a3 inputType:(int)a4 metadata:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v9;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  int v18;
  const char *v19;
  uint64_t v20;

  v9 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v11 = (void *)MEMORY[0x24BE9E340];
  v12 = a7;
  v13 = a6;
  objc_msgSend(v11, "createMultiHypoTokenizationEndedLog:tokenizationResponses:tokenizationInputType:metadata:", 0, a3, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v14, v13, v12);

  if (!v15)
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "+[CDMSELFLogUtil tokenizationEndedWithMultiResponses:inputType:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM tokenization ended (response) event, but the converted object is nil!", (uint8_t *)&v18, 0xCu);
    }

  }
  return v15;
}

+ (BOOL)contextUpdateEnded:(id)a3 metadata:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x24BE9E340];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "createContextUpdateEndedLog:contextUpdateResponse:metadata:", 0, a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v12, v11, v10);

  if (!v13)
  {
    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 136315138;
      v17 = "+[CDMSELFLogUtil contextUpdateEnded:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM context update ended (response) event, but the converted object is nil!", (uint8_t *)&v16, 0xCu);
    }

  }
  return v13;
}

+ (BOOL)cdmClientSetupFailed:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5 logMessage:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  int v15;
  const char *v16;
  uint64_t v17;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x24BE9E340];
  v10 = a6;
  objc_msgSend(v9, "createCDMClientSetupFailedLog:errorDomain:errorCode:", a3, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:", v11, v10);

  if (!v12)
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = 136315138;
      v16 = "+[CDMSELFLogUtil cdmClientSetupFailed:errorDomain:errorCode:logMessage:]";
      _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Setup failed event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v15, 0xCu);
    }

  }
  return v12;
}

+ (BOOL)cdmClientSetupFailed:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  int v18;
  const char *v19;
  uint64_t v20;

  v8 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v11 = (void *)MEMORY[0x24BE9E340];
  v12 = a7;
  v13 = a6;
  objc_msgSend(v11, "createCDMClientSetupFailedLog:errorDomain:errorCode:", a3, v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v14, v13, v12);

  if (!v15)
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "+[CDMSELFLogUtil cdmClientSetupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Setup failed event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v18, 0xCu);
    }

  }
  return v15;
}

+ (BOOL)cdmAllServicesSetupFailed:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BE9E340];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "createCDMAllServicesSetupFailedLog:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v10, v9, v8);

  if (!v11)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CDMSELFLogUtil cdmAllServicesSetupFailed:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM All Services Setup failed event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }

  }
  return v11;
}

+ (BOOL)cdmClientWarmupStarted:(id)a3 logMessage:(id)a4 currentServiceGraph:(int)a5 dataDispatcherContext:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v7 = *(_QWORD *)&a5;
  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  v11 = a4;
  CDMOSLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "nlId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "toSafeNSUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resultCandidateId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trpId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "toSafeNSUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "toSafeNSUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subRequestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "toSafeNSUUID");
    *(_DWORD *)buf = 136316418;
    v27 = "+[CDMSELFLogUtil cdmClientWarmupStarted:logMessage:currentServiceGraph:dataDispatcherContext:]";
    v28 = 2112;
    v29 = v22;
    v30 = 2112;
    v31 = v17;
    v32 = 2112;
    v33 = v18;
    v34 = 2112;
    v35 = v19;
    v36 = 2112;
    v37 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v37;
    _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s SELF Metadata for CDMClientWarmupStarted \n nlxMetadata.nlId: %@ \n nlxMetadata.rcId: %@ \n nlxMetadata.trpId: %@ \nnlxMetadata.requestId: %@ \n nlxMetadata.subRequestId: %@ \n ", buf, 0x3Eu);

  }
  objc_msgSend(MEMORY[0x24BE9E340], "createCDMClientWarmupStartedLog:cdmServiceGraphName:", v9, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v13, v11, v10);

  if (!v14)
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "+[CDMSELFLogUtil cdmClientWarmupStarted:logMessage:currentServiceGraph:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Warmup started event, but there was an issue with emission. Log was not emitted!", buf, 0xCu);
    }

  }
  return v14;
}

+ (BOOL)cdmClientWarmupEnded:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BE9E340];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "createCDMClientWarmupEndedLog:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v10, v9, v8);

  if (!v11)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CDMSELFLogUtil cdmClientWarmupEnded:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Warmup ended event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }

  }
  return v11;
}

+ (BOOL)cdmClientWarmupFailed:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  int v18;
  const char *v19;
  uint64_t v20;

  v8 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v11 = (void *)MEMORY[0x24BE9E340];
  v12 = a7;
  v13 = a6;
  objc_msgSend(v11, "createCDMClientWarmupFailedLog:errorDomain:errorCode:", a3, v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v14, v13, v12);

  if (!v15)
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "+[CDMSELFLogUtil cdmClientWarmupFailed:errorDomain:errorCode:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM Client Warmup failed event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v18, 0xCu);
    }

  }
  return v15;
}

+ (BOOL)cdmAllServicesWarmupFailed:(id)a3 logMessage:(id)a4 dataDispatcherContext:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BE9E340];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "createCDMAllServicesWarmupFailedLog:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v10, v9, v8);

  if (!v11)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CDMSELFLogUtil cdmAllServicesWarmupFailed:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM All Services Warmup failed event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v14, 0xCu);
    }

  }
  return v11;
}

+ (BOOL)cdmAssetSetupFailed:(id)a3 contextId:(id)a4 errorDomain:(int)a5 errorCode:(unsigned int)a6 logMessage:(id)a7 dataDispatcherContext:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  int v20;
  const char *v21;
  uint64_t v22;

  v9 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a5;
  v22 = *MEMORY[0x24BDAC8D0];
  v13 = (void *)MEMORY[0x24BE9E340];
  v14 = a8;
  v15 = a7;
  objc_msgSend(v13, "createCDMAssetSetupFailedLog:errorDomain:errorCode:metadata:", a4, v10, v9, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v16, v15, v14);

  if (!v17)
  {
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = 136315138;
      v21 = "+[CDMSELFLogUtil cdmAssetSetupFailed:contextId:errorDomain:errorCode:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDMAssetSetup failed event, but there was an issue with emission. Log was not emitted!!", (uint8_t *)&v20, 0xCu);
    }

  }
  return v17;
}

+ (BOOL)cdmSetupMissingAssetsDetected:(id)a3 contextId:(id)a4 serviceNames:(id)a5 logMessage:(id)a6 dataDispatcherContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v26 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = +[CDMSELFLogUtil stringServiceTypeToEnum:](CDMSELFLogUtil, "stringServiceTypeToEnum:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), v26);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x24BE9E340], "createCDMSetupMissingAssetsDetectedLog:services:metadata:", v26, v14, v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v22, v12, v13);
  if (!v23)
  {
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "+[CDMSELFLogUtil cdmSetupMissingAssetsDetected:contextId:serviceNames:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDMSetupMissingAssetsDetected event, but there was an issue with emission. Log was not emitted!!", buf, 0xCu);
    }

  }
  return v23;
}

+ (BOOL)cdmXpcProcessingStarted:(id)a3 xpcType:(int)a4 xpcSystemEventType:(int)a5 serviceName:(int)a6 metadata:(id)a7 logMessage:(id)a8 dataDispatcherContext:(id)a9
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  id v16;
  id v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  int v22;
  const char *v23;
  uint64_t v24;

  v11 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a5;
  v13 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v15 = (void *)MEMORY[0x24BE9E340];
  v16 = a9;
  v17 = a8;
  objc_msgSend(v15, "createCdmXpcEventProcessingStartedLog:xpcType:xpcSystemEventType:serviceName:metadata:", a3, v13, v12, v11, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v18, v17, v16);

  if (!v19)
  {
    CDMOSLoggerForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v22 = 136315138;
      v23 = "+[CDMSELFLogUtil cdmXpcProcessingStarted:xpcType:xpcSystemEventType:serviceName:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM XPC Processing started event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v22, 0xCu);
    }

  }
  return v19;
}

+ (BOOL)cdmXpcProcessingEnded:(id)a3 metadata:(id)a4 logMessage:(id)a5 dataDispatcherContext:(id)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x24BE9E340];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "createCdmXpcEventProcessingEndedLog:metadata:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v12, v11, v10);

  if (!v13)
  {
    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 136315138;
      v17 = "+[CDMSELFLogUtil cdmXpcProcessingEnded:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM XPC Processing ended event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v16, 0xCu);
    }

  }
  return v13;
}

+ (BOOL)cdmXpcProcessingFailed:(id)a3 reason:(int)a4 errorCode:(unsigned int)a5 metadata:(id)a6 logMessage:(id)a7 dataDispatcherContext:(id)a8
{
  uint64_t v10;
  uint64_t v11;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  int v20;
  const char *v21;
  uint64_t v22;

  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v13 = (void *)MEMORY[0x24BE9E340];
  v14 = a8;
  v15 = a7;
  objc_msgSend(v13, "createCdmXpcEventProcessingFailedLog:reason:errorCode:metadata:", a3, v11, v10, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[CDMSELFLogUtil emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:](CDMSELFLogUtil, "emitEventsFromContainer:mainEventLogMessage:dataDispatcherContext:", v16, v15, v14);

  if (!v17)
  {
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = 136315138;
      v21 = "+[CDMSELFLogUtil cdmXpcProcessingFailed:reason:errorCode:metadata:logMessage:dataDispatcherContext:]";
      _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to emit a CDM XPC Processing failed event, but there was an issue with emission. Log was not emitted!", (uint8_t *)&v20, 0xCu);
    }

  }
  return v17;
}

+ (int)stringNodeNameToEnum:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    +[CDMServiceNodeNames getNameStringToEnumDict](CDMServiceNodeNames, "getNameStringToEnumDict");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      -[NSObject objectForKey:](v4, "objectForKey:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = v6;
        v8 = -[NSObject intValue](v6, "intValue");
LABEL_14:

        goto LABEL_15;
      }
      CDMOSLoggerForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 136315138;
        v12 = "+[CDMSELFLogUtil stringNodeNameToEnum:]";
        _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to fetch CDMServiceName with string key, but received nil!", (uint8_t *)&v11, 0xCu);
      }

      v7 = 0;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v11 = 136315138;
        v12 = "+[CDMSELFLogUtil stringNodeNameToEnum:]";
        _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to fetch CDMServiceNodeNames stringToEnumDict, but received nil!", (uint8_t *)&v11, 0xCu);
      }
    }
    v8 = 0;
    goto LABEL_14;
  }
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "+[CDMSELFLogUtil stringNodeNameToEnum:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Nil given to stringNodeNameToEnum method!", (uint8_t *)&v11, 0xCu);
  }
  v8 = 0;
LABEL_15:

  return v8;
}

+ (int)stringXPCSystemEventTypeToEnum:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    +[CDMXPCSystemEventTypeNames getNameStringToEnumDict](CDMXPCSystemEventTypeNames, "getNameStringToEnumDict");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      -[NSObject objectForKey:](v4, "objectForKey:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = v6;
        v8 = -[NSObject intValue](v6, "intValue");
LABEL_14:

        goto LABEL_15;
      }
      CDMOSLoggerForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 136315138;
        v12 = "+[CDMSELFLogUtil stringXPCSystemEventTypeToEnum:]";
        _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to fetch CDMXPCSystemEventType with string key, but received nil!", (uint8_t *)&v11, 0xCu);
      }

      v7 = 0;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v11 = 136315138;
        v12 = "+[CDMSELFLogUtil stringXPCSystemEventTypeToEnum:]";
        _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to fetch CDMXPCSystemEventTypeNames stringToEnumDict, but received nil!", (uint8_t *)&v11, 0xCu);
      }
    }
    v8 = 0;
    goto LABEL_14;
  }
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "+[CDMSELFLogUtil stringXPCSystemEventTypeToEnum:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Nil given to stringXPCSystemEventTypeToEnum method!", (uint8_t *)&v11, 0xCu);
  }
  v8 = 0;
LABEL_15:

  return v8;
}

+ (id)mintRequestIdAndCreateSELFMetadataWithRequestId
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BE9E0F0]);
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:0"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdA:", v6);

  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v2, "idA");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v12 = "+[CDMSELFLogUtil mintRequestIdAndCreateSELFMetadataWithRequestId]";
    v13 = 2112;
    v14 = v10;
    _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Generated request id with UUID: %@", buf, 0x16u);

  }
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
