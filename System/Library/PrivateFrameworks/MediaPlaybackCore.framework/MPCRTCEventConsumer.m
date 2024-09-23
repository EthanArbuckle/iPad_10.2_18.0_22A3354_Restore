@implementation MPCRTCEventConsumer

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.MediaPlaybackCore/RTC");
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("queue-load-error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_payloadForQueueLoad:fromQueueLoadEndEvent:", v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_sendOneMessageWithCategory:type:payload:", 1004, 2, v9);

  }
  return 1;
}

- (MPCRTCEventConsumer)init
{
  MPCRTCEventConsumer *v2;
  dispatch_group_t v3;
  OS_dispatch_group *rtcGroup;
  dispatch_queue_t v5;
  OS_dispatch_queue *rtcQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPCRTCEventConsumer;
  v2 = -[MPCRTCEventConsumer init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    rtcGroup = v2->_rtcGroup;
    v2->_rtcGroup = (OS_dispatch_group *)v3;

    v5 = dispatch_queue_create("com.apple.MediaPlayer.MPCRTCEventConsumer", 0);
    rtcQueue = v2->_rtcQueue;
    v2->_rtcQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
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
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  objc_storeStrong((id *)&self->_subscription, a3);
  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke;
  v17[3] = &unk_24CAB94A0;
  v17[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("session-reset"), v17);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_2;
  v16[3] = &unk_24CAB94A0;
  v16[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("session-end"), v16);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_3;
  v15[3] = &unk_24CAB94A0;
  v15[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("application-termination"), v15);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_4;
  v14[3] = &unk_24CAB94A0;
  v14[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("session-restore-end"), v14);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_5;
  v13[3] = &unk_24CAB94A0;
  v13[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("session-migrate-end"), v13);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_6;
  v12[3] = &unk_24CAB94A0;
  v12[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("item-first-audio-frame"), v12);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_7;
  v11[3] = &unk_24CAB94A0;
  v11[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("item-failed"), v11);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_8;
  v10[3] = &unk_24CAB94A0;
  v10[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("asset-load-end"), v10);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_9;
  v9[3] = &unk_24CAB94A0;
  v9[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("item-end"), v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_10;
  v8[3] = &unk_24CAB94A0;
  v8[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("remote-control-begin"), v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_11;
  v7[3] = &unk_24CAB94A0;
  v7[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("queue-load-end"), v7);

}

+ (id)playerServiceNameWithPlayerID:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Music")) & 1) != 0)
  {
    v4 = CFSTR("app.music");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Podcasts")) & 1) != 0)
  {
    v4 = CFSTR("app.podcasts");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.music.classical")))
  {
    v4 = CFSTR("app.music.classical");
  }
  else
  {
    v4 = CFSTR("app.musickit");
  }

  return (id)v4;
}

- (void)setTestingDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "MPCRTCEventConsumer: testingDelegate set. RTC messages will not be sent.", v6, 2u);
  }

  objc_storeWeak((id *)&self->_testingDelegate, v4);
}

- (void)unsubscribeFromEventStream:(id)a3
{
  MPCPlaybackEngineEventStreamSubscription *subscription;

  subscription = self->_subscription;
  self->_subscription = 0;

}

- (void)_handleReportingForItemStartEvent:(id)a3 event:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[MPCRTCEventConsumer _shouldReportItemAssetLoad:forItemEvent:]((uint64_t)self, v7, v6))
  {
    -[MPCRTCEventConsumer _sendSessionStartIfNeeded:forItemEvent:](self, "_sendSessionStartIfNeeded:forItemEvent:", v7, v6);
    -[MPCRTCEventConsumer _sendQueueLoadEventIfNeeded:forItemEvent:](self, "_sendQueueLoadEventIfNeeded:forItemEvent:", v7, v6);
    -[MPCRTCEventConsumer _sendReportForItemAssetLoad:event:](self, "_sendReportForItemAssetLoad:event:", v7, v6);
  }

}

- (void)_sendReportForSessionSummary:(id)a3 event:(id)a4 withType:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a3;
  -[MPCRTCEventConsumer _payloadForSessionSummary:fromEvent:](self, "_payloadForSessionSummary:fromEvent:", v8, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCRTCEventConsumer _networkSignalPayload:]((uint64_t)self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addEntriesFromDictionary:", v9);
  -[MPCRTCEventConsumer _sendOneMessageWithCategory:type:payload:](self, "_sendOneMessageWithCategory:type:payload:", 1003, a5, v10);

}

- (void)_sendSessionStartIfNeeded:(id)a3 forItemEvent:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[MPCRTCEventConsumer _sessionCursorWithCursor:fromEvent:]((uint64_t)self, v11, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCRTCEventConsumer _firstItemAssetLoadEventWithCursor:fromEvent:matchingPayload:]((uint64_t)self, v7, v6, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    objc_msgSend(v6, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("item-first-audio-frame")))
      v10 = 1;
    else
      v10 = 2;

    -[MPCRTCEventConsumer _sendReportForSessionStart:event:withType:](self, "_sendReportForSessionStart:event:withType:", v11, v6, v10);
  }

}

- (void)_sendReportForSessionStart:(id)a3 event:(id)a4 withType:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a3;
  -[MPCRTCEventConsumer _payloadForSessionStart:fromEvent:](self, "_payloadForSessionStart:fromEvent:", v8, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCRTCEventConsumer _networkSignalPayload:]((uint64_t)self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addEntriesFromDictionary:", v9);
  -[MPCRTCEventConsumer _sendOneMessageWithCategory:type:payload:](self, "_sendOneMessageWithCategory:type:payload:", 1002, a5, v10);

}

- (void)_sendQueueLoadEventIfNeeded:(id)a3 forItemEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  _QWORD v39[4];

  v39[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__7515;
  v33 = __Block_byref_object_dispose__7516;
  v34 = 0;
  objc_msgSend(v6, "cursorFromEvent:untilEvent:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = CFSTR("asset-load-end");
  v39[1] = CFSTR("item-failed");
  v39[2] = CFSTR("item-first-audio-frame");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __64__MPCRTCEventConsumer__sendQueueLoadEventIfNeeded_forItemEvent___block_invoke;
  v26[3] = &unk_24CAB55F8;
  v26[4] = self;
  v10 = v6;
  v27 = v10;
  v28 = &v29;
  objc_msgSend(v8, "enumeratePreviousEventsWithTypes:usingBlock:", v9, v26);

  objc_msgSend(v7, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v30[5], "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
    v37 = CFSTR("queue-section-id");
    v38 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-load-end"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCRTCEventConsumer _sessionCursorWithCursor:fromEvent:]((uint64_t)self, v10, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = CFSTR("queue-section-id");
    v36 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCRTCEventConsumer _firstItemAssetLoadEventWithCursor:fromEvent:matchingPayload:]((uint64_t)self, v18, v7, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 && v20 == v7)
    {
      -[MPCRTCEventConsumer _payloadForQueueLoad:fromQueueLoadEndEvent:](self, "_payloadForQueueLoad:fromQueueLoadEndEvent:", v10, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCRTCEventConsumer _networkSignalPayload:]((uint64_t)self, v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addEntriesFromDictionary:", v22);

      objc_msgSend(v17, "payload");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("queue-load-error"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        v25 = 2;
      else
        v25 = 1;

      -[MPCRTCEventConsumer _sendOneMessageWithCategory:type:payload:](self, "_sendOneMessageWithCategory:type:payload:", 1004, v25, v21);
    }

  }
  _Block_object_dispose(&v29, 8);

}

- (void)_sendReportForItemAssetLoad:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[MPCRTCEventConsumer _payloadForItemAssetLoad:fromItemEvent:](self, "_payloadForItemAssetLoad:fromItemEvent:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    -[MPCRTCEventConsumer _networkSignalPayload:]((uint64_t)self, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addEntriesFromDictionary:](v9, "addEntriesFromDictionary:", v10);

    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = 2;
    else
      v12 = 1;

    objc_msgSend(v7, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("asset-load-end"));

    if (v14)
    {
      v15 = v7;
    }
    else
    {
      objc_msgSend(v8, "payload", CFSTR("queue-item-id"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("asset-load-end"), v22);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[MPCRTCEventConsumer _performABCSnapshotWithPayloadIfNecessary:](self, "_performABCSnapshotWithPayloadIfNecessary:", v9);
    -[MPCRTCEventConsumer _sendOneMessageWithCategory:type:payload:](self, "_sendOneMessageWithCategory:type:payload:", 1005, v12, v9);

  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCRTCEventConsumer dateFormatter](MPCRTCEventConsumer, "dateFormatter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromDate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v16;
      v27 = 2114;
      v28 = v19;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: No itemBeginEvent type=%{public}@ date=%{public}@", buf, 0x16u);

    }
  }

}

- (void)_sendReportForItemSummary:(id)a3 event:(id)a4
{
  -[MPCRTCEventConsumer _sendReportForItemSummaryWithEndReason:cursor:event:](self, "_sendReportForItemSummaryWithEndReason:cursor:event:", 0, a3, a4);
}

- (void)_sendReportForItemSummaryWithEndReason:(id)a3 cursor:(id)a4 event:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v8 = a4;
  -[MPCRTCEventConsumer _payloadForItemSummary:fromEvent:](self, "_payloadForItemSummary:fromEvent:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCRTCEventConsumer _networkSignalPayload:]((uint64_t)self, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addEntriesFromDictionary:", v10);
  if (v13)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("endReason"));
  -[MPCRTCEventConsumer _performABCSnapshotWithPayloadIfNecessary:](self, "_performABCSnapshotWithPayloadIfNecessary:", v9);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("errorCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = 2;
  else
    v12 = 1;

  -[MPCRTCEventConsumer _sendOneMessageWithCategory:type:payload:](self, "_sendOneMessageWithCategory:type:payload:", 1006, v12, v9);
}

- (id)_payloadForSessionStart:(id)a3 fromEvent:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  char v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  _QWORD v81[4];
  _QWORD v82[4];
  const __CFString *v83;
  void *v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  _QWORD v89[4];
  _QWORD v90[6];

  v90[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDBCED8];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v6, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("event"));

  -[MPCRTCEventConsumer _accountSnapshotWithCursor:](self, "_accountSnapshotWithCursor:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v11);

  objc_msgSend(v8, "cursorFromEvent:untilEvent:", v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v90[0] = CFSTR("session-begin");
  v90[1] = CFSTR("session-restore-begin");
  v90[2] = CFSTR("session-migrate-begin");
  v90[3] = CFSTR("session-reset");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v90, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "containsObject:", v14))
  {
    v15 = v6;
  }
  else
  {
    v89[0] = CFSTR("session-begin");
    v89[1] = CFSTR("session-restore-begin");
    v89[2] = CFSTR("session-migrate-begin");
    v89[3] = CFSTR("session-reset");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "findPreviousEventWithTypes:matchingPayload:", v16, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v15, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("session-id"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("sessionIdentifier"));

  v19 = v6;
  objc_msgSend(v19, "type");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v15;
  v80 = v9;
  if ((objc_msgSend(v20, "isEqualToString:", CFSTR("asset-load-end")) & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v19, "type");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("item-first-audio-frame")))
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v19, "type");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("item-failed"));

  v42 = v19;
  if ((v44 & 1) != 0)
  {
LABEL_8:
    if (-[MPCRTCEventConsumer _shouldReportItemAssetLoad:forItemEvent:]((uint64_t)self, v12, v19))
    {
      -[MPCRTCEventConsumer _payloadForItemAssetLoad:fromItemEvent:](self, "_payloadForItemAssetLoad:fromItemEvent:", v12, v19);
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("createAssetDuration"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("initialItemLoadDuration"));

      -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("perceivedPlayStartTime"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("perceivedPlayStartTime"));

      -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("errorCode"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("errorCode"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("errorCode"));

        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("errorDomain"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("errorDomain"));

      }
    }
    else
    {
      v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "type");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPCRTCEventConsumer dateFormatter](MPCRTCEventConsumer, "dateFormatter");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "date");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringFromDate:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v86 = v28;
        v87 = 2114;
        v88 = v31;
        _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _payloadForSessionStart: Invalid item start event. type=%{public}@ date=%{public}@", buf, 0x16u);

        v9 = v80;
      }
    }

    v83 = CFSTR("queue-section-id");
    objc_msgSend(v19, "payload");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-load-end"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v35, "payload");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("queue-rtc-service-id"));
      v37 = objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v37, CFSTR("serviceName"));
      }
      else
      {
        v71 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          +[MPCRTCEventConsumer dateFormatter](MPCRTCEventConsumer, "dateFormatter");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "date");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "stringFromDate:", v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v86 = v74;
          _os_log_impl(&dword_210BD8000, v71, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _payloadForSessionStart: serviceName=nil for queueLoadEndEvent date=%{public}@", buf, 0xCu);

          v9 = v80;
        }

      }
      v42 = v35;

    }
    else
    {
      v37 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "type");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPCRTCEventConsumer dateFormatter](MPCRTCEventConsumer, "dateFormatter");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "date");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringFromDate:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v86 = v38;
        v87 = 2114;
        v88 = v41;
        _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _payloadForSessionStart: No QueueLoadEndEvent type=%{public}@ date=%{public}@", buf, 0x16u);

        v9 = v80;
      }
      v42 = v19;
    }

    if (!v42)
      goto LABEL_40;
    goto LABEL_21;
  }
  if (!v19)
  {
LABEL_40:
    v75 = v12;
    v60 = v19;
    v61 = v75;
    goto LABEL_41;
  }
LABEL_21:
  objc_msgSend(v42, "type");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("queue-load-end"));

  if (v46)
  {
    -[MPCRTCEventConsumer _payloadForQueueLoad:fromQueueLoadEndEvent:](self, "_payloadForQueueLoad:fromQueueLoadEndEvent:", v12, v42);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("queueType"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v48, CFSTR("initialQueueType"));

    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("queueLoadDuration"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v49, CFSTR("initialQueueLoadDuration"));

    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("queueEndpoint"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v50, CFSTR("initialQueueFeatureName"));

    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("errorCode"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v52, CFSTR("errorCode"));

      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("errorDomain"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v53, CFSTR("errorDomain"));

    }
  }
  objc_msgSend(v42, "type");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("session-restore-end"));

  if (!v55)
  {
    v58 = v12;
LABEL_29:
    v60 = v19;
    objc_msgSend(v42, "type");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("session-migrate-end"));

    if (v63)
    {
      objc_msgSend(v42, "payload");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("session-migration-error"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCRTCEventConsumer _addErrors:toPayload:]((uint64_t)self, v65, v9);

      v61 = v58;
      objc_msgSend(v58, "findPreviousEventWithType:matchingPayload:", CFSTR("session-migrate-begin"), 0);
      v66 = objc_claimAutoreleasedReturnValue();

      v42 = (id)v66;
      if (!v66)
        goto LABEL_41;
    }
    else
    {
      v61 = v58;
    }
    v82[0] = CFSTR("session-begin");
    v82[1] = CFSTR("session-restore-begin");
    v82[2] = CFSTR("session-migrate-begin");
    v82[3] = CFSTR("session-reset");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 4);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "type");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v67, "containsObject:", v68);

    v70 = v42;
    if ((v69 & 1) != 0)
      goto LABEL_42;
    goto LABEL_41;
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("stateRestoration"));
  objc_msgSend(v42, "payload");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("session-restoration-error"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCRTCEventConsumer _addErrors:toPayload:]((uint64_t)self, v57, v9);

  v58 = v12;
  objc_msgSend(v12, "findPreviousEventWithType:matchingPayload:", CFSTR("session-restore-begin"), 0);
  v59 = objc_claimAutoreleasedReturnValue();

  v42 = (id)v59;
  if (v59)
    goto LABEL_29;
  v60 = v19;
  v61 = v58;
LABEL_41:
  v81[0] = CFSTR("session-begin");
  v81[1] = CFSTR("session-restore-begin");
  v81[2] = CFSTR("session-migrate-begin");
  v81[3] = CFSTR("session-reset");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 4);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "findPreviousEventWithTypes:matchingPayload:", v76, 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_42:
  -[MPCRTCEventConsumer _networkType:fromEvent:](self, v61, v70);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setObject:forKeyedSubscript:", v77, CFSTR("initialNetworkType"));

  return v80;
}

- (id)_payloadForSessionSummary:(id)a3 fromEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[5];
  id v27;
  _BYTE *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[3];
  _BYTE buf[24];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCRTCEventConsumer _sessionCursorWithCursor:fromEvent:]((uint64_t)self, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCRTCEventConsumer _firstItemAssetLoadEventWithCursor:fromEvent:matchingPayload:]((uint64_t)self, v9, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[MPCRTCEventConsumer _payloadForSessionStart:fromEvent:](self, "_payloadForSessionStart:fromEvent:", v6, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  else
  {
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "type");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCRTCEventConsumer dateFormatter](MPCRTCEventConsumer, "dateFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _payloadForSessionSummary: sessionStartItemEvent=nil event.type=%{public}@ event.date=%{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(v7, "type");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("event"));

  -[MPCRTCEventConsumer _networkType:fromEvent:](self, v6, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("networkType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("queue-add"), 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("queuesAdded"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("queue-load-error"), 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("queuesFailed"));

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v36 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v34[0] = CFSTR("item-first-audio-frame");
  v34[1] = CFSTR("asset-load-end");
  v34[2] = CFSTR("item-failed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __59__MPCRTCEventConsumer__payloadForSessionSummary_fromEvent___block_invoke;
  v26[3] = &unk_24CABA7A0;
  v26[4] = self;
  v21 = v9;
  v27 = v21;
  v28 = buf;
  v29 = &v30;
  objc_msgSend(v21, "enumeratePreviousEventsWithTypes:usingBlock:", v20, v26);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("itemsPlayed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v31[3]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("itemsFailed"));

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(buf, 8);

  return v8;
}

- (id)_payloadForQueueLoad:(id)a3 fromQueueLoadEndEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  _QWORD v58[4];
  _QWORD v59[2];
  _QWORD v60[2];
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[MPCRTCEventConsumer _accountSnapshotWithCursor:](self, "_accountSnapshotWithCursor:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v9);

  objc_msgSend(v7, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("event"));

  objc_msgSend(v7, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queue-rtc-service-id"));
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("serviceName"));
  }
  else
  {
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      +[MPCRTCEventConsumer dateFormatter](MPCRTCEventConsumer, "dateFormatter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringFromDate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v16;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _payloadForSessionStart: serviceName=nil for queueLoadEndEvent date=%{public}@", buf, 0xCu);

    }
  }
  v51 = (void *)v12;
  objc_msgSend(v6, "cursorFromEvent:untilEvent:", v7, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCRTCEventConsumer _networkType:fromEvent:](self, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("networkType"));

  objc_msgSend(v7, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "payload");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("queue-load-error"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    -[MPCRTCEventConsumer _addErrors:toPayload:]((uint64_t)self, v22, v8);
  v59[0] = CFSTR("queue-section-id");
  v59[1] = CFSTR("network-operation-type");
  v60[0] = v20;
  v60[1] = &unk_24CB16B00;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v6;
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("network-operation"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v24, "payload");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("queueLoadNetworkTime"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("queueLoadNetworkTime"));

  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("queueIdentifier"));
  v58[0] = CFSTR("session-begin");
  v58[1] = CFSTR("session-restore-begin");
  v58[2] = CFSTR("session-migrate-begin");
  v58[3] = CFSTR("session-reset");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "findPreviousEventWithTypes:matchingPayload:", v27, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "payload");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("session-id"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, CFSTR("sessionIdentifier"));

  v56 = CFSTR("queue-section-id");
  v57 = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-load-begin"), v30);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "durationSinceEvent:", v47);
  objc_msgSend(v31, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, CFSTR("queueLoadDuration"));

  v54 = CFSTR("queue-section-id");
  v55 = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v7;
  objc_msgSend(v17, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), v33);
  v46 = v24;
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "payload");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("queue-reporting-metadata"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("feature-name"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v37, CFSTR("queueEndpoint"));

  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("application-bundle-id"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v38, CFSTR("queueBundleID"));

  -[MPCRTCEventConsumer _sessionCursorWithCursor:fromEvent:]((uint64_t)self, v48, v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("queue-add"), 0) == 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v41, CFSTR("initialQueue"));

  v42 = (void *)MEMORY[0x24BDD16E0];
  v52 = CFSTR("queue-section-id");
  v53 = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v17, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("queue-item-add"), v43));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v44, CFSTR("items"));

  return v8;
}

- (id)_payloadForItemAssetLoad:(id)a3 fromItemEvent:(id)a4
{
  id v6;
  id v7;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  MPCRTCEventConsumer *v98;
  void *v99;
  id v100;
  _QWORD v101[4];
  id v102;
  MPCRTCEventConsumer *v103;
  id v104;
  _QWORD v105[4];
  id v106;
  _QWORD v107[5];
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  _QWORD v114[3];
  const __CFString *v115;
  void *v116;
  const __CFString *v117;
  void *v118;
  uint8_t buf[4];
  void *v120;
  __int16 v121;
  void *v122;
  const __CFString *v123;
  void *v124;
  _QWORD v125[7];

  v125[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v100 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v98 = self;
  -[MPCRTCEventConsumer _accountSnapshotWithCursor:](self, "_accountSnapshotWithCursor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  objc_msgSend(v100, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("event"));

  -[MPCRTCEventConsumer _networkType:fromEvent:](self, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("networkType"));

  objc_msgSend(v100, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("queueIdentifier"));

  v125[0] = CFSTR("session-begin");
  v125[1] = CFSTR("session-restore-begin");
  v125[2] = CFSTR("session-migrate-begin");
  v125[3] = CFSTR("session-reset");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v125, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithTypes:matchingPayload:", v13, 0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v95, "payload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("session-id"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("sessionIdentifier"));

  objc_msgSend(v6, "cursorUntilEvent:", v95);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCRTCEventConsumer _firstItemAssetLoadEventWithCursor:fromEvent:matchingPayload:]((uint64_t)v98, v16, v100, 0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v93, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "isEqual:", v19));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("sessionStartItem"));

  v123 = CFSTR("queue-item-id");
  objc_msgSend(v100, "payload");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v99);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("item-is-start-item"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("queueStartItem"));

  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), 0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v92, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "isEqual:", v28));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("isCurrentItem"));

  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("item-ready-to-play"), v99);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (v94)
  {
    v30 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v94, "durationSinceEvent:", v97);
    objc_msgSend(v30, "numberWithDouble:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, CFSTR("readyToPlayTime"));

  }
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("item-configuration-end"), v99);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    objc_msgSend(v96, "payload");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("hls-metadata-wait-time"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("itemConfigHLSWaitTime"));

    objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("item-configuration-begin"), v99);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "durationSinceEvent:", v34);
    v36 = v35;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v37, CFSTR("itemConfigWaitTime"));

  }
  v108 = 0;
  v109 = &v108;
  v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__7515;
  v112 = __Block_byref_object_dispose__7516;
  objc_msgSend(v100, "type");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("item-first-audio-frame"));
  v40 = v100;
  if (!v39)
    v40 = 0;
  v113 = v40;

  objc_msgSend(v6, "cursorFromEvent:untilEvent:", v100, v97);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = MEMORY[0x24BDAC760];
  v107[1] = 3221225472;
  v107[2] = __62__MPCRTCEventConsumer__payloadForItemAssetLoad_fromItemEvent___block_invoke;
  v107[3] = &unk_24CABA670;
  v107[4] = &v108;
  objc_msgSend(v91, "enumeratePreviousEventsWithType:matchingPayload:usingBlock:", CFSTR("item-first-audio-frame"), v99, v107);
  if (v109[5])
  {
    -[MPCRTCEventConsumer _tapToPlayMetrics:fromItemStartEvent:](v98, "_tapToPlayMetrics:fromItemStartEvent:", v6);
    v41 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v41);
  }
  else
  {
    v41 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v100, "type");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCRTCEventConsumer dateFormatter](MPCRTCEventConsumer, "dateFormatter");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "date");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringFromDate:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v120 = v42;
      v121 = 2112;
      v122 = v45;
      _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, "MPCRTCEventConsumer: _payloadForItemAssetLoad: firstAudioFrame=nil from item event %@ at %@", buf, 0x16u);

    }
  }

  objc_msgSend(v100, "type");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v46, "isEqualToString:", CFSTR("asset-load-end")))
  {
    v47 = v100;
  }
  else
  {
    objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("asset-load-end"), v99);
    v47 = (id)objc_claimAutoreleasedReturnValue();
  }
  v48 = v47;

  if (v48)
  {
    objc_msgSend(v48, "payload");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("rtc-service-id"));
    v88 = objc_claimAutoreleasedReturnValue();

    if (v88)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v88, CFSTR("serviceName"));
    }
    else
    {
      v50 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        +[MPCRTCEventConsumer dateFormatter](MPCRTCEventConsumer, "dateFormatter");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "date");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "stringFromDate:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v120 = v53;
        _os_log_impl(&dword_210BD8000, v50, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _payloadForItemAssetLoad: serviceName=nil for assetLoadEndEvent date=%{public}@", buf, 0xCu);

      }
    }
    objc_msgSend(v48, "payload", v88);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("asset-load-error"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (v90)
    {

    }
    else
    {
      objc_msgSend(v100, "payload");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("asset-load-error"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v90)
      {
        v90 = 0;
        goto LABEL_24;
      }
    }
    -[MPCRTCEventConsumer _addErrors:toPayload:]((uint64_t)v98, v90, v7);
LABEL_24:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MPCRTCEventConsumer _itemWasPreviouslyLoaded:cursor:](v98, "_itemWasPreviouslyLoaded:cursor:", v100, v6));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v56, CFSTR("assetPreloaded"));

    objc_msgSend(v6, "cursorFromEvent:untilEvent:", v48, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "findPreviousEventWithType:matchingPayload:", CFSTR("asset-load-begin"), v99);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCRTCEventConsumer _updateAssetSelectionEvent:fromAssetLoadEndEvent:untilAssetLoadBeginEvent:cursor:](v98, "_updateAssetSelectionEvent:fromAssetLoadEndEvent:untilAssetLoadBeginEvent:cursor:", v7, v48, v58, v6);
    v59 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v48, "durationSinceEvent:", v58);
    objc_msgSend(v59, "numberWithDouble:");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v60, CFSTR("createAssetDuration"));

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cursorUntilEvent:", v58);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = MEMORY[0x24BDAC760];
    v105[1] = 3221225472;
    v105[2] = __62__MPCRTCEventConsumer__payloadForItemAssetLoad_fromItemEvent___block_invoke_40;
    v105[3] = &unk_24CAB3EA0;
    v63 = v61;
    v106 = v63;
    objc_msgSend(v62, "enumeratePreviousEventsWithType:usingBlock:", CFSTR("remote-control-begin"), v105);

    if (objc_msgSend(v63, "count"))
      objc_msgSend(v63, "componentsJoinedByString:", CFSTR(" "));
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v64, CFSTR("assetLoadCommandEvents"));

    -[MPCRTCEventConsumer _mediaIdentifierFromItemAssetLoadEndEvent:cursor:](v98, "_mediaIdentifierFromItemAssetLoadEndEvent:cursor:", v48, v6);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v65, CFSTR("MediaIdentifier"));

    -[MPCRTCEventConsumer _itemAssetTypeFromItemAssetLoadEvent:cursor:](v98, "_itemAssetTypeFromItemAssetLoadEvent:cursor:", v48, v6);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v66, "containsObject:", CFSTR("hls")));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v67, CFSTR("isHLS"));

    objc_msgSend(v66, "componentsJoinedByString:", CFSTR("."));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v68, CFSTR("assetType"));

    v69 = (void *)MEMORY[0x24BDD16E0];
    v117 = CFSTR("queue-section-id");
    objc_msgSend(v48, "payload");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v71;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "numberWithInteger:", objc_msgSend(v6, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("queue-item-add"), v72));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v73, CFSTR("itemQueueSize"));

  }
  objc_msgSend(v6, "cursorFromEvent:untilEvent:", v97, 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "findPreviousEventWithType:matchingPayload:", 0, 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "cursorFromEvent:untilEvent:", v75, 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v76, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v77;
  if (v77)
  {
    v115 = CFSTR("queue-item-id");
    objc_msgSend(v77, "payload");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v80;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "findPreviousEventWithType:matchingPayload:", CFSTR("asset-load-end"), v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      -[MPCRTCEventConsumer _itemAssetTypeFromItemAssetLoadEvent:cursor:](v98, "_itemAssetTypeFromItemAssetLoadEvent:cursor:", v82, v76);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "componentsJoinedByString:", CFSTR("."));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v84, CFSTR("previousItemAssetType"));

      v114[0] = CFSTR("application-termination");
      v114[1] = CFSTR("item-failed");
      v114[2] = CFSTR("item-end");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v114, 3);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = MEMORY[0x24BDAC760];
      v101[1] = 3221225472;
      v101[2] = __62__MPCRTCEventConsumer__payloadForItemAssetLoad_fromItemEvent___block_invoke_2;
      v101[3] = &unk_24CAB3EC8;
      v102 = v76;
      v103 = v98;
      v104 = v7;
      objc_msgSend(v102, "enumeratePreviousEventsWithTypes:usingBlock:", v85, v101);

    }
  }
  v86 = v7;

  _Block_object_dispose(&v108, 8);
  return v86;
}

- (id)_payloadForItemSummary:(id)a3 fromEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v7;
  }
  else
  {
    v14[0] = CFSTR("item-begin");
    v14[1] = CFSTR("item-first-audio-frame");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findPreviousEventWithTypes:matchingPayload:", v11, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[MPCRTCEventConsumer _payloadForItemSummary:fromItemEvent:](self, "_payloadForItemSummary:fromItemEvent:", v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_payloadForItemSummary:(id)a3 fromItemEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v37[4];
  id v38;
  MPCRTCEventConsumer *v39;
  id v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  _QWORD v45[4];

  v45[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = CFSTR("asset-load-end");
  v45[1] = CFSTR("item-failed");
  v45[2] = CFSTR("item-first-audio-frame");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = CFSTR("queue-item-id");
  objc_msgSend(v7, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __60__MPCRTCEventConsumer__payloadForItemSummary_fromItemEvent___block_invoke;
  v37[3] = &unk_24CAB3EC8;
  v13 = v6;
  v38 = v13;
  v39 = self;
  v14 = v8;
  v40 = v14;
  objc_msgSend(v13, "enumeratePreviousEventsWithTypes:matchingPayload:usingBlock:", v9, v12, v37);

  objc_msgSend(v7, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("event"));

  objc_msgSend(v14, "removeObjectForKey:", CFSTR("networkType"));
  objc_msgSend(v7, "type");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("item-begin")))
  {
    v17 = v7;
  }
  else
  {
    v41 = CFSTR("queue-item-id");
    objc_msgSend(v7, "payload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v20);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v13, "cursorFromEvent:untilEvent:", v7, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v21, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("network-type-changed"), 0));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, CFSTR("networkChangeCount"));

    -[MPCRTCEventConsumer _networkType:fromEvent:](self, v13, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, CFSTR("initialNetworkType"));

  }
  -[MPCRTCEventConsumer _networkType:fromEvent:](self, v13, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, CFSTR("finalNetworkType"));

  -[MPCRTCEventConsumer _reasonForEndEvent:cursor:](self, "_reasonForEndEvent:cursor:", v7, v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "isEqualToString:", CFSTR("fail")))
  {
    objc_msgSend(v7, "payload");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("asset-load-error"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCRTCEventConsumer _addErrors:toPayload:]((uint64_t)self, v28, v14);

  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v26, CFSTR("endReason"));
  objc_msgSend(v22, "findPreviousEventWithType:matchingPayload:", CFSTR("error-resolution"), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    objc_msgSend(v29, "payload");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("error-for-resolution"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v32, CFSTR("errorResolution"));

    objc_msgSend(v30, "payload");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("resolution-type"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, CFSTR("errorResolutionType"));

  }
  v35 = v14;

  return v35;
}

- (id)_reasonForEndEvent:(id)a3 cursor:(id)a4
{
  id v5;
  __CFString *v6;
  id v7;
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
  int v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  int v31;
  __CFString **v32;
  void *v33;
  void *v34;
  int v35;
  _QWORD v36[2];
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = CFSTR("unknown");
  v7 = a4;
  objc_msgSend(v7, "cursorFromEvent:untilEvent:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = CFSTR("queue-item-id");
  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqual:", v14) & 1) != 0)
    objc_msgSend(v7, "cursorUntilEvent:", v12);
  else
    objc_msgSend(v7, "cursorFromEvent:untilEvent:", v5, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "type");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToString:", CFSTR("item-failed")))
  {
    objc_msgSend(v5, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("asset-load-end"));

    if (v18)
      goto LABEL_7;
    objc_msgSend(v5, "payload");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("item-did-play-to-end"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");

    if (v25)
    {
      v19 = CFSTR("natural");
      goto LABEL_8;
    }
    if (!v12)
    {
      v19 = CFSTR("unknown");
      goto LABEL_10;
    }
    v36[0] = CFSTR("session-end");
    v36[1] = CFSTR("session-reset");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v15, "countOfPreviousEventsWithTypes:matchingPayload:", v26, 0);

    if (v27 >= 1)
    {
      v19 = CFSTR("endSession");
      goto LABEL_8;
    }
    objc_msgSend(v15, "findPreviousEventWithType:matchingPayload:", CFSTR("remote-control-begin"), 0);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = v28;
    if (v28)
    {
      -[__CFString payload](v28, "payload");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "unsignedIntValue");

      v19 = CFSTR("unknown");
      if (v31 > 121)
      {
        if (v31 != 122)
        {
          if (v31 != 131)
            goto LABEL_9;
          v32 = MPCRTCItemEndReasonPlayItemInQueue;
          goto LABEL_27;
        }
LABEL_26:
        v32 = MPCRTCItemEndReasonEndSession;
        goto LABEL_27;
      }
      if (v31 != 1)
      {
        if (v31 != 4)
          goto LABEL_9;
        v32 = MPCRTCItemEndReasonSkip;
LABEL_27:
        v19 = *v32;

        goto LABEL_9;
      }
      -[__CFString payload](v21, "payload");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("remote-control-source"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "containsString:", CFSTR("migrationPlaybackSession"));

      if (v35)
        goto LABEL_26;
    }
    v19 = CFSTR("unknown");
    goto LABEL_9;
  }

LABEL_7:
  v19 = CFSTR("fail");
LABEL_8:
  v20 = v19;
  v21 = CFSTR("unknown");
LABEL_9:

LABEL_10:
  return v19;
}

- (id)_itemStartIncitingEvent:(id)a3 fromItemStartEvent:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v13[8];
  _QWORD v14[5];
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v21[0] = CFSTR("remote-control-begin");
    v21[1] = CFSTR("item-end");
    v21[2] = CFSTR("session-reset");
    v21[3] = CFSTR("item-failed");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
    v7 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v16 = buf;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__7515;
    v19 = __Block_byref_object_dispose__7516;
    v20 = 0;
    objc_msgSend(v5, "cursorFromEvent:untilEvent:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __66__MPCRTCEventConsumer__itemStartIncitingEvent_fromItemStartEvent___block_invoke;
    v14[3] = &unk_24CABA670;
    v14[4] = buf;
    objc_msgSend(v8, "enumeratePreviousEventsWithTypes:usingBlock:", v7, v14);

    v9 = (void *)*((_QWORD *)v16 + 5);
    if (v9)
    {
      v10 = v9;
    }
    else
    {
      v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _itemStartIncitingEvent: sessionStartEvent=nil", v13, 2u);
      }

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _itemStartIncitingEvent: itemStartEvent=nil", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)_accountSnapshotWithCursor:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("account-begin");
  v12[1] = CFSTR("account-update");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findPreviousEventWithTypes:matchingPayload:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("account-metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("store-front-id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("StorefrontID"));

  }
  return v5;
}

- (id)_tapToPlayMetrics:(id)a3 fromItemStartEvent:(id)a4
{
  id v6;
  id v7;
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
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCRTCEventConsumer _itemStartIncitingEvent:fromItemStartEvent:](self, "_itemStartIncitingEvent:fromItemStartEvent:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "durationSinceEvent:", v9);
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("perceivedPlayStartTime"));

    objc_msgSend(v7, "payload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = CFSTR("queue-section-id");
    v30[1] = CFSTR("network-operation-type");
    v31[0] = v13;
    v31[1] = &unk_24CB16B00;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("network-operation"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "payload");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("queueLoadNetworkTime"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("queueLoadNetworkTime"));

    }
    objc_msgSend(v9, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqual:", CFSTR("remote-control-begin"));

    if (v19)
    {
      objc_msgSend(v9, "payload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("remote-control-options"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x24BE658A0]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v9, "date");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSinceReferenceDate");
        v26 = v25;
        objc_msgSend(v22, "doubleValue");
        objc_msgSend(v23, "numberWithDouble:", v26 - v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, CFSTR("commandSendTime"));

      }
    }

  }
  return v8;
}

- (id)_mediaIdentifierFromItemAssetLoadEndEvent:(id)a3 cursor:(id)a4
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-ids"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "universalStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCRTCEventConsumer rtcIdentifiersFromUniversalIdentifiers:](MPCRTCEventConsumer, "rtcIdentifiersFromUniversalIdentifiers:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("container-ids"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v30 = CFSTR("container-ids");
    v31[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("container-begin"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "payload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("container-kind"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "modelClass");
    if (v18 == objc_opt_class())
    {
      objc_msgSend(v15, "payload");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("container-metadata"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = v20;
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("container-radio-type"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "integerValue");

      if (v22 != 8)
      {
        if (v22 == 4)
          objc_msgSend(v10, "removeAllObjects");
        objc_msgSend(v5, "payload");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("container-ids"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "radio");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPCRTCEventConsumer rtcIdentifiersFromRadioIdentifiers:](MPCRTCEventConsumer, "rtcIdentifiersFromRadioIdentifiers:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addEntriesFromDictionary:", v25);

      }
    }

  }
  +[MPCRTCEventConsumer identifierStringFromItemIdentifiers:radioIdentifiers:](MPCRTCEventConsumer, "identifierStringFromItemIdentifiers:radioIdentifiers:", v10, v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)_itemAssetTypeFromItemAssetLoadEvent:(id)a3 cursor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  __CFString **v19;
  __CFString *v20;
  void *v21;
  char v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  __CFString *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  _QWORD v70[2];

  v70[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-ids"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("item-metadata"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = CFSTR("typeUnknown");
  objc_msgSend(v5, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("item-kind"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "modelClass");
  v62 = v10;
  if (v14 == objc_opt_class())
  {
    v18 = CFSTR("song");
    v20 = CFSTR("song");

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("item-has-video"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if ((v22 & 1) != 0)
    {
      v19 = MPCRTCAssetTypeMusicVideo;
      goto LABEL_11;
    }
LABEL_8:
    v64 = v18;
    goto LABEL_12;
  }
  v15 = objc_msgSend(v13, "modelClass");
  if (v15 == objc_opt_class())
  {
    v18 = CFSTR("typeUnknown");
    v19 = MPCRTCAssetTypeTVEpisode;
    goto LABEL_11;
  }
  v16 = objc_msgSend(v13, "modelClass");
  if (v16 == objc_opt_class())
  {
    v18 = CFSTR("typeUnknown");
    v19 = MPCRTCAssetTypeMovie;
    goto LABEL_11;
  }
  v17 = objc_msgSend(v13, "modelClass");
  v18 = CFSTR("typeUnknown");
  if (v17 != objc_opt_class())
    goto LABEL_8;
  v19 = MPCRTCAssetTypePlaylistEntry;
LABEL_11:
  v23 = *v19;

  v64 = v23;
LABEL_12:
  v24 = CFSTR("originUnknown");
  v25 = CFSTR("originUnknown");
  objc_msgSend(v5, "payload");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("container-ids"));
  v27 = objc_claimAutoreleasedReturnValue();

  v60 = (void *)v27;
  v61 = v13;
  if (!v27)
  {
    v63 = 0;
    v37 = 0;
    goto LABEL_23;
  }
  v69 = CFSTR("container-ids");
  v70[0] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("container-begin"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "payload");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("container-metadata"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "payload");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("container-kind"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_msgSend(v33, "modelClass");
  if (v34 == objc_opt_class())
  {
    v58 = v8;
    v24 = CFSTR("radio");
    v38 = CFSTR("radio");

    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("container-radio-type"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "integerValue");

    NSStringFromMPModelRadioStationType();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "lowercaseString");
    v41 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("container-radio-subtype"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "integerValue");

    if (!v43)
    {
      v63 = 0;
      v8 = v58;
      goto LABEL_22;
    }
    NSStringFromMPModelRadioStationSubtype();
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString lowercaseString](v44, "lowercaseString");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v58;
  }
  else
  {
    objc_msgSend(v8, "universalStore");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "subscriptionAdamID");

    if (v36 < 1)
      v24 = CFSTR("library");
    else
      v24 = CFSTR("subscription");
    v45 = v24;
    v63 = 0;
    v44 = CFSTR("originUnknown");
    v41 = (uint64_t)v64;
  }

LABEL_22:
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v24, v41, v63, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = (void *)v41;
LABEL_23:
  v67 = CFSTR("queue-item-id");
  objc_msgSend(v5, "payload");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v47;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    v59 = v8;
    v50 = v6;
    objc_msgSend(v6, "cursorUntilEvent:", v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = CFSTR("queue-section-id");
    objc_msgSend(v5, "payload");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v53;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "findPreviousEventWithType:matchingPayload:", CFSTR("item-hls-stream-begin"), v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
      objc_msgSend(v37, "addObject:", CFSTR("hls"));

    v6 = v50;
    v8 = v59;
  }
  v56 = v37;

  return v56;
}

- (BOOL)_itemWasPreviouslyLoaded:(id)a3 cursor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void *v29;
  id v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("item-begin")))
  {
    v8 = v5;
  }
  else
  {
    v33 = CFSTR("queue-item-id");
    objc_msgSend(v5, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = CFSTR("queue-item-id");
  objc_msgSend(v5, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __55__MPCRTCEventConsumer__itemWasPreviouslyLoaded_cursor___block_invoke;
  v29 = &unk_24CAB3EA0;
  v16 = v12;
  v30 = v16;
  objc_msgSend(v6, "enumeratePreviousEventsWithType:matchingPayload:usingBlock:", CFSTR("asset-load-end"), v15, &v26);

  objc_msgSend(v16, "msv_firstWhere:", &__block_literal_global_54, v26, v27, v28, v29);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = 0;
  if (v8 && v17)
  {
    objc_msgSend(v8, "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v22 = v21;
    objc_msgSend(v18, "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    v19 = v22 > v24;

  }
  return v19;
}

- (id)_underlyingErrorFromPayload:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;

  v3 = a3;
  v4 = CFSTR("errorDomain");
  v5 = CFSTR("errorCode");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("errorDomain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 0;
    v8 = 1;
    v9 = CFSTR("errorCode");
    v10 = CFSTR("errorDomain");
    do
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v3, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, objc_msgSend(v13, "integerValue"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%d"), CFSTR("errorDomain"), v8);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%d"), CFSTR("errorCode"), v8);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "objectForKeyedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (v8 + 1);
      v9 = v16;
      v10 = v15;
      v7 = v14;
    }
    while (v17);
  }
  else
  {
    v14 = 0;
    v15 = CFSTR("errorDomain");
    v16 = CFSTR("errorCode");
  }

  return v14;
}

- (void)_performABCSnapshotWithPayloadIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorJSON"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BE65C38];
    v7 = *MEMORY[0x24BE65AB0];
    v16[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v7, CFSTR("Bug"), CFSTR("FatalJSONError"), CFSTR("Encountered fatal error with underlying JSON"), 0, v8, 0);
  }
  else
  {
    -[MPCRTCEventConsumer _underlyingErrorFromPayload:](self, "_underlyingErrorFromPayload:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", *MEMORY[0x24BEC86C0]);

    if (v10 && (objc_msgSend(v8, "code") | 0x800) == 0xBE9)
    {
      v11 = (void *)MEMORY[0x24BE65C38];
      v12 = *MEMORY[0x24BE65AB0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Code %ld"), objc_msgSend(v8, "code"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v12, CFSTR("Bug"), CFSTR("ICStoreServerError"), v13, 0, v14, 0);

    }
  }

}

- (void)_updateAssetSelectionEvent:(id)a3 fromAssetLoadEndEvent:(id)a4 untilAssetLoadBeginEvent:(id)a5 cursor:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  uint8_t buf[8];
  _QWORD v48[3];
  _QWORD v49[4];

  v49[3] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("asset-load-end"));

  if ((v14 & 1) != 0)
  {
    objc_msgSend(v10, "previousItemEventWithCursor:type:", v12, CFSTR("asset-selection"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cursorFromEvent:untilEvent:", v10, v11);
      v43 = v12;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x24BDBD1C8];
      v48[0] = CFSTR("blocks-playback");
      v48[1] = CFSTR("queue-section-id");
      -[NSObject payload](v15, "payload");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v19;
      v48[2] = CFSTR("queue-item-id");
      -[NSObject payload](v15, "payload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
      v44 = v11;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __104__MPCRTCEventConsumer__updateAssetSelectionEvent_fromAssetLoadEndEvent_untilAssetLoadBeginEvent_cursor___block_invoke;
      v45[3] = &unk_24CAB3EA0;
      v46 = v16;
      v23 = v16;
      objc_msgSend(v17, "enumeratePreviousEventsWithType:matchingPayload:usingBlock:", CFSTR("network-operation"), v22, v45);

      -[NSObject payload](v15, "payload");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("asset-load-info"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("item-asset-has-online-keys"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("hasOnlineKeys"));

      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("item-asset-has-offline-keys"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("hasOfflineKeys"));

      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("item-asset-url"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "host");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      if (v29)
        v31 = (const __CFString *)v29;
      else
        v31 = CFSTR("localhost");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v31, CFSTR("ContentHostname"));

      objc_msgSend(v23, "objectForKeyedSubscript:", &unk_24CB16B18);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v32, CFSTR("suzeLeaseTime"));

      objc_msgSend(v23, "objectForKeyedSubscript:", &unk_24CB16B30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, CFSTR("bagWaitTime"));

      objc_msgSend(v23, "objectForKeyedSubscript:", &unk_24CB16B48);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v34, CFSTR("leaseWaitTime"));

      objc_msgSend(v23, "objectForKeyedSubscript:", &unk_24CB16B60);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v35, CFSTR("subscriptionWaitTime"));

      objc_msgSend(v23, "objectForKeyedSubscript:", &unk_24CB16B78);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v36, CFSTR("redownloadTime"));

      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("item-asset-is-delegated-playback"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v37, CFSTR("isDelegated"));

      objc_msgSend(v28, "scheme");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v38, CFSTR("urlScheme"));

      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("item-asset-is-subscription-content"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v39, CFSTR("isSubscription"));

      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("item-asset-type"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v40, CFSTR("audioType"));

      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("item-asset-endpoint-type"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v41, CFSTR("endpointType"));

      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("item-asset-source"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v42, CFSTR("assetInfoSource"));

      v11 = v44;
      v12 = v43;
    }
  }
  else
  {
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _updateAssetLoadInfoEvent requires MPCPlaybackEngineEventTypeItemAssetLoadEnd type", buf, 2u);
    }
  }

}

- (void)_generateConfiguredReportingSessionWithSamplingUUID:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  void (**v18)(id, _QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);

  if (WeakRetained)
  {
    v10[2](v10, 0);
  }
  else
  {
    -[MPCRTCEventConsumer _rtcSessionInfoWithSamplingUUID:](self, "_rtcSessionInfoWithSamplingUUID:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCRTCEventConsumer _rtcUserInfoWithServiceName:](self, "_rtcUserInfoWithServiceName:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7CA78]), "initWithSessionInfo:userInfo:frameworksToCheck:", v12, v13, 0);
    dispatch_group_enter((dispatch_group_t)self->_rtcGroup);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __98__MPCRTCEventConsumer__generateConfiguredReportingSessionWithSamplingUUID_serviceName_completion___block_invoke;
    v16[3] = &unk_24CAB6B58;
    v16[4] = self;
    v17 = v14;
    v18 = v10;
    v15 = v14;
    objc_msgSend(v15, "startConfigurationWithCompletionHandler:", v16);

  }
}

- (id)_rtcSessionInfoWithSamplingUUID:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  v15[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE7CAD8];
  v14[0] = *MEMORY[0x24BE7CAC8];
  v14[1] = v5;
  v15[0] = &unk_24CB16B90;
  v15[1] = &unk_24CB16BA8;
  v6 = *MEMORY[0x24BE7CB18];
  v14[2] = *MEMORY[0x24BE7CAA8];
  v14[3] = v6;
  v15[2] = MEMORY[0x24BDBD1C8];
  v15[3] = &unk_24CB16BC0;
  v14[4] = *MEMORY[0x24BE7CAB8];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE7CAE8];
  v15[4] = v8;
  v15[5] = MEMORY[0x24BDBD1C0];
  v10 = *MEMORY[0x24BE7CB08];
  v14[5] = v9;
  v14[6] = v10;
  v11 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[6] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

  }
  return v12;
}

- (id)_rtcUserInfoWithServiceName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = *MEMORY[0x24BE7CB20];
  v3 = (void *)MEMORY[0x24BDD1760];
  v4 = a3;
  objc_msgSend(v3, "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = *MEMORY[0x24BE7CB30];
  v10[0] = v6;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_sendReportWithSession:(id)a3 category:(int64_t)a4 type:(int64_t)a5 payload:(id)a6
{
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  NSObject *rtcQueue;
  NSObject *rtcGroup;
  _QWORD v16[4];
  id v17;
  id v18;
  int64_t v19;
  int64_t v20;

  v10 = a3;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);
  v13 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "performOnPayload:withCategory:type:", v11, a4, a5);
  }
  else
  {
    rtcGroup = self->_rtcGroup;
    rtcQueue = self->_rtcQueue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __68__MPCRTCEventConsumer__sendReportWithSession_category_type_payload___block_invoke;
    v16[3] = &unk_24CAB3F30;
    v17 = v10;
    v19 = a4;
    v20 = a5;
    v18 = v11;
    dispatch_group_notify(rtcGroup, rtcQueue, v16);

  }
}

- (void)_sendOneMessageWithCategory:(int64_t)a3 type:(int64_t)a4 payload:(id)a5
{
  id v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  id v32;
  uint8_t buf[4];
  _BYTE v34[14];
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  void *v38;
  _QWORD v39[5];

  v39[4] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sessionIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 1000:
      v10 = CFSTR("NetworkInterfaceChange");
      break;
    case 1001:
      v10 = CFSTR("SecureKeyLoad");
      break;
    case 1002:
      v10 = CFSTR("SessionStart");
      break;
    case 1003:
      v10 = CFSTR("SessionSummary");
      break;
    case 1004:
      v10 = CFSTR("QueueLoad");
      break;
    case 1005:
      v10 = CFSTR("ItemAssetLoad");
      break;
    case 1006:
      v10 = CFSTR("ItemSummary");
      break;
    default:
      if (a3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedCategory:%d"), a3);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = CFSTR("None");
      }
      break;
  }
  v11 = CFSTR("error");
  if (a4 == 1)
    v11 = CFSTR("nominal");
  v39[0] = v10;
  v39[1] = v11;
  v31 = v11;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("event"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("unknown-event");
  if (v12)
    v14 = (const __CFString *)v12;
  v39[2] = v14;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("analyticSignature"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &stru_24CABB5D0;
  if (v15)
    v17 = (const __CFString *)v15;
  v39[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v34 = v8;
      _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: missing samplingUID for payload=%{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE65C38], "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x24BE65AB0], CFSTR("Bug"), CFSTR("MPCRTCSamplingUUID"), CFSTR("Received nil samplingUUID"), 0, v18, 0);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MPCRTCEventConsumer _rtcSessionInfoWithSamplingUUID:](self, "_rtcSessionInfoWithSamplingUUID:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("serviceName"));
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v34 = v8;
      _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: missing serviceName for payload=%{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE65C38], "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x24BE65AB0], CFSTR("Bug"), CFSTR("MPCRTCServiceName"), CFSTR("Payload missing serviceName"), 0, v18, 0);
    v22 = CFSTR("app.music.unknown");
  }
  -[MPCRTCEventConsumer _rtcUserInfoWithServiceName:](self, "_rtcUserInfoWithServiceName:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(MEMORY[0x24BE7CA78], "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:", v21, v24, (unsigned __int16)a3, (unsigned __int16)a4, v8, &v32);
  v25 = v32;
  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
  v27 = v26;
  if (v25)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v30 = v18;
      switch(a3)
      {
        case 1000:
          v28 = CFSTR("NetworkInterfaceChange");
          break;
        case 1001:
          v28 = CFSTR("SecureKeyLoad");
          break;
        case 1002:
          v28 = CFSTR("SessionStart");
          break;
        case 1003:
          v28 = CFSTR("SessionSummary");
          break;
        case 1004:
          v28 = CFSTR("QueueLoad");
          break;
        case 1005:
          v28 = CFSTR("ItemAssetLoad");
          break;
        case 1006:
          v28 = CFSTR("ItemSummary");
          break;
        default:
          if (a3)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedCategory:%d"), a3);
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v28 = CFSTR("None");
          }
          break;
      }
      objc_msgSend(v25, "msv_description");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v34 = a3;
      *(_WORD *)&v34[4] = 2114;
      *(_QWORD *)&v34[6] = v28;
      v35 = 2114;
      v36 = v31;
      v37 = 2114;
      v38 = v29;
      _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: Sent one message. category=%d (%{public}@) type=%{public}@ error=%{public}@", buf, 0x26u);

LABEL_53:
      v18 = v30;
    }
  }
  else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v30 = v18;
    switch(a3)
    {
      case 1000:
        v28 = CFSTR("NetworkInterfaceChange");
        break;
      case 1001:
        v28 = CFSTR("SecureKeyLoad");
        break;
      case 1002:
        v28 = CFSTR("SessionStart");
        break;
      case 1003:
        v28 = CFSTR("SessionSummary");
        break;
      case 1004:
        v28 = CFSTR("QueueLoad");
        break;
      case 1005:
        v28 = CFSTR("ItemAssetLoad");
        break;
      case 1006:
        v28 = CFSTR("ItemSummary");
        break;
      default:
        if (a3)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedCategory:%d"), a3);
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v28 = CFSTR("None");
        }
        break;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v34 = a3;
    *(_WORD *)&v34[4] = 2114;
    *(_QWORD *)&v34[6] = v28;
    v35 = 2114;
    v36 = v31;
    _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEBUG, "MPCRTCEventConsumer: Sent one message. category=%d (%{public}@) type=%{public}@", buf, 0x1Cu);
    goto LABEL_53;
  }

}

- (MPCRTCEventConsumerTestingDelegate)testingDelegate
{
  return (MPCRTCEventConsumerTestingDelegate *)objc_loadWeakRetained((id *)&self->_testingDelegate);
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_cachedFirstItemAssetLoadEvent, 0);
  objc_storeStrong((id *)&self->_rtcQueue, 0);
  objc_storeStrong((id *)&self->_rtcGroup, 0);
}

void __68__MPCRTCEventConsumer__sendReportWithSession_category_type_payload___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  id v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(unsigned __int16 *)(a1 + 48);
    v4 = *(unsigned __int16 *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 40);
    v17 = 0;
    v6 = objc_msgSend(v2, "sendMessageWithCategory:type:payload:error:", v3, v4, v5, &v17);
    v7 = v17;
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    v9 = (__CFString *)v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v10 = *(_QWORD *)(a1 + 48);
        switch(v10)
        {
          case 1000:
            v11 = CFSTR("NetworkInterfaceChange");
            break;
          case 1001:
            v11 = CFSTR("SecureKeyLoad");
            break;
          case 1002:
            v11 = CFSTR("SessionStart");
            break;
          case 1003:
            v11 = CFSTR("SessionSummary");
            break;
          case 1004:
            v11 = CFSTR("QueueLoad");
            break;
          case 1005:
            v11 = CFSTR("ItemAssetLoad");
            break;
          case 1006:
            v11 = CFSTR("ItemSummary");
            break;
          default:
            if (v10)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedCategory:%d"), *(_QWORD *)(a1 + 48));
              v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v11 = CFSTR("None");
            }
            break;
        }
        v15 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 67109634;
        if (v15 == 1)
          v16 = CFSTR("nominal");
        else
          v16 = CFSTR("error");
        v19 = v10;
        v20 = 2114;
        v21 = v11;
        v22 = 2114;
        v23 = (void *)v16;
        _os_log_impl(&dword_210BD8000, (os_log_t)v9, OS_LOG_TYPE_DEBUG, "MPCRTCEventConsumer: Sent session message. category=%d (%{public}@) type=%{public}@", buf, 0x1Cu);

      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 48);
      switch(v13)
      {
        case 1000:
          v14 = CFSTR("NetworkInterfaceChange");
          break;
        case 1001:
          v14 = CFSTR("SecureKeyLoad");
          break;
        case 1002:
          v14 = CFSTR("SessionStart");
          break;
        case 1003:
          v14 = CFSTR("SessionSummary");
          break;
        case 1004:
          v14 = CFSTR("QueueLoad");
          break;
        case 1005:
          v14 = CFSTR("ItemAssetLoad");
          break;
        case 1006:
          v14 = CFSTR("ItemSummary");
          break;
        default:
          if (v13)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedCategory:%d"), *(_QWORD *)(a1 + 48));
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = CFSTR("None");
          }
          break;
      }
      *(_DWORD *)buf = 67109634;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_210BD8000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: RTC Message send failed. category=%d (%{public}@) error=%{public}@", buf, 0x1Cu);

    }
LABEL_45:

    goto LABEL_46;
  }
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 48);
    switch(v12)
    {
      case 1000:
        v9 = CFSTR("NetworkInterfaceChange");
        break;
      case 1001:
        v9 = CFSTR("SecureKeyLoad");
        break;
      case 1002:
        v9 = CFSTR("SessionStart");
        break;
      case 1003:
        v9 = CFSTR("SessionSummary");
        break;
      case 1004:
        v9 = CFSTR("QueueLoad");
        break;
      case 1005:
        v9 = CFSTR("ItemAssetLoad");
        break;
      case 1006:
        v9 = CFSTR("ItemSummary");
        break;
      default:
        if (v12)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedCategory:%d"), v12);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = CFSTR("None");
        }
        break;
    }
    *(_DWORD *)buf = 67109378;
    v19 = v12;
    v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: Can't send RTC message. session=nil. category=%d (%{public}@)", buf, 0x12u);
    goto LABEL_45;
  }
LABEL_46:

}

uint64_t __98__MPCRTCEventConsumer__generateConfiguredReportingSessionWithSamplingUUID_serviceName_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint8_t v5[16];

  if (!a2)
  {
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: [RTCReporting startConfigurationWithCompletionHandler:] failed with no backends", v5, 2u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __104__MPCRTCEventConsumer__updateAssetSelectionEvent_fromAssetLoadEndEvent_untilAssetLoadBeginEvent_cursor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("network-operation-type"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("network-metrics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  objc_msgSend(v6, "networkTime");
  objc_msgSend(v7, "numberWithDouble:", v10 + v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v13);

}

uint64_t __55__MPCRTCEventConsumer__itemWasPreviouslyLoaded_cursor___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", a2, 0);
}

BOOL __55__MPCRTCEventConsumer__itemWasPreviouslyLoaded_cursor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("asset-load-error"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

void __66__MPCRTCEventConsumer__itemStartIncitingEvent_fromItemStartEvent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v3;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "isEqualToString:", CFSTR("remote-control-begin"));

  if ((_DWORD)v8)
  {
    objc_msgSend(v18, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if ((v11 > 5 || ((1 << v11) & 0x35) == 0) && (v11 - 109 > 0x16 || ((1 << (v11 - 109)) & 0x402003) == 0))
      goto LABEL_18;
LABEL_17:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
    goto LABEL_18;
  }
  objc_msgSend(v18, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("item-end"));
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v18, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("item-did-play-to-end"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
      goto LABEL_10;
  }
  objc_msgSend(v18, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("item-failed")) & 1) != 0)
  {

    if ((v14 & 1) == 0)
    {
LABEL_11:

      goto LABEL_17;
    }
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v18, "type");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("session-reset"));

  if ((v14 & 1) != 0)
  {

  }
  if ((v17 & 1) != 0)
    goto LABEL_17;
LABEL_18:

}

void __60__MPCRTCEventConsumer__payloadForItemSummary_fromItemEvent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cursorFromEvent:untilEvent:", v8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPCRTCEventConsumer _shouldReportItemAssetLoad:forItemEvent:](*(_QWORD *)(a1 + 40), v5, v8))
  {
    v6 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "_payloadForItemAssetLoad:fromItemEvent:", v5, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v7);

    *a3 = 1;
  }

}

- (id)_networkType:(void *)a3 fromEvent:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v6)
    {
      objc_msgSend(v5, "cursorFromEvent:untilEvent:", v6, 0);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v8;
    }
    objc_msgSend(v5, "findPreviousEventWithType:matchingPayload:", CFSTR("network-type-changed"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "payload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("network-type"));
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = &unk_24CB16AE8;
    }

  }
  return a1;
}

- (void)_addErrors:(void *)a3 toPayload:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
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
  id v22;

  v22 = a2;
  v5 = a3;
  if (a1 && v22)
  {
    objc_msgSend(v22, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v22, "code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("errorCode"));

    v8 = v22;
    v9 = 0;
    v10 = *MEMORY[0x24BDD1398];
    v11 = 1;
    v21 = v8;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v8, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("errorDomain"), "stringByAppendingFormat:", CFSTR("-%d"), v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v15);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "code"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("errorCode"), "stringByAppendingFormat:", CFSTR("-%d"), v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v17);

      }
      else if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v13))
      {
        objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v13, 8, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v18, 4);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("errorJSON"));

        v9 = v8;
        v8 = 0;
        break;
      }
      v9 = v13;

      v11 = (v11 + 1);
      v8 = v9;
    }
    while (v9);

    objc_msgSend(v21, "msv_analyticSignature");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("analyticSignature"));

  }
}

- (uint64_t)_shouldReportItemAssetLoad:(void *)a3 forItemEvent:
{
  id v5;
  id v6;
  void *v7;
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
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v36;
  _QWORD v37[4];

  v37[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v37[0] = CFSTR("asset-load-end");
    v37[1] = CFSTR("item-failed");
    v37[2] = CFSTR("item-first-audio-frame");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (v9)
    {
      v35 = CFSTR("queue-item-id");
      objc_msgSend(v6, "payload");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "cursorFromEvent:untilEvent:", v6, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("item-begin");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "findPreviousEventWithTypes:matchingPayload:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_8;
      objc_msgSend(v15, "payload");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "payload");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "isEqualToString:", v19);

      if (!v20)
      {
LABEL_8:
        v22 = 0;
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v5, "cursorFromEvent:untilEvent:", v6, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-first-audio-frame"), v12) > 0)
        goto LABEL_6;
      objc_msgSend(v6, "type");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("item-first-audio-frame"));

      if ((v24 & 1) != 0)
      {
LABEL_10:
        v22 = 1;
        goto LABEL_11;
      }
      objc_msgSend(v6, "type");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("item-failed"));

      if (v27)
      {
        objc_msgSend(v21, "findPreviousEventWithType:matchingPayload:", CFSTR("asset-load-end"), v12);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          objc_msgSend(v28, "payload");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("asset-load-error"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {

            goto LABEL_10;
          }
        }
      }
      else
      {
        objc_msgSend(v6, "type");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "isEqualToString:", CFSTR("asset-load-end")))
        {
          objc_msgSend(v6, "payload");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("asset-load-error"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
            goto LABEL_10;
LABEL_6:
          v22 = 0;
LABEL_11:

          goto LABEL_12;
        }
      }

      goto LABEL_6;
    }
  }
  v22 = 0;
LABEL_13:

  return v22;
}

- (id)_firstItemAssetLoadEventWithCursor:(void *)a3 fromEvent:(void *)a4 matchingPayload:
{
  id v7;
  id v8;
  id *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  _BYTE v43[128];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v36 = a4;
  if (!a1)
  {
    v33 = 0;
    goto LABEL_30;
  }
  v9 = (id *)(a1 + 24);
  if (!*(_QWORD *)(a1 + 24)
    || (v10 = objc_msgSend(v8, "monotonicTimeNanoSeconds"), v10 < objc_msgSend(*v9, "monotonicTimeNanoSeconds"))
    || (v11 = objc_msgSend(*v9, "monotonicTimeNanoSeconds"),
        objc_msgSend(v7, "endEvent"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "monotonicTimeNanoSeconds"),
        v12,
        v11 < v13)
    || v36 && (objc_msgSend(*v9, "matchesPayload:", v36) & 1) == 0)
  {
    v46[0] = CFSTR("asset-load-end");
    v46[1] = CFSTR("item-failed");
    v46[2] = CFSTR("item-first-audio-frame");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 3, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "type");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "containsObject:", v16) & 1) != 0)
    {
      objc_msgSend(v7, "endEvent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "matchesPayload:", v36);

      if (v18)
      {
        objc_msgSend(v7, "endEvent");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *v9;
        *v9 = (id)v19;
        v8 = v35;
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = CFSTR("asset-load-end");
    v45[1] = CFSTR("item-failed");
    v45[2] = CFSTR("item-first-audio-frame");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
      v23 = v36;
    else
      v23 = (id)MEMORY[0x24BDBD1B8];
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __84__MPCRTCEventConsumer__firstItemAssetLoadEventWithCursor_fromEvent_matchingPayload___block_invoke;
    v41[3] = &unk_24CAB3EA0;
    v24 = v21;
    v42 = v24;
    objc_msgSend(v7, "enumeratePreviousEventsWithTypes:matchingPayload:usingBlock:", v22, v23, v41);

    v44[0] = CFSTR("asset-load-end");
    v44[1] = CFSTR("item-failed");
    v44[2] = CFSTR("item-first-audio-frame");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v35;
    objc_msgSend(v35, "type");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "containsObject:", v26))
      v27 = v35;
    else
      v27 = 0;
    objc_storeStrong((id *)(a1 + 24), v27);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v20 = v24;
    v28 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(v20);
          v32 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (-[MPCRTCEventConsumer _shouldReportItemAssetLoad:forItemEvent:](a1, v7, v32))
          {
            objc_storeStrong((id *)(a1 + 24), v32);
            goto LABEL_27;
          }
        }
        v29 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        if (v29)
          continue;
        break;
      }
    }
LABEL_27:

    goto LABEL_28;
  }
LABEL_29:
  v33 = *v9;
LABEL_30:

  return v33;
}

void __62__MPCRTCEventConsumer__payloadForItemAssetLoad_fromItemEvent___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __62__MPCRTCEventConsumer__payloadForItemAssetLoad_fromItemEvent___block_invoke_40(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "payload");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __62__MPCRTCEventConsumer__payloadForItemAssetLoad_fromItemEvent___block_invoke_2(id *a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(a1[4], "cursorFromEvent:untilEvent:", v7, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPCRTCEventConsumer _shouldReportItemSummary:forEvent:]((uint64_t)a1[5], v5, v7))
  {
    objc_msgSend(a1[5], "_reasonForEndEvent:cursor:", v7, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v6, CFSTR("previousItemEndReason"));

    *a3 = 1;
  }

}

- (BOOL)_shouldReportItemSummary:(void *)a3 forEvent:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  char v31;
  const __CFString *v32;
  void *v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_13;
  }
  -[MPCRTCEventConsumer _sessionCursorWithCursor:fromEvent:](a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = CFSTR("item-begin");
  v34[1] = CFSTR("item-first-audio-frame");
  v34[2] = CFSTR("item-failed");
  v34[3] = CFSTR("item-end");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithTypes:matchingPayload:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("item-end"));

  if (!v11)
  {
LABEL_7:
    if (!v9)
    {
LABEL_11:
      v18 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v9, "type");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("item-end")))
    {
LABEL_9:

      goto LABEL_11;
    }
    objc_msgSend(v9, "type");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("item-failed"));

    if ((v21 & 1) != 0)
      goto LABEL_11;
    objc_msgSend(v6, "type");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("item-failed")))
    {
      objc_msgSend(v9, "type");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "isEqualToString:", CFSTR("item-first-audio-frame")) & 1) != 0)
      {
        objc_msgSend(v9, "payload");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "payload");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v26, "isEqualToString:", v28);

        if ((v31 & 1) != 0)
          goto LABEL_22;
        goto LABEL_20;
      }

    }
LABEL_20:
    objc_msgSend(v6, "type");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("application-termination")) & 1) == 0)
      goto LABEL_9;
    objc_msgSend(v9, "type");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("item-first-audio-frame"));

    if ((v30 & 1) == 0)
      goto LABEL_11;
LABEL_22:
    v18 = 1;
    goto LABEL_12;
  }
  v32 = CFSTR("queue-item-id");
  objc_msgSend(v6, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cursorFromEvent:untilEvent:", v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "findPreviousEventWithType:matchingPayload:", CFSTR("item-failed"), v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (!v17
    && objc_msgSend(v16, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-first-audio-frame"), v14) <= 0)
  {

    goto LABEL_7;
  }

LABEL_12:
LABEL_13:

  return v18;
}

- (id)_sessionCursorWithCursor:(void *)a3 fromEvent:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v6)
    {
      objc_msgSend(v5, "cursorFromEvent:untilEvent:", v6, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v5;
    }
    v9 = v8;
    v14[0] = CFSTR("session-begin");
    v14[1] = CFSTR("session-restore-begin");
    v14[2] = CFSTR("session-migrate-begin");
    v14[3] = CFSTR("session-reset");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "findPreviousEventWithTypes:matchingPayload:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "cursorUntilEvent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __84__MPCRTCEventConsumer__firstItemAssetLoadEventWithCursor_fromEvent_matchingPayload___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", a2, 0);
}

void __59__MPCRTCEventConsumer__payloadForSessionSummary_fromEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  int v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  LODWORD(v4) = -[MPCRTCEventConsumer _shouldReportItemAssetLoad:forItemEvent:](v3, v4, v5);
  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v4)
  {
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("item-first-audio-frame"));

    v8 = a1 + 56;
    if (v7)
      v8 = a1 + 48;
  }
  else
  {
    v9 = objc_msgSend(v6, "isEqualToString:", CFSTR("item-failed"));

    if (!v9)
      return;
    v8 = a1 + 56;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24);
}

- (id)_networkSignalPayload:(uint64_t)a1
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v2 = (objc_class *)MEMORY[0x24BDBCED8];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  v17[0] = CFSTR("network-type-changed");
  v17[1] = CFSTR("network-reachability-changed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findPreviousEventWithTypes:matchingPayload:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("network-signal-info"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = MEMORY[0x24BDBD1B8];
    if (v8)
      v11 = v8;
    else
      v11 = MEMORY[0x24BDBD1B8];
    objc_msgSend(v4, "addEntriesFromDictionary:", v11);

    objc_msgSend(v6, "payload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("network-signal-strength"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = v13;
    else
      v15 = v10;
    objc_msgSend(v4, "addEntriesFromDictionary:", v15);

  }
  return v4;
}

void __64__MPCRTCEventConsumer__sendQueueLoadEventIfNeeded_forItemEvent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (-[MPCRTCEventConsumer _shouldReportItemAssetLoad:forItemEvent:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v6))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }

}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (-[MPCRTCEventConsumer _shouldReportSessionEnd:forEvent:](*(_QWORD *)(a1 + 32), v6, v5))
    objc_msgSend(*(id *)(a1 + 32), "_sendReportForSessionSummary:event:withType:", v6, v5, 1);

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (-[MPCRTCEventConsumer _shouldReportSessionEnd:forEvent:](*(_QWORD *)(a1 + 32), v6, v5))
    objc_msgSend(*(id *)(a1 + 32), "_sendReportForSessionSummary:event:withType:", v6, v5, 1);

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (-[MPCRTCEventConsumer _shouldReportSessionEnd:forEvent:](*(_QWORD *)(a1 + 32), v6, v5))
    objc_msgSend(*(id *)(a1 + 32), "_sendReportForSessionSummary:event:withType:", v6, v5, 1);
  if (-[MPCRTCEventConsumer _shouldReportItemSummary:forEvent:](*(_QWORD *)(a1 + 32), v6, v5))
    objc_msgSend(*(id *)(a1 + 32), "_sendReportForItemSummaryWithEndReason:cursor:event:", CFSTR("endSession"), v6, v5);

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("session-restoration-error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "_sendReportForSessionStart:event:withType:", v6, v5, 2);

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("session-migration-error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "_sendReportForSessionStart:event:withType:", v6, v5, 2);

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleReportingForItemStartEvent:event:", a3, a2);
  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = -[MPCRTCEventConsumer _shouldReportItemSummary:forEvent:](v5, v6, v7);
  v9 = *(void **)(a1 + 32);
  if (v8)
    objc_msgSend(v9, "_sendReportForItemSummaryWithEndReason:cursor:event:", CFSTR("fail"), v6, v7);
  else
    objc_msgSend(v9, "_handleReportingForItemStartEvent:event:", v6, v7);

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleReportingForItemStartEvent:event:", a3, a2);
  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (-[MPCRTCEventConsumer _shouldReportItemSummary:forEvent:](*(_QWORD *)(a1 + 32), v6, v5))
    objc_msgSend(*(id *)(a1 + 32), "_sendReportForItemSummary:event:", v6, v5);

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (-[MPCRTCEventConsumer _shouldReportSessionEnd:forEvent:](*(_QWORD *)(a1 + 32), v6, v5))
  {
    v12[0] = CFSTR("item-begin");
    v12[1] = CFSTR("item-first-audio-frame");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findPreviousEventWithTypes:matchingPayload:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("item-first-audio-frame"));

      if (v10)
        objc_msgSend(*(id *)(a1 + 32), "_sendReportForItemSummaryWithEndReason:cursor:event:", CFSTR("endSession"), v6, v5);
    }
    objc_msgSend(*(id *)(a1 + 32), "_sendReportForSessionSummary:event:withType:", v6, v5, 1);

  }
  return 1;
}

- (uint64_t)_shouldReportSessionEnd:(void *)a3 forEvent:
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a1)
  {
    -[MPCRTCEventConsumer _sessionCursorWithCursor:fromEvent:](a1, a2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-first-audio-frame"), 0))
    {
      objc_msgSend(v5, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("remote-control-begin"));

      if (v8)
      {
        objc_msgSend(v5, "payload");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "unsignedIntValue") == 1)
        {
          objc_msgSend(v5, "payload");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("remote-control-source"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsString:", CFSTR("migrationPlaybackSession"));

          if ((v13 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
      }
      objc_msgSend(v5, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("session-end")))
      {

LABEL_13:
        a1 = 1;
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v5, "type");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("session-reset"));

      if ((v16 & 1) != 0)
        goto LABEL_13;
      objc_msgSend(v5, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("application-termination"));

      if (v18)
      {
        v32[0] = CFSTR("item-first-audio-frame");
        v32[1] = CFSTR("session-end");
        v32[2] = CFSTR("session-reset");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "findPreviousEventWithTypes:matchingPayload:", v19, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "type");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("item-first-audio-frame"));

        if ((v22 & 1) != 0)
          goto LABEL_13;
      }
      v31[0] = CFSTR("session-begin");
      v31[1] = CFSTR("session-migrate-begin");
      v31[2] = CFSTR("session-restore-begin");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "containsObject:", v24);

      if (v25)
      {
        v30[0] = CFSTR("item-first-audio-frame");
        v30[1] = CFSTR("session-end");
        v30[2] = CFSTR("session-reset");
        v30[3] = CFSTR("application-termination");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "findPreviousEventWithTypes:matchingPayload:", v26, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "type");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = objc_msgSend(v28, "isEqualToString:", CFSTR("item-first-audio-frame"));

        goto LABEL_17;
      }
    }
    a1 = 0;
    goto LABEL_17;
  }
LABEL_18:

  return a1;
}

+ (id)identifierStringFromItemIdentifiers:(id)a3 radioIdentifiers:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = (void *)MEMORY[0x24BDD16A8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__MPCRTCEventConsumer_identifierStringFromItemIdentifiers_radioIdentifiers___block_invoke_2;
  v17[3] = &unk_24CAB3E38;
  v10 = v8;
  v18 = v10;
  objc_msgSend(v7, "msv_enumerateKeysAndObjectsOrderedByKeyComparator:usingBlock:", &__block_literal_global_7572, v17);

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __76__MPCRTCEventConsumer_identifierStringFromItemIdentifiers_radioIdentifiers___block_invoke_4;
  v15[3] = &unk_24CAB80F8;
  v11 = v10;
  v16 = v11;
  objc_msgSend(v6, "msv_enumerateKeysAndObjectsOrderedByKeyComparator:usingBlock:", &__block_literal_global_3, v15);

  v12 = v16;
  v13 = v11;

  return v13;
}

+ (id)rtcIdentifiersFromRadioIdentifiers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  const __CFString *v10;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stationStringID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_24CABB5D0;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("raid"));

  objc_msgSend(v4, "stationEventID");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = &stru_24CABB5D0;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("raidev"));

  return v5;
}

+ (id)rtcIdentifiersFromUniversalIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "adamID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("adamid"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "purchasedAdamID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("padamid"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "subscriptionAdamID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("sadamid"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "assetAdamID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("aadamid"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24CB16AE8, CFSTR("adamid"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CB16AE8, CFSTR("padamid"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CB16AE8, CFSTR("sadamid"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CB16AE8, CFSTR("aadamid"));
  }

  return v5;
}

+ (id)NSStringFromMPCRTCReportingEventCategory:(int64_t)a3
{
  __CFString *v3;
  id result;

  switch(a3)
  {
    case 1000:
      v3 = CFSTR("NetworkInterfaceChange");
      goto LABEL_3;
    case 1001:
      result = CFSTR("SecureKeyLoad");
      break;
    case 1002:
      result = CFSTR("SessionStart");
      break;
    case 1003:
      result = CFSTR("SessionSummary");
      break;
    case 1004:
      result = CFSTR("QueueLoad");
      break;
    case 1005:
      result = CFSTR("ItemAssetLoad");
      break;
    case 1006:
      result = CFSTR("ItemSummary");
      break;
    default:
      if (a3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedCategory:%d"), a3);
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
        result = v3;
      }
      else
      {
        result = CFSTR("None");
      }
      break;
  }
  return result;
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1)
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_25_7553);
  return (id)dateFormatter___formatter;
}

uint64_t __36__MPCRTCEventConsumer_dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)dateFormatter___formatter;
  dateFormatter___formatter = (uint64_t)v0;

  return objc_msgSend((id)dateFormatter___formatter, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss.SSSXX"));
}

void __76__MPCRTCEventConsumer_identifierStringFromItemIdentifiers_radioIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "stringValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@=%@,"), v5, v6);

}

uint64_t __76__MPCRTCEventConsumer_identifierStringFromItemIdentifiers_radioIdentifiers___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@=%@,"), a2, a3);
}

uint64_t __76__MPCRTCEventConsumer_identifierStringFromItemIdentifiers_radioIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __76__MPCRTCEventConsumer_identifierStringFromItemIdentifiers_radioIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end
