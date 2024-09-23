@implementation AWSampleLogger

- (void)shouldSample:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unint64_t v17;
  double v18;
  NSMutableSet *outstandingClientLogData;
  NSMutableSet *v20;
  unint64_t samplingStartTime;
  NSObject *v22;
  unint64_t v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  double v27;
  id *location;
  _BOOL4 v29;
  NSMutableSet *obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  double v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  void *v40;
  _QWORD v41[4];
  _QWORD v42[4];
  _BYTE v43[128];
  uint64_t v44;

  v29 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  location = (id *)&self->_outstandingClientLogData;
  obj = self->_outstandingClientLogData;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->_addedClientLogData, "containsObject:", v8, location) & 1) == 0)
        {
          v9 = absTimeNS();
          v10 = v9 - objc_msgSend(v8, "samplingStartTime");
          objc_msgSend(v8, "setCumulativeSamplingTime:", objc_msgSend(v8, "cumulativeSamplingTime") + v10);
          objc_msgSend(v8, "setSamplingStartTime:", 0);
          v41[0] = CFSTR("identifier");
          objc_msgSend(v8, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = v11;
          v41[1] = CFSTR("samplingInterval");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "samplingInterval"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v42[1] = v12;
          v41[2] = CFSTR("pollingClient");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "pollingClient"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v42[2] = v13;
          v41[3] = CFSTR("sampleDuration");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v42[3] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (currentLogLevel >= 7)
          {
            _AALog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v17 = absTimeNS();
              if (v17 == -1)
                v18 = INFINITY;
              else
                v18 = (double)v17 / 1000000000.0;
              *(_DWORD *)buf = 134218498;
              v36 = v18;
              v37 = 2112;
              v38 = CFSTR("com.apple.AttentionAwareness.clientSamplingEnded");
              v39 = 2112;
              v40 = v15;
              _os_log_impl(&dword_1AF589000, v16, OS_LOG_TYPE_DEFAULT, "%13.5f: AnalyticsSendEvent(%@, %@)", buf, 0x20u);
            }

          }
          AnalyticsSendEvent();

        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v5);
  }

  outstandingClientLogData = self->_outstandingClientLogData;
  v20 = outstandingClientLogData;
  objc_storeStrong(location, self->_addedClientLogData);
  objc_storeStrong((id *)&self->_addedClientLogData, outstandingClientLogData);
  -[NSMutableSet removeAllObjects](self->_addedClientLogData, "removeAllObjects");
  samplingStartTime = self->_samplingStartTime;
  if (v29)
  {
    if (!samplingStartTime)
    {
      self->_samplingStartTime = absTimeNS();
      if (currentLogLevel < 7)
        goto LABEL_36;
      _AALog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      v23 = absTimeNS();
      if (v23 == -1)
        v24 = INFINITY;
      else
        v24 = (double)v23 / 1000000000.0;
      *(_DWORD *)buf = 134218498;
      v36 = v24;
      v37 = 2112;
      v38 = CFSTR("com.apple.AttentionAwareness.sampleStarted");
      v39 = 2112;
      v40 = (void *)MEMORY[0x1E0C9AA70];
      goto LABEL_34;
    }
  }
  else if (samplingStartTime)
  {
    v25 = absTimeNS() - self->_samplingStartTime + self->_cumulativeSamplingTime;
    self->_samplingStartTime = 0;
    self->_cumulativeSamplingTime = v25;
    if (currentLogLevel < 7)
      goto LABEL_36;
    _AALog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
LABEL_35:

LABEL_36:
      AnalyticsSendEvent();
      goto LABEL_37;
    }
    v26 = absTimeNS();
    if (v26 == -1)
      v27 = INFINITY;
    else
      v27 = (double)v26 / 1000000000.0;
    *(_DWORD *)buf = 134218498;
    v36 = v27;
    v37 = 2112;
    v38 = CFSTR("com.apple.AttentionAwareness.sampleEnded");
    v39 = 2112;
    v40 = (void *)MEMORY[0x1E0C9AA70];
LABEL_34:
    _os_log_impl(&dword_1AF589000, v22, OS_LOG_TYPE_DEFAULT, "%13.5f: AnalyticsSendEvent(%@, %@)", buf, 0x20u);
    goto LABEL_35;
  }
LABEL_37:

}

+ (void)client:(id)a3 event:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  unint64_t v15;
  double v16;
  int v17;
  double v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "eventMask"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("eventMask"));

  if (objc_msgSend(v5, "eventMask") == 1)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "attentionLostTimeout");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("attentionLostTimeout"));

  }
  v13 = v8;
  if (currentLogLevel >= 7)
  {
    _AALog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = absTimeNS();
      if (v15 == -1)
        v16 = INFINITY;
      else
        v16 = (double)v15 / 1000000000.0;
      v17 = 134218498;
      v18 = v16;
      v19 = 2112;
      v20 = CFSTR("com.apple.AttentionAwareness.clientEvent");
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_1AF589000, v14, OS_LOG_TYPE_DEFAULT, "%13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v17, 0x20u);
    }

  }
  AnalyticsSendEvent();

}

+ (void)client:(id)a3 attentionStateChange:(BOOL)a4
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  unint64_t v11;
  double v12;
  int v13;
  double v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("com.apple.AttentionAwareness.clientStateNegative");
  if (a4)
    v5 = CFSTR("com.apple.AttentionAwareness.clientStatePositive");
  v6 = v5;
  v19 = CFSTR("identifier");
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  if (currentLogLevel >= 7)
  {
    _AALog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = absTimeNS();
      if (v11 == -1)
        v12 = INFINITY;
      else
        v12 = (double)v11 / 1000000000.0;
      v13 = 134218498;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1AF589000, v10, OS_LOG_TYPE_DEFAULT, "%13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v13, 0x20u);
    }

  }
  AnalyticsSendEvent();

}

- (AWSampleLogger)init
{
  id v2;
  uint64_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  dispatch_source_t v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD handler[4];
  id v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AWSampleLogger;
  v2 = -[AWSampleLogger init](&v21, sel_init);
  if (v2)
  {
    awQueue(1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = dispatch_queue_create("com.apple.AttentionAwareness.PowerLog", 0);
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v11;

    v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 1));
    v14 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v13;

    v15 = *((_QWORD *)v2 + 6);
    v16 = dispatch_time(0, 3600000000000);
    dispatch_source_set_timer(v15, v16, 0x34630B8A000uLL, 0x6FC23AC00uLL);
    v17 = *((_QWORD *)v2 + 6);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __22__AWSampleLogger_init__block_invoke;
    handler[3] = &unk_1E5F8EC18;
    v20 = v2;
    dispatch_source_set_event_handler(v17, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 6));

  }
  return (AWSampleLogger *)v2;
}

- (void)_logFeatureEnablement
{
  int v2;
  xpc_object_t v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  int v7;
  double v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (AVGestaltGetBoolAnswer())
  {
    v2 = _AXSAttentionAwarenessFeaturesEnabled();
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "FeatureEnabled", v2 != 0);
    if (currentLogLevel >= 6)
    {
      _AALog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = absTimeNS();
        if (v5 == -1)
          v6 = INFINITY;
        else
          v6 = (double)v5 / 1000000000.0;
        v7 = 134218240;
        v8 = v6;
        v9 = 1024;
        v10 = v2 != 0;
        _os_log_impl(&dword_1AF589000, v4, OS_LOG_TYPE_DEFAULT, "%13.5f: Logging Attention Aware Features enabled: %d", (uint8_t *)&v7, 0x12u);
      }

    }
    analytics_send_event();

  }
}

- (void)streamingCompleteWithidentifier:(id)a3 duration:(unint64_t)a4 ERActivated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  unint64_t v10;
  double v11;
  xpc_object_t v12;
  id v13;
  const char *v14;
  int v15;
  double v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (currentLogLevel >= 6)
  {
    _AALog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = absTimeNS();
      if (v10 == -1)
        v11 = INFINITY;
      else
        v11 = (double)v10 / 1000000000.0;
      v15 = 134218754;
      v16 = v11;
      v17 = 2048;
      v18 = a4;
      v19 = 2112;
      v20 = v8;
      v21 = 1024;
      v22 = v5;
      _os_log_impl(&dword_1AF589000, v9, OS_LOG_TYPE_DEFAULT, "%13.5f: Streaming complete. duration: %llu identifier: %@ ERActivated: %d", (uint8_t *)&v15, 0x26u);
    }

  }
  v12 = xpc_dictionary_create(0, 0, 0);
  v13 = objc_retainAutorelease(v8);
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  xpc_dictionary_set_int64(v12, "StreamingInterval", a4);
  xpc_dictionary_set_string(v12, "identifier", v14);
  xpc_dictionary_set_BOOL(v12, "ERActivated", v5);
  analytics_send_event();

}

- (void)_outputPowerLog
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  AWSampleLogger *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  AWSampleLogger *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[2];
  _QWORD v36[2];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = self;
  -[NSMutableDictionary allValues](self->_clientLogData, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  v4 = 0x1E0CB3000uLL;
  v5 = 0x1E0C99000uLL;
  if (v3)
  {
    v6 = v3;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v9, "cumulativeSamplingTime"))
        {
          if (objc_msgSend(v9, "pollingClient"))
          {
            v35[0] = CFSTR("client");
            objc_msgSend(v9, "identifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v35[1] = CFSTR("cumulativeSamplingTimeMS");
            v36[0] = v10;
            objc_msgSend(*(id *)(v4 + 2024), "numberWithUnsignedLongLong:", objc_msgSend(v9, "cumulativeSamplingTime") / 0xF4240uLL);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v36[1] = v11;
            objc_msgSend(*(id *)(v5 + 3456), "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[AWSampleLogger powerLogName:event:](v26, "powerLogName:event:", CFSTR("PollingAggregation"), v12);
          }
          else
          {
            v33[0] = CFSTR("client");
            objc_msgSend(v9, "identifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v34[0] = v10;
            v33[1] = CFSTR("samplingRateMS");
            objc_msgSend(*(id *)(v4 + 2024), "numberWithUnsignedLongLong:", objc_msgSend(v9, "samplingInterval") / 0xF4240uLL);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v34[1] = v11;
            v33[2] = CFSTR("cumulativeSamplingTimeMS");
            objc_msgSend(*(id *)(v4 + 2024), "numberWithUnsignedLongLong:", objc_msgSend(v9, "cumulativeSamplingTime") / 0xF4240uLL);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v34[2] = v12;
            objc_msgSend(*(id *)(v5 + 3456), "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
            v13 = v4;
            v14 = v5;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[AWSampleLogger powerLogName:event:](v26, "powerLogName:event:", CFSTR("SamplingAggregation"), v15);

            v5 = v14;
            v4 = v13;
          }

          objc_msgSend(v9, "setCumulativeSamplingTime:", 0);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v6);
  }

  v31[0] = CFSTR("cumulativeSamplingTimeMS");
  v16 = *(void **)(v4 + 2024);
  v17 = v4;
  v18 = v26;
  objc_msgSend(v16, "numberWithUnsignedLongLong:", v26->_cumulativeSamplingTime / 0xF4240);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v19;
  v31[1] = CFSTR("pollsRequested");
  objc_msgSend(*(id *)(v17 + 2024), "numberWithUnsignedLongLong:", v26->_pollsRequested);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v20;
  v31[2] = CFSTR("singleShotsRequested");
  objc_msgSend(*(id *)(v17 + 2024), "numberWithUnsignedLongLong:", v18->_samplesRequested - v18->_pollsRequested);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v21;
  v31[3] = CFSTR("positiveOutcomes");
  objc_msgSend(*(id *)(v17 + 2024), "numberWithUnsignedLongLong:", v26->_samplesSucceeded);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v22;
  v31[4] = CFSTR("negativeOutcomes");
  objc_msgSend(*(id *)(v17 + 2024), "numberWithUnsignedLongLong:", v18->_samplesRequested - v18->_samplesSucceeded);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v23;
  objc_msgSend(*(id *)(v5 + 3456), "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWSampleLogger powerLogName:event:](v26, "powerLogName:event:", CFSTR("ServiceAggregation"), v24);

  *(_OWORD *)&v26->_cumulativeSamplingTime = 0u;
  *(_OWORD *)&v26->_pollsRequested = 0u;
}

- (void)outputPowerLog
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AWSampleLogger_outputPowerLog__block_invoke;
  block[3] = &unk_1E5F8EC18;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)powerLogName:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  NSObject *powerLogQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  powerLogQueue = self->_powerLogQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__AWSampleLogger_powerLogName_event___block_invoke;
  v11[3] = &unk_1E5F8EC40;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(powerLogQueue, v11);

}

- (void)updateDataForClient:(id)a3 deadline:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AWSampleLogData *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  unint64_t v20;
  double v21;
  int v22;
  double v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4)
    v7 = 0;
  else
    v7 = objc_msgSend(v6, "samplingInterval");
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_clientLogData, "objectForKeyedSubscript:", v11);
  v12 = (AWSampleLogData *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = objc_alloc_init(AWSampleLogData);
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWSampleLogData setIdentifier:](v12, "setIdentifier:", v13);

    -[AWSampleLogData setSamplingInterval:](v12, "setSamplingInterval:", v7);
    -[AWSampleLogData setPollingClient:](v12, "setPollingClient:", a4 != 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clientLogData, "setObject:forKeyedSubscript:", v12, v11);
  }
  if (!-[AWSampleLogData samplingStartTime](v12, "samplingStartTime"))
  {
    -[AWSampleLogData setSamplingStartTime:](v12, "setSamplingStartTime:", absTimeNS());
    v28[0] = CFSTR("identifier");
    -[AWSampleLogData identifier](v12, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v14;
    v28[1] = CFSTR("samplingInterval");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AWSampleLogData samplingInterval](v12, "samplingInterval"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v15;
    v28[2] = CFSTR("pollingClient");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AWSampleLogData pollingClient](v12, "pollingClient"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v16;
    v28[3] = CFSTR("pollingDeadline");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (currentLogLevel >= 7)
    {
      _AALog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = absTimeNS();
        if (v20 == -1)
          v21 = INFINITY;
        else
          v21 = (double)v20 / 1000000000.0;
        v22 = 134218498;
        v23 = v21;
        v24 = 2112;
        v25 = CFSTR("com.apple.AttentionAwareness.clientSamplingStarted");
        v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_1AF589000, v19, OS_LOG_TYPE_DEFAULT, "%13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v22, 0x20u);
      }

    }
    AnalyticsSendEvent();

  }
  -[NSMutableSet addObject:](self->_addedClientLogData, "addObject:", v12);

}

- (void)sampleStartedWithDeadline:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  double v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  double v13;
  int v14;
  double v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ++self->_samplesRequested;
  if (a3)
  {
    ++self->_pollsRequested;
    v20 = CFSTR("deadline");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (currentLogLevel >= 7)
    {
      _AALog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = absTimeNS();
        if (v8 == -1)
          v9 = INFINITY;
        else
          v9 = (double)v8 / 1000000000.0;
        v14 = 134218498;
        v15 = v9;
        v16 = 2112;
        v17 = CFSTR("com.apple.AttentionAwareness.pollRequested");
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_1AF589000, v7, OS_LOG_TYPE_DEFAULT, "%13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v14, 0x20u);
      }

    }
    AnalyticsSendEvent();

  }
  else
  {
    if (currentLogLevel >= 7)
    {
      _AALog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)MEMORY[0x1E0C9AA70];
        v12 = absTimeNS();
        if (v12 == -1)
          v13 = INFINITY;
        else
          v13 = (double)v12 / 1000000000.0;
        v14 = 134218498;
        v15 = v13;
        v16 = 2112;
        v17 = CFSTR("com.apple.AttentionAwareness.singleShotRequested");
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_1AF589000, v10, OS_LOG_TYPE_DEFAULT, "%13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v14, 0x20u);
      }

    }
    AnalyticsSendEvent();
  }
}

- (void)sampleSucceeded
{
  NSObject *v3;
  uint64_t v4;
  unint64_t v5;
  double v6;
  int v7;
  double v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ++self->_samplesSucceeded;
  if (currentLogLevel >= 7)
  {
    _AALog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = MEMORY[0x1E0C9AA70];
      v5 = absTimeNS();
      if (v5 == -1)
        v6 = INFINITY;
      else
        v6 = (double)v5 / 1000000000.0;
      v7 = 134218498;
      v8 = v6;
      v9 = 2112;
      v10 = CFSTR("com.apple.AttentionAwareness.sampleSucceeded");
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v7, 0x20u);
    }

  }
  AnalyticsSendEvent();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_addedClientLogData, 0);
  objc_storeStrong((id *)&self->_outstandingClientLogData, 0);
  objc_storeStrong((id *)&self->_clientLogData, 0);
  objc_storeStrong((id *)&self->_powerLogQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __37__AWSampleLogger_powerLogName_event___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  double v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (currentLogLevel >= 6)
  {
    _AALog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = absTimeNS();
      if (v3 == -1)
        v4 = INFINITY;
      else
        v4 = (double)v3 / 1000000000.0;
      v5 = *(void **)(a1 + 32);
      v6 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v13 = v4;
      v14 = 2112;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: PowerLog %@ %@", buf, 0x20u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.AttentionAwareness.PowerLog.%@"), *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(id *)(a1 + 40);
  if (currentLogLevel > 6)
  {
    _AALog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = absTimeNS();
      if (v10 == -1)
        v11 = INFINITY;
      else
        v11 = (double)v10 / 1000000000.0;
      *(_DWORD *)buf = 134218498;
      v13 = v11;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1AF589000, v9, OS_LOG_TYPE_DEFAULT, "%13.5f: AnalyticsSendEvent(%@, %@)", buf, 0x20u);
    }

  }
  AnalyticsSendEvent();

  PLLogTimeSensitiveRegisteredEvent();
}

uint64_t __32__AWSampleLogger_outputPowerLog__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_outputPowerLog");
}

uint64_t __22__AWSampleLogger_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_outputPowerLog");
  return objc_msgSend(*(id *)(a1 + 32), "_logFeatureEnablement");
}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1)
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_2465);
  return (id)sharedLogger_logger;
}

+ (void)client:(id)a3 pollEventType:(unint64_t)a4 event:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  unint64_t v17;
  double v18;
  int v19;
  double v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a3;
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("identifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("pollEventType"));

  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "eventMask"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("pollEventMask"));

  }
  v15 = v10;
  if (currentLogLevel >= 7)
  {
    _AALog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = absTimeNS();
      if (v17 == -1)
        v18 = INFINITY;
      else
        v18 = (double)v17 / 1000000000.0;
      v19 = 134218498;
      v20 = v18;
      v21 = 2112;
      v22 = CFSTR("com.apple.AttentionAwareness.clientPollEvent");
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_1AF589000, v16, OS_LOG_TYPE_DEFAULT, "%13.5f: AnalyticsSendEvent(%@, %@)", (uint8_t *)&v19, 0x20u);
    }

  }
  AnalyticsSendEvent();

}

void __30__AWSampleLogger_sharedLogger__block_invoke()
{
  AWSampleLogger *v0;
  void *v1;

  v0 = objc_alloc_init(AWSampleLogger);
  v1 = (void *)sharedLogger_logger;
  sharedLogger_logger = (uint64_t)v0;

}

@end
