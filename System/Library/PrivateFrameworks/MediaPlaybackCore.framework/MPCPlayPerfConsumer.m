@implementation MPCPlayPerfConsumer

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.MediaPlaybackCore/PlayPerf");
}

uint64_t __69__MPCPlayPerfConsumer_setupErrorHandlerForEventType_errorKey_prefix___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", a1[4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = a1[5];
    objc_msgSend(v8, "msv_analyticSignature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@:%@"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)a1[6];
    +[MPCPlayPerfMetrics playMetricsWithErrorSignature:event:cursor:](MPCPlayPerfMetrics, "playMetricsWithErrorSignature:event:cursor:", v12, v5, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleMetrics:", v14);

  }
  return 1;
}

- (MPCPlayPerfConsumer)initWithPlaybackEngine:(id)a3
{
  id v4;
  MPCPlayPerfConsumer *v5;
  MPCPlayPerfConsumer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCPlayPerfConsumer;
  v5 = -[MPCPlayPerfConsumer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_playbackEngine, v4);

  return v6;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "publishPlaybackMetrics:", 0);
  return 1;
}

- (void)publishPlaybackMetrics:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  objc_msgSend(WeakRetained, "mediaRemotePublisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__MPCPlayPerfConsumer_publishPlaybackMetrics___block_invoke;
  block[3] = &unk_24CAB59B8;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)subscribeToEventStream:(id)a3
{
  id v5;
  uint64_t v6;
  MPCPlaybackEngineEventStreamSubscription *subscription;
  MPCPlaybackEngineEventStreamSubscription *v8;
  MPCPlaybackEngineEventStreamSubscription *v9;
  MPCPlaybackEngineEventStreamSubscription *v10;
  MPCPlaybackEngineEventStreamSubscription *v11;
  MPCPlaybackEngineEventStreamSubscription *v12;
  MPCPlaybackEngineEventStreamSubscription *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];

  objc_storeStrong((id *)&self->_subscription, a3);
  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  subscription = self->_subscription;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke;
  v20[3] = &unk_24CAB94A0;
  v20[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](subscription, "subscribeToEventType:handler:", CFSTR("item-begin"), v20);
  v8 = self->_subscription;
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_2;
  v19[3] = &unk_24CAB94A0;
  v19[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v8, "subscribeToEventType:handler:", CFSTR("perf-report"), v19);
  v9 = self->_subscription;
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_3;
  v18[3] = &unk_24CAB94A0;
  v18[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v9, "subscribeToEventType:handler:", CFSTR("item-ready-for-metrics"), v18);
  v10 = self->_subscription;
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_4;
  v17[3] = &unk_24CAB94A0;
  v17[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v10, "subscribeToEventType:handler:", CFSTR("remote-control-end"), v17);
  v11 = self->_subscription;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_5;
  v16[3] = &unk_24CAB94A0;
  v16[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v11, "subscribeToEventType:handler:", CFSTR("remote-control-timeout"), v16);
  -[MPCPlayPerfConsumer setupErrorHandlerForEventType:errorKey:prefix:](self, "setupErrorHandlerForEventType:errorKey:prefix:", CFSTR("asset-load-end"), CFSTR("asset-load-error"), CFSTR("AssetLoad"));
  -[MPCPlayPerfConsumer setupErrorHandlerForEventType:errorKey:prefix:](self, "setupErrorHandlerForEventType:errorKey:prefix:", CFSTR("queue-load-end"), CFSTR("queue-load-error"), CFSTR("QueueLoad"));
  -[MPCPlayPerfConsumer setupErrorHandlerForEventType:errorKey:prefix:](self, "setupErrorHandlerForEventType:errorKey:prefix:", CFSTR("session-migrate-end"), CFSTR("session-migration-error"), CFSTR("SessionMigrate"));
  -[MPCPlayPerfConsumer setupErrorHandlerForEventType:errorKey:prefix:](self, "setupErrorHandlerForEventType:errorKey:prefix:", CFSTR("session-restore-end"), CFSTR("session-restoration-error"), CFSTR("SessionRestore"));
  -[MPCPlayPerfConsumer setupErrorHandlerForEventType:errorKey:prefix:](self, "setupErrorHandlerForEventType:errorKey:prefix:", CFSTR("shared-session-synchronization-end"), CFSTR("shared-sync-error"), CFSTR("SharedSessionSynchronization"));
  -[MPCPlayPerfConsumer setupErrorHandlerForEventType:errorKey:prefix:](self, "setupErrorHandlerForEventType:errorKey:prefix:", CFSTR("session-activation-end"), CFSTR("session-activation-error"), CFSTR("SessionActivation"));
  -[MPCPlayPerfConsumer setupErrorHandlerForEventType:errorKey:prefix:](self, "setupErrorHandlerForEventType:errorKey:prefix:", CFSTR("item-failed"), CFSTR("asset-load-error"), CFSTR("PlayToEnd"));
  v12 = self->_subscription;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_6;
  v15[3] = &unk_24CAB94A0;
  v15[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v12, "subscribeToEventType:handler:", CFSTR("item-pause"), v15);
  v13 = self->_subscription;
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_7;
  v14[3] = &unk_24CAB94A0;
  v14[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v13, "subscribeToEventType:handler:", CFSTR("item-rate-changed"), v14);

}

- (void)setupErrorHandlerForEventType:(id)a3 errorKey:(id)a4 prefix:(id)a5
{
  id v8;
  id v9;
  MPCPlaybackEngineEventStreamSubscription *subscription;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  MPCPlayPerfConsumer *v16;

  v8 = a4;
  v9 = a5;
  subscription = self->_subscription;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__MPCPlayPerfConsumer_setupErrorHandlerForEventType_errorKey_prefix___block_invoke;
  v13[3] = &unk_24CAB4298;
  v14 = v8;
  v15 = v9;
  v16 = self;
  v11 = v9;
  v12 = v8;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](subscription, "subscribeToEventType:handler:", a3, v13);

}

void __46__MPCPlayPerfConsumer_publishPlaybackMetrics___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "updatePlaybackMetrics:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)unsubscribeFromEventStream:(id)a3
{
  MPCPlaybackEngineEventStreamSubscription *subscription;

  subscription = self->_subscription;
  self->_subscription = 0;

}

- (void)handleMetrics:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
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
  void *v18;
  int v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    goto LABEL_18;
  if (MSVDeviceOSIsInternalInstall() && (MSVDeviceIsInternalCarry() & 1) == 0)
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics_Oversize");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v6;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "PlayPerfJSON: %{public}@", buf, 0xCu);

    }
  }
  -[MPCPlayPerfConsumer playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("FirstItem")))
  {

LABEL_10:
    objc_msgSend(v7, "eventStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jsonObject", CFSTR("perf-metrics"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    v21[1] = CFSTR("queue-section-id");
    objc_msgSend(v4, "sectionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v13;
    v21[2] = CFSTR("queue-item-id");
    objc_msgSend(v4, "itemIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "emitEventType:payload:", CFSTR("perf-report"), v15);

    goto LABEL_11;
  }
  objc_msgSend(v4, "eventType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("NextItem"));

  if (v10)
    goto LABEL_10;
LABEL_11:
  -[MPCPlayPerfConsumer generatePlayPerfSignposts:](self, "generatePlayPerfSignposts:", v4);
  -[MPCPlayPerfConsumer sendMetricsToCoreAnalytics:](self, "sendMetricsToCoreAnalytics:", v4);
  objc_msgSend(v4, "eventType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FirstItem")) & 1) != 0)
  {
    objc_msgSend(v4, "siriRefId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[MPCPlayPerfConsumer sendMetricsToSiriSelfLogger:](self, "sendMetricsToSiriSelfLogger:", v4);
  }
  else
  {

  }
  objc_msgSend(v4, "eventType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("FirstItem"));

  if (v19)
  {
    objc_msgSend(v7, "player");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "donateMetricsToPlayerItem:", v4);

  }
LABEL_18:

}

- (void)generatePlayPerfSignposts:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  NSObject *v90;
  void *v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "eventType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("FirstItem"));

  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v7 = os_signpost_id_generate(v6);

    objc_msgSend(v3, "assetType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCPlayPerfConsumer analyticsContentType:](MPCPlayPerfConsumer, "analyticsContentType:", objc_msgSend(v8, "integerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "formatInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCPlayPerfConsumer analyticsFormat:](MPCPlayPerfConsumer, "analyticsFormat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = mach_continuous_time();
    v13 = v12 - mach_absolute_time();
    objc_msgSend(v3, "checkpointMRSetQueueBegin");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v3, "checkpointSetQueueBegin");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v18 = v17;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          objc_msgSend(v3, "checkpointMRSetQueueBegin");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = 134349570;
          v94 = objc_msgSend(v19, "longLongValue") + v13;
          v95 = 2082;
          v96 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
          v97 = 2082;
          v98 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SendQueue", "%{public, signpost.description:begin_time}llu,contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s", (uint8_t *)&v93, 0x20u);

        }
        v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v21 = v20;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          objc_msgSend(v3, "checkpointSetQueueBegin");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "longLongValue");
          v93 = 134349056;
          v94 = v23 + v13;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v21, OS_SIGNPOST_INTERVAL_END, v7, "SendQueue", "%{public, signpost.description:end_time}llu,", (uint8_t *)&v93, 0xCu);

        }
      }
    }
    objc_msgSend(v3, "checkpointSetQueueBegin");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      objc_msgSend(v3, "checkpointAssetLoadBegin");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v28 = v27;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          objc_msgSend(v3, "checkpointSetQueueBegin");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "longLongValue") + v13;
          v31 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
          v32 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          v93 = 134349570;
          v94 = v30;
          v95 = 2082;
          v96 = v31;
          v97 = 2082;
          v98 = v32;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SetQueue", "%{public, signpost.description:begin_time}llu,contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s", (uint8_t *)&v93, 0x20u);

        }
        v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v34 = v33;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          objc_msgSend(v3, "checkpointAssetLoadBegin");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "longLongValue");
          v93 = 134349056;
          v94 = v36 + v13;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v34, OS_SIGNPOST_INTERVAL_END, v7, "SetQueue", "%{public, signpost.description:end_time}llu,", (uint8_t *)&v93, 0xCu);

        }
      }
    }
    objc_msgSend(v3, "checkpointAssetLoadEnd");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)v37;
      objc_msgSend(v3, "checkpointLikelyToKeepUp");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        v40 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v41 = v40;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          objc_msgSend(v3, "checkpointAssetLoadEnd");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "longLongValue") + v13;
          v44 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
          v45 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          v93 = 134349570;
          v94 = v43;
          v95 = 2082;
          v96 = v44;
          v97 = 2082;
          v98 = v45;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v7, "WaitForLikelyToKeepUp", "%{public, signpost.description:begin_time}llu,contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s", (uint8_t *)&v93, 0x20u);

        }
        v46 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v47 = v46;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          objc_msgSend(v3, "checkpointLikelyToKeepUp");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "longLongValue");
          v93 = 134349056;
          v94 = v49 + v13;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v47, OS_SIGNPOST_INTERVAL_END, v7, "WaitForLikelyToKeepUp", "%{public, signpost.description:end_time}llu,", (uint8_t *)&v93, 0xCu);

        }
      }
    }
    objc_msgSend(v3, "checkpointAssetLoadEnd");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      v51 = (void *)v50;
      objc_msgSend(v3, "checkpointReadyToPlay");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        v53 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v54 = v53;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
        {
          objc_msgSend(v3, "checkpointAssetLoadEnd");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "longLongValue") + v13;
          v57 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
          v58 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          v93 = 134349570;
          v94 = v56;
          v95 = 2082;
          v96 = v57;
          v97 = 2082;
          v98 = v58;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v7, "WaitForReadyToPlay", "%{public, signpost.description:begin_time}llu,contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s", (uint8_t *)&v93, 0x20u);

        }
        v59 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v60 = v59;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
        {
          objc_msgSend(v3, "checkpointReadyToPlay");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "longLongValue");
          v93 = 134349056;
          v94 = v62 + v13;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v60, OS_SIGNPOST_INTERVAL_END, v7, "WaitForReadyToPlay", "%{public, signpost.description:end_time}llu,", (uint8_t *)&v93, 0xCu);

        }
      }
    }
    objc_msgSend(v3, "checkpointReadyToPlay");
    v63 = objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      v64 = (void *)v63;
      objc_msgSend(v3, "checkpointRateOne");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (v65)
      {
        objc_msgSend(v3, "checkpointReadyToPlay");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "longLongValue");

        objc_msgSend(v3, "checkpointPlay");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          objc_msgSend(v3, "checkpointPlay");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v69, "longLongValue");

          if (v67 <= v70)
            v67 = v70;
        }
        v71 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v72 = v71;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
        {
          v73 = v67 + v13;
          v74 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
          v75 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          v93 = 134349570;
          v94 = v73;
          v95 = 2082;
          v96 = v74;
          v97 = 2082;
          v98 = v75;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v72, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PlayToSetRate", "%{public, signpost.description:begin_time}llu,contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s", (uint8_t *)&v93, 0x20u);
        }

        v76 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v77 = v76;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
        {
          objc_msgSend(v3, "checkpointRateOne");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v78, "longLongValue");
          v93 = 134349056;
          v94 = v79 + v13;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v77, OS_SIGNPOST_INTERVAL_END, v7, "PlayToSetRate", "%{public, signpost.description:end_time}llu,", (uint8_t *)&v93, 0xCu);

        }
      }
    }
    objc_msgSend(v3, "checkpointRateOne");
    v80 = objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      v81 = (void *)v80;
      objc_msgSend(v3, "checkpointFirstAudioFrame");
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (v82)
      {
        v83 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v84 = v83;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
        {
          objc_msgSend(v3, "checkpointRateOne");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "longLongValue") + v13;
          v87 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
          v88 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          v93 = 134349570;
          v94 = v86;
          v95 = 2082;
          v96 = v87;
          v97 = 2082;
          v98 = v88;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v84, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SetRateToEffectiveRate", "%{public, signpost.description:begin_time}llu,contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s", (uint8_t *)&v93, 0x20u);

        }
        v89 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v90 = v89;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
        {
          objc_msgSend(v3, "checkpointFirstAudioFrame");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v91, "longLongValue");
          v93 = 134349056;
          v94 = v92 + v13;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v90, OS_SIGNPOST_INTERVAL_END, v7, "SetRateToEffectiveRate", "%{public, signpost.description:end_time}llu,", (uint8_t *)&v93, 0xCu);

        }
      }
    }

  }
}

- (void)sendMetricsToCoreAnalytics:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "eventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreAnalyticsEventNameWithEventType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__MPCPlayPerfConsumer_sendMetricsToCoreAnalytics___block_invoke;
    v8[3] = &unk_24CAB42C0;
    v9 = v3;
    v10 = v6;
    v7 = _Block_copy(v8);
    AnalyticsSendEventLazy();

  }
}

- (void)sendMetricsToSiriSelfLogger:(id)a3
{
  void *v4;
  char v5;
  NSString *v6;
  NSString *lastSiriReferenceIdentifier;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "siriRefId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", self->_lastSiriReferenceIdentifier);

  if ((v5 & 1) == 0)
  {
    +[MPCSiriSelfLogger sendMetrics:](MPCSiriSelfLogger, "sendMetrics:", v8);
    objc_msgSend(v8, "siriRefId");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    lastSiriReferenceIdentifier = self->_lastSiriReferenceIdentifier;
    self->_lastSiriReferenceIdentifier = v6;

  }
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
  objc_storeStrong((id *)&self->_lastSiriReferenceIdentifier, 0);
}

id __50__MPCPlayPerfConsumer_sendMetricsToCoreAnalytics___block_invoke(uint64_t a1)
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
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
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  NSObject *v140;
  uint64_t v141;
  int v143;
  uint64_t v144;
  __int16 v145;
  void *v146;
  uint64_t v147;

  v147 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("app"));

  objc_msgSend(*(id *)(a1 + 32), "assetCacheAge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("assetCacheAge"));

  objc_msgSend(*(id *)(a1 + 32), "assetLoadWaitTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("assetLoadWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "assetLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("assetLocation"));

  objc_msgSend(*(id *)(a1 + 32), "assetProtectionType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("assetProtectionType"));

  objc_msgSend(*(id *)(a1 + 32), "assetSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("assetSource"));

  objc_msgSend(*(id *)(a1 + 32), "assetType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("assetType"));

  objc_msgSend(*(id *)(a1 + 32), "avTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("avTime"));

  objc_msgSend(*(id *)(a1 + 32), "bagWaitTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("bagWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "endpointType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("endpointType"));

  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "errorResolution");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInt:", v15 != 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("errorResolutionApplied"));

  objc_msgSend(*(id *)(a1 + 32), "errorSignature");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("errorSignature"));

  objc_msgSend(*(id *)(a1 + 32), "experimentID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v18, CFSTR("experimentID"));

  objc_msgSend(*(id *)(a1 + 32), "featureName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("featureName"));

  objc_msgSend(*(id *)(a1 + 32), "firstAudioFrameWaitTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, CFSTR("firstAudioFrameWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "formatInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("bitDepth"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("formatInfoBitDepth"));

  objc_msgSend(*(id *)(a1 + 32), "formatInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("bitrate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v24, CFSTR("formatInfoBitrate"));

  objc_msgSend(*(id *)(a1 + 32), "formatInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("channelLayout"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v26, CFSTR("formatInfoChannelLayout"));

  objc_msgSend(*(id *)(a1 + 32), "formatInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("codec"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v28, CFSTR("formatInfoCodec"));

  objc_msgSend(*(id *)(a1 + 32), "formatInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("multiChannel"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v30, CFSTR("formatInfoMultiChannel"));

  objc_msgSend(*(id *)(a1 + 32), "formatInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("sampleRate"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v32, CFSTR("formatInfoSampleRate"));

  objc_msgSend(*(id *)(a1 + 32), "formatInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("spatialized"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v34, CFSTR("formatInfoSpartialized"));

  objc_msgSend(*(id *)(a1 + 32), "formatInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("tier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v36, CFSTR("formatInfoTier"));

  objc_msgSend(*(id *)(a1 + 32), "hasAccountInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v37, CFSTR("hasAccountInfo"));

  v38 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "leaseWaitTime");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "doubleValue");
  objc_msgSend(v38, "numberWithInt:", v40 > 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v41, CFSTR("hasLeaseWaitTime"));

  v42 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "lookupWaitTime");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "doubleValue");
  objc_msgSend(v42, "numberWithInt:", v44 > 0.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v45, CFSTR("hasLookupWaitTime"));

  v46 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "mediaRedownloadWaitTime");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "doubleValue");
  objc_msgSend(v46, "numberWithInt:", v48 > 0.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v49, CFSTR("hasMediaRedownloadWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "hasOfflinePlaybackKeys");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v50, CFSTR("hasOfflinePlaybackKeys"));

  objc_msgSend(*(id *)(a1 + 32), "hasOnlinePlaybackKeys");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v51, CFSTR("hasOnlinePlaybackKeys"));

  v52 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "subscriptionAssetLoadWaitTime");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "doubleValue");
  objc_msgSend(v52, "numberWithInt:", v54 > 0.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v55, CFSTR("hasSubscriptionAssetLoadWaitTime"));

  v56 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "suzeLeaseWaitTime");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "doubleValue");
  objc_msgSend(v56, "numberWithInt:", v58 > 0.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v59, CFSTR("hasSuzeLeaseWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "hlsMetadataWaitTime");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v60, CFSTR("hlsMetadataWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "isActiveAccount");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v61, CFSTR("isActiveAccount"));

  objc_msgSend(*(id *)(a1 + 32), "isAutoPlayEnabled");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v62, CFSTR("isAutoPlayEnabled"));

  objc_msgSend(*(id *)(a1 + 32), "isDelegatedPlayback");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v63, CFSTR("isDelegatedPlayback"));

  objc_msgSend(*(id *)(a1 + 32), "itemMetadata");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("item-is-start-item"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v65, CFSTR("isFirstItem"));

  objc_msgSend(*(id *)(a1 + 32), "isFirstPlay");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v66, CFSTR("isFirstPlay"));

  objc_msgSend(*(id *)(a1 + 32), "isRemoteSetQueue");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v67, CFSTR("isRemoteSetQueue"));

  objc_msgSend(*(id *)(a1 + 32), "isReplacingPlayback");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v68, CFSTR("isReplacingPlayback"));

  objc_msgSend(*(id *)(a1 + 32), "isSharePlay");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v69, CFSTR("isSharePlay"));

  objc_msgSend(*(id *)(a1 + 32), "isShuffled");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v70, CFSTR("isShuffled"));

  objc_msgSend(*(id *)(a1 + 32), "leaseWaitTime");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v71, CFSTR("leaseWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "lookupWaitTime");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v72, CFSTR("lookupWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "mediaPlayerTime");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v73, CFSTR("mediaPlayerTime"));

  objc_msgSend(*(id *)(a1 + 32), "mediaRedownloadWaitTime");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v74, CFSTR("mediaRedownloadWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "musicWaitTime");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v75, CFSTR("musicWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "networkType");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v76, CFSTR("networkType"));

  objc_msgSend(*(id *)(a1 + 32), "networkTime");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v77, CFSTR("networkTime"));

  objc_msgSend(*(id *)(a1 + 32), "playCommandSendTime");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v78, CFSTR("playCommandSendTime"));

  objc_msgSend(*(id *)(a1 + 32), "playCommandWaitTime");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v79, CFSTR("playCommandWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "queueCommandType");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v80, CFSTR("queueCommandType"));

  objc_msgSend(*(id *)(a1 + 32), "queueLoadWaitTime");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v81, CFSTR("queueLoadWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "queueType");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v82, CFSTR("queueType"));

  objc_msgSend(*(id *)(a1 + 32), "rateChangeWaitTime");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v83, CFSTR("rateChangeWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "readyToPlayStatusWaitTime");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v84, CFSTR("readyToPlayStatusWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "routeInfo");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("type"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v86, CFSTR("routeInfoType"));

  objc_msgSend(*(id *)(a1 + 32), "seekBeforePlaying");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v87, CFSTR("seekBeforePlaying"));

  objc_msgSend(*(id *)(a1 + 32), "sessionActivationAVTime");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v88, CFSTR("sessionActivationAVTime"));

  objc_msgSend(*(id *)(a1 + 32), "sessionActivationWaitTime");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v89, CFSTR("sessionActivationTime"));

  objc_msgSend(*(id *)(a1 + 32), "setQueueCommandSendTime");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v90, CFSTR("setQueueCommandSendTime"));

  objc_msgSend(*(id *)(a1 + 32), "storefront");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v91, CFSTR("storefront"));

  objc_msgSend(*(id *)(a1 + 32), "subscriptionAssetLoadWaitTime");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v92, CFSTR("subscriptionAssetLoadWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "subscriptionType");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v93, CFSTR("subscriptionType"));

  objc_msgSend(*(id *)(a1 + 32), "suzeLeaseWaitTime");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v94, CFSTR("suzeLeaseWaitTime"));

  objc_msgSend(*(id *)(a1 + 32), "treatmentID");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v95, CFSTR("treatmentID"));

  objc_msgSend(*(id *)(a1 + 32), "timeSinceBoot");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v96, CFSTR("timeSinceBoot"));

  objc_msgSend(*(id *)(a1 + 32), "timeSinceLaunch");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v97, CFSTR("timeSinceLaunch"));

  objc_msgSend(*(id *)(a1 + 32), "timeSincePaused");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v98, CFSTR("timeSincePaused"));

  objc_msgSend(*(id *)(a1 + 32), "musicTotalTime");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v99, CFSTR("totalTime"));

  objc_msgSend(*(id *)(a1 + 32), "nextItemWaitTime");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v100, CFSTR("gapTime"));

  objc_msgSend(*(id *)(a1 + 32), "vocalsControlActive");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v101, CFSTR("vocalsControlActive"));

  objc_msgSend(*(id *)(a1 + 32), "AVPlayerItemPerformanceMetrics");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v102;
  if (v102)
  {
    objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("BufferedAirPlay"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v104, CFSTR("avBufferedAirPlay"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("CKFetchTime"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v105, CFSTR("avCKFetchTime"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("IndexResponseCount"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v106, CFSTR("avIndexResponseCount"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("IndexResponseTime0"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v107, CFSTR("avIndexResponseTime0"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("IndexResponseTimeSum"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v108, CFSTR("avIndexResponseTimeSum"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("indicatedBitrate"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v109, CFSTR("avIndicatedBitrate"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("MediaFile2CKCount"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v110, CFSTR("avMediaFile2CKCount"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("MediaFile2CKTime"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v111, CFSTR("avMediaFile2CKTime"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("MVPResponseCount"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v112, CFSTR("avMVPResponseCount"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("MVPResponseTime0"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v113, CFSTR("avMVPResponseTime0"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("MVPResponseTimeSum"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v114, CFSTR("avMVPResponseTimeSum"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("numberOfBytesTransferred"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v115, CFSTR("avNumberOfBytesTransferred"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("observedBitrate"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v116, CFSTR("avObservedBitrate"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("PPTime"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v117, CFSTR("avPPTime"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("ReadyToPlayTime"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v118, CFSTR("avReadyToPlayTime"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("RequestCount"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v119, CFSTR("avRequestCount"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("RequestTimeSum"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v120, CFSTR("avRequestTimeSum"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("SchedulingDelayCount"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v121, CFSTR("avSchedulingDelayCount"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("SchedulingDelayTimeSum"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v122, CFSTR("avSchedulingDelayTimeSum"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("segmentsDownloadedDuration"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v123, CFSTR("avSegmentsDownloadedDuration"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("startupTime"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v124, CFSTR("avStartupTime"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("tfac2ICreate"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v125, CFSTR("avTfac2ICreate"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("tfac2ICurrent"));
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v126, CFSTR("avTfac2ICurrent"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("tfac2IEnqueued"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v127, CFSTR("avTfac2IEnqueued"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("tfac2IReady"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v128, CFSTR("avTfac2IReady"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("tfac2NWStart"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v129, CFSTR("avTfac2NWStart"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("tfac2RPCreate"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v130, CFSTR("avTfac2RPCreate"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("tfac2RPCreateEnd"));
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v131, CFSTR("avTfac2RPCreateEnd"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("tfac2SetRate"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v132, CFSTR("avTfac2SetRate"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("tfac2SetRateEnd"));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v133, CFSTR("avTfac2SetRateEnd"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("TimeItemToCurrent"));
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v134, CFSTR("avTimeItemToCurrent"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("TimeItemToEnqueue"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v135, CFSTR("avTimeItemToEnqueue"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("TimeItemToLTKU"));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v136, CFSTR("avTimeItemToLTKU"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("TimeLTKPToStart"));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v137, CFSTR("avTimeLTKPToStart"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("TimeLTKUToSTimebaseChange"));
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v138, CFSTR("avTimeLTKUToSTimebaseChange"));

    objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("TimeUntilOutputStart"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v139, CFSTR("avTimeUntilOutputStart"));

  }
  if (MSVDeviceOSIsInternalInstall())
  {
    v140 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics_Oversize");
    if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
    {
      v141 = *(_QWORD *)(a1 + 40);
      v143 = 138543618;
      v144 = v141;
      v145 = 2114;
      v146 = v2;
      _os_log_impl(&dword_210BD8000, v140, OS_LOG_TYPE_DEBUG, "PlayPerfEvent: Logging CoreAnalytics event %{public}@ with payload:\n%{public}@", (uint8_t *)&v143, 0x16u);
    }

  }
  return v2;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("perf-metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publishPlaybackMetrics:", v4);

  return 1;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  +[MPCPlayPerfMetrics playMetricsWithItemReadyForMetricsEvent:cursor:](MPCPlayPerfMetrics, "playMetricsWithItemReadyForMetricsEvent:cursor:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "handleMetrics:", v4);

  return 1;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("remote-control-status"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "type") == 3)
  {
    objc_msgSend(v9, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "payload");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "unsignedIntValue");

      v14 = (void *)MRMediaRemoteCopyCommandDescription();
      v15 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v9, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "msv_analyticSignature");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Command:%@:%@"), v14, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = *(void **)(a1 + 32);
      +[MPCPlayPerfMetrics playMetricsWithErrorSignature:event:cursor:](MPCPlayPerfMetrics, "playMetricsWithErrorSignature:event:cursor:", v18, v5, v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleMetrics:", v20);

    }
  }

  return 1;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unsignedIntValue");

  v9 = (void *)MRMediaRemoteCopyCommandDescription();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Command:%@:Timeout"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  +[MPCPlayPerfMetrics playMetricsWithErrorSignature:event:cursor:](MPCPlayPerfMetrics, "playMetricsWithErrorSignature:event:cursor:", v10, v6, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "handleMetrics:", v12);
  return 1;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_6(uint64_t a1, void *a2, void *a3)
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

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-rate-change-reason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("item-rate-change-source"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("error")))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ItemPause:%@:%@"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    +[MPCPlayPerfMetrics playMetricsWithErrorSignature:event:cursor:](MPCPlayPerfMetrics, "playMetricsWithErrorSignature:event:cursor:", v11, v5, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleMetrics:", v13);

  }
  return 1;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_7(uint64_t a1, void *a2, void *a3)
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

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-rate-change-reason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("item-rate-change-source"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB20A0]))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ItemRateChange:%@:%@"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    +[MPCPlayPerfMetrics playMetricsWithErrorSignature:event:cursor:](MPCPlayPerfMetrics, "playMetricsWithErrorSignature:event:cursor:", v11, v5, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleMetrics:", v13);

  }
  return 1;
}

+ (id)analyticsContentType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return &stru_24CABB5D0;
  else
    return off_24CAB42E0[a3 - 1];
}

+ (id)analyticsFormat:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned __int16 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v21;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("codec"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = bswap32(v5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c"), v6, BYTE1(v6), BYTE2(v6), HIBYTE(v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bitrate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("channelLayout"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sampleRate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bitrate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "integerValue");
  if (v11 >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%ldkbps,%ld"), v9, v11 / 0x3E8uLL, v13);
LABEL_5:
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v15 >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%ldkhz,%ld"), v9, v15 / 0x3E8uLL, v17);
    goto LABEL_5;
  }
  v21 = &stru_24CABB5D0;
  if (v9)
    v21 = v9;
  v18 = v21;
LABEL_6:
  v19 = v18;

  return v19;
}

+ (id)coreAnalyticsEventNameWithEventType:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FirstItem")) & 1) != 0)
  {
    v4 = CFSTR("com.apple.amp.mediaplayer.playperf.FirstItem");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NextItem")) & 1) != 0)
  {
    v4 = CFSTR("com.apple.amp.mediaplayer.playperf.NextItem");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PlayError")))
  {
    v4 = CFSTR("com.apple.amp.mediaplayer.playperf.PlayError");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

@end
