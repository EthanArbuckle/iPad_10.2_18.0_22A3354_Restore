@implementation CDMCcqrServiceUtils

+ (id)leftShiftSiriResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v3, "originalInteractions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = v6 - 1;
  if (v6 > 1)
  {
    for (i = 1; i != v6; ++i)
    {
      objc_msgSend(v3, "originalInteractions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "siriResponses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "originalInteractions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", i - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSiriResponses:", v11);

    }
  }
  if (v6 >= 1)
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v4, "originalInteractions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSiriResponses:", v14);

  }
  return v4;
}

+ (id)buildQueryRewriteRequest
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v33[2];
  id v34;
  void *v35;
  id v36;
  _QWORD v37[4];

  v37[3] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BE9E2A8]);
  v3 = objc_alloc_init(MEMORY[0x24BE9E150]);
  objc_msgSend(v2, "setAsrId:", v3);

  objc_msgSend(v2, "setUtterance:", CFSTR("helloo world"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("helloo"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMToken getTokenWith:cleanValue:normalizedValues:isSignificant:isWhitespace:](CDMToken, "getTokenWith:cleanValue:normalizedValues:isSignificant:isWhitespace:", CFSTR("helloo"), CFSTR("helloo"), v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR(" "), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMToken getTokenWith:cleanValue:normalizedValues:isSignificant:isWhitespace:](CDMToken, "getTokenWith:cleanValue:normalizedValues:isSignificant:isWhitespace:", CFSTR(" "), CFSTR(" "), v6, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("world"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMToken getTokenWith:cleanValue:normalizedValues:isSignificant:isWhitespace:](CDMToken, "getTokenWith:cleanValue:normalizedValues:isSignificant:isWhitespace:", CFSTR("world"), CFSTR("world"), v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v2, "setNluInternalTokens:", v11);

  v12 = (void *)MEMORY[0x24BDBD1A8];
  v13 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "copy");
  objc_msgSend(v2, "setAsrUtteranceTokens:", v13);

  objc_msgSend(v2, "setConfidence:", 0.0);
  v14 = objc_alloc_init(MEMORY[0x24BE9E298]);
  v36 = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v14, "setOriginalUtterances:", v16);

  v17 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v14, "setSiriResponses:", v17);

  objc_msgSend(v14, "setLocale:", CFSTR("en_US"));
  objc_msgSend(v14, "setTap2edit:", 0);
  objc_msgSend(v14, "setStartTimestamp:", 0);
  v18 = objc_alloc_init(MEMORY[0x24BE9E2A8]);
  v19 = objc_alloc_init(MEMORY[0x24BE9E150]);
  objc_msgSend(v18, "setAsrId:", v19);

  objc_msgSend(v18, "setUtterance:", CFSTR("hello"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("hello"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMToken getTokenWith:cleanValue:normalizedValues:isSignificant:isWhitespace:](CDMToken, "getTokenWith:cleanValue:normalizedValues:isSignificant:isWhitespace:", CFSTR("hello"), CFSTR("hello"), v20, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  objc_msgSend(v18, "setNluInternalTokens:", v23);

  v24 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v18, "setAsrUtteranceTokens:", v24);

  objc_msgSend(v18, "setConfidence:", 0.0);
  v25 = objc_alloc_init(MEMORY[0x24BE9E298]);
  v34 = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(v25, "setOriginalUtterances:", v27);

  v28 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v25, "setSiriResponses:", v28);

  objc_msgSend(v25, "setLocale:", CFSTR("en_US"));
  objc_msgSend(v25, "setTap2edit:", 0);
  objc_msgSend(v25, "setStartTimestamp:", 0);
  v29 = objc_alloc_init(MEMORY[0x24BE9E280]);
  v33[0] = v14;
  v33[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copy");
  objc_msgSend(v29, "setOriginalInteractions:", v31);

  return v29;
}

+ (BOOL)isNLRouterAssetAvailable
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  BOOL v15;
  __CFString *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "+[CDMCcqrServiceUtils isNLRouterAssetAvailable]";
    v22 = 2112;
    v23 = CFSTR("en");
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Checking NLRouter assets for locale: %@", buf, 0x16u);
  }

  +[CDMAssetsUtils getCDMAssetsInfoForNLRouterWithLocale:](CDMAssetsUtils, "getCDMAssetsInfoForNLRouterWithLocale:", CFSTR("en"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[CDMAssetsManager getSingletonCDMAssetsManager](CDMAssetsManager, "getSingletonCDMAssetsManager");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSObject shouldReSetupForLocale:cdmAssetsInfo:](v4, "shouldReSetupForLocale:cdmAssetsInfo:", CFSTR("en"), v3))
    {
      v19 = 0;
      -[NSObject setupForLocale:cdmAssetsInfo:error:](v4, "setupForLocale:cdmAssetsInfo:error:", v5, v3, &v19);
      v6 = (__CFString *)v19;
      if (v6)
      {
        v7 = v6;
        CDMOSLoggerForCategory(0);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v21 = "+[CDMCcqrServiceUtils isNLRouterAssetAvailable]";
          v22 = 2112;
          v23 = v7;
          _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s NLRouter CDM assets manager failed to setup with error: %@.", buf, 0x16u);
        }
        goto LABEL_22;
      }
    }
    -[NSObject getAssetsByFactorNamesForCDMAssetsInfo:assetDirPath:locale:](v4, "getAssetsByFactorNamesForCDMAssetsInfo:assetDirPath:locale:", v3, 0, v5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[__CFString descriptionInStringsFileFormat](v7, "descriptionInStringsFileFormat");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMCcqrServiceUtils isNLRouterAssetAvailable]";
      v22 = 2112;
      v23 = v17;
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s AssetPath Info for NLRouter.  %@", buf, 0x16u);

    }
    v18 = 0;
    v10 = -[NSObject areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:](v4, "areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:", v3, v7, &v18);
    v8 = v18;
    if (v8)
    {
      CDMOSLoggerForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
LABEL_21:

LABEL_22:
        v15 = 0;
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMCcqrServiceUtils isNLRouterAssetAvailable]";
      v22 = 2112;
      v23 = (const __CFString *)v8;
      v12 = "%s NLRouter assets not available due to error %@.";
      v13 = v11;
      v14 = 22;
    }
    else
    {
      if ((v10 & 1) != 0)
      {
        v15 = 1;
LABEL_23:

        goto LABEL_24;
      }
      CDMOSLoggerForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      *(_DWORD *)buf = 136315138;
      v21 = "+[CDMCcqrServiceUtils isNLRouterAssetAvailable]";
      v12 = "%s NLRouter assets not available";
      v13 = v11;
      v14 = 12;
    }
    _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, v12, buf, v14);
    goto LABEL_21;
  }
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "+[CDMCcqrServiceUtils isNLRouterAssetAvailable]";
    _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s Failed to initialize CDMAssetsInfo for NLRouter. Asset registration failed", buf, 0xCu);
  }
  v15 = 0;
LABEL_24:

  return v15;
}

@end
