@implementation MPCAutoBugCaptureEventConsumer

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.MediaPlaybackCore/ABC");
}

- (void)subscribeToEventStream:(id)a3
{
  id v5;
  NSMutableSet *v6;
  NSMutableSet *reportedBugSignatures;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  objc_storeStrong((id *)&self->_subscription, a3);
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  reportedBugSignatures = self->_reportedBugSignatures;
  self->_reportedBugSignatures = v6;

  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke;
  v13[3] = &unk_24CAB94A0;
  v13[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("remote-control-end"), v13);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_12;
  v12[3] = &unk_24CAB94A0;
  v12[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("remote-control-timeout"), v12);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_2;
  v11[3] = &unk_24CAB94A0;
  v11[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("asset-load-end"), v11);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_3;
  v10[3] = &unk_24CAB94A0;
  v10[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("item-rate-changed"), v10);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_4;
  v9[3] = &unk_24CAB94A0;
  v9[4] = self;
  objc_msgSend(v5, "subscribeToEventType:handler:", CFSTR("item-failed"), v9);

}

- (void)unsubscribeFromEventStream:(id)a3
{
  MPCPlaybackEngineEventStreamSubscription *subscription;

  subscription = self->_subscription;
  self->_subscription = 0;

}

- (BOOL)shouldReportError:(id)a3
{
  void *v3;
  uint64_t v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "msv_errorByUnwrappingDomain:", CFSTR("MPCError"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "code");

  return v4 != 28 && (v4 & 0xFFFFFFFFFFFFFFDFLL) != 24;
}

- (void)autoBugCaptureWithSubType:(id)a3 context:(id)a4 triggerThresholdValues:(id)a5 events:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSMutableSet *reportedBugSignatures;
  void *v17;
  NSObject *v18;
  const char *v19;
  NSMutableSet *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");

  reportedBugSignatures = self->_reportedBugSignatures;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(reportedBugSignatures) = -[NSMutableSet containsObject:](reportedBugSignatures, "containsObject:", v17);

  if ((reportedBugSignatures & 1) != 0)
  {
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics_Oversize");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v23 = v10;
      v24 = 2114;
      v25 = v11;
      v26 = 2114;
      v27 = v13;
      v19 = "PlayPerf ABC [discarded] subtype:%{public}@ context:%{public}@ events:%{public}@";
LABEL_6:
      _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x20u);
    }
  }
  else
  {
    v20 = self->_reportedBugSignatures;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v20, "addObject:", v21);

    objc_msgSend(MEMORY[0x24BE65C38], "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x24BE65AB0], CFSTR("Performance"), v10, v11, v12, v13, 0);
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics_Oversize");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v23 = v10;
      v24 = 2114;
      v25 = v11;
      v26 = 2114;
      v27 = v13;
      v19 = "PlayPerf ABC [reported] subtype:%{public}@ context:%{public}@ events:%{public}@";
      goto LABEL_6;
    }
  }

}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (NSMutableSet)reportedBugSignatures
{
  return self->_reportedBugSignatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedBugSignatures, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
}

uint64_t __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v15;
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
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
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
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v9, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "shouldReportError:", v11);

    if ((_DWORD)v10)
    {
      v42 = a1;
      v46 = CFSTR("remote-control-id");
      objc_msgSend(v5, "payload");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("remote-control-id"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("remote-control-begin"), v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v15;
      objc_msgSend(v6, "cursorUntilEvent:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("resolution-type");
      v45 = &unk_24CB16BD8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v17;
      objc_msgSend(v17, "findPreviousEventWithType:matchingPayload:", CFSTR("error-resolution"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v19;
      objc_msgSend(v19, "payload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("error-for-resolution"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_5;
      objc_msgSend(v9, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "domain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "msv_errorByUnwrappingDomain:code:", v23, objc_msgSend(v21, "code"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        objc_msgSend(v21, "msv_analyticSignature");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("CommandFailure-MissingInnerError-"), "stringByAppendingString:", v25);
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
LABEL_5:
        v39 = CFSTR("CommandFailure");
      }
      v26 = v16;
      objc_msgSend(v16, "payload");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "unsignedIntValue");

      MPCRemoteCommandDescriptionCopy(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v9, "error");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "msv_analyticSignature");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@:%@"), v30, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      _EVSEventToABCEvent(v26);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v35;
      _EVSEventToABCEvent(v5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v36;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v42 + 32), "autoBugCaptureWithSubType:context:triggerThresholdValues:events:", v39, v34, 0, v37);
    }
  }

  return 1;
}

uint64_t __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v22 = CFSTR("remote-control-id");
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("remote-control-id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findPreviousEventWithType:matchingPayload:", CFSTR("remote-control-begin"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "durationSinceEvent:", v10);
  v12 = v11;
  objc_msgSend(v10, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("remote-control-type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v14, "unsignedIntValue");

  MPCRemoteCommandDescriptionCopy(v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.3f"), v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _EVSEventToABCEvent(v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  _EVSEventToABCEvent(v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v21[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "autoBugCaptureWithSubType:context:triggerThresholdValues:events:", CFSTR("CommandTimeout"), v15, v16, v19);
  return 1;
}

uint64_t __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asset-load-error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("time-control-status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == 2 && objc_msgSend(*(id *)(a1 + 32), "shouldReportError:", v5))
  {
    _EVSEventToABCEvent(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 32);
    objc_msgSend(v5, "msv_analyticSignature");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "autoBugCaptureWithSubType:context:triggerThresholdValues:events:", CFSTR("ItemLoadFailure"), v12, 0, v10);

  }
  return 1;
}

uint64_t __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
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
  float v23;
  float v24;
  void *v25;
  void *v26;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("item-rate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  objc_msgSend(v5, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("item-rate-change-reason"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "payload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("item-rate-change-participant-id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14
    && v10 == 0.0
    && (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDB2098]) & 1) == 0
    && (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDB2070]) & 1) == 0)
  {
    v29[0] = CFSTR("queue-section-id");
    objc_msgSend(v5, "payload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("queue-section-id"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = CFSTR("queue-item-id");
    v30[0] = v16;
    objc_msgSend(v5, "payload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", CFSTR("item-rate-changed"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "payload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("item-rate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    v24 = v23;

    if (v24 > 0.0)
    {
      _EVSEventToABCEvent(v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "autoBugCaptureWithSubType:context:triggerThresholdValues:events:", CFSTR("ItemUnexpectedRate0"), v12, 0, v26);
    }

  }
  return 1;
}

uint64_t __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asset-load-error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "shouldReportError:", v5))
  {
    _EVSEventToABCEvent(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "msv_analyticSignature");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "autoBugCaptureWithSubType:context:triggerThresholdValues:events:", CFSTR("ItemUnexpectedEnding"), v9, 0, v7);

  }
  return 1;
}

@end
