@implementation MOSplunkLogger

- (MOSplunkLogger)initWithName:(id)a3 configurationURL:(id)a4 splunkTopic:(id)a5 version:(id)a6 allowInvalidCert:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  MOSplunkLogger *v16;
  MOSplunkLogger *v17;
  id v18;
  id v19;
  const char *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  MOSplunkLogger *v23;
  objc_super v25;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)MOSplunkLogger;
  v16 = -[MOSplunkLogger init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_configurationURL, a4);
    objc_storeStrong((id *)&v17->_splunkTopic, a5);
    objc_storeStrong((id *)&v17->_version, a6);
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[MOSplunkLogger setEvents:](v17, "setEvents:", v18);

    -[MOSplunkLogger setAllowInvalidCert:](v17, "setAllowInvalidCert:", v7);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.SplunkLoggerQueue"), v12);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend(v19, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create(v20, v21);
    -[MOSplunkLogger setQueue:](v17, "setQueue:", v22);

    v23 = v17;
  }

  return v17;
}

- (void)_onQueue_loadConfiguration
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  dispatch_semaphore_t v16;

  -[MOSplunkLogger queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v5, self, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__MOSplunkLogger__onQueue_loadConfiguration__block_invoke;
  v15[3] = &unk_1EA98D5F8;
  v15[4] = self;
  v16 = v4;
  v7 = v4;
  v8 = _Block_copy(v15);
  -[MOSplunkLogger configurationURL](self, "configurationURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataTaskWithURL:completionHandler:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]", CFSTR("Loading configuration"), v11, v12, v13, v14, v15[0]);
  objc_msgSend(v10, "resume");
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

}

void __44__MOSplunkLogger__onQueue_loadConfiguration__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char v48;
  char v49;
  void *v50;
  id v51;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v15 = v9;
    v16 = 0;
LABEL_5:
    MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke", CFSTR("Unable to load configuration. Error: %@"), v11, v12, v13, v14, (char)v15);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_6;
  }
  v51 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v51);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v51;
  if (v17)
  {
    v15 = v17;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v16;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("metricsUrl"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "version");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "URLByAppendingPathComponent:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "splunkTopic");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "URLByAppendingPathComponent:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSplunkUploadURL:", v32);

      objc_msgSend(*(id *)(a1 + 32), "splunkUploadURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke", CFSTR("Splunk upload URL set to %@"), v34, v35, v36, v37, (char)v33);

    }
    else
    {
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke", CFSTR("Could not find metrics URL in configuration"), v25, v26, v27, v28, v48);
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("performance"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("samplingPercentage"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 32), "setSamplingPercentage:", v18);
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke", CFSTR("Sampling percentage set to %@"), v43, v44, v45, v46, (char)v18);
    }
    else
    {
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke", CFSTR("Could not find sampling percentage in configuration"), v39, v40, v41, v42, v49);
    }
    objc_msgSend(*(id *)(a1 + 32), "samplingPercentage");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "splunkUploadURL");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        objc_msgSend(*(id *)(a1 + 32), "setLastSuccessfulConfigurationLoad:");
      }
      v15 = 0;
    }
    v20 = v16;
  }
  else
  {
    MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke", CFSTR("Configuration does not have the expected format"), v21, v22, v23, v24, v48);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v15 = 0;
  }
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)uploadEventsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];

  v4 = a3;
  -[MOSplunkLogger queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke;
  block[3] = &unk_1EA98D620;
  block[4] = self;
  dispatch_async(v5, block);

  -[MOSplunkLogger queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke_2;
  v9[3] = &unk_1EA98D670;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

uint64_t __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t result;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  result = objc_msgSend(*(id *)(a1 + 32), "lastSuccessfulConfigurationLoad");
  if (v3 - v5 > 86400.0)
    return objc_msgSend(*(id *)(a1 + 32), "_onQueue_loadConfiguration");
  return result;
}

void __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke_2(uint64_t a1)
{
  float v2;
  void *v3;
  float v4;
  float v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  dispatch_semaphore_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  _QWORD aBlock[5];
  dispatch_semaphore_t v31;
  id v32;
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v2 = (float)arc4random_uniform(0x64u);
  objc_msgSend(*(id *)(a1 + 32), "samplingPercentage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4 * 100.0;

  if (v5 >= v2)
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v6, *(_QWORD *)(a1 + 32), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0CB37A8]);
    objc_msgSend(*(id *)(a1 + 32), "splunkUploadURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setURL:", v9);

    objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
    v34[0] = CFSTR("postTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", clock_gettime_nsec_np(_CLOCK_REALTIME) / 0xF4240);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = CFSTR("events");
    v35[0] = v10;
    objc_msgSend(*(id *)(a1 + 32), "events");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v12, 0, &v33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v33;
    v19 = v14;
    if (!v13 || v14)
    {
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_2", CFSTR("Failed to serialize Splunk payload: %@"), v15, v16, v17, v18, (char)v14);
    }
    else
    {
      objc_msgSend(v8, "setHTTPBody:", v13);
      v20 = dispatch_semaphore_create(0);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke_3;
      aBlock[3] = &unk_1EA98D648;
      v21 = *(void **)(a1 + 40);
      aBlock[4] = *(_QWORD *)(a1 + 32);
      v31 = v20;
      v32 = v21;
      v22 = v20;
      v23 = _Block_copy(aBlock);
      objc_msgSend(v7, "dataTaskWithRequest:completionHandler:", v8, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_2", CFSTR("Splunk upload start"), v25, v26, v27, v28, v29);
      objc_msgSend(v24, "resume");
      dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

void __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  id v32;

  v32 = a2;
  v7 = a3;
  v8 = a4;
  v13 = v8;
  if (v8)
  {
    MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_3", CFSTR("Error in uploading the events to splunk: %@"), v9, v10, v11, v12, (char)v8);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v7;
      if (objc_msgSend(v14, "statusCode") < 200 || objc_msgSend(v14, "statusCode") > 299)
      {
        v31 = objc_msgSend(v14, "statusCode");
        MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_3", CFSTR("Splunk upload unexpected status: %d"), v25, v26, v27, v28, v31);
      }
      else
      {
        MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_3", CFSTR("Splunk upload successful"), v15, v16, v17, v18, v30);
        objc_msgSend(*(id *)(a1 + 32), "events");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeAllObjects");

      }
    }
    else
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_3", CFSTR("Received the wrong kind of response: %@"), v21, v22, v23, v24, (char)v14);
    }

  }
  v29 = *(_QWORD *)(a1 + 48);
  if (v29)
    (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v13);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)logEventNamed:(id)a3 value:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", clock_gettime_nsec_np(_CLOCK_REALTIME) / 0xF4240);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("eventTime"));

  -[MOSplunkLogger splunkTopic](self, "splunkTopic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("topic"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("eventType"));
  -[MOSplunkLogger queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__MOSplunkLogger_logEventNamed_value___block_invoke;
  v12[3] = &unk_1EA98D698;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  dispatch_async(v10, v12);

}

void __38__MOSplunkLogger_logEventNamed_value___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 0x3E9)
  {
    MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger logEventNamed:value:]_block_invoke", CFSTR("Maximum number of events exceeded. Discarding oldest event."), v5, v6, v7, v8, v9);
    objc_msgSend(*(id *)(a1 + 32), "events");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", 0);

  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  char v29;
  int v30;

  v7 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger URLSession:didReceiveChallenge:completionHandler:]", CFSTR("Splunk upload challenge"), v9, v10, v11, v12, v28);
  v30 = 0;
  if (objc_msgSend(v7, "previousFailureCount") >= 1)
    goto LABEL_2;
  objc_msgSend(v7, "protectionSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "authenticationMethod");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB32C8]);

  if (!v15)
  {
    v8[2](v8, 1, 0);
    goto LABEL_11;
  }
  objc_msgSend(v7, "protectionSpace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1E0BFEFE4](objc_msgSend(v16, "serverTrust"), &v30);

  if (!-[MOSplunkLogger allowInvalidCert](self, "allowInvalidCert") && v30 != 4 && v30 != 1)
  {
    MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger URLSession:didReceiveChallenge:completionHandler:]", CFSTR("Error evaluating trust. SecTrustResultType=%d"), v17, v18, v19, v20, v30);
LABEL_2:
    v8[2](v8, 2, 0);
    goto LABEL_11;
  }
  if (-[MOSplunkLogger allowInvalidCert](self, "allowInvalidCert"))
    MOLogWrite(0, 3, (uint64_t)"-[MOSplunkLogger URLSession:didReceiveChallenge:completionHandler:]", CFSTR("Force Accepting Credential"), v21, v22, v23, v24, v29);
  v25 = (void *)MEMORY[0x1E0CB39A8];
  objc_msgSend(v7, "protectionSpace");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "credentialForTrust:", objc_msgSend(v26, "serverTrust"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v27);
LABEL_11:

}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)allowInvalidCert
{
  return self->_allowInvalidCert;
}

- (void)setAllowInvalidCert:(BOOL)a3
{
  self->_allowInvalidCert = a3;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSURL)splunkUploadURL
{
  return self->_splunkUploadURL;
}

- (void)setSplunkUploadURL:(id)a3
{
  objc_storeStrong((id *)&self->_splunkUploadURL, a3);
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (void)setConfigurationURL:(id)a3
{
  objc_storeStrong((id *)&self->_configurationURL, a3);
}

- (NSString)splunkTopic
{
  return self->_splunkTopic;
}

- (void)setSplunkTopic:(id)a3
{
  objc_storeStrong((id *)&self->_splunkTopic, a3);
}

- (NSNumber)samplingPercentage
{
  return self->_samplingPercentage;
}

- (void)setSamplingPercentage:(id)a3
{
  objc_storeStrong((id *)&self->_samplingPercentage, a3);
}

- (double)lastSuccessfulConfigurationLoad
{
  return self->_lastSuccessfulConfigurationLoad;
}

- (void)setLastSuccessfulConfigurationLoad:(double)a3
{
  self->_lastSuccessfulConfigurationLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingPercentage, 0);
  objc_storeStrong((id *)&self->_splunkTopic, 0);
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_splunkUploadURL, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
