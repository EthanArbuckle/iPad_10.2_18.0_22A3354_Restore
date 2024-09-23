@implementation HMDLogEventUserActivityAnalyzer

- (HMDLogEventUserActivityAnalyzer)initWithEventCountersManager:(id)a3 flagsManager:(id)a4 dateProvider:(id)a5
{
  id v8;
  id v9;
  HMDLogEventUserActivityAnalyzer *v10;
  uint64_t v11;
  HMDEventCounterGroup *counterGroup;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDLogEventUserActivityAnalyzer;
  v10 = -[HMDHouseholdActivityLogEventContributor initWithHouseholdGroupName:countersManager:dateProvider:](&v14, sel_initWithHouseholdGroupName_countersManager_dateProvider_, CFSTR("HMDLogEventUserActivityAnalyzerRequestGroup"), v8, a5);
  if (v10)
  {
    objc_msgSend(v8, "counterGroupForName:", CFSTR("HMDLogEventUserActivityAnalyzerRequestGroup"));
    v11 = objc_claimAutoreleasedReturnValue();
    counterGroup = v10->_counterGroup;
    v10->_counterGroup = (HMDEventCounterGroup *)v11;

    objc_storeStrong((id *)&v10->_flagsManager, a4);
  }

  return v10;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;

  v24 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v24;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HMDLogEventUserActivityAnalyzer _handleReadWriteLogEvent:](self, "_handleReadWriteLogEvent:", v5);
  }
  else
  {
    v6 = v24;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      -[HMDLogEventUserActivityAnalyzer _handleAccessoryPairingLogEvent:](self, "_handleAccessoryPairingLogEvent:", v8);
    }
    else
    {
      v9 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      if (v11)
      {
        -[HMDLogEventUserActivityAnalyzer _handleAddActionSetLogEvent:](self, "_handleAddActionSetLogEvent:", v11);
      }
      else
      {
        v12 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        v14 = v13;

        if (v14)
        {
          -[HMDLogEventUserActivityAnalyzer _handleAddTriggerLogEvent:](self, "_handleAddTriggerLogEvent:", v14);
        }
        else
        {
          v15 = v12;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
          v17 = v16;

          if (v17)
          {
            -[HMDLogEventUserActivityAnalyzer _handleActionSetRunLogEvent:](self, "_handleActionSetRunLogEvent:", v17);
          }
          else
          {
            v18 = v15;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v19 = v18;
            else
              v19 = 0;
            v20 = v19;

            if (v20)
            {
              -[HMDLogEventUserActivityAnalyzer _handleCameraStreamLogEvent:](self, "_handleCameraStreamLogEvent:", v20);
            }
            else
            {
              v21 = v18;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v22 = v21;
              else
                v22 = 0;
              v23 = v22;

              if (v23)
                -[HMDLogEventUserActivityAnalyzer _handleCameraClipRequestLogEvent:](self, "_handleCameraClipRequestLogEvent:", v23);

            }
          }

        }
      }

    }
  }

}

- (void)_handleReadWriteLogEvent:(id)a3
{
  int v4;
  __CFString *v5;
  const __CFString *v6;
  int v7;
  __CFString *v8;
  const __CFString *v9;
  char v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a3;
  switch(objc_msgSend(v17, "triggerSource"))
  {
    case 0:
      v4 = objc_msgSend(v17, "isWriteOperation");
      v5 = CFSTR("HMDLogEventUserActivityAnalyzerUnknownSourceReadEventCounter");
      v6 = CFSTR("HMDLogEventUserActivityAnalyzerUnknownSourceWriteEventCounter");
      goto LABEL_13;
    case 1:
      v7 = objc_msgSend(v17, "isWriteOperation");
      v8 = CFSTR("HMDLogEventUserActivityAnalyzerSiriReadEventCounter");
      v9 = CFSTR("HMDLogEventUserActivityAnalyzerSiriWriteEventCounter");
      goto LABEL_7;
    case 5:
      v10 = objc_msgSend(v17, "isWriteOperation");
      v11 = v17;
      if ((v10 & 1) != 0)
      {
        v12 = CFSTR("HMDLogEventUserActivityAnalyzerFirstPartyWriteEventCounter");
LABEL_11:
        -[HMDLogEventUserActivityAnalyzer markActiveForEventName:logEvent:](self, "markActiveForEventName:logEvent:", v12, v11);
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v17, "bundleId");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString lowercaseString](v12, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.springboard")))
      {
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v17, "bundleId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.home.homewidget"));

      if ((v16 & 1) == 0)
      {
        v12 = CFSTR("HMDLogEventUserActivityAnalyzerFirstPartyReadEventCounter");
LABEL_10:
        v11 = v17;
        goto LABEL_11;
      }
LABEL_18:
      -[HMDLogEventUserActivityAnalyzer updateLinkTypeActivityCountsForReadWriteLogEvent:](self, "updateLinkTypeActivityCountsForReadWriteLogEvent:", v17);

      return;
    case 6:
      v7 = objc_msgSend(v17, "isWriteOperation");
      v8 = CFSTR("HMDLogEventUserActivityAnalyzerThirdPartyReadEventCounter");
      v9 = CFSTR("HMDLogEventUserActivityAnalyzerThirdPartyWriteEventCounter");
LABEL_7:
      if (v7)
        v8 = (__CFString *)v9;
      v12 = v8;
      goto LABEL_10;
    case 7:
      v4 = objc_msgSend(v17, "isWriteOperation");
      v5 = CFSTR("HMDLogEventUserActivityAnalyzerInternalRequestedReadEventCounter");
      v6 = CFSTR("HMDLogEventUserActivityAnalyzerInternalRequestedWriteEventCounter");
LABEL_13:
      if (v4)
        v5 = (__CFString *)v6;
      v12 = v5;
      -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "incrementEventCounterForEventName:", v12);
      goto LABEL_16;
    default:
      goto LABEL_18;
  }
}

- (void)updateLinkTypeActivityCountsForReadWriteLogEvent:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  if (objc_msgSend(v15, "linkType") == 1 && objc_msgSend(v15, "isLocal"))
  {
    -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "incrementEventCounterForEventName:withValue:", CFSTR("HMDLogEventUserActivityAnalyzerIPDurationAggregate"), objc_msgSend(v15, "durationMilliseconds"));

    objc_msgSend(v15, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "code");

    -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v8 = CFSTR("HMDLogEventUserActivityAnalyzerReadWriteIPFailureEventCounter");
    else
      v8 = CFSTR("HMDLogEventUserActivityAnalyzerReadWriteIPSuccessEventCounter");
LABEL_15:
    objc_msgSend(v7, "incrementEventCounterForEventName:", v8);

    goto LABEL_16;
  }
  if (objc_msgSend(v15, "linkType") == 2 && objc_msgSend(v15, "isLocal"))
  {
    -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "incrementEventCounterForEventName:withValue:", CFSTR("HMDLogEventUserActivityAnalyzerBTDurationAggregate"), objc_msgSend(v15, "durationMilliseconds"));

    objc_msgSend(v15, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "code");

    -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v8 = CFSTR("HMDLogEventUserActivityAnalyzerReadWriteBTFailureEventCounter");
    else
      v8 = CFSTR("HMDLogEventUserActivityAnalyzerReadWriteBTSuccessEventCounter");
    goto LABEL_15;
  }
  if ((objc_msgSend(v15, "isLocal") & 1) == 0)
  {
    -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "incrementEventCounterForEventName:withValue:", CFSTR("HMDLogEventUserActivityAnalyzerIDSDurationAggregate"), objc_msgSend(v15, "durationMilliseconds"));

    objc_msgSend(v15, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "code");

    -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v8 = CFSTR("HMDLogEventUserActivityAnalyzerReadWriteIDSFailureEventCounter");
    else
      v8 = CFSTR("HMDLogEventUserActivityAnalyzerReadWriteIDSSuccessEventCounter");
    goto LABEL_15;
  }
LABEL_16:

}

- (void)_handleAccessoryPairingLogEvent:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isAddOperation"))
  {
    objc_msgSend(v6, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "code");

    if (!v5)
      -[HMDLogEventUserActivityAnalyzer markActiveForEventName:logEvent:](self, "markActiveForEventName:logEvent:", CFSTR("HMDLogEventUserActivityAnalyzerAddAccessoryEventCounter"), v6);
  }

}

- (void)_handleAddActionSetLogEvent:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[HMDLogEventUserActivityAnalyzer markActiveForEventName:logEvent:](self, "markActiveForEventName:logEvent:", CFSTR("HMDLogEventUserActivityAnalyzerAddSceneEventCounter"), v6);
  objc_msgSend(v6, "actionSetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD5208]);

  if (v5)
    -[HMDLogEventUserActivityAnalyzer markActiveForEventName:logEvent:](self, "markActiveForEventName:logEvent:", CFSTR("HMDLogEventUserActivityAnalyzerAddShortcutEventCounter"), v6);

}

- (void)_handleAddTriggerLogEvent:(id)a3
{
  id v4;

  v4 = a3;
  -[HMDLogEventUserActivityAnalyzer markActiveForEventName:logEvent:](self, "markActiveForEventName:logEvent:", CFSTR("HMDLogEventUserActivityAnalyzerAddSceneEventCounter"), v4);
  -[HMDLogEventUserActivityAnalyzer markActiveForEventName:logEvent:](self, "markActiveForEventName:logEvent:", CFSTR("HMDLogEventUserActivityAnalyzerAddTriggerEventCounter"), v4);

}

- (void)_handleActionSetRunLogEvent:(id)a3
{
  void *v4;
  char v5;
  id v6;
  const __CFString *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "actionSetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD5208]);

  if ((v5 & 1) != 0)
  {
    v6 = v8;
    v7 = CFSTR("HMDLogEventUserActivityAnalyzerRunShortcutEventCounter");
LABEL_7:
    -[HMDLogEventUserActivityAnalyzer markActiveForEventName:logEvent:](self, "markActiveForEventName:logEvent:", v7, v6);
    goto LABEL_8;
  }
  if (-[HMDLogEventUserActivityAnalyzer _isUserSource:](self, "_isUserSource:", objc_msgSend(v8, "triggerSource")))
  {
    v6 = v8;
    v7 = CFSTR("HMDLogEventUserActivityAnalyzerRunSceneEventCounter");
    goto LABEL_7;
  }
  if (-[HMDLogEventUserActivityAnalyzer _isTriggerSource:](self, "_isTriggerSource:", objc_msgSend(v8, "triggerSource")))
  {
    v6 = v8;
    v7 = CFSTR("HMDLogEventUserActivityAnalyzerTriggerFiredEventCounter");
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_handleCameraStreamLogEvent:(id)a3
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");
  v6 = CFSTR("HMDLogEventUserActivityAnalyzerCameraStreamStartFailureEventCounter");
  if (!v5)
    v6 = CFSTR("HMDLogEventUserActivityAnalyzerCameraStreamStartSuccessEventCounter");
  v7 = v6;

  -[HMDLogEventUserActivityAnalyzer markActiveForEventName:logEvent:](self, "markActiveForEventName:logEvent:", v7, v8);
}

- (void)_handleCameraClipRequestLogEvent:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "requestName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("HMDCameraClipManagerRequestLogEventFetchVideoSegmentsAssetRequestName"));

  if (v5)
    -[HMDLogEventUserActivityAnalyzer markActiveForEventName:logEvent:](self, "markActiveForEventName:logEvent:", CFSTR("HMDLogEventUserActivityAnalyzerFetchCameraClipVideoSegmentsAssetEventCounter"), v6);

}

- (BOOL)_isUserSource:(unint64_t)a3
{
  return ((a3 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

- (BOOL)_isTriggerSource:(unint64_t)a3
{
  return a3 - 3 < 2;
}

- (void)markActiveForEventName:(id)a3 logEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "incrementEventCounterForEventName:", v15);

  HMMSafeHomeUUIDFromLogEvent();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMDLogEventUserActivityAnalyzer flagsManager](self, "flagsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "flagForName:homeUUID:periodicity:", CFSTR("HMDLogEventUserActivityAnalyzerIsActiveFlag"), v8, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setCurrentBit");
  }
  -[HMDLogEventUserActivityAnalyzer flagsManager](self, "flagsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "flagForName:periodicity:", CFSTR("HMDLogEventUserActivityAnalyzerIsActiveFlag"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setCurrentBit");
  -[HMDHouseholdActivityLogEventContributor householdGroupForLogEvent:](self, "householdGroupForLogEvent:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "incrementEventCounterForEventName:", v15);

}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
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
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
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
  void *v40;
  int8x8_t v41;
  uint64_t v42;
  uint8x8_t v43;
  uint64_t v44;
  id v45;

  v45 = a3;
  v6 = a4;
  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumReadSiri:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerSiriReadEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumWriteSiri:", objc_msgSend(v8, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerSiriWriteEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumReadFirstPartyApp:", objc_msgSend(v9, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerFirstPartyReadEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumWriteFirstPartyApp:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerFirstPartyWriteEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumReadThirdPartyApp:", objc_msgSend(v11, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerThirdPartyReadEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumWriteThirdPartyApp:", objc_msgSend(v12, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerThirdPartyWriteEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumReadInternalRequested:", objc_msgSend(v13, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerInternalRequestedReadEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumWriteInternalRequested:", objc_msgSend(v14, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerInternalRequestedWriteEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumReadUnknownSource:", objc_msgSend(v15, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerUnknownSourceReadEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumWriteUnknownSource:", objc_msgSend(v16, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerUnknownSourceWriteEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumReadWriteSuccessIP:", objc_msgSend(v17, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerReadWriteIPSuccessEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumReadWriteFailureIP:", objc_msgSend(v18, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerReadWriteIPFailureEventCounter"), v6));

  if (objc_msgSend(v45, "numReadWriteSuccessIP") || objc_msgSend(v45, "numReadWriteFailureIP"))
  {
    -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerIPDurationAggregate"), v6);

    objc_msgSend(v45, "setAverageLatencyIP:", v20 / (objc_msgSend(v45, "numReadWriteFailureIP") + objc_msgSend(v45, "numReadWriteSuccessIP")));
  }
  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumReadWriteSuccessBT:", objc_msgSend(v21, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerReadWriteBTSuccessEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumReadWriteFailureBT:", objc_msgSend(v22, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerReadWriteBTFailureEventCounter"), v6));

  if (objc_msgSend(v45, "numReadWriteSuccessBT") || objc_msgSend(v45, "numReadWriteFailureBT"))
  {
    -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerBTDurationAggregate"), v6);

    objc_msgSend(v45, "setAverageLatencyBT:", v24 / (objc_msgSend(v45, "numReadWriteFailureBT") + objc_msgSend(v45, "numReadWriteSuccessBT")));
  }
  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumReadWriteSuccessIDS:", objc_msgSend(v25, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerReadWriteIDSSuccessEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumReadWriteFailureIDS:", objc_msgSend(v26, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerReadWriteIDSFailureEventCounter"), v6));

  if (objc_msgSend(v45, "numReadWriteSuccessIDS") || objc_msgSend(v45, "numReadWriteFailureIDS"))
  {
    -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerIDSDurationAggregate"), v6);

    objc_msgSend(v45, "setAverageLatencyIDS:", v28 / (objc_msgSend(v45, "numReadWriteFailureIDS") + objc_msgSend(v45, "numReadWriteSuccessIDS")));
  }
  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumAccessoriesAdded:", objc_msgSend(v29, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerAddAccessoryEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumScenesAdded:", objc_msgSend(v30, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerAddSceneEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumTriggersAdded:", objc_msgSend(v31, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerAddTriggerEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumShortcutsAdded:", objc_msgSend(v32, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerAddShortcutEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumScenesUserRun:", objc_msgSend(v33, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerRunSceneEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumShortcutsRun:", objc_msgSend(v34, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerRunShortcutEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumTriggersFired:", objc_msgSend(v35, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerTriggerFiredEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setCameraStreamStartSuccessCount:", objc_msgSend(v36, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerCameraStreamStartSuccessEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setCameraStreamStartFailureCount:", objc_msgSend(v37, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerCameraStreamStartFailureEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFetchCameraClipVideoSegmentAssetCount:", objc_msgSend(v38, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventUserActivityAnalyzerFetchCameraClipVideoSegmentsAssetEventCounter"), v6));

  -[HMDLogEventUserActivityAnalyzer flagsManager](self, "flagsManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "flagForName:periodicity:", CFSTR("HMDLogEventUserActivityAnalyzerIsActiveFlag"), 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (int8x8_t)objc_msgSend(v40, "bitsForDate:bitCount:outValidBitCount:", v6, 30, 0);
  objc_msgSend(v45, "setActiveDay:", v41.i8[0] & 1);
  if (v41)
    v42 = (uint64_t)log2((double)(unint64_t)(*(_QWORD *)&v41 & -*(_QWORD *)&v41));
  else
    v42 = -1;
  objc_msgSend(v45, "setCountOfDaysSinceLastActive:", v42);
  v43 = (uint8x8_t)vcnt_s8(v41);
  v43.i16[0] = vaddlv_u8(v43);
  if (v41)
    v44 = v43.u32[0];
  else
    v44 = 0;
  objc_msgSend(v45, "setActiveDaysPerMonthCount:", v44);

}

- (void)resetAggregationAnalysisContext
{
  id v2;

  -[HMDLogEventUserActivityAnalyzer counterGroup](self, "counterGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetEventCounters");

}

- (void)populateLogEvent:(id)a3 forHomeWithUUID:(id)a4 associatedToDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDHouseholdActivityLogEventContributor householdGroupForHomeWithUUID:associatedWithDate:](self, "householdGroupForHomeWithUUID:associatedWithDate:", v9, v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumReadSiri:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerSiriReadEventCounter")));
  objc_msgSend(v10, "setNumWriteSiri:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerSiriWriteEventCounter")));
  objc_msgSend(v10, "setNumReadFirstPartyApp:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerFirstPartyReadEventCounter")));
  objc_msgSend(v10, "setNumWriteFirstPartyApp:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerFirstPartyWriteEventCounter")));
  objc_msgSend(v10, "setNumReadThirdPartyApp:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerThirdPartyReadEventCounter")));
  objc_msgSend(v10, "setNumWriteThirdPartyApp:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerThirdPartyWriteEventCounter")));
  objc_msgSend(v10, "setNumAccessoriesAdded:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerAddAccessoryEventCounter")));
  objc_msgSend(v10, "setNumScenesAdded:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerAddSceneEventCounter")));
  objc_msgSend(v10, "setNumTriggersAdded:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerAddTriggerEventCounter")));
  objc_msgSend(v10, "setNumShortcutsAdded:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerAddShortcutEventCounter")));
  objc_msgSend(v10, "setNumScenesUserRun:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerRunSceneEventCounter")));
  objc_msgSend(v10, "setNumShortcutsRun:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerRunShortcutEventCounter")));
  objc_msgSend(v10, "setNumTriggersFired:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerTriggerFiredEventCounter")));
  objc_msgSend(v10, "setCameraStreamStartSuccessCount:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerCameraStreamStartSuccessEventCounter")));
  objc_msgSend(v10, "setCameraStreamStartFailureCount:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerCameraStreamStartFailureEventCounter")));
  objc_msgSend(v10, "setFetchCameraClipVideoSegmentAssetCount:", objc_msgSend(v14, "fetchEventCounterForEventName:", CFSTR("HMDLogEventUserActivityAnalyzerFetchCameraClipVideoSegmentsAssetEventCounter")));
  -[HMDLogEventUserActivityAnalyzer flagsManager](self, "flagsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "flagForName:homeUUID:periodicity:", CFSTR("HMDLogEventUserActivityAnalyzerIsActiveFlag"), v9, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "bitsForDate:bitCount:outValidBitCount:", v8, 30, 0);
  objc_msgSend(v10, "setActiveDaysBitField:", v13);
  -[HMDLogEventUserActivityAnalyzer finishCoalescingLogEvent:](self, "finishCoalescingLogEvent:", v10);

}

- (void)contributeLogEvent:(id)a3 toSerializedMetric:(id)a4
{
  void *v5;
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
  uint64_t v25;
  id v26;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v7, "numReadSiri"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("siriReadCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "numWriteSiri"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("siriWriteCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "numReadFirstPartyApp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("firstPartyReadCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "numWriteFirstPartyApp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("firstPartyWriteCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "numReadThirdPartyApp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("thirdPartyReadCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "numWriteThirdPartyApp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("thirdPartyWriteCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "numAccessoriesAdded"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("accessoriesAddedCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "numScenesAdded"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("scenesAddedCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "numTriggersAdded"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("triggersAddedCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "numShortcutsAdded"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("shortcutsAddedCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "numScenesUserRun"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("scenesRunCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "numShortcutsRun"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("shortcutsRunCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "numTriggersFired"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("triggersRunCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "cameraStreamStartSuccessCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("cameraStreamStartSuccessCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "cameraStreamStartFailureCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("cameraStreamStartFailureCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "fetchCameraClipVideoSegmentAssetCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("fetchVideoSegmentsAssetCount"));

  v24 = (void *)MEMORY[0x24BDD16E0];
  v25 = objc_msgSend(v7, "activeDaysBitField");

  objc_msgSend(v24, "numberWithUnsignedLongLong:", v25);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("activeDay"));

}

- (void)deserializeLogEvent:(id)a3 fromSerializedMetric:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  id v75;

  v6 = a4;
  v75 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("siriReadCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumReadSiri:", v10);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("siriWriteCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v14 = objc_msgSend(v13, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumWriteSiri:", v14);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstPartyReadCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v18 = objc_msgSend(v17, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumReadFirstPartyApp:", v18);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstPartyWriteCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  v22 = objc_msgSend(v21, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumWriteFirstPartyApp:", v22);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("thirdPartyReadCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  v26 = objc_msgSend(v25, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumReadThirdPartyApp:", v26);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("thirdPartyWriteCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v28 = v27;
  else
    v28 = 0;
  v29 = v28;

  v30 = objc_msgSend(v29, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumWriteThirdPartyApp:", v30);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessoriesAddedCount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v32 = v31;
  else
    v32 = 0;
  v33 = v32;

  v34 = objc_msgSend(v33, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumAccessoriesAdded:", v34);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scenesAddedCount"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = v35;
  else
    v36 = 0;
  v37 = v36;

  v38 = objc_msgSend(v37, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumScenesAdded:", v38);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("triggersAddedCount"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v40 = v39;
  else
    v40 = 0;
  v41 = v40;

  v42 = objc_msgSend(v41, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumTriggersAdded:", v42);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shortcutsAddedCount"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v44 = v43;
  else
    v44 = 0;
  v45 = v44;

  v46 = objc_msgSend(v45, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumShortcutsAdded:", v46);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scenesRunCount"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v48 = v47;
  else
    v48 = 0;
  v49 = v48;

  v50 = objc_msgSend(v49, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumScenesUserRun:", v50);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shortcutsRunCount"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v52 = v51;
  else
    v52 = 0;
  v53 = v52;

  v54 = objc_msgSend(v53, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumShortcutsRun:", v54);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("triggersRunCount"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v56 = v55;
  else
    v56 = 0;
  v57 = v56;

  v58 = objc_msgSend(v57, "unsignedIntegerValue");
  objc_msgSend(v75, "setNumTriggersFired:", v58);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cameraStreamStartSuccessCount"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v60 = v59;
  else
    v60 = 0;
  v61 = v60;

  v62 = objc_msgSend(v61, "unsignedIntegerValue");
  objc_msgSend(v75, "setCameraStreamStartSuccessCount:", v62);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cameraStreamStartFailureCount"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v64 = v63;
  else
    v64 = 0;
  v65 = v64;

  v66 = objc_msgSend(v65, "unsignedIntegerValue");
  objc_msgSend(v75, "setCameraStreamStartFailureCount:", v66);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fetchVideoSegmentsAssetCount"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v68 = v67;
  else
    v68 = 0;
  v69 = v68;

  v70 = objc_msgSend(v69, "unsignedIntegerValue");
  objc_msgSend(v75, "setFetchCameraClipVideoSegmentAssetCount:", v70);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activeDay"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v72 = v71;
  else
    v72 = 0;
  v73 = v72;

  v74 = objc_msgSend(v73, "unsignedLongLongValue");
  objc_msgSend(v75, "setActiveDaysBitField:", v74);
  -[HMDLogEventUserActivityAnalyzer finishCoalescingLogEvent:](self, "finishCoalescingLogEvent:", v75);

}

- (void)contributeLogEvent:(id)a3 toCoreAnalyticsEvent:(id)a4
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
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;

  v5 = a4;
  v6 = a3;
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intervalIndexForValue:", objc_msgSend(v6, "numReadSiri"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("siriReadCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intervalIndexForValue:", objc_msgSend(v6, "numWriteSiri"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("siriWriteCount"));

  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intervalIndexForValue:", objc_msgSend(v6, "numReadFirstPartyApp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("firstPartyReadCount"));

  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "intervalIndexForValue:", objc_msgSend(v6, "numWriteFirstPartyApp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("firstPartyWriteCount"));

  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "intervalIndexForValue:", objc_msgSend(v6, "numReadThirdPartyApp"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("thirdPartyReadCount"));

  +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "intervalIndexForValue:", objc_msgSend(v6, "numWriteThirdPartyApp"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("thirdPartyWriteCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "intervalIndexForValue:", objc_msgSend(v6, "numAccessoriesAdded"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("accessoriesAddedCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "intervalIndexForValue:", objc_msgSend(v6, "numScenesAdded"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("scenesAddedCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "intervalIndexForValue:", objc_msgSend(v6, "numTriggersAdded"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("triggersAddedCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "intervalIndexForValue:", objc_msgSend(v6, "numShortcutsAdded"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("shortcutsAddedCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "intervalIndexForValue:", objc_msgSend(v6, "numScenesUserRun"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("scenesRunCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "intervalIndexForValue:", objc_msgSend(v6, "numTriggersFired"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("triggersRunCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "intervalIndexForValue:", objc_msgSend(v6, "numShortcutsRun"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("shortcutsRunCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "intervalIndexForValue:", objc_msgSend(v6, "cameraStreamStartSuccessCount"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("cameraStreamStartSuccessCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "intervalIndexForValue:", objc_msgSend(v6, "cameraStreamStartFailureCount"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("cameraStreamStartFailureCount"));

  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "intervalIndexForValue:", objc_msgSend(v6, "fetchCameraClipVideoSegmentAssetCount"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, CFSTR("fetchVideoSegmentsAssetCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "isActiveDay"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("activeDay"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "countOfDaysSinceLastActive"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("daysSinceLastActiveCount"));

  v41 = (void *)MEMORY[0x24BDD16E0];
  v42 = objc_msgSend(v6, "activeDaysPerMonthCount");

  objc_msgSend(v41, "numberWithInteger:", v42);
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("activeDaysPerMonthCount"));

}

- (void)coalesceLogEvent:(id)a3 fromSourceEvent:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  v7 = a3;
  objc_msgSend(v7, "setNumReadSiri:", objc_msgSend(v7, "numReadSiri") + objc_msgSend(v5, "numReadSiri"));
  objc_msgSend(v7, "setNumWriteSiri:", objc_msgSend(v7, "numWriteSiri") + objc_msgSend(v5, "numWriteSiri"));
  objc_msgSend(v7, "setNumReadFirstPartyApp:", objc_msgSend(v7, "numReadFirstPartyApp") + objc_msgSend(v5, "numReadFirstPartyApp"));
  objc_msgSend(v7, "setNumWriteFirstPartyApp:", objc_msgSend(v7, "numWriteFirstPartyApp") + objc_msgSend(v5, "numWriteFirstPartyApp"));
  objc_msgSend(v7, "setNumReadThirdPartyApp:", objc_msgSend(v7, "numReadThirdPartyApp") + objc_msgSend(v5, "numReadThirdPartyApp"));
  objc_msgSend(v7, "setNumWriteThirdPartyApp:", objc_msgSend(v7, "numWriteThirdPartyApp") + objc_msgSend(v5, "numWriteThirdPartyApp"));
  objc_msgSend(v7, "setNumAccessoriesAdded:", objc_msgSend(v7, "numAccessoriesAdded") + objc_msgSend(v5, "numAccessoriesAdded"));
  objc_msgSend(v7, "setNumScenesAdded:", objc_msgSend(v7, "numScenesAdded") + objc_msgSend(v5, "numScenesAdded"));
  objc_msgSend(v7, "setNumTriggersAdded:", objc_msgSend(v7, "numTriggersAdded") + objc_msgSend(v5, "numTriggersAdded"));
  objc_msgSend(v7, "setNumShortcutsAdded:", objc_msgSend(v7, "numShortcutsAdded") + objc_msgSend(v5, "numShortcutsAdded"));
  objc_msgSend(v7, "setNumScenesUserRun:", objc_msgSend(v7, "numScenesUserRun") + objc_msgSend(v5, "numScenesUserRun"));
  objc_msgSend(v7, "setNumShortcutsRun:", objc_msgSend(v7, "numShortcutsRun") + objc_msgSend(v5, "numShortcutsRun"));
  objc_msgSend(v7, "setNumTriggersFired:", objc_msgSend(v7, "numTriggersFired") + objc_msgSend(v5, "numTriggersFired"));
  objc_msgSend(v7, "setCameraStreamStartSuccessCount:", objc_msgSend(v7, "cameraStreamStartSuccessCount") + objc_msgSend(v5, "cameraStreamStartSuccessCount"));
  objc_msgSend(v7, "setCameraStreamStartFailureCount:", objc_msgSend(v7, "cameraStreamStartFailureCount") + objc_msgSend(v5, "cameraStreamStartFailureCount"));
  objc_msgSend(v7, "setFetchCameraClipVideoSegmentAssetCount:", objc_msgSend(v7, "fetchCameraClipVideoSegmentAssetCount")+ objc_msgSend(v5, "fetchCameraClipVideoSegmentAssetCount"));
  v6 = objc_msgSend(v5, "activeDaysBitField");

  objc_msgSend(v7, "setActiveDaysBitField:", objc_msgSend(v7, "activeDaysBitField") | v6);
}

- (void)finishCoalescingLogEvent:(id)a3
{
  int8x8_t v3;
  uint64_t v4;
  uint8x8_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v3 = (int8x8_t)objc_msgSend(v7, "activeDaysBitField");
  objc_msgSend(v7, "setActiveDay:", v3.i8[0] & 1);
  if (v3)
    v4 = (uint64_t)log2((double)(unint64_t)(*(_QWORD *)&v3 & -*(_QWORD *)&v3));
  else
    v4 = -1;
  objc_msgSend(v7, "setCountOfDaysSinceLastActive:", v4);
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v3)
    v6 = v5.u32[0];
  else
    v6 = 0;
  objc_msgSend(v7, "setActiveDaysPerMonthCount:", v6);

}

- (HMDTimeBasedFlagsManager)flagsManager
{
  return self->_flagsManager;
}

- (HMDEventCounterGroup)counterGroup
{
  return self->_counterGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterGroup, 0);
  objc_storeStrong((id *)&self->_flagsManager, 0);
}

+ (id)managedEventCounterRequestGroups
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("HMDLogEventUserActivityAnalyzerRequestGroup");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_68695 != -1)
    dispatch_once(&logCategory__hmf_once_t24_68695, &__block_literal_global_68696);
  return (id)logCategory__hmf_once_v25_68697;
}

void __46__HMDLogEventUserActivityAnalyzer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_68697;
  logCategory__hmf_once_v25_68697 = v0;

}

@end
