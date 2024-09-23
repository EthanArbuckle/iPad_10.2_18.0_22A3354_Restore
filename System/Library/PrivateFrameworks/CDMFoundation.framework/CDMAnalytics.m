@implementation CDMAnalytics

+ (void)recordCDMSetupSuccessEvent:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    AnalyticsSendEventLazy();
    v5 = v6;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "+[CDMAnalytics recordCDMSetupSuccessEvent:]";
      _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Skipping recordCDMSetupSuccessEvent due to locale being nil.", buf, 0xCu);
    }
  }

}

+ (void)recordReceivedNluRequestEvent:(id)a3 withNluRequest:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v8 = v5;
    v9 = v6;
    AnalyticsSendEventLazy();

    v7 = v8;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "+[CDMAnalytics recordReceivedNluRequestEvent:withNluRequest:]";
      _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: Skipping recordReceivedNluRequestEvent due to locale being nil.", buf, 0xCu);
    }
  }

}

+ (id)constructContextUpdateOutcome:(int)a3 numTurnsRollback:(int)a4 locale:(id)a5
{
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v5 = *(_QWORD *)&a4;
  v14[4] = *MEMORY[0x24BDAC8D0];
  if ((a3 - 1) > 2)
    v6 = CFSTR("None");
  else
    v6 = off_24DCACF08[a3 - 1];
  v14[0] = v6;
  v13[0] = CFSTR("reformType");
  v13[1] = CFSTR("numTurnsRollback");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = (__CFString *)a5;
  objc_msgSend(v7, "numberWithInt:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  v14[2] = CFSTR("success");
  v13[2] = CFSTR("status");
  v13[3] = CFSTR("locale");
  if (v8)
    v10 = v8;
  else
    v10 = CFSTR("nil");
  v14[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)recordContextUpdateOutcome:(int)a3 numTurnsRollback:(int)a4 locale:(id)a5
{
  id v5;
  id v6;

  v6 = a5;
  v5 = v6;
  AnalyticsSendEventLazy();

}

+ (void)recordCDMSetupFailureEvent:(id)a3 withError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  id v10;
  __CFString *v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v6, "domain");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "code");
    }
    else
    {
      v8 = CFSTR("UnknownErrorDomain");
    }
    v10 = v5;
    v11 = v8;
    v9 = v8;
    AnalyticsSendEventLazy();

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "+[CDMAnalytics recordCDMSetupFailureEvent:withError:]";
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Skipping recordCDMSetupFailureEvent due to locale being nil.", buf, 0xCu);
    }
  }

}

+ (void)recordGraphSuccessEvent:(id)a3 withTopParserId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    v13 = "+[CDMAnalytics recordGraphSuccessEvent:withTopParserId:]";
    v9 = "%s [WARN]: Skipping recordGraphSuccessEvent due to locale being nil.";
LABEL_8:
    _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v6)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    v13 = "+[CDMAnalytics recordGraphSuccessEvent:withTopParserId:]";
    v9 = "%s [WARN]: Skipping recordGraphSuccessEvent due to parserId being nil.";
    goto LABEL_8;
  }
  v10 = v5;
  v11 = v7;
  AnalyticsSendEventLazy();

  v8 = v10;
LABEL_9:

}

+ (void)recordGraphFailureEvent:(id)a3 withError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  id v10;
  __CFString *v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v6, "domain");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "code");
    }
    else
    {
      v8 = CFSTR("UnknownErrorDomain");
    }
    v10 = v5;
    v11 = v8;
    v9 = v8;
    AnalyticsSendEventLazy();

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "+[CDMAnalytics recordGraphFailureEvent:withError:]";
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Skipping recordGraphFailureEvent due to locale being nil.", buf, 0xCu);
    }
  }

}

id __50__CDMAnalytics_recordGraphFailureEvent_withError___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("locale");
  v5[1] = CFSTR("wasSuccessful");
  v1 = a1[5];
  v6[0] = a1[4];
  v6[1] = MEMORY[0x24BDBD1C0];
  v6[2] = v1;
  v5[2] = CFSTR("errorDomain");
  v5[3] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __56__CDMAnalytics_recordGraphSuccessEvent_withTopParserId___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("locale");
  v3[1] = CFSTR("wasSuccessful");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = MEMORY[0x24BDBD1C8];
  v3[2] = CFSTR("topParseParserId");
  v4[2] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__CDMAnalytics_recordCDMSetupFailureEvent_withError___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("locale");
  v5[1] = CFSTR("wasSuccessful");
  v1 = a1[5];
  v6[0] = a1[4];
  v6[1] = MEMORY[0x24BDBD1C0];
  v6[2] = v1;
  v5[2] = CFSTR("errorDomain");
  v5[3] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __43__CDMAnalytics_recordCDMSetupSuccessEvent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = CFSTR("locale");
  v3[1] = CFSTR("wasSuccessful");
  v4[0] = v1;
  v4[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __67__CDMAnalytics_recordContextUpdateOutcome_numTurnsRollback_locale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "constructContextUpdateOutcome:numTurnsRollback:locale:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(_QWORD *)(a1 + 32));
}

id __61__CDMAnalytics_recordReceivedNluRequestEvent_withNluRequest___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v8[0] = CFSTR("locale");
  v8[1] = CFSTR("previousTurnCount");
  v9[0] = v2;
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v1, "previousTurnInputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
