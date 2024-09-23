@implementation CDMFeatureStoreUtils

+ (id)allowedFSMessagesOnExternalBuilds
{
  if (allowedFSMessagesOnExternalBuilds_onceToken != -1)
    dispatch_once(&allowedFSMessagesOnExternalBuilds_onceToken, &__block_literal_global_4156);
  return (id)allowedFSMessagesOnExternalBuilds_allowedFSMessagesOnExternalBuilds;
}

+ (BOOL)platformSupportedAndEnabled
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!+[CDMFeatureFlags isFeatureStoreEnabled](CDMFeatureFlags, "isFeatureStoreEnabled"))
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    v5 = 136315138;
    v6 = "+[CDMFeatureStoreUtils platformSupportedAndEnabled]";
    v4 = "%s FeatureFlag SiriNL/SiriMiniFeatureStoreEnabled disabled, skip inserting into FeatureStore";
LABEL_10:
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v5, 0xCu);
    goto LABEL_7;
  }
  if ((objc_msgSend(MEMORY[0x24BE30C68], "isSupportedUser") & 1) != 0)
    return 1;
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "+[CDMFeatureStoreUtils platformSupportedAndEnabled]";
    v4 = "%s Current user is not a FeatureStore-supported user, skip inserting into FeatureStore";
    goto LABEL_10;
  }
LABEL_7:

  return 0;
}

+ (BOOL)checkFeatureStoreEnabledForExternalBuilds:(id)a3
{
  id v4;
  char v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
  {
    v5 = 1;
  }
  else if (+[CDMFeatureFlags isFeatureStoreEnabledForExternalBuilds](CDMFeatureFlags, "isFeatureStoreEnabledForExternalBuilds"))
  {
    objc_msgSend(a1, "allowedFSMessagesOnExternalBuilds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v4);

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315138;
      v10 = "+[CDMFeatureStoreUtils checkFeatureStoreEnabledForExternalBuilds:]";
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s FeatureFlag SiriNL/SiriMiniFeatureStoreEnabledForExternalBuilds disabled, skip inserting into FeatureStore", (uint8_t *)&v9, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (BOOL)insertRequestToFeatureStoreAsJson:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  __CFString *v10;
  BOOL v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315138;
    v15 = "+[CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson:]";
    _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson", (uint8_t *)&v14, 0xCu);
  }

  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson:]";
      v16 = 2112;
      v17 = v10;
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_12;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("SiriNluRequestAsJson")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson:]";
      v16 = 2112;
      v17 = CFSTR("SiriNluRequestAsJson");
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_12:
    v11 = 0;
    goto LABEL_17;
  }
  if (v5 && (objc_msgSend(v5, "requestId"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(v5, "requestId");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject idA](v8, "idA");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson:]";
      _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: The request or requestId within the request is nil. Cannot extract interactionId!", (uint8_t *)&v14, 0xCu);
    }
    v9 = 0;
  }

  +[CDMProtobufConverter serializeExternalNluRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeExternalNluRequestWithRequest:formatType:", v5, CFSTR("json"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v12, v9, CFSTR("SiriNluRequestAsJson"));

LABEL_17:
  return v11;
}

+ (BOOL)insertResponseToFeatureStoreAsJson:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  __CFString *v10;
  BOOL v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315138;
    v15 = "+[CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson:]";
    _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson", (uint8_t *)&v14, 0xCu);
  }

  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson:]";
      v16 = 2112;
      v17 = v10;
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_12;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("SiriNluResponseAsJson")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson:]";
      v16 = 2112;
      v17 = CFSTR("SiriNluResponseAsJson");
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_12:
    v11 = 0;
    goto LABEL_17;
  }
  if (v5 && (objc_msgSend(v5, "requestId"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(v5, "requestId");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject idA](v8, "idA");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = "+[CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson:]";
      _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: The response or requestId within the response is nil. Cannot extract interactionId!", (uint8_t *)&v14, 0xCu);
    }
    v9 = 0;
  }

  +[CDMProtobufConverter serializeExternalNluResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeExternalNluResponseWithResponse:formatType:", v5, CFSTR("json"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v12, v9, CFSTR("SiriNluResponseAsJson"));

LABEL_17:
  return v11;
}

+ (BOOL)insertJsonStringToFeatureStore:(id)a3 interactionId:(id)a4 streamId:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v25 = "+[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:]";
      v26 = 2112;
      v27 = v18;
      _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", buf, 0x16u);

    }
    goto LABEL_21;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", v11) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:]";
      v26 = 2112;
      v27 = v11;
      _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", buf, 0x16u);
    }
    goto LABEL_21;
  }
  if (!v10)
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:]";
      v26 = 2112;
      v27 = v11;
      v19 = "%s [WARN]: A nil interaction ID was passed in for streamId=%@. Skip saving to FeatureStore";
      v20 = v13;
      v21 = 22;
LABEL_20:
      _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
    }
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  CDMOSLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "+[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:]";
      v26 = 2112;
      v27 = v10;
      v28 = 2112;
      v29 = v11;
      v19 = "%s [WARN]: The passed in Feature is nil with interactionId=%@ for streamId=%@. Skip saving to FeatureStore";
      v20 = v13;
      v21 = 32;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "+[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:]";
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v11;
    _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s interactionId=%@, streamId=%@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x24BE30C60], "getWithStreamId:", v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30C58]), "initWithJsonStr:interactionId:dataVersion:", v9, v10, 1);
  v23 = 0;
  v15 = -[NSObject insert:error:](v13, "insert:error:", v14, &v23);
  v16 = v23;
  if (v16)
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "+[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:]";
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: Error while inserting into FeatureStore for streamId=%@: %@", buf, 0x20u);
    }

  }
LABEL_22:

  return v15;
}

+ (BOOL)insertTokenizerResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertTokenizerResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("TokenizerResponse")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertTokenizerResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("TokenizerResponse");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeTokenizerResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeTokenizerResponseWithResponse:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("TokenizerResponse"));

LABEL_9:
  return v10;
}

+ (BOOL)insertSpanMatchResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertSpanMatchResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("SpanMatchResponse")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertSpanMatchResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("SpanMatchResponse");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeSpanMatchResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeSpanMatchResponseWithResponse:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("SpanMatchResponse"));

LABEL_9:
  return v10;
}

+ (BOOL)insertSNLCRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertSNLCRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("SNLCITFMRequest")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertSNLCRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("SNLCITFMRequest");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeITFMParserRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeITFMParserRequestWithRequest:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("SNLCITFMRequest"));

LABEL_9:
  return v10;
}

+ (BOOL)insertSNLCResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertSNLCResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("SNLCITFMResponse")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertSNLCResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("SNLCITFMResponse");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeITFMParserResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeITFMParserResponseWithResponse:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("SNLCITFMResponse"));

LABEL_9:
  return v10;
}

+ (BOOL)insertPSCRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertPSCRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("PSCRequest")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertPSCRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("PSCRequest");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeITFMParserRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeITFMParserRequestWithRequest:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("PSCRequest"));

LABEL_9:
  return v10;
}

+ (BOOL)insertPSCResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertPSCResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("PSCResponse")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertPSCResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("PSCResponse");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeITFMParserResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeITFMParserResponseWithResponse:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("PSCResponse"));

LABEL_9:
  return v10;
}

+ (BOOL)insertLVCRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertLVCRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("LVCRequest")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertLVCRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("LVCRequest");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeITFMParserRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeITFMParserRequestWithRequest:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("LVCRequest"));

LABEL_9:
  return v10;
}

+ (BOOL)insertLVCResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertLVCResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("LVCResponse")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertLVCResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("LVCResponse");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeITFMParserResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeITFMParserResponseWithResponse:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("LVCResponse"));

LABEL_9:
  return v10;
}

+ (BOOL)insertMDRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMDRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("MDRequest")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMDRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("MDRequest");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeMDRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeMDRequestWithRequest:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("MDRequest"));

LABEL_9:
  return v10;
}

+ (BOOL)insertMDResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMDResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("MDResponse")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMDResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("MDResponse");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeMDResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeMDResponseWithResponse:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("MDResponse"));

LABEL_9:
  return v10;
}

+ (BOOL)insertMRRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMRRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("MRRequest")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMRRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("MRRequest");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeMRRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeMRRequestWithRequest:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("MRRequest"));

LABEL_9:
  return v10;
}

+ (BOOL)insertMRResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMRResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("MRResponse")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertMRResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("MRResponse");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeMRResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeMRResponseWithResponse:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("MRResponse"));

LABEL_9:
  return v10;
}

+ (BOOL)insertNLv4ParserRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertNLv4ParserRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("NLv4Request")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertNLv4ParserRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("NLv4Request");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeNlv4ParserRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeNlv4ParserRequestWithRequest:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("NLv4Request"));

LABEL_9:
  return v10;
}

+ (BOOL)insertNLv4ParserResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertNLv4ParserResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("NLv4Response")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertNLv4ParserResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("NLv4Response");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeNlv4ParserResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeNlv4ParserResponseWithResponse:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("NLv4Response"));

LABEL_9:
  return v10;
}

+ (BOOL)insertUaaPParserRequestToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertUaaPParserRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("NLv4Request")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertUaaPParserRequestToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("NLv4Request");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeUaaPParserRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeUaaPParserRequestWithRequest:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("NLv4Request"));

LABEL_9:
  return v10;
}

+ (BOOL)insertUaaPParserResponseToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertUaaPParserResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(a1, "checkFeatureStoreEnabledForExternalBuilds:", CFSTR("NLv4Response")) & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertUaaPParserResponseToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = CFSTR("NLv4Response");
      _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, "%s FeatureStoreEnabledForExternalBuilds is not enabled OR streamId=%@ not allowed to be logged", (uint8_t *)&v14, 0x16u);
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  +[CDMProtobufConverter serializeUaaPParserResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeUaaPParserResponseWithResponse:formatType:", v7, CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v9, v8, CFSTR("NLv4Response"));

LABEL_9:
  return v10;
}

+ (BOOL)insertPreprocessingWrapperToFeatureStore:(id)a3 interactionId:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315138;
    v15 = "+[CDMFeatureStoreUtils insertPreprocessingWrapperToFeatureStore:interactionId:]";
    _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s CDMFeatureStoreUtils insertPreprocessingWrapperToFeatureStore", (uint8_t *)&v14, 0xCu);
  }

  if ((objc_msgSend(a1, "platformSupportedAndEnabled") & 1) == 0)
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[CDMFeatureStoreUtils insertPreprocessingWrapperToFeatureStore:interactionId:]";
      v16 = 2112;
      v17 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s FeatureStore is 1) not enabled on this platform yet or 2) FF is off. So skipping %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_10;
  }
  if (!+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315138;
      v15 = "+[CDMFeatureStoreUtils insertPreprocessingWrapperToFeatureStore:interactionId:]";
      _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Device not on internal build. Not inserting PreprocessingWrapper to FeatureStore.", (uint8_t *)&v14, 0xCu);
    }
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  +[CDMProtobufConverter serializePreprocessingWrapperWithWrapper:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializePreprocessingWrapperWithWrapper:formatType:", v7, CFSTR("json"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = +[CDMFeatureStoreUtils insertJsonStringToFeatureStore:interactionId:streamId:](CDMFeatureStoreUtils, "insertJsonStringToFeatureStore:interactionId:streamId:", v10, v8, CFSTR("PreprocessingWrapper"));
LABEL_11:

  return v11;
}

void __57__CDMFeatureStoreUtils_allowedFSMessagesOnExternalBuilds__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("SiriNluRequestAsJson"), CFSTR("SiriNluResponseAsJson"), CFSTR("MDRequest"), CFSTR("MDResponse"), CFSTR("MRRequest"), CFSTR("MRResponse"), CFSTR("SpanMatchResponse"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allowedFSMessagesOnExternalBuilds_allowedFSMessagesOnExternalBuilds;
  allowedFSMessagesOnExternalBuilds_allowedFSMessagesOnExternalBuilds = v0;

}

@end
