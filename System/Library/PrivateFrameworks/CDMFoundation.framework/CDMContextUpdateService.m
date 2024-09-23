@implementation CDMContextUpdateService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMContextUpdateRequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isEnabled
{
  return +[CDMFeatureFlags isContextUpdateEnabled](CDMFeatureFlags, "isContextUpdateEnabled");
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSString *v7;
  NSString *locale;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "-[CDMContextUpdateService setup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Setting up Context Update Service", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(v4, "dynamicConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  locale = self->locale;
  self->locale = v7;

  if (!self->locale)
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 136315138;
      v13 = "-[CDMContextUpdateService setup:]";
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Received a setup request command with locale being nil.", (uint8_t *)&v12, 0xCu);
    }

  }
  self->super.super._serviceState = 2;
  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)handle:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CDMContextUpdateResponseCommand *v42;
  const __CFString *v44;
  const __CFString *v45;
  char v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v50 = "-[CDMContextUpdateService handle:]";
    _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_INFO, "%s Calling Context Update Service", buf, 0xCu);
  }

  objc_msgSend(v3, "ctxUpdateRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentTurn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "ctxUpdateRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "previousTurns");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithArray:copyItems:", v10, 1);

  if (!v7
    || (v12 = objc_msgSend(v7, "tapToEdit"), (v12 & 1) == 0)
    && !+[SiriNLUTypesUtils isTopSdaAskRepeat:](SiriNLUTypesUtils, "isTopSdaAskRepeat:", v7))
  {
    objc_msgSend(v3, "ctxUpdateRequest");
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject qrHypotheses](v18, "qrHypotheses");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "ctxUpdateRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "qrHypotheses");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count") == 1;

      if (!v21)
      {
        v47 = 0;
        v14 = 0;
        v27 = 0;
        goto LABEL_39;
      }
      objc_msgSend(v3, "ctxUpdateRequest");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "qrHypotheses");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v24, "copy");

      if (!-[NSObject rewriteType](v18, "rewriteType"))
      {
        CDMOSLoggerForCategory(0);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v50 = "-[CDMContextUpdateService handle:]";
          _os_log_debug_impl(&dword_21A2A0000, v34, OS_LOG_TYPE_DEBUG, "%s Handling Correction by Repetition Request", buf, 0xCu);
        }

        CDMOSLoggerForCategory(0);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v50 = "-[CDMContextUpdateService handle:]";
          _os_log_debug_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_DEBUG, "%s Reform type: Correction by Repetition", buf, 0xCu);
        }
        v27 = 1;
        goto LABEL_34;
      }
      if (-[NSObject rewriteType](v18, "rewriteType") == 1)
      {
        CDMOSLoggerForCategory(0);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v50 = "-[CDMContextUpdateService handle:]";
          _os_log_debug_impl(&dword_21A2A0000, v25, OS_LOG_TYPE_DEBUG, "%s Handling AER Request", buf, 0xCu);
        }

        CDMOSLoggerForCategory(0);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 2;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v50 = "-[CDMContextUpdateService handle:]";
          _os_log_debug_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_DEBUG, "%s Reform type: Reference Resolution", buf, 0xCu);
        }
LABEL_34:

        v47 = 0;
        v14 = 0;
        goto LABEL_37;
      }
      v47 = 0;
      v14 = 0;
    }
    else
    {
      v47 = 0;
    }
    v27 = 0;
    goto LABEL_37;
  }
  CDMOSLoggerForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v44 = CFSTR("AskRepeat");
    if (v12)
      v44 = CFSTR("Tap2Edit");
    *(_DWORD *)buf = 136315394;
    v50 = "-[CDMContextUpdateService handle:]";
    v51 = 2112;
    v52 = v44;
    _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Handling %@ triggered Request", buf, 0x16u);
  }

  v14 = 0;
  v47 = v12 ^ 1;
  while (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "tapToEdit"))
    {

    }
    else
    {
      objc_msgSend(v11, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = +[SiriNLUTypesUtils isTopSdaAskRepeat:](SiriNLUTypesUtils, "isTopSdaAskRepeat:", v16);

      if (!v17)
        break;
    }
    v14 = (v14 + 1);
    objc_msgSend(v11, "removeLastObject");
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v7, "asrOutputs");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = -[NSObject mutableCopy](v18, "mutableCopy");
    objc_msgSend(v28, "setAsrOutputs:", v29);

    objc_msgSend(v11, "removeLastObject");
    CDMOSLoggerForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v45 = CFSTR("AskRepeat");
      if (v12)
        v45 = CFSTR("Tap2Edit");
      *(_DWORD *)buf = 136315394;
      v50 = "-[CDMContextUpdateService handle:]";
      v51 = 2112;
      v52 = v45;
      _os_log_debug_impl(&dword_21A2A0000, v30, OS_LOG_TYPE_DEBUG, "%s Reform type: %@", buf, 0x16u);
    }

    v14 = (v14 + 1);
    v27 = 3;
    goto LABEL_38;
  }
  objc_msgSend(v3, "ctxUpdateRequest");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "previousTurns");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "mutableCopy");

  CDMOSLoggerForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v50 = "-[CDMContextUpdateService handle:]";
    _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Received an invalid NluRequest with every turn as Tap2Edit/AskRepeat turns.", buf, 0xCu);
  }
  v27 = 0;
  v11 = (void *)v33;
LABEL_37:
  v28 = v7;
LABEL_38:

  v7 = v28;
LABEL_39:
  v35 = objc_alloc_init(MEMORY[0x24BE9E1D0]);
  objc_msgSend(v35, "setType:", v27);
  objc_msgSend(v35, "setCurrentTurn:", v7);
  objc_msgSend(v35, "setPreviousTurns:", v11);
  v36 = objc_alloc_init(MEMORY[0x24BE9E1C8]);
  objc_msgSend(v3, "ctxUpdateRequest");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "requestId");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "copy");
  objc_msgSend(v36, "setRequestId:", v39);

  v48 = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "mutableCopy");
  objc_msgSend(v36, "setReformedTurnInputBundles:", v41);

  v42 = -[CDMContextUpdateResponseCommand initWithCtxUpdateResponse:]([CDMContextUpdateResponseCommand alloc], "initWithCtxUpdateResponse:", v36);
  if ((v47 & 1) == 0)
    -[CDMContextUpdateService doCoreAnalyticsForContextUpdateOutcome:numTurnsRollback:locale:](self, "doCoreAnalyticsForContextUpdateOutcome:numTurnsRollback:locale:", v27, v14, self->locale);

  return v42;
}

- (void)doCoreAnalyticsForContextUpdateOutcome:(int)a3 numTurnsRollback:(int)a4 locale:(id)a5
{
  +[CDMAnalytics recordContextUpdateOutcome:numTurnsRollback:locale:](CDMAnalytics, "recordContextUpdateOutcome:numTurnsRollback:locale:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->locale, 0);
}

@end
