@implementation HMDProcessLaunchInfoLogEvent

- (HMDProcessLaunchInfoLogEvent)initWithSubmissionState:(int64_t)a3 dataSyncState:(id)a4 timeIntervalSincePreviousProcessLaunch:(double)a5 millisecondsToHomeDataLoad:(int64_t)a6 millisecondsToXPCMessageTransportReady:(int64_t)a7 millisecondsSinceLaunchToDataSyncStateGood:(int64_t)a8 millisecondsToAccountResolved:(int64_t)a9 numUncommittedRecords:(int64_t)a10 numUncommittedAndPushedRecords:(int64_t)a11 processExitType:(id)a12 processExitReason:(id)a13 processLaunchCount:(int64_t)a14 processExitCount:(int64_t)a15 processJetsamCount:(int64_t)a16 processIdleExitCount:(int64_t)a17 processCrashCount:(int64_t)a18 isConfigurationLoaded:(BOOL)a19 isTTSUInProgress:(BOOL)a20
{
  id v26;
  id v27;
  id v28;
  HMDProcessLaunchInfoLogEvent *v29;
  HMDProcessLaunchInfoLogEvent *v30;
  objc_super v34;

  v26 = a4;
  v27 = a12;
  v28 = a13;
  v34.receiver = self;
  v34.super_class = (Class)HMDProcessLaunchInfoLogEvent;
  v29 = -[HMMLogEvent init](&v34, sel_init);
  v30 = v29;
  if (v29)
  {
    v29->_submissionState = a3;
    objc_storeStrong((id *)&v29->_dataSyncState, a4);
    v30->_timeIntervalSincePreviousProcessLaunch = a5;
    v30->_homeDataLoadedMilliseconds = a6;
    v30->_xpcMessageTransportReadyMilliseconds = a7;
    v30->_millisecondsSinceLaunchToDataSyncStateGood = a8;
    v30->_millisecondsToAccountResolved = a9;
    v30->_numUncommittedRecords = a10;
    v30->_numUncommittedAndPushedRecords = a11;
    objc_storeStrong((id *)&v30->_processExitType, a12);
    objc_storeStrong((id *)&v30->_processExitReason, a13);
    v30->_processLaunchCount = a14;
    v30->_processExitCount = a15;
    v30->_processJetsamCount = a16;
    v30->_processIdleExitCount = a17;
    v30->_processCrashCount = a18;
    v30->_isConfigurationLoaded = a19;
    v30->_isTTSUInProgress = a20;
  }

  return v30;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.processLaunch.processLaunchInfo");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent submissionState](self, "submissionState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("submissionState"));

  -[HMDProcessLaunchInfoLogEvent dataSyncState](self, "dataSyncState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dataSyncState"));

  +[HMDLogEventHistograms latencyHistogram](HMDLogEventHistograms, "latencyHistogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intervalIndexForValue:", -[HMDProcessLaunchInfoLogEvent millisecondsSinceLaunchToDataSyncStateGood](self, "millisecondsSinceLaunchToDataSyncStateGood"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("millisecondsSinceLaunchToDataSyncStateGood"));

  -[HMDProcessLaunchInfoLogEvent timeIntervalSincePreviousProcessLaunch](self, "timeIntervalSincePreviousProcessLaunch");
  if (v8 > 0.0)
  {
    +[HMDLogEventHistograms highVolumeHistogram](HMDLogEventHistograms, "highVolumeHistogram");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDProcessLaunchInfoLogEvent timeIntervalSincePreviousProcessLaunch](self, "timeIntervalSincePreviousProcessLaunch");
    objc_msgSend(v9, "intervalIndexForValue:", (unint64_t)v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("timeIntervalSincePreviousProcessLaunch"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent homeDataLoadedMilliseconds](self, "homeDataLoadedMilliseconds"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("homeDataLoadedMilliseconds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent xpcMessageTransportReadyMilliseconds](self, "xpcMessageTransportReadyMilliseconds"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("xpcMessageTransportReadyMilliseconds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent millisecondsSinceLaunchToDataSyncStateGood](self, "millisecondsSinceLaunchToDataSyncStateGood"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("dataSyncStateGoodMilliseconds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent millisecondsToAccountResolved](self, "millisecondsToAccountResolved"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("accountResolvedMilliseconds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent numUncommittedRecords](self, "numUncommittedRecords"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("numUncommittedRecords"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent numUncommittedAndPushedRecords](self, "numUncommittedAndPushedRecords"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("numUncommittedAndPushedRecords"));

  -[HMDProcessLaunchInfoLogEvent processExitType](self, "processExitType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("processExitType"));

  -[HMDProcessLaunchInfoLogEvent processExitReason](self, "processExitReason");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("processExitReason"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent processLaunchCount](self, "processLaunchCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("processLaunchCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent processExitCount](self, "processExitCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("processExitCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent processCrashCount](self, "processCrashCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("processCrashCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent processJetsamCount](self, "processJetsamCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("processJetsamCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDProcessLaunchInfoLogEvent processIdleExitCount](self, "processIdleExitCount"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("processIdleExitCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDProcessLaunchInfoLogEvent isConfigurationLoaded](self, "isConfigurationLoaded"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("isConfigurationLoaded_BOOL"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDProcessLaunchInfoLogEvent isTTSUInProgress](self, "isTTSUInProgress"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("isTTSUInProgress_BOOL"));

  if (-[HMDProcessLaunchInfoLogEvent isConfigurationLoaded](self, "isConfigurationLoaded"))
    v27 = &unk_1E8B33648;
  else
    v27 = &unk_1E8B33660;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("isConfigurationLoaded_INT"));
  if (-[HMDProcessLaunchInfoLogEvent isTTSUInProgress](self, "isTTSUInProgress"))
    v28 = &unk_1E8B33648;
  else
    v28 = &unk_1E8B33660;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("isTTSUInProgress_INT"));
  v29 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v29;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (int64_t)submissionState
{
  return self->_submissionState;
}

- (NSString)dataSyncState
{
  return self->_dataSyncState;
}

- (int64_t)systemUptimeMillisecondsAtLaunch
{
  return self->_systemUptimeMillisecondsAtLaunch;
}

- (double)timeIntervalSincePreviousProcessLaunch
{
  return self->_timeIntervalSincePreviousProcessLaunch;
}

- (int64_t)homeDataLoadedMilliseconds
{
  return self->_homeDataLoadedMilliseconds;
}

- (int64_t)xpcMessageTransportReadyMilliseconds
{
  return self->_xpcMessageTransportReadyMilliseconds;
}

- (int64_t)millisecondsSinceLaunchToDataSyncStateGood
{
  return self->_millisecondsSinceLaunchToDataSyncStateGood;
}

- (int64_t)millisecondsToAccountResolved
{
  return self->_millisecondsToAccountResolved;
}

- (int64_t)numUncommittedRecords
{
  return self->_numUncommittedRecords;
}

- (int64_t)numUncommittedAndPushedRecords
{
  return self->_numUncommittedAndPushedRecords;
}

- (NSString)processExitType
{
  return self->_processExitType;
}

- (NSString)processExitReason
{
  return self->_processExitReason;
}

- (int64_t)processLaunchCount
{
  return self->_processLaunchCount;
}

- (int64_t)processExitCount
{
  return self->_processExitCount;
}

- (int64_t)processJetsamCount
{
  return self->_processJetsamCount;
}

- (int64_t)processIdleExitCount
{
  return self->_processIdleExitCount;
}

- (int64_t)processCrashCount
{
  return self->_processCrashCount;
}

- (BOOL)isConfigurationLoaded
{
  return self->_isConfigurationLoaded;
}

- (BOOL)isTTSUInProgress
{
  return self->_isTTSUInProgress;
}

- (BOOL)eventSubmittedOnTimeOut
{
  return self->_eventSubmittedOnTimeOut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processExitReason, 0);
  objc_storeStrong((id *)&self->_processExitType, 0);
  objc_storeStrong((id *)&self->_dataSyncState, 0);
}

@end
