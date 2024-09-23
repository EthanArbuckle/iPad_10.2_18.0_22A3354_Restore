@implementation HMDLogEventErrorEventsAnalyzer

- (HMDLogEventErrorEventsAnalyzer)initWithDataSource:(id)a3
{
  id v4;
  HMDLogEventErrorEventsAnalyzer *v5;
  uint64_t v6;
  HMDEventCountersManager *eventCountersManager;
  uint64_t v8;
  HMMLogEventSubmitting *logEventSubmitter;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[18];

  v15[17] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDLogEventErrorEventsAnalyzer;
  v5 = -[HMDLogEventErrorEventsAnalyzer init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "legacyCountersManager");
    v6 = objc_claimAutoreleasedReturnValue();
    eventCountersManager = v5->_eventCountersManager;
    v5->_eventCountersManager = (HMDEventCountersManager *)v6;

    objc_msgSend(v4, "logEventSubmitter");
    v8 = objc_claimAutoreleasedReturnValue();
    logEventSubmitter = v5->_logEventSubmitter;
    v5->_logEventSubmitter = (HMMLogEventSubmitting *)v8;

    objc_msgSend(v4, "dailyScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerDailyTaskRunner:", v5);

    objc_msgSend(v4, "logEventDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v15[5] = objc_opt_class();
    v15[6] = objc_opt_class();
    v15[7] = objc_opt_class();
    v15[8] = objc_opt_class();
    v15[9] = objc_opt_class();
    v15[10] = objc_opt_class();
    v15[11] = objc_opt_class();
    v15[12] = objc_opt_class();
    v15[13] = objc_opt_class();
    v15[14] = objc_opt_class();
    v15[15] = objc_opt_class();
    v15[16] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:forEventClasses:", v5, v12);

    objc_msgSend(v4, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("pairingFailureCount"), CFSTR("Any Error"), CFSTR("HMDAddAccessoryPairingLogEvent"), 3);
    objc_msgSend(v4, "addThresholdTrigger:forEventName:requestGroup:atThreshold:uploadImmediately:", CFSTR("cameraRecordingUploadErrorCount"), CFSTR("Any Error"), CFSTR("HMDCameraRecordingUploadOperationLogEvent"), 1, 1);
  }

  return v5;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
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
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;

  v29 = a3;
  -[HMDLogEventErrorEventsAnalyzer eventCounterRequestGroupNameForLogEvent:](self, "eventCounterRequestGroupNameForLogEvent:");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v29, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:", CFSTR("Any Error"), CFSTR("All Event Groups"));

      -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Any Error");
      v9 = v4;
    }
    else
    {
      v8 = CFSTR("No Error");
      v9 = CFSTR("All Event Groups");
    }
    objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:", v8, v9);

    -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "incrementEventCounterForEventName:requestGroup:", CFSTR("Total Events"), CFSTR("All Event Groups"));

    -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "incrementEventCounterForEventName:requestGroup:", CFSTR("Total Events"), v4);

    -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:](HMDLogEventErrorEventsAnalyzer, "eventCounterNameForError:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "incrementEventCounterForEventName:requestGroup:", v14, v4);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_UnderlyingError"), v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v20)
    {
      -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:](HMDLogEventErrorEventsAnalyzer, "eventCounterNameForError:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "incrementEventCounterForEventName:requestGroup:", v22, v15);

    }
    v23 = v29;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
    v25 = v24;

    if (v25)
    {
      -[HMDLogEventErrorEventsAnalyzer _handleAdditionalErrorsForAccessoryPairingLogEvent:logEventUnderlyingErrorGroupName:](self, "_handleAdditionalErrorsForAccessoryPairingLogEvent:logEventUnderlyingErrorGroupName:", v25, v15);
    }
    else
    {
      v26 = v23;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
      v28 = v27;

      if (v28)
        -[HMDLogEventErrorEventsAnalyzer _handleAdditionalErrorsForCloudShareTrustManagerFailureLogEvent:logEventUnderlyingErrorGroupName:](self, "_handleAdditionalErrorsForCloudShareTrustManagerFailureLogEvent:logEventUnderlyingErrorGroupName:", v28, v15);

    }
  }

}

- (id)eventCounterRequestGroupNameForLogEvent:(id)a3
{
  id v3;
  char isKindOfClass;
  const __CFString *v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  char v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  char v38;
  id v40;
  char v41;
  id v42;
  char v43;
  id v44;
  unsigned __int8 v45;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v3 && (isKindOfClass & 1) != 0)
  {
    v5 = CFSTR("HMDCharacteristicReadWriteLogEvent");
  }
  else
  {
    v6 = v3;
    objc_opt_class();
    v7 = objc_opt_isKindOfClass();

    if (v3 && (v7 & 1) != 0)
    {
      v5 = CFSTR("HAPPairVerifyLogEvent");
    }
    else
    {
      v8 = v6;
      objc_opt_class();
      v9 = objc_opt_isKindOfClass();

      if (v3 && (v9 & 1) != 0)
      {
        v10 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v12 = v11;

        v13 = objc_msgSend(v12, "isAddOperation");
        if (v13)
          v5 = CFSTR("HMDAddAccessoryPairingLogEvent");
        else
          v5 = CFSTR("HMDRemoveAccessoryPairingLogEvent");
      }
      else
      {
        v14 = v8;
        objc_opt_class();
        v15 = objc_opt_isKindOfClass();

        if (v3 && (v15 & 1) != 0)
        {
          v5 = CFSTR("HMDLogEventErrorEventsAnalyzerCloudSyncLegacyUploadRequestGroup");
        }
        else
        {
          v16 = v14;
          objc_opt_class();
          v17 = objc_opt_isKindOfClass();

          if (v3 && (v17 & 1) != 0)
          {
            v5 = CFSTR("HMDCloudShareTrustManagerFailureLogEvent");
          }
          else
          {
            v18 = v16;
            objc_opt_class();
            v19 = objc_opt_isKindOfClass();

            if (v3 && (v19 & 1) != 0)
            {
              v5 = CFSTR("HMDDatabaseCKOperationCompletionEvent");
            }
            else
            {
              v20 = v18;
              objc_opt_class();
              v21 = objc_opt_isKindOfClass();

              if (v3 && (v21 & 1) != 0)
              {
                v5 = CFSTR("HMDBackingStoreCKOperationZoneCompletionLogEvent");
              }
              else
              {
                v22 = v20;
                objc_opt_class();
                v23 = objc_opt_isKindOfClass();

                if (v3 && (v23 & 1) != 0)
                {
                  v5 = CFSTR("HMDCameraMetricsStreamLogEvent");
                }
                else
                {
                  v24 = v22;
                  objc_opt_class();
                  v25 = objc_opt_isKindOfClass();

                  if (v3 && (v25 & 1) != 0)
                  {
                    v5 = CFSTR("HMDCameraMetricsSnapshotLogEvent");
                  }
                  else
                  {
                    v26 = v24;
                    objc_opt_class();
                    v27 = objc_opt_isKindOfClass();

                    if (v3 && (v27 & 1) != 0)
                    {
                      v5 = CFSTR("HMDActionSetLogEvent");
                    }
                    else
                    {
                      v28 = v26;
                      objc_opt_class();
                      v29 = objc_opt_isKindOfClass();

                      if (v3 && (v29 & 1) != 0)
                      {
                        v5 = CFSTR("HomeKitEventTriggerExecutionSessionLogEvent");
                      }
                      else
                      {
                        v30 = v28;
                        objc_opt_class();
                        v31 = objc_opt_isKindOfClass();

                        if (v3 && (v31 & 1) != 0)
                        {
                          v5 = CFSTR("HMDSiriCommandLogEvent");
                        }
                        else
                        {
                          v32 = v30;
                          objc_opt_class();
                          v33 = objc_opt_isKindOfClass();

                          if (v3 && (v33 & 1) != 0)
                          {
                            v34 = v32;
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                              v35 = v34;
                            else
                              v35 = 0;
                            v36 = v35;

                            if (objc_msgSend(v36, "transportType") == 6)
                            {
                              v5 = CFSTR("txRapportRemoteMessageLogEvent");
                            }
                            else if (objc_msgSend(v36, "transportType") == 2)
                            {
                              v5 = CFSTR("txIDSRemoteMessageLogEvent");
                            }
                            else
                            {
                              v5 = 0;
                            }

                          }
                          else
                          {
                            v37 = v32;
                            objc_opt_class();
                            v38 = objc_opt_isKindOfClass();

                            if (v3 && (v38 & 1) != 0)
                            {
                              v5 = CFSTR("HMDCameraRecordingUploadOperationLogEvent");
                            }
                            else
                            {
                              v40 = v37;
                              objc_opt_class();
                              v41 = objc_opt_isKindOfClass();

                              if (v3 && (v41 & 1) != 0)
                              {
                                v5 = CFSTR("HMDCameraRecordingSessionCoordinationLogEvent");
                              }
                              else
                              {
                                v42 = v40;
                                objc_opt_class();
                                v43 = objc_opt_isKindOfClass();

                                if (v3 && (v43 & 1) != 0)
                                {
                                  v5 = CFSTR("HMDCameraRecordingBulkSessionStartLogEvent");
                                }
                                else
                                {
                                  v44 = v42;
                                  objc_opt_class();
                                  v45 = objc_opt_isKindOfClass();

                                  if (((v3 != 0) & v45) != 0)
                                    v5 = CFSTR("HMDCameraRecordingBulkSessionEndLogEvent");
                                  else
                                    v5 = 0;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return (id)v5;
}

- (void)_handleAdditionalErrorsForAccessoryPairingLogEvent:(id)a3 logEventUnderlyingErrorGroupName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "threadCommissioningError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "threadCommissioningError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:](HMDLogEventErrorEventsAnalyzer, "eventCounterNameForError:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Thread_%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "incrementEventCounterForEventName:requestGroup:", v11, v6);

  }
}

- (void)_handleAdditionalErrorsForCloudShareTrustManagerFailureLogEvent:(id)a3 logEventUnderlyingErrorGroupName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "trustManagerErrorCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v13, "trustManagerErrorCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("HMDCloudShareTrustManagerErrorDomain"), objc_msgSend(v9, "integerValue"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:](HMDLogEventErrorEventsAnalyzer, "eventCounterNameForError:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "incrementEventCounterForEventName:requestGroup:", v12, v6);

  }
}

- (id)errorEventsAnalyzedSummaryForDate:(id)a3
{
  __CFString *v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  id obj;
  uint64_t v18;
  id v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend((id)objc_opt_class(), "errorEventsRequestGroupKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v18 = *(_QWORD *)v28;
    v3 = CFSTR("Aggregated error counts: \n");
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "counterGroupForName:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v7;
        objc_msgSend(v7, "eventCountersForDate:", v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v24;
          do
          {
            v12 = 0;
            v13 = v3;
            do
            {
              if (*(_QWORD *)v24 != v11)
                objc_enumerationMutation(v8);
              v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
              objc_msgSend(v8, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFString stringByAppendingFormat:](v13, "stringByAppendingFormat:", CFSTR("   Error: %@ Event: %@ Count: %@ \n"), v14, v5, v15);
              v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

              ++v12;
              v13 = v3;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v10);
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }
  else
  {
    v3 = CFSTR("Aggregated error counts: \n");
  }

  return v3;
}

- (void)submitAllFormattedErrorAggregationLogEvents
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend((id)objc_opt_class(), "errorEventsRequestGroupKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6);
        -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "fetchEventCounterForEventName:requestGroup:", CFSTR("Any Error"), v7);

        -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "fetchEventCounterForEventName:requestGroup:", CFSTR("Total Events"), v7);

        -[HMDLogEventErrorEventsAnalyzer logEventSubmitter](self, "logEventSubmitter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDErrorAggregationLogEvent createSummaryEventForRequestGroup:totalErrorCount:totalEventCount:](HMDErrorAggregationLogEvent, "createSummaryEventForRequestGroup:totalErrorCount:totalEventCount:", v7, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "submitLogEvent:", v15);

        -[HMDLogEventErrorEventsAnalyzer submitErrorAggregationLogEventsForErrorEventGroup:](self, "submitErrorAggregationLogEventsForErrorEventGroup:", v7);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_UnderlyingError"), v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDLogEventErrorEventsAnalyzer submitErrorAggregationLogEventsForErrorEventGroup:](self, "submitErrorAggregationLogEventsForErrorEventGroup:", v16);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  -[HMDLogEventErrorEventsAnalyzer resetEventCountersForAllErrorEventRequestGroups](self, "resetEventCountersForAllErrorEventRequestGroups");
}

- (void)submitErrorAggregationLogEventsForErrorEventGroup:(id)a3
{
  id v4;
  HMDLogEventErrorEventsAnalyzer *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v4;
  objc_msgSend(v6, "fetchEventCountersForRequestGroup:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Total Events")) & 1) == 0)
        {
          -[HMDLogEventErrorEventsAnalyzer logEventSubmitter](v5, "logEventSubmitter");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDErrorAggregationLogEvent createErrorEventForRequestGroup:errorString:errorCount:](HMDErrorAggregationLogEvent, "createErrorEventForRequestGroup:errorString:errorCount:", v17, v13, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "submitLogEvent:", v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (void)resetEventCountersForAllErrorEventRequestGroups
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "errorEventsRequestGroupKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "resetEventCountersForRequestGroup:", v8);

        -[HMDLogEventErrorEventsAnalyzer eventCountersManager](self, "eventCountersManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_UnderlyingError"), v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "resetEventCountersForRequestGroup:", v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
}

+ (NSArray)errorEventsRequestGroupKeys
{
  if (errorEventsRequestGroupKeys_onceToken != -1)
    dispatch_once(&errorEventsRequestGroupKeys_onceToken, &__block_literal_global_182823);
  return (NSArray *)(id)errorEventsRequestGroupKeys_errorEventsRequestGroupKeys;
}

+ (id)eventCounterNameForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "domain");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CFSTR("<No Domain>");
    }
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %ld"), v7, objc_msgSend(v4, "code"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v6)

  }
  else
  {
    v8 = CFSTR("No Error");
  }

  return v8;
}

+ (id)managedEventCounterRequestGroups
{
  return (id)objc_msgSend((id)objc_opt_class(), "errorEventsRequestGroupKeys");
}

void __61__HMDLogEventErrorEventsAnalyzer_errorEventsRequestGroupKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[23];

  v2[22] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("HMDLogEventErrorEventsAnalyzerCloudSyncLegacyUploadRequestGroup");
  v2[1] = CFSTR("HMDCloudShareTrustManagerFailureLogEvent");
  v2[2] = CFSTR("HMDDatabaseCKOperationCompletionEvent");
  v2[3] = CFSTR("HMDBackingStoreCKOperationZoneCompletionLogEvent");
  v2[4] = CFSTR("HMDCameraRecordingUploadOperationLogEvent");
  v2[5] = CFSTR("HMDCameraMetricsStreamLogEvent");
  v2[6] = CFSTR("HMDCameraMetricsSnapshotLogEvent");
  v2[7] = CFSTR("HMDAddAccessoryPairingLogEvent");
  v2[8] = CFSTR("HMDRemoveAccessoryPairingLogEvent");
  v2[9] = CFSTR("HMDCharacteristicReadWriteLogEvent");
  v2[10] = CFSTR("HMDActionSetLogEvent");
  v2[11] = CFSTR("HomeKitEventTriggerExecutionSessionLogEvent");
  v2[12] = CFSTR("HMDSiriCommandLogEvent");
  v2[13] = CFSTR("HMDCameraRecordingSessionCoordinationLogEvent");
  v2[14] = CFSTR("HMDCameraRecordingBulkSessionStartLogEvent");
  v2[15] = CFSTR("HMDCameraRecordingBulkSessionEndLogEvent");
  v2[16] = CFSTR("HAPPairVerifyLogEvent");
  v2[17] = CFSTR("CoreDataCloudKitImportEvent");
  v2[18] = CFSTR("CoreDataCloudKitExportEvent");
  v2[19] = CFSTR("txRapportRemoteMessageLogEvent");
  v2[20] = CFSTR("txIDSRemoteMessageLogEvent");
  v2[21] = CFSTR("All Event Groups");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)errorEventsRequestGroupKeys_errorEventsRequestGroupKeys;
  errorEventsRequestGroupKeys_errorEventsRequestGroupKeys = v0;

}

@end
