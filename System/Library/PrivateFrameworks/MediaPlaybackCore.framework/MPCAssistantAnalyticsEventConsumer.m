@implementation MPCAssistantAnalyticsEventConsumer

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.MediaPlaybackCore/Siri");
}

- (MPCAssistantAnalyticsEventConsumer)initWithPlaybackEngine:(id)a3
{
  id v4;
  MPCAssistantAnalyticsEventConsumer *v5;
  MPCAssistantAnalyticsEventConsumer *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *eventQueue;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPCAssistantAnalyticsEventConsumer;
  v5 = -[MPCAssistantAnalyticsEventConsumer init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    v7 = dispatch_queue_create("com.apple.MediaPlayer.MPAssistantAnalyticsReportingController.eventQueue", 0);
    eventQueue = v6->_eventQueue;
    v6->_eventQueue = (OS_dispatch_queue *)v7;

  }
  return v6;
}

- (void)subscribeToEventStream:(id)a3
{
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  objc_storeStrong((id *)&self->_subscription, a3);
  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke;
  v11[3] = &unk_24CAB94A0;
  v11[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("session-will-begin"), v11);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_5;
  v10[3] = &unk_24CAB94A0;
  v10[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("item-buffer-ready"), v10);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_7;
  v9[3] = &unk_24CAB94A0;
  v9[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("item-first-audio-frame"), v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_16;
  v8[3] = &unk_24CAB94A0;
  v8[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("item-begin"), v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_2;
  v7[3] = &unk_24CAB94A0;
  v7[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("asset-load-end"), v7);

}

- (void)unsubscribeFromEventStream:(id)a3
{
  MPCPlaybackEngineEventStreamSubscription *subscription;

  subscription = self->_subscription;
  self->_subscription = 0;

}

- (void)_handleAssetLoadEnd:(id)a3 cursor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint8_t buf[8];
  _QWORD v30[2];
  _QWORD v31[2];
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("asset-load-end"));

  if (v9)
  {
    objc_msgSend(v6, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "payload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = CFSTR("queue-section-id");
    v33[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCAssistantAnalyticsEventConsumer _validateAndBuildContextWithEvent:](self, "_validateAndBuildContextWithEvent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    if (v17)
    {
      v30[0] = CFSTR("queue-section-id");
      v30[1] = CFSTR("queue-item-id");
      v31[0] = v11;
      v31[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("asset-load-begin"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v19, "durationSinceEvent:", v6);
      objc_msgSend(v20, "numberWithDouble:", v21 * 1000.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("Duration"));

      v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "MPCAssistantAnalyticsEventConsumer: AFAnalyticsEventTypeMusicPlaybackAssetLoad", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v6, "monotonicTime");
        v25 = *((_QWORD *)&v26 + 1);
      }
      else
      {
        v25 = 0;
        v28 = 0;
        v26 = 0u;
        v27 = 0u;
      }
      objc_msgSend(v24, "logEventWithType:machAbsoluteTime:context:", 2903, v25, v17, v26, v27, v28);

    }
  }

}

- (id)_validateAndBuildContextWithEvent:(id)a3
{
  id v4;
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
  const __CFString *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queue-reporting-metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("siri-ref-id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && (objc_msgSend(v7, "isEqualToString:", self->_lastSiriReferenceIdentifierForPlaybackStart) & 1) == 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("siri-wha-metrics"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        v20[0] = CFSTR("refId");
        v20[1] = CFSTR("endTimeReciever");
        v21[0] = v8;
        v11 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v4, "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        objc_msgSend(v11, "numberWithDouble:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v19[0] = v14;
        v19[1] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        AFAnalyticsContextsMerge();
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = CFSTR("refId");
        v18 = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_lastSiriReferenceIdentifierForPlaybackStart, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

uint64_t __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_validateAndBuildContextWithEvent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "MPCAssistantAnalyticsEventConsumer: AFAnalyticsEventTypeMusicPlaybackQueueReceived", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v3, "monotonicTime");
      v7 = *((_QWORD *)&v9 + 1);
    }
    else
    {
      v7 = 0;
      v11 = 0;
      v9 = 0u;
      v10 = 0u;
    }
    objc_msgSend(v6, "logEventWithType:machAbsoluteTime:context:", 2906, v7, v4, v9, v10, v11);

  }
  return 1;
}

uint64_t __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v34;
  uint64_t v36;
  uint8_t buf[16];
  const __CFString *v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "findPreviousEventWithType:matchingPayload:", CFSTR("session-begin"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cursorUntilEvent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = CFSTR("queue-section-id");
  objc_msgSend(v4, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = CFSTR("queue-item-id");
  v43[0] = v9;
  objc_msgSend(v4, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-buffer-ready"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v4;
  if (!v13)
  {
    v34 = v7;
    v40[0] = CFSTR("queue-section-id");
    objc_msgSend(v4, "payload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = CFSTR("queue-item-id");
    v41[0] = v16;
    objc_msgSend(v4, "payload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v19 = v4;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v19;
    objc_msgSend(v21, "payload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("item-is-start-item"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v24, "BOOLValue");

    if ((_DWORD)v15)
    {
      v38 = CFSTR("queue-section-id");
      objc_msgSend(v19, "payload");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_validateAndBuildContextWithEvent:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "MPCAssistantAnalyticsEventConsumer: AFAnalyticsEventTypeMusicPlaybackReady", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v14, "monotonicTime");
          v32 = v36;
        }
        else
        {
          v32 = 0;
        }
        objc_msgSend(v31, "logEventWithType:machAbsoluteTime:context:", 2901, v32, v29);

      }
    }

    v7 = v34;
  }

  return 1;
}

uint64_t __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v34;
  void *v35;
  __int128 v37;
  _QWORD v38[5];
  _QWORD v39[2];
  _QWORD v40[2];
  _BYTE info[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  const __CFString *v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v49[0] = CFSTR("queue-section-id");
  v49[1] = CFSTR("queue-item-id");
  v50[0] = v7;
  v50[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("item-is-start-item"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v14, "BOOLValue");

  if ((_DWORD)v10)
  {
    objc_msgSend(v5, "cursorUntilEvent:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-first-audio-frame"), 0))
    {
      v47 = CFSTR("queue-section-id");
      v48 = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), v16);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_validateAndBuildContextWithEvent:", v35);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      if (v18)
      {
        v45[0] = CFSTR("queue-section-id");
        v45[1] = CFSTR("item-start-item-id");
        v46[0] = v7;
        v46[1] = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "findPreviousEventWithType:matchingPayload:", CFSTR("item-hls-stream-begin"), v19);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("HLS"), CFSTR("contentType"));
          *(_QWORD *)info = 0;
          *(_QWORD *)&info[8] = info;
          *(_QWORD *)&info[16] = 0x3032000000;
          v42 = __Block_byref_object_copy__1962;
          v43 = __Block_byref_object_dispose__1963;
          v44 = 0;
          v39[0] = CFSTR("queue-section-id");
          v39[1] = CFSTR("queue-item-id");
          v40[0] = v7;
          v40[1] = v9;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = MEMORY[0x24BDAC760];
          v38[1] = 3221225472;
          v38[2] = __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_12;
          v38[3] = &unk_24CABA670;
          v38[4] = info;
          objc_msgSend(v15, "enumeratePreviousEventsWithType:matchingPayload:usingBlock:", CFSTR("audio-format-changed"), v20, v38);

          v21 = *(void **)(*(_QWORD *)&info[8] + 40);
          if (v21)
          {
            objc_msgSend(v21, "analyticsFormatInfo");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addEntriesFromDictionary:", v22);

          }
          _Block_object_dispose(info, 8);

        }
        else
        {
          objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("CRABS"), CFSTR("contentType"));
        }
        objc_msgSend(v4, "payload");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("event-time-offset"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;

        if (v4)
          objc_msgSend(v4, "monotonicTime");
        else
          v37 = 0u;
        *(_QWORD *)info = 0;
        mach_timebase_info((mach_timebase_info_t)info);
        v27 = *(unsigned int *)&info[4] * (uint64_t)(v26 * 1000000000.0) / *(unsigned int *)info + *((_QWORD *)&v37 + 1);
        v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)info = 134218242;
          *(_QWORD *)&info[4] = v27;
          *(_WORD *)&info[12] = 2114;
          *(_QWORD *)&info[14] = v18;
          _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "MPCAssistantAnalyticsEventConsumer: AFAnalyticsEventTypeMusicPlaybackStart %lld %{public}@", info, 0x16u);
        }

        objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logEventWithType:machAbsoluteTime:context:", 2905, v27, v18);

        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("refId"));
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(_QWORD *)(a1 + 32);
        v32 = *(void **)(v31 + 16);
        *(_QWORD *)(v31 + 16) = v30;

      }
    }

  }
  return 1;
}

uint64_t __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-is-start-item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    objc_msgSend(v5, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "payload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = CFSTR("asset-load-end");
    v25[1] = CFSTR("session-reset");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findPreviousEventWithTypes:matchingPayload:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("session-reset"));

      if ((v18 & 1) == 0)
      {
        objc_msgSend(v16, "payload");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "isEqualToString:", v12) & 1) != 0)
        {
          objc_msgSend(v16, "payload");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqualToString:", v14);

          if (v24)
            objc_msgSend(*(id *)(a1 + 32), "_handleAssetLoadEnd:cursor:", v16, v6);
        }
        else
        {

        }
      }
    }

  }
  return 1;
}

uint64_t __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = CFSTR("item-begin");
  v26[1] = CFSTR("session-reset");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithTypes:matchingPayload:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_11;
  objc_msgSend(v12, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("session-reset"));

  if ((v14 & 1) != 0)
    goto LABEL_11;
  objc_msgSend(v12, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("item-begin")) & 1) == 0)
  {
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v12, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", v8) & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v12, "payload");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v25, "isEqualToString:", v10))
  {

    goto LABEL_9;
  }
  objc_msgSend(v5, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("item-is-start-item"));
  v22 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v19, "BOOLValue");

  if (v24)
    objc_msgSend(*(id *)(a1 + 32), "_handleAssetLoadEnd:cursor:", v5, v6);
LABEL_11:

  return 1;
}

void __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_12(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("item-audio-format-metadata"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("active-format"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("target-format"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    *a3 = 1;
    v8 = v6;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v8);

}

@end
