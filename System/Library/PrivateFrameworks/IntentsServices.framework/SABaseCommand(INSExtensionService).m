@implementation SABaseCommand(INSExtensionService)

- (BOOL)ins_isJSONPayload
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "ins_jsonEncodedIntent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)ins_jsonEncodedIntent
{
  return 0;
}

- (uint64_t)ins_protobufEncodedIntent
{
  return 0;
}

- (id)ins_aceIntent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "ins_jsonEncodedIntent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    goto LABEL_3;
  objc_msgSend(a1, "ins_jsonEncodedIntent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentCreate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_3:
    objc_msgSend(a1, "ins_protobufEncodedIntent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1, "ins_protobufEncodedIntent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "typeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "ins_protobufEncodedIntent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      INIntentCreate();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v5;
}

- (uint64_t)ins_jsonEncodedIntentResponse
{
  return 0;
}

- (uint64_t)ins_protobufEncodedIntentResponse
{
  return 0;
}

- (id)ins_aceIntentResponse
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "ins_jsonEncodedIntentResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    goto LABEL_3;
  objc_msgSend(a1, "ins_jsonEncodedIntentResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentResponseCreate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_3:
    objc_msgSend(a1, "ins_protobufEncodedIntentResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1, "ins_protobufEncodedIntentResponse");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(a1, "ins_protobufEncodedIntentResponse");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "typeName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        INIntentResponseCreate();
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (void)ins_sendIntent:()INSExtensionService toExtensionProxy:onQueue:completionHandler:
{
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = a6;
  v8 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_ERROR))
  {
    v9 = 136315394;
    v10 = "-[SABaseCommand(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]";
    v11 = 2112;
    v12 = a1;
    _os_log_error_impl(&dword_20BAA8000, v8, OS_LOG_TYPE_ERROR, "%s %@ delivered to the wrong service", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(a1, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v7, 1303, 0);

}

- (uint64_t)ins_analyticsBeginEventType
{
  return 0;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 0;
}

- (void)ins_invokeErrorCompletionHandler:()INSExtensionService withErrorCode:underlyingError:
{
  void (**v8)(id, void *, void *);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = objc_msgSend(a1, "ins_analyticsEndEventType");
    v11 = 603;
    if (a4 != 1306)
      v11 = v10;
    v24 = v11;
    if (a4 == 1316)
      v12 = *MEMORY[0x24BE82248];
    else
      v12 = a4;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE811A8]), "initWithErrorCode:", v12);
    if (v9)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BDD1398];
      v26[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), a4, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    v8[2](v8, v13, v16);
    +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contextDictionaryForCommand:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ins_afAnalyticsContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contextDictionaryForError:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    IFMergeDictionaries();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logEventWithType:context:contextNoCopy:", v24, v23, 1, v18, v22, 0);

  }
}

- (void)ins_invokeErrorCompletionHandler:()INSExtensionService forUnderlyingError:
{
  id v5;
  objc_class *v6;
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t *v13;
  __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (a3)
  {
    v6 = (objc_class *)MEMORY[0x24BE811A8];
    v7 = a3;
    v8 = (void *)objc_msgSend([v6 alloc], "initWithErrorCode:", -1);
    objc_msgSend(v5, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "code");
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD98D0]))
    {
      if (v10 == 3001)
      {
        v11 = CFSTR("kAFAssistantErrorDomain");
        v17 = CFSTR("kAFAssistantErrorDomain");
        v13 = (uint64_t *)MEMORY[0x24BE82280];
      }
      else
      {
        if (v10 != 3005)
        {
          v11 = CFSTR("kAFAssistantErrorDomain");
          v18 = CFSTR("kAFAssistantErrorDomain");
          v15 = 1302;
          goto LABEL_17;
        }
        v11 = CFSTR("SiriAceErrorDomain");
        v12 = CFSTR("SiriAceErrorDomain");
        v13 = (uint64_t *)MEMORY[0x24BE82238];
      }
      v15 = *v13;
      objc_msgSend(v8, "setErrorCode:", *v13);
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD9910]))
        goto LABEL_11;
      switch(v10)
      {
        case 2005:
          v11 = CFSTR("kAFAssistantErrorDomain");
          v19 = CFSTR("kAFAssistantErrorDomain");
          v15 = 1315;
          objc_msgSend(v8, "setErrorCode:", 1315);
          break;
        case 5001:
          v11 = CFSTR("kAFAssistantErrorDomain");
          v20 = CFSTR("kAFAssistantErrorDomain");
          v15 = 1301;
          break;
        case 5000:
          v11 = CFSTR("kAFAssistantErrorDomain");
          v14 = CFSTR("kAFAssistantErrorDomain");
          v15 = 1304;
          break;
        default:
LABEL_11:
          v11 = CFSTR("kAFAssistantErrorDomain");
          v16 = CFSTR("kAFAssistantErrorDomain");
          v15 = 1399;
          break;
      }
    }
LABEL_17:
    v21 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD1398];
    v25[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v11, v15, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v8, v23);
    kdebug_trace();

  }
}

- (id)ins_afAnalyticsContext
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextDictionaryForCommand:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = a1;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "metricsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11 = CFSTR("metricsContext");
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    IFMergeDictionaries();
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }

  return v3;
}

@end
