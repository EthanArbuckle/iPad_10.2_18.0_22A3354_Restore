@implementation MPCPlayActivityFeedEventConsumer

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.MediaPlaybackCore/PAF");
}

uint64_t __71__MPCPlayActivityFeedEventConsumer__updateAllowedBundleIdsIfNecessary___block_invoke()
{
  return _NSIsNSString();
}

- (MPCPlayActivityFeedEventConsumer)init
{
  MPCPlayActivityFeedEventConsumer *v2;
  NSArray *allowedBundleIds;
  NSObject *v4;
  MPCPlayActivityFeedEventConsumer *v5;
  void *v6;
  _QWORD block[4];
  MPCPlayActivityFeedEventConsumer *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPCPlayActivityFeedEventConsumer;
  v2 = -[MPCPlayActivityFeedEventConsumer init](&v10, sel_init);
  allowedBundleIds = v2->_allowedBundleIds;
  v2->_allowedBundleIds = 0;

  dispatch_get_global_queue(17, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__MPCPlayActivityFeedEventConsumer_init__block_invoke;
  block[3] = &unk_24CABA2D0;
  v5 = v2;
  v9 = v5;
  dispatch_async(v4, block);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__handleURLBagProviderDidUpdateBagNotification_, *MEMORY[0x24BEC8710], 0);

  return v5;
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
  v11[2] = __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke;
  v11[3] = &unk_24CAB94A0;
  v11[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("item-resume"), v11);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_2;
  v10[3] = &unk_24CAB94A0;
  v10[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("item-position-jump"), v10);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_3;
  v9[3] = &unk_24CAB94A0;
  v9[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("item-pause"), v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_4;
  v8[3] = &unk_24CAB94A0;
  v8[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("item-end"), v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_5;
  v7[3] = &unk_24CAB94A0;
  v7[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("application-termination"), v7);

}

void __40__MPCPlayActivityFeedEventConsumer_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[MPCPlayActivityFeedEventConsumer] Failed to fetch the bag. error: %{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateAllowedBundleIdsIfNecessary:", v5);

}

- (void)_updateAllowedBundleIdsIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MPCPlayActivityFeedEventConsumer *v9;
  uint64_t v10;
  NSArray *allowedBundleIds;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "dictionaryForBagKey:", CFSTR("metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("treatmentProfiles.bundleIdAllowList.treatments"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && _NSIsNSArray())
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && _NSIsNSDictionary())
      {
        objc_msgSend(v7, "valueForKeyPath:", CFSTR("fieldActions.bundle-id.allowedValues"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 && _NSIsNSArray())
        {
          v9 = self;
          objc_sync_enter(v9);
          objc_msgSend(v8, "msv_filter:", &__block_literal_global_13553);
          v10 = objc_claimAutoreleasedReturnValue();
          allowedBundleIds = v9->_allowedBundleIds;
          v9->_allowedBundleIds = (NSArray *)v10;

          objc_sync_exit(v9);
        }

      }
    }

  }
}

void __40__MPCPlayActivityFeedEventConsumer_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc(MEMORY[0x24BEC89F8]);
  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithIdentity:", v3);

  objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__MPCPlayActivityFeedEventConsumer_init__block_invoke_2;
  v6[3] = &unk_24CAB54F8;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "getBagForRequestContext:withCompletionHandler:", v4, v6);

}

- (void)unsubscribeFromEventStream:(id)a3
{
  MPCPlaybackEngineEventStreamSubscription *subscription;

  subscription = self->_subscription;
  self->_subscription = 0;

}

- (void)_handleURLBagProviderDidUpdateBagNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEC8718]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[MPCPlayActivityFeedEventConsumer _updateAllowedBundleIdsIfNecessary:](self, "_updateAllowedBundleIdsIfNecessary:", v5);
}

- (BOOL)_handleItemResumeEvent:(id)a3 cursor:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  MPCPlayActivityFeedEventConsumer *v49;
  uint64_t v50;
  BOOL v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  id v65;
  MPCPlayActivityFeedEventConsumer *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  const __CFString *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  const __CFString *v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  uint8_t buf[4];
  MPCPlayActivityFeedEventConsumer *v94;
  __int16 v95;
  id v96;
  __int16 v97;
  id v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = v6;
  objc_msgSend(v6, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v9)
  {
    v91 = CFSTR("queue-section-id");
    v92 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), v12);
    v75 = objc_claimAutoreleasedReturnValue();

    v89 = CFSTR("queue-section-id");
    v90 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-hls-stream-begin"), v13);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(MEMORY[0x24BEC88E8]);
    objc_msgSend(v6, "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEventDate:", v15);

    objc_msgSend(v14, "setEventType:", 1);
    objc_msgSend(v14, "setEndReasonType:", 0);
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-end"), 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cursorUntilEvent:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = CFSTR("queue-section-id");
    v87[1] = CFSTR("queue-item-id");
    v88[0] = v9;
    v88[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v17);
    v74 = objc_claimAutoreleasedReturnValue();

    v85[0] = CFSTR("queue-section-id");
    v85[1] = CFSTR("queue-item-id");
    v86[0] = v9;
    v86[1] = v11;
    v69 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-resume"), v18);

    v83 = CFSTR("remote-control-type");
    v84 = &unk_24CB16C08;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v16;
    objc_msgSend(v16, "findPreviousEventWithType:matchingPayload:", CFSTR("remote-control-end"), v20);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("session-begin"), 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cursorUntilEvent:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "findPreviousEventWithType:matchingPayload:", CFSTR("item-resume"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v21;
    if (v22)
    {
      v23 = 0;
    }
    else
    {
      objc_msgSend(v21, "findPreviousEventWithType:matchingPayload:", CFSTR("session-restore-begin"), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v26 != 0;

    }
    if (!v19 && !v23 && !v73)
    {
      objc_msgSend(v6, "payload");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "payload");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v28, "isEqualToString:", v30);

      if ((v31 & 1) == 0)
        objc_msgSend(v14, "setReasonHintType:", 1);
    }
    v81 = CFSTR("queue-section-id");
    v82 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("container-begin"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "payload");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "type");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v74;
    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType:](self, "_updatePAFEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType:", v14, v74, v34, v7, v35);

    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withQueueAddEvent:queueSectionIdentifier:cursor:](self, "_updatePAFEvent:withQueueAddEvent:queueSectionIdentifier:cursor:", v14, v75, v9, v7);
    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withDeviceInfoFromCursor:](self, "_updatePAFEvent:withDeviceInfoFromCursor:", v14, v7);
    v37 = v33;
    -[MPCPlayActivityFeedEventConsumer _getStartTimeForMostRecentPlaybackStart:withItemBeginEvent:containerBeginEvent:cursor:](self, "_getStartTimeForMostRecentPlaybackStart:withItemBeginEvent:containerBeginEvent:cursor:", v77, v74, v33, v7);
    objc_msgSend(v14, "setItemStartTime:");
    v79 = CFSTR("queue-section-id");
    v80 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-timed-metadata-ping"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = v39;
    objc_msgSend(v39, "payload");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("item-timed-metadata"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTimedMetadata:", v41);

    objc_msgSend(v76, "payload");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("container-indeterminate-duration"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "BOOLValue"))
    {

    }
    else
    {
      objc_msgSend(v33, "payload");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("container-metadata"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("container-radio-subtype"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v7;
      v47 = v9;
      v48 = v37;
      v49 = self;
      v50 = objc_msgSend(v46, "integerValue");

      v36 = (void *)v74;
      v51 = v50 == 2;
      self = v49;
      v37 = v48;
      v9 = v47;
      v7 = v65;
      if (!v51)
        goto LABEL_19;
    }
    objc_msgSend(v14, "setItemStartTime:", 0.0);
    objc_msgSend(v14, "setItemDuration:", 0.0);
LABEL_19:
    objc_msgSend(v36, "payload");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("item-end-boundary"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (v54)
    {
      objc_msgSend(v54, "doubleValue");
      v57 = v56;
    }
    else
    {
      objc_msgSend(v36, "payload");
      v66 = self;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("item-metadata"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("item-duration"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "doubleValue");
      v57 = v61;

      v36 = (void *)v74;
      self = v66;
    }

    -[MPCPlayActivityFeedEventConsumer _clampTimeValuesForPAFEvent:withDuration:](self, "_clampTimeValuesForPAFEvent:withDuration:", v14, v57);
    if (objc_msgSend(v14, "isSBEnabled"))
    {
      -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withSharedListeningInfoFromCursor:](self, "_updatePAFEvent:withSharedListeningInfoFromCursor:", v14, v7);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "postNotificationName:object:", CFSTR("MPCPlayActivityUtilitiesPlayStartNotification"), self);

      v78 = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[MPCPlayActivityFeedEventConsumer _finalizePAFEvents:](self, "_finalizePAFEvents:", v63);

    }
    else
    {
      v25 = 1;
    }
    v11 = v69;
    v24 = v75;

    goto LABEL_26;
  }
  v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    v94 = self;
    v95 = 2114;
    v96 = v6;
    v97 = 2114;
    v98 = v7;
    _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _handleItemResumeEvent:cursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
  }
  v25 = 1;
LABEL_26:

  return v25;
}

- (BOOL)_handleItemPositionJumpEvent:(id)a3 cursor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t *v71;
  void *v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  _QWORD v84[6];
  _QWORD v85[3];
  uint64_t v86;
  _QWORD v87[2];
  _QWORD v88[2];
  _BYTE buf[24];
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  const __CFString *v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  const __CFString *v97;
  void *v98;
  const __CFString *v99;
  void *v100;
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[4];
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[4];

  v106[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v106[0] = CFSTR("remote-control-begin");
  v106[1] = CFSTR("remote-control-end");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v106, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithTypes:matchingPayload:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("remote-control-end")) & 1) != 0)
    {
      v11 = 1;
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(v6, "payload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("item-jump-user-initiated"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
    {
      objc_msgSend(v6, "payload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "payload");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v83 || !v10)
      {
        v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v6;
          *(_WORD *)&buf[22] = 2114;
          v90 = (uint64_t (*)(uint64_t, uint64_t))v7;
          _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _handleItemPositionJumpEvent:cursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
        }
        v11 = 1;
        goto LABEL_29;
      }
      v104[0] = CFSTR("queue-section-id");
      v104[1] = CFSTR("queue-item-id");
      v105[0] = v10;
      v105[1] = v83;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v105, v104, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v103[0] = CFSTR("item-begin");
      v103[1] = CFSTR("item-resume");
      v103[2] = CFSTR("item-position-jump");
      v103[3] = CFSTR("item-pause");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v103, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = CFSTR("queue-section-id");
      v101[1] = CFSTR("queue-item-id");
      v102[0] = v10;
      v102[1] = v83;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCPlayActivityFeedEventConsumer _findRecentPlaybackStartFromTypes:matchingPayload:cursor:](self, "_findRecentPlaybackStartFromTypes:matchingPayload:cursor:", v19, v20, v7);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      v99 = CFSTR("queue-section-id");
      v100 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("container-begin"), v21);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPCPlayActivityFeedEventConsumer _getStartTimeForMostRecentPlaybackStart:withItemBeginEvent:containerBeginEvent:cursor:](self, "_getStartTimeForMostRecentPlaybackStart:withItemBeginEvent:containerBeginEvent:cursor:", v79, v18, v80, v7);
      v23 = v22;
      objc_msgSend(v6, "payload");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("item-start-position"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = v26;

      -[NSObject payload](v18, "payload");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("item-metadata"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("requires-mpaf"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "BOOLValue");

      if ((v31 & 1) == 0)
      {
        -[MPCPlayActivityFeedEventConsumer _sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:](self, "_sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:", 0, v7, v23, v27);
        v11 = 1;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      v97 = CFSTR("queue-section-id");
      v98 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-hls-stream-begin"), v32);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v78, "payload");
      v82 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("container-indeterminate-duration"));
      v81 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v81, "BOOLValue") & 1) != 0)
      {
        v11 = 1;
      }
      else
      {
        objc_msgSend(v80, "payload");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("container-metadata"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("container-radio-subtype"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "integerValue") == 2;

        if (v36)
        {
          v11 = 1;
LABEL_27:

          goto LABEL_28;
        }
        v82 = objc_alloc_init(MEMORY[0x24BEC88E8]);
        objc_msgSend(v6, "date");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "setEventDate:", v37);

        objc_msgSend(v82, "setEventType:", 0);
        objc_msgSend(v82, "setEndReasonType:", 9);
        v81 = objc_alloc_init(MEMORY[0x24BEC88E8]);
        objc_msgSend(v6, "date");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setEventDate:", v38);

        objc_msgSend(v81, "setEventType:", 0);
        objc_msgSend(v81, "setEndReasonType:", 10);
        objc_msgSend(v80, "payload");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "type");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType:](self, "_updatePAFEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType:", v82, v18, v39, v7, v40);

        objc_msgSend(v80, "payload");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "type");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType:](self, "_updatePAFEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType:", v81, v18, v41, v7, v42);

        v95 = CFSTR("queue-section-id");
        v96 = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withQueueAddEvent:queueSectionIdentifier:cursor:](self, "_updatePAFEvent:withQueueAddEvent:queueSectionIdentifier:cursor:", v82, v44, v10, v7);
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withQueueAddEvent:queueSectionIdentifier:cursor:](self, "_updatePAFEvent:withQueueAddEvent:queueSectionIdentifier:cursor:", v81, v44, v10, v7);
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withDeviceInfoFromCursor:](self, "_updatePAFEvent:withDeviceInfoFromCursor:", v82, v7);
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withDeviceInfoFromCursor:](self, "_updatePAFEvent:withDeviceInfoFromCursor:", v81, v7);
        objc_msgSend(v82, "setItemStartTime:", v23);
        objc_msgSend(v6, "payload");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("item-start-position"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "doubleValue");
        objc_msgSend(v82, "setItemEndTime:");

        objc_msgSend(v6, "payload");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("item-start-position"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "doubleValue");
        objc_msgSend(v81, "setItemStartTime:");

        objc_msgSend(v6, "payload");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("item-end-position"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "doubleValue");
        v52 = v51;

        objc_msgSend(v81, "setItemEndTime:", v52);
        v93 = CFSTR("queue-section-id");
        v94 = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-timed-metadata-ping"), v53);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if (v77)
        {
          objc_msgSend(v77, "payload");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("item-timed-metadata"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "setTimedMetadata:", v55);

          objc_msgSend(v77, "payload");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("item-timed-metadata"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "setTimedMetadata:", v57);

        }
        -[NSObject payload](v18, "payload");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("item-metadata"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("item-end-boundary"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v58;
        if (v58)
        {
          objc_msgSend(v58, "doubleValue");
          v61 = v60;
        }
        else
        {
          -[NSObject payload](v18, "payload");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("item-metadata"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("item-duration"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "doubleValue");
          v61 = v64;

        }
        -[MPCPlayActivityFeedEventConsumer _clampTimeValuesForPAFEvent:withDuration:](self, "_clampTimeValuesForPAFEvent:withDuration:", v82, v61);
        -[MPCPlayActivityFeedEventConsumer _clampTimeValuesForPAFEvent:withDuration:](self, "_clampTimeValuesForPAFEvent:withDuration:", v81, v61);
        objc_msgSend(v82, "itemStartTime");
        v66 = v65;
        objc_msgSend(v82, "itemEndTime");
        -[MPCPlayActivityFeedEventConsumer _sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:](self, "_sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:", v82, v7, v66, v67);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v90 = __Block_byref_object_copy__13533;
        v91 = __Block_byref_object_dispose__13534;
        v92 = 0;
        v87[0] = CFSTR("queue-section-id");
        v87[1] = CFSTR("queue-item-id");
        v88[0] = v10;
        v88[1] = v83;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v84[0] = MEMORY[0x24BDAC760];
        v84[1] = 3221225472;
        v84[2] = __72__MPCPlayActivityFeedEventConsumer__handleItemPositionJumpEvent_cursor___block_invoke;
        v84[3] = &unk_24CABA670;
        v84[4] = buf;
        objc_msgSend(v7, "enumeratePreviousEventsWithType:matchingPayload:usingBlock:", CFSTR("audio-format-changed"), v68, v84);

        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withAudioChangeEvent:](self, "_updatePAFEvent:withAudioChangeEvent:", v82, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withAudioChangeEvent:](self, "_updatePAFEvent:withAudioChangeEvent:", v81, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withSharedListeningInfoFromCursor:](self, "_updatePAFEvent:withSharedListeningInfoFromCursor:", v82, v7);
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withSharedListeningInfoFromCursor:](self, "_updatePAFEvent:withSharedListeningInfoFromCursor:", v81, v7);
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withVocalAttenuationInfoForEndEvent:cursor:](self, "_updatePAFEvent:withVocalAttenuationInfoForEndEvent:cursor:", v82, v6, v7);
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withVocalAttenuationInfoForEndEvent:cursor:](self, "_updatePAFEvent:withVocalAttenuationInfoForEndEvent:cursor:", v81, v6, v7);
        objc_msgSend(v81, "setVocalAttenuationDuration:", 0.0);
        -[MPCPlayActivityFeedEventConsumer _generateAggregateNoncatalogEndEventForCursor:](self, "_generateAggregateNoncatalogEndEventForCursor:", v7);
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = (void *)v69;
        if (v69)
        {
          v85[1] = v69;
          v85[2] = v82;
          v71 = &v86;
        }
        else
        {
          v84[5] = v82;
          v71 = v85;
        }
        *v71 = (uint64_t)v81;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[MPCPlayActivityFeedEventConsumer _finalizePAFEvents:](self, "_finalizePAFEvents:", v72);

        _Block_object_dispose(buf, 8);
      }

      goto LABEL_27;
    }
  }
  v11 = 1;
LABEL_31:

  return v11;
}

- (BOOL)_handleItemPauseEvent:(id)a3 cursor:(id)a4
{
  id v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  BOOL v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id *v62;
  uint64_t v63;
  void *v64;
  _BOOL4 v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void *v76;
  void *v77;
  id v78;
  _QWORD v79[5];
  _QWORD v80[4];
  uint64_t (*v81)(uint64_t, uint64_t);
  uint64_t *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  id v87;
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _BYTE buf[24];
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  const __CFString *v95;
  void *v96;
  _QWORD v97[2];
  const __CFString *v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  const __CFString *v102;
  void *v103;
  _QWORD v104[2];
  _QWORD v105[2];
  const __CFString *v106;
  void *v107;
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[3];
  _QWORD v111[2];
  _QWORD v112[5];

  v112[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  objc_msgSend(v6, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 || !v9)
  {
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2114;
      v92 = v7;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _handleItemPauseEvent:cursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
    }
    v33 = 1;
    goto LABEL_32;
  }
  if (-[MPCPlayActivityFeedEventConsumer _itemIsPlayingFromQueueSectionIdentifier:itemIdentifier:cursor:](self, "_itemIsPlayingFromQueueSectionIdentifier:itemIdentifier:cursor:", v9, v11, v7))
  {
    v111[0] = CFSTR("queue-section-id");
    v111[1] = CFSTR("queue-item-id");
    v112[0] = v9;
    v112[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v110[0] = CFSTR("item-begin");
    v110[1] = CFSTR("item-resume");
    v110[2] = CFSTR("item-position-jump");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v110, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = CFSTR("queue-section-id");
    v108[1] = CFSTR("queue-item-id");
    v109[0] = v9;
    v109[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v109, v108, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayActivityFeedEventConsumer _findRecentPlaybackStartFromTypes:matchingPayload:cursor:](self, "_findRecentPlaybackStartFromTypes:matchingPayload:cursor:", v14, v15, v7);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v106 = CFSTR("queue-section-id");
    v107 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("container-begin"), v16);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlayActivityFeedEventConsumer _getStartTimeForMostRecentPlaybackStart:withItemBeginEvent:containerBeginEvent:cursor:](self, "_getStartTimeForMostRecentPlaybackStart:withItemBeginEvent:containerBeginEvent:cursor:", v76, v13, v77, v7);
    v18 = v17;
    objc_msgSend(v6, "payload");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("item-end-position"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    -[NSObject payload](v13, "payload");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("requires-mpaf"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    if ((v26 & 1) == 0)
    {
      -[MPCPlayActivityFeedEventConsumer _sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:](self, "_sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:", 0, v7, v18, v22);
      v33 = 1;
LABEL_31:

LABEL_32:
      goto LABEL_33;
    }
    v78 = objc_alloc_init(MEMORY[0x24BEC88E8]);
    objc_msgSend(v6, "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setEventDate:", v27);

    objc_msgSend(v78, "setEventType:", 0);
    objc_msgSend(v77, "payload");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "type");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType:](self, "_updatePAFEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType:", v78, v13, v28, v7, v29);

    objc_msgSend(v7, "cursorUntilEvent:", v13);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v78, "itemType") != 4)
    {
      v104[0] = CFSTR("queue-section-id");
      v104[1] = CFSTR("queue-item-id");
      v105[0] = v9;
      v105[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v105, v104, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v73, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-resume"), v30) == 0;

      if (v31)
      {
        v33 = 1;
LABEL_30:

        goto LABEL_31;
      }
    }
    v102 = CFSTR("queue-section-id");
    v103 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), v32);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withQueueAddEvent:queueSectionIdentifier:cursor:](self, "_updatePAFEvent:withQueueAddEvent:queueSectionIdentifier:cursor:", v78, v72, v9, v7);
    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withDeviceInfoFromCursor:](self, "_updatePAFEvent:withDeviceInfoFromCursor:", v78, v7);
    objc_msgSend(v78, "setItemStartTime:", v18);
    objc_msgSend(v78, "setItemEndTime:", v22);
    objc_msgSend(v7, "cursorUntilEvent:", v76);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0;
    v84 = &v83;
    v85 = 0x2020000000;
    v86 = 0;
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __65__MPCPlayActivityFeedEventConsumer__handleItemPauseEvent_cursor___block_invoke;
    v80[3] = &unk_24CAB55C8;
    v82 = &v83;
    v75 = v7;
    v81 = v75;
    objc_msgSend(v74, "enumeratePreviousEventsWithType:usingBlock:", CFSTR("remote-control-begin"), v80);
    if (*((_BYTE *)v84 + 24))
    {
      objc_msgSend(v78, "setEndReasonType:", 5);
    }
    else
    {
      objc_msgSend(v74, "findPreviousEventWithType:matchingPayload:", CFSTR("interrupt-begin"), 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
        v35 = 6;
      else
        v35 = 1;
      objc_msgSend(v78, "setEndReasonType:", v35);

    }
    -[NSObject payload](v13, "payload");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("item-end-boundary"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (!v38)
    {
      -[NSObject payload](v13, "payload");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("item-metadata"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("item-duration"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v39, "doubleValue");
    v41 = v40;
    if (!v38)
    {

    }
    -[MPCPlayActivityFeedEventConsumer _clampTimeValuesForPAFEvent:withDuration:](self, "_clampTimeValuesForPAFEvent:withDuration:", v78, v41);
    v100 = CFSTR("queue-section-id");
    v101 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "findPreviousEventWithType:matchingPayload:", CFSTR("item-timed-metadata-ping"), v42);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v71, "payload");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("item-timed-metadata"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setTimedMetadata:", v44);

    v98 = CFSTR("queue-section-id");
    v99 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "findPreviousEventWithType:matchingPayload:", CFSTR("item-hls-stream-begin"), v45);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v69, "payload");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("container-indeterminate-duration"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v47, "BOOLValue"))
    {

    }
    else
    {
      objc_msgSend(v77, "payload");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("container-metadata"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("container-radio-subtype"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v49, "integerValue") == 2;

      if (!v66)
      {
LABEL_26:
        objc_msgSend(v78, "itemStartTime");
        v57 = v56;
        objc_msgSend(v78, "itemEndTime");
        -[MPCPlayActivityFeedEventConsumer _sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:](self, "_sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:", v78, v75, v57, v58);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v92 = __Block_byref_object_copy__13533;
        v93 = __Block_byref_object_dispose__13534;
        v94 = 0;
        v89[0] = CFSTR("queue-section-id");
        v89[1] = CFSTR("queue-item-id");
        v90[0] = v9;
        v90[1] = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = MEMORY[0x24BDAC760];
        v79[1] = 3221225472;
        v79[2] = __65__MPCPlayActivityFeedEventConsumer__handleItemPauseEvent_cursor___block_invoke_2;
        v79[3] = &unk_24CABA670;
        v79[4] = buf;
        objc_msgSend(v75, "enumeratePreviousEventsWithType:matchingPayload:usingBlock:", CFSTR("audio-format-changed"), v59, v79);

        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withAudioChangeEvent:](self, "_updatePAFEvent:withAudioChangeEvent:", v78, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withSharedListeningInfoFromCursor:](self, "_updatePAFEvent:withSharedListeningInfoFromCursor:", v78, v75);
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withVocalAttenuationInfoForEndEvent:cursor:](self, "_updatePAFEvent:withVocalAttenuationInfoForEndEvent:cursor:", v78, v6, v75);
        -[MPCPlayActivityFeedEventConsumer _generateAggregateNoncatalogEndEventForCursor:](self, "_generateAggregateNoncatalogEndEventForCursor:", v75);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = (void *)v60;
        if (v60)
        {
          v88[0] = v60;
          v88[1] = v78;
          v62 = (id *)v88;
          v63 = 2;
        }
        else
        {
          v87 = v78;
          v62 = &v87;
          v63 = 1;
        }
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[MPCPlayActivityFeedEventConsumer _finalizePAFEvents:](self, "_finalizePAFEvents:", v64);

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v83, 8);

        goto LABEL_30;
      }
    }
    v97[0] = CFSTR("item-resume");
    v97[1] = CFSTR("item-timed-metadata-ping");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = CFSTR("queue-section-id");
    v96 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "findPreviousEventWithTypes:matchingPayload:", v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v78, "setItemStartTime:", 0.0);
    objc_msgSend(v75, "cursorFromEvent:untilEvent:", v6, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayActivityFeedEventConsumer _getPlaybackDurationForHLSStreamFromStartEvent:toEndEvent:withLimitedCursor:](self, "_getPlaybackDurationForHLSStreamFromStartEvent:toEndEvent:withLimitedCursor:", v52, v6, v53);
    v55 = v54;

    objc_msgSend(v78, "setItemEndTime:", v55);
    objc_msgSend(v78, "setItemDuration:", 0.0);

    goto LABEL_26;
  }
  v33 = 1;
LABEL_33:

  return v33;
}

- (BOOL)_handleItemEndEvent:(id)a3 cursor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject **v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  NSObject *v25;
  _QWORD v26[2];
  uint8_t buf[4];
  MPCPlayActivityFeedEventConsumer *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 || !v9)
  {
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v28 = self;
      v29 = 2114;
      v30 = v6;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _handleItemEndEvent:cursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
    }
    goto LABEL_8;
  }
  -[MPCPlayActivityFeedEventConsumer _generatePlaybackEndEventFromEvent:withQueueSectionIdentifier:itemIdentifier:cursor:](self, "_generatePlaybackEndEventFromEvent:withQueueSectionIdentifier:itemIdentifier:cursor:", v6, v9, v11, v7);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
LABEL_8:
    v22 = 1;
    goto LABEL_11;
  }
  -[NSObject itemStartTime](v12, "itemStartTime");
  v15 = v14;
  -[NSObject itemEndTime](v13, "itemEndTime");
  -[MPCPlayActivityFeedEventConsumer _sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:](self, "_sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:", v13, v7, v15, v16);
  -[MPCPlayActivityFeedEventConsumer _generateAggregateNoncatalogEndEventForCursor:](self, "_generateAggregateNoncatalogEndEventForCursor:", v7);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
  {
    v26[0] = v17;
    v26[1] = v13;
    v19 = (void *)MEMORY[0x24BDBCE30];
    v20 = (NSObject **)v26;
    v21 = 2;
  }
  else
  {
    v25 = v13;
    v19 = (void *)MEMORY[0x24BDBCE30];
    v20 = &v25;
    v21 = 1;
  }
  objc_msgSend(v19, "arrayWithObjects:count:", v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MPCPlayActivityFeedEventConsumer _finalizePAFEvents:](self, "_finalizePAFEvents:", v23);

LABEL_11:
  return v22;
}

- (id)_generatePlaybackEndEventFromEvent:(id)a3 withQueueSectionIdentifier:(id)a4 itemIdentifier:(id)a5 cursor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  _QWORD v81[5];
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _QWORD v88[8];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  char v100;
  const __CFString *v101;
  id v102;
  _QWORD v103[2];
  const __CFString *v104;
  id v105;
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[3];
  const __CFString *v113;
  id v114;
  const __CFString *v115;
  id v116;
  _QWORD v117[2];
  _QWORD v118[4];

  v118[2] = *MEMORY[0x24BDAC8D0];
  v80 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v79 = v11;
  if (-[MPCPlayActivityFeedEventConsumer _itemIsPlayingFromQueueSectionIdentifier:itemIdentifier:cursor:](self, "_itemIsPlayingFromQueueSectionIdentifier:itemIdentifier:cursor:", v10, v11, v12)&& !-[MPCPlayActivityFeedEventConsumer _itemIsPlaceholderFromQueueSectionIdentifier:itemIdentifier:cursor:](self, "_itemIsPlaceholderFromQueueSectionIdentifier:itemIdentifier:cursor:", v10, v11, v12))
  {
    v117[0] = CFSTR("queue-section-id");
    v117[1] = CFSTR("queue-item-id");
    v118[0] = v10;
    v118[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v118, v117, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v14);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v78, "payload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc_init(MEMORY[0x24BEC88E8]);
    objc_msgSend(v80, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEventDate:", v17);

    objc_msgSend(v16, "setEventType:", 0);
    v115 = CFSTR("queue-section-id");
    v116 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "findPreviousEventWithType:matchingPayload:", CFSTR("container-begin"), v18);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v77, "payload");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "type");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType:](self, "_updatePAFEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType:", v16, v78, v19, v12, v20);

    v113 = CFSTR("queue-section-id");
    v114 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), v21);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withQueueAddEvent:queueSectionIdentifier:cursor:](self, "_updatePAFEvent:withQueueAddEvent:queueSectionIdentifier:cursor:", v16, v74, v10, v12);
    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withDeviceInfoFromCursor:](self, "_updatePAFEvent:withDeviceInfoFromCursor:", v16, v12);
    v112[0] = CFSTR("item-begin");
    v112[1] = CFSTR("item-resume");
    v112[2] = CFSTR("item-position-jump");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v112, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = CFSTR("queue-section-id");
    v110[1] = CFSTR("queue-item-id");
    v111[0] = v10;
    v111[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v111, v110, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayActivityFeedEventConsumer _findRecentPlaybackStartFromTypes:matchingPayload:cursor:](self, "_findRecentPlaybackStartFromTypes:matchingPayload:cursor:", v22, v23, v12);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCPlayActivityFeedEventConsumer _getStartTimeForMostRecentPlaybackStart:withItemBeginEvent:containerBeginEvent:cursor:](self, "_getStartTimeForMostRecentPlaybackStart:withItemBeginEvent:containerBeginEvent:cursor:", v76, v78, v77, v12);
    v25 = v24;
    objc_msgSend(v80, "payload");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("item-end-position"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v29 = v28;

    objc_msgSend(v16, "setItemStartTime:", v25);
    objc_msgSend(v16, "setItemEndTime:", v29);
    objc_msgSend(v80, "type");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("application-termination"));

    if (v31)
    {
      objc_msgSend(v16, "setEndReasonType:", 15);
      goto LABEL_28;
    }
    if (objc_msgSend(v16, "itemType") == 5)
    {
      objc_msgSend(v16, "setEndReasonType:", 0);
      goto LABEL_28;
    }
    objc_msgSend(v12, "cursorUntilEvent:", v76);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0;
    v83 = &v82;
    v84 = 0x2020000000;
    LOBYTE(v85) = 0;
    v97 = 0;
    v98 = &v97;
    v99 = 0x2020000000;
    v100 = 0;
    v93 = 0;
    v94 = &v93;
    v95 = 0x2020000000;
    v96 = 0;
    v89 = 0;
    v90 = &v89;
    v91 = 0x2020000000;
    v92 = 0;
    v88[0] = MEMORY[0x24BDAC760];
    v88[1] = 3221225472;
    v88[2] = __120__MPCPlayActivityFeedEventConsumer__generatePlaybackEndEventFromEvent_withQueueSectionIdentifier_itemIdentifier_cursor___block_invoke;
    v88[3] = &unk_24CABA8A0;
    v88[4] = &v82;
    v88[5] = &v97;
    v88[6] = &v93;
    v88[7] = &v89;
    objc_msgSend(v32, "enumeratePreviousEventsWithType:usingBlock:", CFSTR("remote-control-begin"), v88);
    if (*((_BYTE *)v83 + 24))
    {
      v33 = 3;
    }
    else if (*((_BYTE *)v98 + 24))
    {
      v33 = 2;
    }
    else if (*((_BYTE *)v94 + 24))
    {
      v33 = 4;
    }
    else
    {
      objc_msgSend(v80, "payload");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("item-did-play-to-end"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "BOOLValue");

      if (!v36)
      {
        objc_msgSend(v32, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-load-begin"), 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
          v41 = 0;
        else
          v41 = *((_BYTE *)v90 + 24) == 0;
        if (v41)
          v42 = 1;
        else
          v42 = 4;
        objc_msgSend(v16, "setEndReasonType:", v42);

        goto LABEL_27;
      }
      objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("item-end-boundary"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37 == 0;

      if (v38)
        objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("item-duration"));
      else
        objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("item-end-boundary"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "doubleValue");
      objc_msgSend(v16, "setItemEndTime:");

      v33 = 11;
    }
    objc_msgSend(v16, "setEndReasonType:", v33);
LABEL_27:
    _Block_object_dispose(&v89, 8);
    _Block_object_dispose(&v93, 8);
    _Block_object_dispose(&v97, 8);
    _Block_object_dispose(&v82, 8);

LABEL_28:
    objc_msgSend(v78, "payload");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("item-end-boundary"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v45)
    {
      objc_msgSend(v45, "doubleValue");
      v48 = v47;
    }
    else
    {
      objc_msgSend(v78, "payload");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("item-metadata"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("item-duration"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "doubleValue");
      v48 = v52;

    }
    -[MPCPlayActivityFeedEventConsumer _clampTimeValuesForPAFEvent:withDuration:](self, "_clampTimeValuesForPAFEvent:withDuration:", v16, v48);
    v108[0] = CFSTR("queue-section-id");
    v108[1] = CFSTR("queue-item-id");
    v109[0] = v10;
    v109[1] = v79;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v109, v108, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "findPreviousEventWithType:matchingPayload:", CFSTR("item-timed-metadata-ping"), v53);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v73, "payload");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("item-timed-metadata"));
    v55 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTimedMetadata:", v55);

    objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("requires-mpaf"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v55) = objc_msgSend(v56, "BOOLValue");

    if ((v55 & 1) == 0)
    {
      -[MPCPlayActivityFeedEventConsumer _sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:](self, "_sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:", v16, v12, v25, v29);
      v13 = 0;
LABEL_38:

      goto LABEL_39;
    }
    v82 = 0;
    v83 = &v82;
    v84 = 0x3032000000;
    v85 = __Block_byref_object_copy__13533;
    v86 = __Block_byref_object_dispose__13534;
    v87 = 0;
    v106[0] = CFSTR("queue-section-id");
    v106[1] = CFSTR("queue-item-id");
    v107[0] = v10;
    v107[1] = v79;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v107, v106, 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = __120__MPCPlayActivityFeedEventConsumer__generatePlaybackEndEventFromEvent_withQueueSectionIdentifier_itemIdentifier_cursor___block_invoke_2;
    v81[3] = &unk_24CABA670;
    v81[4] = &v82;
    objc_msgSend(v12, "enumeratePreviousEventsWithType:matchingPayload:usingBlock:", CFSTR("audio-format-changed"), v57, v81);

    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withAudioChangeEvent:](self, "_updatePAFEvent:withAudioChangeEvent:", v16, v83[5]);
    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withSharedListeningInfoFromCursor:](self, "_updatePAFEvent:withSharedListeningInfoFromCursor:", v16, v12);
    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withVocalAttenuationInfoForEndEvent:cursor:](self, "_updatePAFEvent:withVocalAttenuationInfoForEndEvent:cursor:", v16, v80, v12);
    v104 = CFSTR("queue-section-id");
    v105 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "findPreviousEventWithType:matchingPayload:", CFSTR("item-hls-stream-begin"), v58);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v72, "payload");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("container-indeterminate-duration"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v60, "BOOLValue"))
    {

    }
    else
    {
      objc_msgSend(v77, "payload");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("container-metadata"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("container-radio-subtype"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "integerValue") == 2;

      if (!v64)
      {
LABEL_37:
        v13 = v16;

        _Block_object_dispose(&v82, 8);
        goto LABEL_38;
      }
    }
    v103[0] = CFSTR("item-resume");
    v103[1] = CFSTR("item-timed-metadata-ping");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v103, 2);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = CFSTR("queue-section-id");
    v102 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "findPreviousEventWithTypes:matchingPayload:", v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setItemStartTime:", 0.0);
    objc_msgSend(v12, "cursorFromEvent:untilEvent:", v80, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayActivityFeedEventConsumer _getPlaybackDurationForHLSStreamFromStartEvent:toEndEvent:withLimitedCursor:](self, "_getPlaybackDurationForHLSStreamFromStartEvent:toEndEvent:withLimitedCursor:", v67, v80, v68);
    v70 = v69;

    objc_msgSend(v16, "setItemEndTime:", v70);
    objc_msgSend(v16, "setItemDuration:", 0.0);

    goto LABEL_37;
  }
  v13 = 0;
LABEL_39:

  return v13;
}

- (BOOL)_handleApplicationTerminationEvent:(id)a3 cursor:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  BOOL v30;
  id v32;
  _QWORD v33[2];
  _QWORD v34[2];
  uint8_t buf[4];
  MPCPlayActivityFeedEventConsumer *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "payload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && v12)
    {
      v33[0] = CFSTR("queue-section-id");
      v33[1] = CFSTR("queue-item-id");
      v34[0] = v12;
      v34[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-resume"), v15);
      v16 = objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[MPCPlayActivityFeedEventConsumer _generatePlaybackEndEventFromEvent:withQueueSectionIdentifier:itemIdentifier:cursor:](self, "_generatePlaybackEndEventFromEvent:withQueueSectionIdentifier:itemIdentifier:cursor:", v6, v12, v14, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "itemType") != 4 || (objc_msgSend(v17, "itemDuration"), v18 != 0.0))
        {
          objc_msgSend(v6, "date");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject date](v16, "date");
          v32 = v6;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "timeIntervalSinceDate:", v20);
          v22 = v21;

          -[NSObject payload](v16, "payload");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("item-start-position"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          objc_msgSend(v17, "setItemEndTime:", v22 + v25);

          v6 = v32;
        }
        if (v17)
        {
          objc_msgSend(v17, "itemStartTime");
          v27 = v26;
          objc_msgSend(v17, "itemEndTime");
          -[MPCPlayActivityFeedEventConsumer _sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:](self, "_sendPlayEndNotificationWithStartTime:endTime:pafEvent:cursor:", v17, v7, v27, v28);
          objc_msgSend(v8, "addObject:", v17);
        }

      }
      -[MPCPlayActivityFeedEventConsumer _generateAggregateNoncatalogEndEventForCursor:](self, "_generateAggregateNoncatalogEndEventForCursor:", v7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
        objc_msgSend(v8, "addObject:", v29);
      if (objc_msgSend(v8, "count"))
        v30 = -[MPCPlayActivityFeedEventConsumer _finalizePAFEvents:](self, "_finalizePAFEvents:", v8);
      else
        v30 = 1;

    }
    else
    {
      v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v36 = self;
        v37 = 2114;
        v38 = v6;
        v39 = 2114;
        v40 = v7;
        _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _handleApplicationTerminationEvent:cursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
      }
      v30 = 1;
    }

  }
  else
  {
    v30 = 1;
  }

  return v30;
}

- (BOOL)_itemIsPlayingFromQueueSectionIdentifier:(id)a3 itemIdentifier:(id)a4 cursor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id *v16;
  const __CFString **v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  const __CFString *v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29[0] = CFSTR("queue-section-id");
  v29[1] = CFSTR("queue-item-id");
  v30[0] = v8;
  v30[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "cursorFromEvent:untilEvent:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MPCPlayActivityFeedEventConsumer _itemWithinHLSTimedMetadataBeginFromQueueSection:itemIdentifier:cursor:](self, "_itemWithinHLSTimedMetadataBeginFromQueueSection:itemIdentifier:cursor:", v8, v9, v13))
    {
      v14 = v10;
      v27 = CFSTR("queue-section-id");
      v28 = v8;
      v15 = (void *)MEMORY[0x24BDBCE70];
      v16 = &v28;
      v17 = &v27;
      v18 = 1;
    }
    else
    {
      objc_msgSend(v10, "cursorUntilEvent:", v12);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v25[0] = CFSTR("queue-section-id");
      v25[1] = CFSTR("queue-item-id");
      v26[0] = v8;
      v26[1] = v9;
      v15 = (void *)MEMORY[0x24BDBCE70];
      v16 = (id *)v26;
      v17 = (const __CFString **)v25;
      v18 = 2;
    }
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "findPreviousEventWithType:matchingPayload:", CFSTR("item-pause"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v14, "cursorUntilEvent:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "findPreviousEventWithType:matchingPayload:", CFSTR("item-resume"), v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v14, "findPreviousEventWithType:matchingPayload:", CFSTR("item-resume"), v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = v23 != 0;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_itemWithinHLSTimedMetadataBeginFromQueueSection:(id)a3 itemIdentifier:(id)a4 cursor:(id)a5
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
  char v16;
  const __CFString *v18;
  void *v19;
  _QWORD v20[2];
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a5;
  v21 = CFSTR("queue-section-id");
  v22[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-hls-stream-begin"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v20[0] = CFSTR("item-hls-timed-metadata-begin");
    v20[1] = CFSTR("item-hls-timed-metadata-end");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("item-stream-id");
    objc_msgSend(v9, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("item-stream-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithTypes:matchingPayload:", v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("item-hls-timed-metadata-begin"));

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_itemIsPlaceholderFromQueueSectionIdentifier:(id)a3 itemIdentifier:(id)a4 cursor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MPCPlayActivityFeedEventConsumer _itemWithinHLSTimedMetadataBeginFromQueueSection:itemIdentifier:cursor:](self, "_itemWithinHLSTimedMetadataBeginFromQueueSection:itemIdentifier:cursor:", v8, v9, v10))
  {
    v15[0] = CFSTR("queue-section-id");
    v15[1] = CFSTR("queue-item-id");
    v16[0] = v8;
    v16[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "findPreviousEventWithType:matchingPayload:", CFSTR("item-timed-metadata-ping"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12 == 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_generateAggregateNoncatalogEndEventForCursor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  BOOL v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  id v55;
  id v56;
  uint64_t *v57;
  _BYTE *v58;
  uint64_t v59;
  double *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[3];
  _BYTE buf[24];
  uint64_t v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  uint64_t v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  uint64_t v77;
  const __CFString *v78;
  void *v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[6];

  v82[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v82[0] = CFSTR("item-begin");
  v82[1] = CFSTR("item-pause");
  v82[2] = CFSTR("item-end");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findPreviousEventWithTypes:matchingPayload:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("item-begin"));

  if (v8)
  {
    v9 = v6;
    objc_msgSend(v4, "cursorUntilEvent:", v9);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (v12)
    {
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v4;
        _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _generateAggregateNoncatalogEndEventForCursor: - could not find queueItemIdentifier - cursor:%{public}@", buf, 0x16u);
      }
    }
    else
    {
      v13 = MEMORY[0x24BDBD1C8];
      v80[1] = CFSTR("queue-item-id");
      v81[0] = MEMORY[0x24BDBD1C8];
      v80[0] = CFSTR("item-jump-user-initiated");
      objc_msgSend(v9, "payload");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v81[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "findPreviousEventWithType:matchingPayload:", CFSTR("item-position-jump"), v16);
      v17 = objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(v4, "cursorFromEvent:untilEvent:", v9, 0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v13;
        v78 = CFSTR("item-metadata");
        v76 = CFSTR("requires-mpaf");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v19);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          objc_msgSend(v51, "payload");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21 == 0;

          if (v22)
          {
            v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v4;
              _os_log_impl(&dword_210BD8000, v43, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _generateAggregateNoncatalogEndEventForCursor: - could not find queueItemIdentifier - cursor:%{public}@", buf, 0x16u);
            }
            v27 = 0;
            goto LABEL_21;
          }
          v74 = CFSTR("queue-item-id");
          objc_msgSend(v51, "payload");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v24;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "findPreviousEventWithType:matchingPayload:", CFSTR("item-end"), v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v52, "cursorUntilEvent:", v26);
          v27 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v27 = v52;
        }
        v72 = CFSTR("item-metadata");
        v70 = CFSTR("requires-mpaf");
        v71 = MEMORY[0x24BDBD1C0];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v29;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v27, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-begin"), v30) == 0;

        if (v31)
        {
          v28 = 0;
LABEL_28:

          v17 = 0;
          goto LABEL_29;
        }
        objc_msgSend(v27, "findPreviousEventWithType:matchingPayload:", CFSTR("item-resume"), 0);
        v50 = objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          v32 = objc_alloc_init(MEMORY[0x24BEC88E8]);
          objc_msgSend(v32, "setEventType:", 0);
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setEventDate:", v33);

          objc_msgSend(v32, "setItemType:", 7);
          -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withDeviceInfoFromCursor:](self, "_updatePAFEvent:withDeviceInfoFromCursor:", v32, v52);
          -[NSObject payload](v50, "payload");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v68 = CFSTR("queue-section-id");
          v69 = v35;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), v36);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v49, "payload");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("account-id"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v66 = CFSTR("rectification-section-id");
          v67 = v35;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "findPreviousEventWithType:matchingPayload:", CFSTR("account-rectification"), v39);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v48)
          {
            objc_msgSend(v48, "payload");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("account-id"));
            v41 = objc_claimAutoreleasedReturnValue();

            v42 = (void *)v41;
          }
          else
          {
            v42 = v38;
          }
          -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withAccountIdentifier:cursor:](self, "_updatePAFEvent:withAccountIdentifier:cursor:", v32, v42);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v65 = 0;
          v59 = 0;
          v60 = (double *)&v59;
          v61 = 0x2020000000;
          v62 = 0;
          v63[0] = CFSTR("item-position-jump");
          v63[1] = CFSTR("item-pause");
          v63[2] = CFSTR("item-end");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 3);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = MEMORY[0x24BDAC760];
          v54[1] = 3221225472;
          v54[2] = __82__MPCPlayActivityFeedEventConsumer__generateAggregateNoncatalogEndEventForCursor___block_invoke;
          v54[3] = &unk_24CAB55A0;
          v54[4] = self;
          v55 = v4;
          v27 = v27;
          v56 = v27;
          v57 = &v59;
          v58 = buf;
          objc_msgSend(v27, "enumeratePreviousEventsWithTypes:usingBlock:", v44, v54);

          if (*(double *)(*(_QWORD *)&buf[8] + 24) <= 0.0)
          {
            v43 = v50;
            v28 = 0;
          }
          else
          {
            objc_msgSend(v32, "setItemDuration:", v60[3]);
            objc_msgSend(v32, "setItemEndTime:", *(double *)(*(_QWORD *)&buf[8] + 24));
            objc_msgSend(v32, "setHouseholdID:", 0);
            objc_msgSend(v32, "setRepeatPlayMode:", 0);
            objc_msgSend(v32, "setShufflePlayMode:", 0);
            objc_msgSend(v32, "setAutoPlayMode:", 0);
            objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithAbbreviation:", CFSTR("UTC"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setEventTimeZone:", v45);

            objc_msgSend(v32, "setPrivateListeningEnabled:", 0);
            v28 = v32;
            v43 = v50;
          }

          _Block_object_dispose(&v59, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_27;
        }
        v43 = 0;
LABEL_21:
        v28 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    v28 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v28 = 0;
LABEL_30:

  return v28;
}

- (id)_findRecentPlaybackStartFromTypes:(id)a3 matchingPayload:(id)a4 cursor:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__13533;
  v20 = __Block_byref_object_dispose__13534;
  v21 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __93__MPCPlayActivityFeedEventConsumer__findRecentPlaybackStartFromTypes_matchingPayload_cursor___block_invoke;
  v13[3] = &unk_24CAB55C8;
  v10 = v9;
  v14 = v10;
  v15 = &v16;
  objc_msgSend(v10, "enumeratePreviousEventsWithTypes:matchingPayload:usingBlock:", v7, v8, v13);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (double)_getStartTimeForMostRecentPlaybackStart:(id)a3 withItemBeginEvent:(id)a4 containerBeginEvent:(id)a5 cursor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  void *v26;
  void *v27;
  int v28;
  double v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  void *v54;
  void *v55;
  double v56;
  uint64_t v58;
  void *v59;
  int v60;
  double v61;
  void *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  id v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  double v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  const __CFString *v92;
  void *v93;
  _QWORD v94[2];
  const __CFString *v95;
  void *v96;
  _QWORD v97[2];
  uint8_t buf[4];
  MPCPlayActivityFeedEventConsumer *v99;
  __int16 v100;
  id v101;
  __int16 v102;
  id v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "payload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v17 = objc_claimAutoreleasedReturnValue();

  v85 = (void *)v17;
  if (v15 && v17)
  {
    v97[0] = CFSTR("item-hls-stream-begin");
    v97[1] = CFSTR("item-hls-stream-end");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = CFSTR("queue-section-id");
    v96 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
    v84 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "findPreviousEventWithTypes:matchingPayload:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    if (!v84)
      goto LABEL_12;
    objc_msgSend(v84, "payload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("container-metadata"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("container-radio-type"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v11;
    v24 = objc_msgSend(v23, "intValue");

    v25 = v24 == 4;
    v11 = v82;
    if (!v25)
      goto LABEL_12;
    if (v20)
    {
      -[NSObject type](v20, "type");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "isEqualToString:", CFSTR("item-hls-stream-begin")))
      {
        objc_msgSend(v82, "payload");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("item-metadata"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("item-has-video"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v27, "BOOLValue") & 1) != 0)
        {
          v28 = 0;
        }
        else
        {
          -[NSObject payload](v20, "payload");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("container-indeterminate-duration"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v51, "BOOLValue") ^ 1;

          v11 = v82;
        }

      }
      else
      {
        v28 = 0;
      }

      objc_msgSend(v13, "cursorUntilEvent:", v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v13, "cursorUntilEvent:", v20);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v81, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-resume"), 0);
        if (v52)
        {
          v53 = 0x24BDBC000uLL;
          if (v52 != 1)
            goto LABEL_40;
          objc_msgSend(v10, "type");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v54, "isEqualToString:", CFSTR("item-resume")))
          {

            goto LABEL_40;
          }
          v58 = objc_msgSend(v81, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-timed-metadata-ping"), 0);

          v29 = 0.0;
          if (v58 >= 2)
          {
LABEL_40:
            objc_msgSend(v10, "type");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("item-resume"));

            if (v60)
            {
              objc_msgSend(v10, "payload");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("item-start-position"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "doubleValue");
              v29 = v61;
              v11 = v82;
              goto LABEL_16;
            }
            v94[0] = CFSTR("item-resume");
            v94[1] = CFSTR("item-begin");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 2);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = CFSTR("queue-section-id");
            v93 = v15;
            objc_msgSend(*(id *)(v53 + 3696), "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "findPreviousEventWithTypes:matchingPayload:", v62, v63);
            v64 = v53;
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            v90[0] = CFSTR("queue-section-id");
            v90[1] = CFSTR("item-jump-user-initiated");
            v91[0] = v15;
            v91[1] = MEMORY[0x24BDBD1C8];
            objc_msgSend(*(id *)(v64 + 3696), "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "findPreviousEventWithType:matchingPayload:", CFSTR("item-position-jump"), v65);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37 && (!v36 || objc_msgSend(v37, "compare:", v36) == 1))
            {
              v66 = v37;

              v36 = v66;
            }
            objc_msgSend(v36, "type");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v67, "isEqualToString:", CFSTR("item-begin"));

            if (v68)
            {
              objc_msgSend(v36, "payload");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("item-metadata"));
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("item-initial-position"));
              v71 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(v36, "type");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = objc_msgSend(v72, "isEqualToString:", CFSTR("item-resume"));

              if (!v73)
              {
                objc_msgSend(v36, "type");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = objc_msgSend(v75, "isEqualToString:", CFSTR("item-position-jump"));

                v11 = v82;
                if (!v76)
                {
                  v71 = 0;
                  goto LABEL_52;
                }
                objc_msgSend(v36, "payload");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("item-end-position"));
                v71 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:

LABEL_52:
                objc_msgSend(v71, "doubleValue");
                v29 = v74;

                goto LABEL_16;
              }
              objc_msgSend(v36, "payload");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("item-start-position"));
              v71 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v11 = v82;
            goto LABEL_51;
          }
        }
        else
        {
          v29 = 0.0;
          v53 = 0x24BDBC000;
          if (objc_msgSend(v81, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-timed-metadata-ping"), 0) >= 2)goto LABEL_40;
        }
        v12 = v84;
        v41 = v81;
        goto LABEL_35;
      }
    }
    else
    {
LABEL_12:
      objc_msgSend(v13, "cursorUntilEvent:", v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "type");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("item-resume"));

    if (!v32)
    {
      objc_msgSend(v10, "type");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("item-begin"));

      if (v40)
      {
        objc_msgSend(v11, "payload");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("item-metadata"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("item-initial-position"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "doubleValue");
        v29 = v43;

      }
      else
      {
        objc_msgSend(v10, "payload");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("item-end-position"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "doubleValue");
        v29 = v44;
      }
      v12 = v84;
      goto LABEL_34;
    }
    objc_msgSend(v13, "cursorFromEvent:untilEvent:", v10, v11);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = CFSTR("queue-section-id");
    v88[1] = CFSTR("queue-item-id");
    v89[0] = v15;
    v89[1] = v85;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v89, v88, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v33;
    v35 = objc_msgSend(v33, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-resume"), v34);

    if (!v35)
    {
      v83 = v11;
      v87[0] = MEMORY[0x24BDBD1C8];
      v86[0] = CFSTR("item-jump-user-initiated");
      v86[1] = CFSTR("queue-section-id");
      objc_msgSend(v10, "payload");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v87[1] = v45;
      v86[2] = CFSTR("queue-item-id");
      objc_msgSend(v10, "payload");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v87[2] = v47;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 3);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "findPreviousEventWithType:matchingPayload:", CFSTR("item-position-jump"), v48);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v36, "payload");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("item-end-position"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "doubleValue");
        v29 = v50;
        v11 = v83;
      }
      else
      {
        v11 = v83;
        objc_msgSend(v83, "payload");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("item-metadata"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("item-initial-position"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "doubleValue");
        v29 = v56;

      }
      v12 = v84;

      goto LABEL_33;
    }
    objc_msgSend(v10, "payload");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("item-start-position"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");
    v29 = v38;
LABEL_16:
    v12 = v84;
LABEL_33:

    v41 = v81;
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
  v29 = -1.0;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    v99 = self;
    v100 = 2114;
    v101 = v10;
    v102 = 2114;
    v103 = v13;
    _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _getStartTimeForMostRecentPlaybackStart:withItemBeginEvent:cursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
  }
LABEL_36:

  return v29;
}

- (double)_getPlaybackDurationForHLSStreamFromStartEvent:(id)a3 toEndEvent:(id)a4 withLimitedCursor:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "timeIntervalSinceEvent:", v7);
  v11 = v10;
  objc_msgSend(v9, "findPreviousEventWithType:matchingPayload:", CFSTR("item-buffer-stall"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v9, "cursorUntilEvent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-buffer-ready"), 0);
    v22 = 0;
    v23 = (double *)&v22;
    v24 = 0x2020000000;
    v25 = 0;
    v15 = 0;
    if (!v14)
      objc_msgSend(v8, "timeIntervalSinceEvent:", v12, 0.0);
    v25 = v15;
    v26[0] = CFSTR("item-pause");
    v26[1] = CFSTR("item-end");
    v26[2] = CFSTR("item-buffer-ready");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __112__MPCPlayActivityFeedEventConsumer__getPlaybackDurationForHLSStreamFromStartEvent_toEndEvent_withLimitedCursor___block_invoke;
    v18[3] = &unk_24CAB55F8;
    v19 = v9;
    v20 = v7;
    v21 = &v22;
    objc_msgSend(v19, "enumeratePreviousEventsWithTypes:usingBlock:", v16, v18);

    if (v11 - v23[3] >= 0.0)
      v11 = v11 - v23[3];
    else
      v11 = 0.0;

    _Block_object_dispose(&v22, 8);
  }

  return v11;
}

- (void)_sendPlayEndNotificationWithStartTime:(double)a3 endTime:(double)a4 pafEvent:(id)a5 cursor:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MPCPlayActivityFeedEventConsumer *v22;
  void *v23;
  _BOOL4 v24;
  unint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  MPCPlayActivityFeedEventConsumer *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v11, "findPreviousEventWithType:matchingPayload:", CFSTR("session-begin"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "payload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("behavior-type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  v39[0] = CFSTR("shared-session-begin");
  v39[1] = CFSTR("shared-session-end");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "findPreviousEventWithTypes:matchingPayload:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "type");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("shared-session-begin")))
    {
      objc_msgSend(v18, "payload");
      v38 = v10;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("shared-session-type"));
      v21 = v13;
      v22 = self;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "integerValue") == 2;

      self = v22;
      v13 = v21;

      v10 = v38;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }
  v25 = 0x24BDD1000;
  if (v16 == 3 || v24)
  {
    objc_msgSend(v11, "findPreviousEventWithType:matchingPayload:", CFSTR("shared-session-participants-changed"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "payload");
    v27 = v10;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("participants"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "payload");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("shared-session-id"));
    v31 = v13;
    v32 = self;
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v34, CFSTR("MPCPlayActivityUtilitiesPlayEndEventSharedSessionParticipantCountKey"));

    v10 = v27;
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v33, CFSTR("MPCPlayActivityUtilitiesPlayEndEventSharedSessionIdKey"));

    self = v32;
    v13 = v31;
    v25 = 0x24BDD1000uLL;

  }
  if (objc_msgSend(v10, "endReasonType") == 11)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("MPCPlayActivityUtilitiesPlayEndEventIsNaturalTransitionKey"));
  objc_msgSend(*(id *)(v25 + 1760), "numberWithDouble:", a3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v35, CFSTR("MPCPlayActivityUtilitiesPlayEndEventStartTimeKey"));

  objc_msgSend(*(id *)(v25 + 1760), "numberWithDouble:", a4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v36, CFSTR("MPCPlayActivityUtilitiesPlayEndEventEndTimeKey"));

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "postNotificationName:object:userInfo:", CFSTR("MPCPlayActivityUtilitiesPlayEndNotification"), self, v12);

}

- (void)_updatePAFEvent:(id)a3 withQueueAddEvent:(id)a4 queueSectionIdentifier:(id)a5 cursor:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  MPCPlayActivityFeedEventConsumer *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  const __CFString *v36;
  id v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v35 = a5;
  v12 = a6;
  objc_msgSend(v11, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("queue-reporting-metadata"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("feature-name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFeatureName:", v15);

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("queue-grouping-id"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setQueueGroupingID:", v16);

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("reco-data"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRecommendationData:", v17);

  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("siri-ref-id"));
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithBool:", v19 != 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSiriInitiated:", v20);

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("application-bundle-id"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  v34 = (void *)MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID();
  v38[0] = v33;
  v38[1] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_msgSend(v22, "containsObject:", v21);

  v23 = self;
  objc_sync_enter(v23);
  if ((v19 & 1) != 0 || -[NSArray containsObject:](v23->_allowedBundleIds, "containsObject:", v21))
  {
    objc_msgSend(v10, "setRequestingBundleIdentifier:", v21);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("application-version"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRequestingBundleVersion:", v24);

  }
  objc_sync_exit(v23);

  objc_msgSend(v11, "payload");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("account-id"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = CFSTR("rectification-section-id");
  v37 = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "findPreviousEventWithType:matchingPayload:", CFSTR("account-rectification"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v28, "payload");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("account-id"));
    v30 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v30;
  }
  -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withAccountIdentifier:cursor:](v23, "_updatePAFEvent:withAccountIdentifier:cursor:", v10, v26, v12);
  objc_msgSend(v11, "payload");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("queue-delegated-account-id"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
    -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withEnqueuerAccountIdentifier:queueAddEvent:cursor:](v23, "_updatePAFEvent:withEnqueuerAccountIdentifier:queueAddEvent:cursor:", v10, v32, v11, v12);

}

- (void)_updatePAFEvent:(id)a3 withItemBeginEvent:(id)a4 containerBeginPayload:(id)a5 cursor:(id)a6 forEventType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
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
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned int v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
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
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  uint64_t v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  NSObject *v140;
  void *v141;
  void *v142;
  const __CFString *v143;
  void *v144;
  _QWORD v145[2];
  _QWORD v146[2];
  const __CFString *v147;
  void *v148;
  _QWORD v149[2];
  const __CFString *v150;
  void *v151;
  _QWORD v152[2];
  const __CFString *v153;
  void *v154;
  _QWORD v155[2];
  _QWORD v156[2];
  uint8_t buf[4];
  MPCPlayActivityFeedEventConsumer *v158;
  __int16 v159;
  id v160;
  __int16 v161;
  id v162;
  uint64_t v163;

  v163 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v13, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && v20)
  {
    v131 = v16;
    v155[0] = CFSTR("queue-section-id");
    v155[1] = CFSTR("queue-item-id");
    v156[0] = v18;
    v156[1] = v20;
    v134 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v156, v155, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "findPreviousEventWithType:matchingPayload:", CFSTR("item-update"), v21);
    v140 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "payload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("container-metadata"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("item-metadata"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = CFSTR("queue-section-id");
    v139 = v22;
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "findPreviousEventWithType:matchingPayload:", CFSTR("queue-add"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v137 = v25;
    objc_msgSend(v25, "payload");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("private-listening-source"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "integerValue");

    v135 = v18;
    v136 = v15;
    v132 = v14;
    switch(v28)
    {
      case 0:
        objc_msgSend(v12, "setPrivateListeningEnabled:", MEMORY[0x24BDBD1C8]);
        goto LABEL_29;
      case 1:
        objc_msgSend(v15, "findPreviousEventWithType:matchingPayload:", CFSTR("device-changed"), 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "payload");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("device-metadata"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("private-listening-enabled"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "payload");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("device-metadata"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("focus-mode-private-listening-enabled"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "integerValue");

        if (v37)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v37 == 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setPrivateListeningEnabled:", v38);

        }
        else
        {
          if (v33)
            v57 = v33;
          else
            v57 = (void *)MEMORY[0x24BDBD1C8];
          objc_msgSend(v12, "setPrivateListeningEnabled:", v57);
        }

        goto LABEL_29;
      case 2:
        objc_msgSend(v137, "payload");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("account-id"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          v152[0] = CFSTR("account-begin");
          v152[1] = CFSTR("account-update");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v152, 2);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v150 = CFSTR("account-id");
          v151 = v40;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "findPreviousEventWithTypes:matchingPayload:", v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "findPreviousEventWithType:matchingPayload:", CFSTR("device-changed"), 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "payload");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("account-metadata"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("private-listening-enabled"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v44, "payload");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("device-metadata"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("focus-mode-private-listening-enabled"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "integerValue");

          if (v51)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v51 == 1);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setPrivateListeningEnabled:", v52);

          }
          else
          {
            if (v47)
              v60 = v47;
            else
              v60 = (void *)MEMORY[0x24BDBD1C8];
            objc_msgSend(v12, "setPrivateListeningEnabled:", v60);
          }
          v14 = v132;

LABEL_29:
          objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("item-duration"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "doubleValue");
          objc_msgSend(v12, "setItemDuration:");

          objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("item-has-video"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "BOOLValue");

          objc_msgSend(v12, "setMediaType:", v63);
          objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("radio-track-info"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTrackInfo:", v64);

          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("container-kind"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v59, "modelClass");
          if (v65 == objc_opt_class())
          {
            v70 = 1;
            v67 = v140;
          }
          else
          {
            v66 = objc_msgSend(v59, "modelClass");
            v67 = v140;
            if (v66 == objc_opt_class())
            {
              v70 = 2;
            }
            else
            {
              v68 = objc_msgSend(v59, "modelClass");
              if (v68 == objc_opt_class())
              {
                v70 = 3;
              }
              else
              {
                v69 = objc_msgSend(v59, "modelClass");
                v70 = 4 * (v69 == objc_opt_class());
              }
            }
          }
          objc_msgSend(v12, "setContainerType:", v70);
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("container-ids"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_alloc_init(MEMORY[0x24BEC88F0]);
          -[NSObject payload](v67, "payload");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("item-ids"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v74;
          if (v74)
          {
            v76 = v74;
          }
          else
          {
            objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("item-ids"));
            v76 = (id)objc_claimAutoreleasedReturnValue();
          }
          v77 = v76;

          v138 = objc_alloc_init(MEMORY[0x24BEC88F8]);
          -[NSObject payload](v140, "payload");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("item-kind"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = v79;
          if (v79)
          {
            v81 = v79;
          }
          else
          {
            objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("item-kind"));
            v81 = (id)objc_claimAutoreleasedReturnValue();
          }
          v133 = v81;

          objc_msgSend(v71, "universalStore");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setAdamID:", objc_msgSend(v82, "adamID"));

          objc_msgSend(v77, "personalizedStore");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "cloudAlbumID");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setCloudAlbumID:", v84);

          objc_msgSend(v71, "personalizedStore");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setCloudPlaylistID:", objc_msgSend(v85, "cloudID"));

          objc_msgSend(v71, "universalStore");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "globalPlaylistID");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setGlobalPlaylistID:", v87);

          objc_msgSend(v142, "objectForKeyedSubscript:", CFSTR("container-playlist-version-hash"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setPlaylistVersionHash:", v88);

          objc_msgSend(v71, "radio");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setStationID:", objc_msgSend(v89, "stationID"));

          objc_msgSend(v71, "radio");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "stationHash");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setStationHash:", v91);

          objc_msgSend(v71, "radio");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "stationStringID");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setStationStringID:", v93);

          objc_msgSend(v12, "setContainerIDs:", v72);
          objc_msgSend(v142, "objectForKeyedSubscript:", CFSTR("container-is-collaborative-playlist"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setCollaborativePlaylist:", objc_msgSend(v94, "BOOLValue"));

          objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("item-artist-uploaded"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v93) = objc_msgSend(v95, "BOOLValue");

          if ((_DWORD)v93)
          {
            objc_msgSend(v77, "universalStore");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = objc_msgSend(v96, "subscriptionAdamID");
            v98 = v77;
            if (v97)
            {
              objc_msgSend(v138, "setSubscriptionAdamID:", v97);
            }
            else
            {
              objc_msgSend(v77, "universalStore");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v138, "setSubscriptionAdamID:", objc_msgSend(v110, "adamID"));

            }
            v107 = v142;

            v109 = 6;
          }
          else
          {
            v99 = objc_msgSend(v59, "modelClass");
            v100 = objc_opt_class();
            objc_msgSend(v77, "universalStore");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = v101;
            v98 = v77;
            if (v99 == v100)
            {
              v111 = objc_msgSend(v101, "adamID");
              v107 = v142;
              if (v111)
              {
                objc_msgSend(v138, "setRadioAdamID:", v111);
              }
              else
              {
                objc_msgSend(v98, "universalStore");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v138, "setRadioAdamID:", objc_msgSend(v112, "subscriptionAdamID"));

              }
              v109 = objc_msgSend(v138, "radioAdamID") != 0;
            }
            else
            {
              objc_msgSend(v138, "setSubscriptionAdamID:", objc_msgSend(v101, "subscriptionAdamID"));

              objc_msgSend(v77, "universalStore");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v138, "setPurchasedAdamID:", objc_msgSend(v103, "purchasedAdamID"));

              objc_msgSend(v77, "personalizedStore");
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v138, "setCloudID:", objc_msgSend(v104, "cloudID"));

              objc_msgSend(v77, "universalStore");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v138, "setReportingAdamID:", objc_msgSend(v105, "reportingAdamID"));

              v106 = objc_msgSend(v133, "modelClass");
              v107 = v142;
              if (v106 == objc_opt_class())
              {
                v109 = 9;
              }
              else
              {
                v108 = objc_msgSend(v133, "modelClass");
                if (v108 == objc_opt_class())
                  v109 = 8;
                else
                  v109 = objc_msgSend(v138, "subscriptionAdamID")
                      || objc_msgSend(v138, "purchasedAdamID")
                      || objc_msgSend(v138, "reportingAdamID");
              }
            }
          }
          objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("container-radio-type"));
          v113 = objc_claimAutoreleasedReturnValue();
          if (v113
            && (v114 = (void *)v113,
                objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("container-radio-type")),
                v115 = (void *)objc_claimAutoreleasedReturnValue(),
                v116 = objc_msgSend(v115, "intValue"),
                v115,
                v114,
                v116 == 4))
          {
            v128 = v12;
            v149[0] = CFSTR("item-hls-stream-begin");
            v149[1] = CFSTR("item-hls-stream-end");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v149, 2);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = CFSTR("queue-section-id");
            v148 = v135;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
            v118 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "findPreviousEventWithTypes:matchingPayload:", v117, v118);
            v119 = (void *)objc_claimAutoreleasedReturnValue();

            v145[0] = CFSTR("queue-section-id");
            v145[1] = CFSTR("queue-item-id");
            v146[0] = v135;
            v146[1] = v134;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v146, v145, 2);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "findPreviousEventWithType:matchingPayload:", CFSTR("item-timed-metadata-ping"), v120);
            v129 = objc_claimAutoreleasedReturnValue();

            v130 = v119;
            objc_msgSend(v119, "type");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v118) = objc_msgSend(v121, "isEqualToString:", CFSTR("item-hls-stream-begin"));

            objc_msgSend(v142, "objectForKeyedSubscript:", CFSTR("container-radio-subtype"));
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            v123 = objc_msgSend(v122, "integerValue");

            if ((v118 & 1) != 0 || v123 == 2)
            {
              v16 = v131;
              v127 = (void *)v129;
              if (v129 && (objc_msgSend(v131, "isEqualToString:", CFSTR("item-end")) & 1) != 0)
                v109 = 5;
              else
                v109 = 4;
              v20 = v134;
              v12 = v128;
            }
            else
            {
              if (v119)
              {
                objc_msgSend(v136, "cursorUntilEvent:", v13);
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                v143 = CFSTR("queue-section-id");
                v144 = v135;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v124, "findPreviousEventWithType:matchingPayload:", CFSTR("item-hls-stream-end"), v125);
                v126 = (void *)objc_claimAutoreleasedReturnValue();

                if (v126)
                  v109 = 4;

              }
              v16 = v131;
              v20 = v134;
              v12 = v128;
              v127 = (void *)v129;
            }

          }
          else
          {
            v16 = v131;
            v20 = v134;
          }
          objc_msgSend(v12, "setItemIDs:", v138);
          objc_msgSend(v12, "setItemType:", v109);

          v14 = v132;
          v18 = v135;
          v15 = v136;
        }
        else
        {
          v58 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218498;
            v158 = self;
            v159 = 2114;
            v160 = v137;
            v161 = 2114;
            v162 = v15;
            _os_log_impl(&dword_210BD8000, v58, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _updatePafEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType: - could not find accountIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
          }
          v16 = v131;
          v20 = v134;
          v59 = v58;
        }
        v29 = v140;

        break;
      case 3:
        objc_msgSend(v137, "payload");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("queue-reporting-metadata"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("private-listening-enabled"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
          v56 = v55;
        else
          v56 = (void *)MEMORY[0x24BDBD1C8];
        objc_msgSend(v12, "setPrivateListeningEnabled:", v56);

        goto LABEL_29;
      default:
        goto LABEL_29;
    }
  }
  else
  {
    v29 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v158 = self;
      v159 = 2114;
      v160 = v13;
      v161 = 2114;
      v162 = v15;
      _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _updatePafEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
    }
  }

}

- (void)_updatePAFEvent:(id)a3 withAccountIdentifier:(id)a4 cursor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  _QWORD v22[2];
  uint8_t buf[4];
  MPCPlayActivityFeedEventConsumer *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v22[0] = CFSTR("account-update");
    v22[1] = CFSTR("account-begin");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("account-id");
    v21 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "findPreviousEventWithTypes:matchingPayload:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    -[NSObject payload](v13, "payload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("account-metadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("subscription-status"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSBEnabled:", objc_msgSend(v16, "hasCapability:", 128));
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("store-front-id"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStoreFrontID:", v17);

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("store-account-id"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStoreAccountID:", objc_msgSend(v18, "unsignedLongLongValue"));

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("household-id"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHouseholdID:", v19);

  }
  else
  {
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v24 = self;
      v25 = 2114;
      v26 = v8;
      v27 = 2114;
      v28 = v10;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_ERROR, "MPCPlayActivityFeedEventConsumer %p - Unable to update PAF event [missing account identifier] - event:%{public}@ - cursor:%{public}@", buf, 0x20u);
    }
  }

}

- (void)_updatePAFEvent:(id)a3 withEnqueuerAccountIdentifier:(id)a4 queueAddEvent:(id)a5 cursor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *v47;
  const __CFString *v48;
  id v49;
  _QWORD v50[2];
  uint8_t buf[4];
  MPCPlayActivityFeedEventConsumer *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    objc_msgSend(v12, "payload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("queue-reporting-metadata"));
    v15 = objc_claimAutoreleasedReturnValue();

    v47 = v15;
    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("device-metadata"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = CFSTR("account-update");
    v50[1] = CFSTR("account-begin");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = CFSTR("account-id");
    v49 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "findPreviousEventWithTypes:matchingPayload:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v19;
    objc_msgSend(v19, "payload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("account-metadata"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc_init(MEMORY[0x24BEC88E0]);
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("store-account-id"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setStoreAccountID:", objc_msgSend(v23, "unsignedLongLongValue"));

    v45 = v21;
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("store-front-id"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setStoreFrontID:", v24);

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("user-agent"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBuildVersion:", v25);

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("device-guid"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDeviceGUID:", v26);

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("device-name"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDeviceName:", v27);

    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTimeZone:", v28);

    objc_msgSend(v12, "payload");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("queue-delegated-account-metadata"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("private-listening-enabled"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      v32 = v31;
    else
      v32 = (void *)MEMORY[0x24BDBD1C8];
    objc_msgSend(v22, "setPrivateListeningEnabled:", v32);
    objc_msgSend(v12, "payload");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("private-listening-source"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "integerValue");

    if (v35 == 1)
    {
      v44 = v11;
      v36 = v10;
      objc_msgSend(v13, "findPreviousEventWithType:matchingPayload:", CFSTR("device-changed"), 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "payload");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("device-metadata"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("private-listening-enabled"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v40, "BOOLValue"))
        objc_msgSend(v22, "setPrivateListeningEnabled:", MEMORY[0x24BDBD1C8]);

      v31 = v40;
      v10 = v36;
      v11 = v44;
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("device-software-variant"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v47;
    if ((objc_msgSend(v41, "isEqualToString:", CFSTR("Carrier")) & 1) != 0)
    {
      v43 = 2;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("Beta")) & 1) != 0)
    {
      v43 = 3;
    }
    else if (objc_msgSend(v41, "isEqualToString:", CFSTR("Internal")))
    {
      v43 = 4;
    }
    else
    {
      v43 = 1;
    }
    objc_msgSend(v22, "setSystemReleaseType:", v43);
    objc_msgSend(v22, "setSBEnabled:", 1);
    objc_msgSend(v10, "setEnqueuerProperties:", v22);

  }
  else
  {
    v42 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v52 = self;
      v53 = 2114;
      v54 = v10;
      v55 = 2114;
      v56 = v13;
      _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_ERROR, "MPCPlayActivityFeedEventConsumer %p - Unable to update PAF event [missing account identifier for delegated playback] - event:%{public}@ - cursor:%{public}@", buf, 0x20u);
    }
  }

}

- (void)_updatePAFEvent:(id)a3 withVocalAttenuationInfoForEndEvent:(id)a4 cursor:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v56;
  _QWORD v57[4];
  id v58;
  MPCPlayActivityFeedEventConsumer *v59;
  _QWORD *v60;
  uint64_t *v61;
  uint64_t *v62;
  _QWORD v63[4];
  uint64_t v64;
  double *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  const __CFString *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  _QWORD v82[4];

  v82[2] = *MEMORY[0x24BDAC8D0];
  v56 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v82[0] = CFSTR("item-resume");
  v82[1] = CFSTR("item-vocal-attenuation-changed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "findPreviousEventWithTypes:matchingPayload:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "payload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-available"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue") ? 1 : 2;

    objc_msgSend(v56, "setVocalAttenuationAvailability:", v17);
    if (v10)
    {
      if (v12
        && -[MPCPlayActivityFeedEventConsumer _itemIsPlayingFromQueueSectionIdentifier:itemIdentifier:cursor:](self, "_itemIsPlayingFromQueueSectionIdentifier:itemIdentifier:cursor:", v10, v12, v8))
      {
        v80 = CFSTR("queue-section-id");
        v81 = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "findPreviousEventWithType:matchingPayload:", CFSTR("container-begin"), v18);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v78 = CFSTR("queue-section-id");
        v79 = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "findPreviousEventWithType:matchingPayload:", CFSTR("item-hls-stream-begin"), v19);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v54, "payload");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("container-indeterminate-duration"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "BOOLValue"))
        {

LABEL_11:
          objc_msgSend(v56, "setVocalAttenuationDuration:", 0.0, v50);
LABEL_27:

          goto LABEL_28;
        }
        objc_msgSend(v53, "payload");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("container-metadata"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("container-radio-subtype"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v50) = objc_msgSend(v24, "integerValue") == 2;

        if ((_DWORD)v50)
          goto LABEL_11;
        v77[0] = CFSTR("item-resume");
        v77[1] = CFSTR("item-position-jump");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v75[0] = CFSTR("queue-section-id");
        v75[1] = CFSTR("queue-item-id");
        v76[0] = v10;
        v76[1] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayActivityFeedEventConsumer _findRecentPlaybackStartFromTypes:matchingPayload:cursor:](self, "_findRecentPlaybackStartFromTypes:matchingPayload:cursor:", v25, v26, v8);
        v51 = objc_claimAutoreleasedReturnValue();

        v68 = 0;
        v69 = (double *)&v68;
        v70 = 0x2020000000;
        v71 = 0;
        objc_msgSend(v7, "payload");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("item-end-position"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "doubleValue");
        v30 = v29;

        v71 = v30;
        objc_msgSend(v7, "type");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v31, "isEqualToString:", CFSTR("item-end")) & 1) != 0)
        {
          objc_msgSend(v7, "payload");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("item-did-play-to-end"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "BOOLValue");

          if (v34)
          {
            v73[0] = CFSTR("queue-section-id");
            v73[1] = CFSTR("queue-item-id");
            v74[0] = v10;
            v74[1] = v12;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v36, "payload");
            v37 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v37, "objectForKeyedSubscript:", CFSTR("item-metadata"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("item-end-boundary"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v37) = v39 == 0;

            if ((v37 & 1) != 0)
              objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("item-duration"));
            else
              objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("item-end-boundary"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "doubleValue");
            *((_QWORD *)v69 + 3) = v44;

            goto LABEL_21;
          }
        }
        else
        {

        }
        objc_msgSend(v7, "type", v51);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("item-position-jump"));

        if (!v42)
        {
LABEL_22:
          if (objc_msgSend(v14, "isEqual:", v51, v51))
          {
            if (-[MPCPlayActivityFeedEventConsumer _vocalControlIsOnForEvent:](self, "_vocalControlIsOnForEvent:", v52))
            {
              objc_msgSend(v52, "payload");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("item-start-position"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "doubleValue");
              v48 = v47;

              objc_msgSend(v56, "setVocalAttenuationDuration:", v69[3] - v48);
            }
          }
          else
          {
            v64 = 0;
            v65 = (double *)&v64;
            v66 = 0x2020000000;
            v67 = 0;
            v63[0] = 0;
            v63[1] = v63;
            v63[2] = 0x2020000000;
            v63[3] = 0xBFF0000000000000;
            v72[0] = CFSTR("item-resume");
            v72[1] = CFSTR("item-vocal-attenuation-changed");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 2);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v57[0] = MEMORY[0x24BDAC760];
            v57[1] = 3221225472;
            v57[2] = __95__MPCPlayActivityFeedEventConsumer__updatePAFEvent_withVocalAttenuationInfoForEndEvent_cursor___block_invoke;
            v57[3] = &unk_24CAB5658;
            v58 = v52;
            v59 = self;
            v60 = v63;
            v61 = &v68;
            v62 = &v64;
            objc_msgSend(v8, "enumeratePreviousEventsWithTypes:usingBlock:", v49, v57);

            objc_msgSend(v56, "setVocalAttenuationDuration:", v65[3]);
            _Block_object_dispose(v63, 8);
            _Block_object_dispose(&v64, 8);
          }
          _Block_object_dispose(&v68, 8);

          goto LABEL_27;
        }
        objc_msgSend(v7, "payload");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("item-start-position"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "doubleValue");
        *((_QWORD *)v69 + 3) = v43;
LABEL_21:

        goto LABEL_22;
      }
    }
  }
LABEL_28:

}

- (BOOL)_vocalControlIsOnForEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v5 = a3;
  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("item-resume")) & 1) == 0)
  {
    objc_msgSend(v5, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("item-vocal-attenuation-changed"));

    if ((v8 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlayActivityFeedEventConsumer.m"), 1452, CFSTR("Only Item Resume and Vocal Attenuation Changed events contain vocal attenuation fields."));
  }

LABEL_5:
  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-available"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "BOOLValue"))
  {
    objc_msgSend(v5, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-configured"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "BOOLValue"))
    {
      objc_msgSend(v5, "payload");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("supports-vocal-attenuation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "BOOLValue"))
      {
        objc_msgSend(v5, "payload");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-enabled"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "BOOLValue");

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_updatePAFEvent:(id)a3 withDeviceInfoFromCursor:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  id *v54;
  void *v55;
  MPCPlayActivityFeedEventConsumer *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[2];
  _BYTE v69[128];
  _QWORD v70[3];

  v56 = self;
  v70[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v61 = a4;
  v70[0] = CFSTR("device-changed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "findPreviousEventWithTypes:matchingPayload:", v6, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v58, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("device-metadata"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v58, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("internal-carry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    objc_msgSend(&unk_24CB173F8, "arrayByAddingObject:", CFSTR("CARRY"), v56);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = &unk_24CB173F8;
  }
  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("media-frameworks"), v56);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = 0;
  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v65 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        v13 |= objc_msgSend(v17, "isRoot");
        v12 |= objc_msgSend(v17, "isDebug");
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    }
    while (v14);
  }

  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("application-source-version"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v18;
  if (v18)
  {
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("9000"));
    v20 = objc_msgSend(v62, "isEqualToString:", CFSTR("9100"));
    v21 = objc_msgSend(v62, "hasSuffix:", CFSTR("-Debug"));
    v22 = objc_msgSend(v62, "hasPrefix:", CFSTR("9000"));
    v12 |= v21 | v19;
    v13 |= objc_msgSend(v62, "isEqualToString:", CFSTR("9999.99.99")) | v22 | v20;
  }
  if ((v10 & 1) != 0 || ((v13 | v12) & 1) == 0)
  {
    v23 = v59;
    if ((v13 & 1) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  objc_msgSend(v59, "arrayByAddingObject:", CFSTR("DEV"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v13 & 1) != 0)
  {
LABEL_18:
    v24 = v23;
    objc_msgSend(v23, "arrayByAddingObject:", CFSTR("ROOTS"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_19:
  if ((v12 & 1) != 0)
  {
    v25 = v23;
    objc_msgSend(v23, "arrayByAddingObject:", CFSTR("DEBUG"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v60 = v23;
  objc_msgSend(v5, "setBuildFeatures:", v23);
  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("user-agent"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBuildVersion:", v26);

  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("device-name"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceName:", v27);

  objc_msgSend(v5, "requestingBundleVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    goto LABEL_22;
  objc_msgSend(v5, "requestingBundleIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29 == 0;

  if (v30)
  {
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("application-bundle-id"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    v51 = (void *)MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID();
    v68[0] = v50;
    v68[1] = v51;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "containsObject:", v28);

    v54 = v57;
    objc_sync_enter(v54);
    if ((v53 & 1) != 0 || objc_msgSend(v54[1], "containsObject:", v28))
    {
      objc_msgSend(v5, "setRequestingBundleIdentifier:", v28);
      objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("application-version"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRequestingBundleVersion:", v55);

    }
    objc_sync_exit(v54);

LABEL_22:
  }
  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("device-software-variant"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "isEqualToString:", CFSTR("Carrier")) & 1) != 0)
  {
    v32 = 2;
  }
  else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("Beta")) & 1) != 0)
  {
    v32 = 3;
  }
  else if (objc_msgSend(v31, "isEqualToString:", CFSTR("Internal")))
  {
    v32 = 4;
  }
  else
  {
    v32 = 1;
  }
  objc_msgSend(v5, "setSystemReleaseType:", v32);
  objc_msgSend(v61, "findPreviousEventWithType:matchingPayload:", CFSTR("network-reachability-changed"), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "payload");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("network-reachability"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setOffline:", objc_msgSend(v35, "integerValue") == 0);
  objc_msgSend(v61, "findPreviousEventWithType:matchingPayload:", CFSTR("playback-behavior-changed"), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "payload");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("playback-behavior-metadata"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("repeat-type"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "intValue");

  if (v40 <= 2)
    objc_msgSend(v5, "setRepeatPlayMode:", v40 + 1);
  objc_msgSend(v36, "payload");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("playback-behavior-metadata"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("shuffle-type"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "intValue");

  if (v44 <= 2)
    objc_msgSend(v5, "setShufflePlayMode:", qword_210ED9350[v44]);
  objc_msgSend(v36, "payload");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("playback-behavior-metadata"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("autoplay-mode"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "intValue");

  if (v48 <= 3)
    objc_msgSend(v5, "setAutoPlayMode:", v48);
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventTimeZone:", v49);

}

- (void)_updatePAFEvent:(id)a3 withAudioChangeEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v5 = a3;
  if (a4)
  {
    v20 = v5;
    objc_msgSend(a4, "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("item-audio-format-metadata"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("active-format"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("target-format"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preferred-tiers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (objc_msgSend(v9, "codec"))
    {
      v12 = objc_alloc_init(MEMORY[0x24BEC88D8]);
      objc_msgSend(v12, "setBitDepth:", objc_msgSend(v9, "bitDepth"));
      objc_msgSend(v12, "setBitRate:", objc_msgSend(v9, "bitrate"));
      objc_msgSend(v9, "audioChannelLayoutDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setChannelLayoutDescription:", v13);

      objc_msgSend(v12, "setCodec:", objc_msgSend(v9, "codec"));
      objc_msgSend(v12, "setSampleRate:", objc_msgSend(v9, "sampleRate"));
      objc_msgSend(v12, "setSpatialized:", objc_msgSend(v9, "isMultiChannel"));
      objc_msgSend(v20, "setTargetedAudioQuality:", v12);

    }
    if (objc_msgSend(v8, "codec"))
    {
      v14 = objc_alloc_init(MEMORY[0x24BEC88D8]);
      objc_msgSend(v14, "setBitDepth:", objc_msgSend(v8, "bitDepth"));
      objc_msgSend(v14, "setBitRate:", objc_msgSend(v8, "bitrate"));
      objc_msgSend(v8, "audioChannelLayoutDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setChannelLayoutDescription:", v15);

      objc_msgSend(v14, "setCodec:", objc_msgSend(v8, "codec"));
      objc_msgSend(v14, "setSampleRate:", objc_msgSend(v8, "sampleRate"));
      objc_msgSend(v14, "setSpatialized:", objc_msgSend(v8, "isMultiChannel"));
      objc_msgSend(v20, "setProvidedAudioQuality:", v14);

    }
    v16 = 2;
    v17 = 3;
    if ((v11 & 4) == 0)
      v17 = (v11 >> 1) & 4;
    if ((v11 & 2) == 0)
      v16 = v17;
    if ((v11 & 1) != 0)
      v18 = 1;
    else
      v18 = v16;
    objc_msgSend(v20, "setAudioQualityPreference:", v18);
    if ((v11 & 0x10) != 0)
      v19 = 2;
    else
      v19 = 1;
    objc_msgSend(v20, "setPlaybackFormatPreference:", v19);

    v5 = v20;
  }

}

- (void)_updatePAFEvent:(id)a3 withSharedListeningInfoFromCursor:(id)a4
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
  void *v15;
  _BOOL4 v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("session-begin"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("behavior-type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  v30[0] = CFSTR("shared-session-begin");
  v30[1] = CFSTR("shared-session-end");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findPreviousEventWithTypes:matchingPayload:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("shared-session-begin")) & 1) != 0)
    {
      objc_msgSend(v12, "payload");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("shared-session-type"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue") == 2;

      if (v16)
      {
        v17 = v6;
        v18 = v10 == 3;
        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  objc_msgSend(v6, "cursorUntilEvent:", v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == 3)
  {
    v18 = 1;
LABEL_8:
    objc_msgSend(v17, "findPreviousEventWithType:matchingPayload:", CFSTR("shared-session-participants-changed"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "payload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("shared-session-event-route-type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "intValue");
      if (MROutputDeviceSubtypeFromGroupSessionRoute() == 14)
      {
LABEL_18:

        goto LABEL_19;
      }
      if (!v18)
      {
        if (objc_msgSend(v21, "intValue") == 8 || objc_msgSend(v21, "intValue") == 11)
        {
          v22 = 6;
        }
        else
        {
          if (objc_msgSend(v21, "intValue") != 5)
            goto LABEL_17;
          objc_msgSend(v21, "intValue");
          if (MROutputDeviceTypeFromGroupSessionRoute() == 1)
          {
            v22 = 5;
          }
          else
          {
            objc_msgSend(v21, "intValue");
            v22 = 4 * (MROutputDeviceTypeFromGroupSessionRoute() == 2);
          }
        }
        goto LABEL_16;
      }
    }
    else if (!v18)
    {
LABEL_17:
      objc_msgSend(v19, "payload");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("participants"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setSharedActivityGroupSizeCurrent:", objc_msgSend(v24, "count"));
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v29 = 0;
      v29 = objc_msgSend(v24, "count");
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __86__MPCPlayActivityFeedEventConsumer__updatePAFEvent_withSharedListeningInfoFromCursor___block_invoke;
      v25[3] = &unk_24CABA670;
      v25[4] = &v26;
      objc_msgSend(v17, "enumeratePreviousEventsWithType:usingBlock:", CFSTR("shared-session-participants-changed"), v25);
      objc_msgSend(v5, "setSharedActivityGroupSizeMax:", v27[3]);
      _Block_object_dispose(&v26, 8);

      goto LABEL_18;
    }
    v22 = 1;
LABEL_16:
    objc_msgSend(v5, "setSharedActivityType:", v22);
    goto LABEL_17;
  }
LABEL_19:

}

- (void)_clampTimeValuesForPAFEvent:(id)a3 withDuration:(double)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "itemStartTime");
  v6 = v5;
  objc_msgSend(v11, "itemEndTime");
  v8 = 0.0;
  if (v6 >= 0.0)
    v9 = v6;
  else
    v9 = 0.0;
  if (v7 >= 0.0)
    v8 = v7;
  if (v9 >= a4)
    v10 = a4;
  else
    v10 = v9;
  if (v8 < a4)
    a4 = v8;
  objc_msgSend(v11, "setItemStartTime:", v10);
  objc_msgSend(v11, "setItemEndTime:", a4);

}

- (BOOL)_finalizePAFEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  MPCPlayActivityFeedEventConsumer *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEC8908], "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__MPCPlayActivityFeedEventConsumer__finalizePAFEvents___block_invoke;
  v8[3] = &unk_24CAB8C28;
  v9 = v4;
  v10 = self;
  v6 = v4;
  objc_msgSend(v5, "recordPlayActivityEvents:shouldFlush:withCompletionHandler:", v6, 0, v8);

  return 1;
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (NSMutableArray)radioPlayActivityEvents
{
  return self->_radioPlayActivityEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioPlayActivityEvents, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_allowedBundleIds, 0);
}

void __55__MPCPlayActivityFeedEventConsumer__finalizePAFEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint8_t v9[16];
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  if (a2)
  {
    v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "[MPCPlayActivityFeedEventConsumer] Failed to record play activity events.", v9, 2u);
    }
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BEC89F8]);
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v4, "initWithIdentity:", v5);

    objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__MPCPlayActivityFeedEventConsumer__finalizePAFEvents___block_invoke_2;
    v10[3] = &unk_24CAB56C8;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11 = v7;
    v12 = v8;
    objc_msgSend(v6, "getBagForRequestContext:withCompletionHandler:", v2, v10);

  }
}

void __55__MPCPlayActivityFeedEventConsumer__finalizePAFEvents___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  BOOL v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  char v36;
  int v37;
  id obj;
  char v39;
  _QWORD v40[5];
  char v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[8];
  const __CFString *v48;
  void *v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[MPCPlayActivityFeedEventConsumer] Failed to fetch the bag.", buf, 2u);
    }

  }
  objc_msgSend(v5, "numberForBagKey:", CFSTR("play-activity-feed-post-all-play-starts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v36 = objc_msgSend(v8, "BOOLValue");
  else
    v36 = 0;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = *(id *)(a1 + 32);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (!v9)
  {

    goto LABEL_37;
  }
  v10 = v9;
  v31 = a1;
  v32 = v8;
  v33 = v6;
  v34 = v5;
  v11 = 0;
  v12 = 0;
  v39 = 0;
  v13 = *(_QWORD *)v44;
  v35 = *MEMORY[0x24BE65AB0];
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v44 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v14);
      v16 = objc_msgSend(v15, "eventType");
      if (objc_msgSend(v15, "systemReleaseType") == 4)
      {
        objc_msgSend(v15, "itemEndTime");
        v18 = v17;
        objc_msgSend(v15, "itemStartTime");
        if (v18 - v19 > 43200.0)
        {
          v37 = v12;
          v20 = (void *)MEMORY[0x24BE65C38];
          v48 = CFSTR("PAF Event");
          objc_msgSend(v15, "description");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v21;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v22 = v13;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v23;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v20;
          v12 = v37;
          objc_msgSend(v25, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v35, CFSTR("Bug"), CFSTR("PAFDurationBug"), CFSTR("Playback greater than 12 hours"), &stru_24CABB5D0, v24, 0);

          v13 = v22;
        }
      }
      switch(v16)
      {
        case 2:
          goto LABEL_23;
        case 1:
          v28 = objc_msgSend(v15, "reasonHintType") == 1;
          v39 |= v28;
          v12 |= objc_msgSend(v15, "containerType") == 1;
          v11 |= v36 | v28 & v12;
          if ((v11 & 1) == 0)
            goto LABEL_27;
          goto LABEL_25;
        case 0:
          v26 = objc_msgSend(v15, "endReasonType");
          if (v26 <= 0xF && ((1 << v26) & 0x8872) != 0)
LABEL_23:
            v11 = 1;
          break;
      }
      if ((v11 & 1) == 0)
        goto LABEL_27;
LABEL_25:
      if ((v39 & 1) != 0 && (v12 & 1) != 0)
      {

        v39 = 1;
        LOBYTE(v12) = 1;
        v6 = v33;
        v5 = v34;
        v8 = v32;
        goto LABEL_35;
      }
LABEL_27:
      ++v14;
    }
    while (v10 != v14);
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    v10 = v29;
  }
  while (v29);

  v6 = v33;
  v5 = v34;
  v8 = v32;
  if ((v11 & 1) == 0)
    goto LABEL_37;
LABEL_35:
  objc_msgSend(MEMORY[0x24BEC8908], "shared");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __55__MPCPlayActivityFeedEventConsumer__finalizePAFEvents___block_invoke_87;
  v40[3] = &unk_24CAB56A0;
  v40[4] = *(_QWORD *)(v31 + 40);
  v41 = v39 & 1;
  v42 = v12 & 1;
  objc_msgSend(v30, "flushPendingPlayActivityEventsWithCompletionHandler:", v40);

LABEL_37:
}

void __55__MPCPlayActivityFeedEventConsumer__finalizePAFEvents___block_invoke_87(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint8_t v9[8];
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "[MPCPlayActivityFeedEventConsumer] Failed to flush play activity events.", v9, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v10[0] = CFSTR("MPCJinglePlayActivityReportingControllerUserInfoKeyDidIncludeContainerChangeEvent");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = CFSTR("MPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEvent");
    v11[0] = v5;
    if (*(_BYTE *)(a1 + 41))
      v6 = *(unsigned __int8 *)(a1 + 40);
    else
      v6 = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:userInfo:](v2, "postNotificationName:object:userInfo:", CFSTR("MPCJinglePlayActivityReportingControllerDidFlushEventsNotification"), v4, v8);

  }
}

void __86__MPCPlayActivityFeedEventConsumer__updatePAFEvent_withSharedListeningInfoFromCursor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("participants"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v5 = objc_msgSend(v7, "count");
  if (v4 <= v5)
    v6 = v5;
  else
    v6 = v4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;

}

void __95__MPCPlayActivityFeedEventConsumer__updatePAFEvent_withVocalAttenuationInfoForEndEvent_cursor___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  id v19;

  v19 = a2;
  if (objc_msgSend(v19, "compare:", *(_QWORD *)(a1 + 32)) == 1)
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "_vocalControlIsOnForEvent:", v19);
    objc_msgSend(v19, "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("item-start-position"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    if (v5)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;

      v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v9 > 0.0)
      {
        v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        if (v10 > 0.0)
        {
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v10
                                                                      - v9
                                                                      + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                              + 8)
                                                                                  + 24);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0xBFF0000000000000;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0xBFF0000000000000;
        }
      }
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;

    }
  }
  else
  {
    *a3 = 1;
    if (objc_msgSend(*(id *)(a1 + 40), "_vocalControlIsOnForEvent:", v19))
    {
      objc_msgSend(*(id *)(a1 + 32), "payload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("item-start-position"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v13;

      objc_msgSend(*(id *)(a1 + 32), "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v14, "isEqualToString:", CFSTR("item-position-jump"));

      if ((_DWORD)v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "payload");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("item-end-position"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v17;

      }
      v18 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v18 > 0.0)
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v18
                                                                    - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                + 24);
    }
  }

}

void __112__MPCPlayActivityFeedEventConsumer__getPlaybackDurationForHLSStreamFromStartEvent_toEndEvent_withLimitedCursor___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cursorFromEvent:untilEvent:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findPreviousEventWithType:matchingPayload:", CFSTR("item-buffer-stall"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "cursorFromEvent:untilEvent:", v6, *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPreviousEventWithType:matchingPayload:", CFSTR("item-buffer-stall"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v10, "timeIntervalSinceEvent:", v8);
      if (v9 < 0.0)
        v9 = 0.0;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24);
    }
    else
    {
      *a3 = 1;
    }

  }
  else
  {
    *a3 = 1;
  }

}

void __93__MPCPlayActivityFeedEventConsumer__findRecentPlaybackStartFromTypes_matchingPayload_cursor___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("item-position-jump"));

  if (!v8)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "cursorFromEvent:untilEvent:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("remote-control-begin");
  v16[1] = CFSTR("remote-control-end");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "findPreviousEventWithTypes:matchingPayload:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("remote-control-end")))
    {

      goto LABEL_5;
    }
    objc_msgSend(v6, "payload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("item-jump-user-initiated"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if (!v15)
      goto LABEL_8;
LABEL_7:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
    goto LABEL_8;
  }
LABEL_5:

LABEL_8:
}

void __82__MPCPlayActivityFeedEventConsumer__generateAggregateNoncatalogEndEventForCursor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
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
  double v42;
  double v43;
  void *v44;
  int v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  int v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  void *v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[3];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  id v78;
  __int16 v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "cursorFromEvent:untilEvent:", v3, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("item-position-jump"));

    if (!v10)
      goto LABEL_10;
    v74[0] = CFSTR("remote-control-begin");
    v74[1] = CFSTR("remote-control-end");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject findPreviousEventWithTypes:matchingPayload:](v8, "findPreviousEventWithTypes:matchingPayload:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("remote-control-end")))
      {

        goto LABEL_30;
      }
      objc_msgSend(v3, "payload");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("item-jump-user-initiated"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      if (!v18)
        goto LABEL_30;
LABEL_10:
      v72[0] = CFSTR("queue-section-id");
      v72[1] = CFSTR("queue-item-id");
      v73[0] = v5;
      v73[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject findPreviousEventWithType:matchingPayload:](v8, "findPreviousEventWithType:matchingPayload:", CFSTR("item-begin"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "payload");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("item-metadata"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("item-duration"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v25 = v24;

      v26 = 0x24BDBC000uLL;
      v60 = v20;
      objc_msgSend(*(id *)(a1 + 40), "cursorFromEvent:untilEvent:", v3, v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = CFSTR("queue-section-id");
      v70[1] = CFSTR("queue-item-id");
      v71[0] = v5;
      v71[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "countOfPreviousEventsWithType:matchingPayload:", CFSTR("item-resume"), v28);

      if (v29)
      {
        objc_msgSend(v3, "type");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("item-end"));

        v59 = v27;
        if (!v31)
          goto LABEL_16;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v25
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                                + 24);
        v68[0] = CFSTR("queue-section-id");
        v68[1] = CFSTR("queue-item-id");
        v69[0] = v5;
        v69[1] = v7;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "findPreviousEventWithType:matchingPayload:", CFSTR("item-pause"), v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          objc_msgSend(v27, "cursorUntilEvent:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v66[0] = CFSTR("queue-section-id");
          v66[1] = CFSTR("queue-item-id");
          v67[0] = v5;
          v67[1] = v7;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "findPreviousEventWithType:matchingPayload:", CFSTR("item-resume"), v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36)
          {
LABEL_28:

            v27 = v59;
            goto LABEL_29;
          }

          v26 = 0x24BDBC000;
LABEL_16:
          v39 = *(void **)(a1 + 32);
          v63[0] = CFSTR("item-begin");
          v63[1] = CFSTR("item-resume");
          v63[2] = CFSTR("item-position-jump");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 3);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v61[0] = CFSTR("queue-section-id");
          v61[1] = CFSTR("queue-item-id");
          v62[0] = v5;
          v62[1] = v7;
          objc_msgSend(*(id *)(v26 + 3696), "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "_findRecentPlaybackStartFromTypes:matchingPayload:cursor:", v40, v41, v8);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            objc_msgSend(*(id *)(a1 + 32), "_getStartTimeForMostRecentPlaybackStart:withItemBeginEvent:containerBeginEvent:cursor:", v33, v60, 0, v8);
            v43 = v42;
            objc_msgSend(v3, "type");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("item-position-jump"));
            v46 = CFSTR("item-end-position");
            if (v45)
              v46 = CFSTR("item-start-position");
            v47 = v46;

            objc_msgSend(v3, "payload");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectForKeyedSubscript:", v47);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "doubleValue");
            v51 = v50;

            if (v51 >= v25)
              v51 = v25;
            objc_msgSend(v3, "payload");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("item-did-play-to-end"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "BOOLValue");

            if (v54)
              v55 = v25;
            else
              v55 = v51;
            v56 = v55 - v43;
            if (v56 >= 0.0)
              v57 = v56;
            else
              v57 = 0.0;
            v58 = *(_QWORD *)(a1 + 64);

            *(double *)(*(_QWORD *)(v58 + 8) + 24) = v57 + *(double *)(*(_QWORD *)(v58 + 8) + 24);
          }
          goto LABEL_28;
        }
        v64[0] = CFSTR("queue-section-id");
        v64[1] = CFSTR("queue-item-id");
        v65[0] = v5;
        v65[1] = v7;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "findPreviousEventWithType:matchingPayload:", CFSTR("item-resume"), v37);
        v26 = 0x24BDBC000uLL;
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
          goto LABEL_16;
      }
LABEL_29:

    }
  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v76 = v14;
      v77 = 2114;
      v78 = v3;
      v79 = 2114;
      v80 = v15;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _generateAggregateNoncatalogEndEventForCursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
    }
  }
LABEL_30:

}

void __120__MPCPlayActivityFeedEventConsumer__generatePlaybackEndEventFromEvent_withQueueSectionIdentifier_itemIdentifier_cursor___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  objc_msgSend(a2, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  if (v7 > 121)
  {
    if (v7 == 122)
    {
      v8 = a1 + 56;
    }
    else
    {
      if (v7 != 131)
        return;
      v8 = a1 + 48;
    }
  }
  else if (v7 == 4)
  {
    v8 = a1 + 32;
  }
  else
  {
    if (v7 != 5)
      return;
    v8 = a1 + 40;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24) = 1;
  *a3 = 1;
}

void __120__MPCPlayActivityFeedEventConsumer__generatePlaybackEndEventFromEvent_withQueueSectionIdentifier_itemIdentifier_cursor___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("item-audio-format-metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("active-format"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __65__MPCPlayActivityFeedEventConsumer__handleItemPauseEvent_cursor___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a2, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  if ((v7 - 1) <= 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __65__MPCPlayActivityFeedEventConsumer__handleItemPauseEvent_cursor___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("item-audio-format-metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("active-format"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __72__MPCPlayActivityFeedEventConsumer__handleItemPositionJumpEvent_cursor___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("item-audio-format-metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("active-format"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

uint64_t __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleItemResumeEvent:cursor:", a2, a3);
}

uint64_t __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleItemPositionJumpEvent:cursor:", a2, a3);
}

uint64_t __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleItemPauseEvent:cursor:", a2, a3);
}

uint64_t __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleItemEndEvent:cursor:", a2, a3);
}

uint64_t __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleApplicationTerminationEvent:cursor:", a2, a3);
}

@end
