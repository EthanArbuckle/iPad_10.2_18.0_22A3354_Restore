@implementation HMDLogEventElectionEventsAnalyzer

- (HMDLogEventElectionEventsAnalyzer)initWithDataSource:(id)a3
{
  id v4;
  HMDLogEventElectionEventsAnalyzer *v5;
  void *v6;
  uint64_t v7;
  HMDEventCounterGroup *counterGroup;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDLogEventElectionEventsAnalyzer;
  v5 = -[HMDLogEventElectionEventsAnalyzer init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "legacyCountersManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "counterGroupForName:", CFSTR("HMDLogEventElectionEventsAnalyzerRequestGroup"));
    v7 = objc_claimAutoreleasedReturnValue();
    counterGroup = v5->_counterGroup;
    v5->_counterGroup = (HMDEventCounterGroup *)v7;

    v5->_isCurrentDeviceInSecondaryResidentCoordinationMesh = 0;
    objc_msgSend(v4, "logEventDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forEventClasses:", v5, v10);

    objc_msgSend(v4, "notificationCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v5, sel_handlePrimaryResidentChangedNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), 0);

    objc_msgSend(v4, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("legacyElectionStartCount"), CFSTR("currentDeviceStartedElectionCount"), CFSTR("HMDLogEventElectionEventsAnalyzerRequestGroup"), 10);
    objc_msgSend(v4, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("electionV2PrimaryElectionCount"), CFSTR("v2ElectionPrimaryResidentElectionRunCount"), CFSTR("HMDLogEventElectionEventsAnalyzerRequestGroup"), 10);
    objc_msgSend(v4, "addThresholdTrigger:forEventName:requestGroup:atThreshold:", CFSTR("electionV2PrimaryChangedCount"), CFSTR("v2ElectionPrimaryResidentChangedCount"), CFSTR("HMDLogEventElectionEventsAnalyzerRequestGroup"), 10);
    -[HMDEventCounterGroup resumeDurationCounter:](v5->_counterGroup, "resumeDurationCounter:", CFSTR("v2CurrentDeviceInPrimaryMeshDurationSeconds"));
  }

  return v5;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v25;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "incrementEventCounterForEventName:", CFSTR("currentDeviceStartedElectionCount"));
  }
  else
  {
    v7 = v25;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v6 = v8;

    if (v6)
    {
      -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "incrementEventCounterForEventName:", CFSTR("v2ElectionCoordinationMeshUpdateCount"));

      if (objc_msgSend(v6, "didElectLeader"))
      {
        -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "incrementEventCounterForEventName:", CFSTR("v2ElectionCoordinationMeshLeaderElectedCount"));

      }
      if (objc_msgSend(v6, "didChangeLeader"))
      {
        -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "incrementEventCounterForEventName:", CFSTR("v2ElectionCoordinationMeshLeaderChangedCount"));

      }
      if (objc_msgSend(v6, "didCurrentDeviceLeavePrimaryMesh"))
      {
        -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "incrementEventCounterForEventName:", CFSTR("v2ElectionCoordinationCurrentDeviceFlapCount"));

      }
      v13 = -[HMDLogEventElectionEventsAnalyzer isCurrentDeviceInSecondaryResidentCoordinationMesh](self, "isCurrentDeviceInSecondaryResidentCoordinationMesh");
      if (v13 != objc_msgSend(v6, "isInSecondaryMesh"))
      {
        v14 = objc_msgSend(v6, "isInSecondaryMesh");
        -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v14)
        {
          objc_msgSend(v15, "pauseDurationCounter:", CFSTR("v2CurrentDeviceInPrimaryMeshDurationSeconds"));

          -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          v19 = CFSTR("v2CurrentDeviceInSecondaryMeshDurationSeconds");
        }
        else
        {
          objc_msgSend(v15, "pauseDurationCounter:", CFSTR("v2CurrentDeviceInSecondaryMeshDurationSeconds"));

          -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          v19 = CFSTR("v2CurrentDeviceInPrimaryMeshDurationSeconds");
        }
        objc_msgSend(v17, "resumeDurationCounter:", v19);

        -[HMDLogEventElectionEventsAnalyzer setIsCurrentDeviceInSecondaryResidentCoordinationMesh:](self, "setIsCurrentDeviceInSecondaryResidentCoordinationMesh:", objc_msgSend(v6, "isInSecondaryMesh"));
      }
    }
    else
    {
      v20 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
      v22 = v21;

      if (v22)
      {
        -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "incrementEventCounterForEventName:", CFSTR("v2ElectionPrimaryResidentElectionRunCount"));

        if (objc_msgSend(v22, "didChangePrimary"))
        {
          -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "incrementEventCounterForEventName:", CFSTR("v2ElectionPrimaryResidentChangedCount"));

        }
      }

      v6 = 0;
    }
  }

}

- (void)handlePrimaryResidentChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  HMDLogEventElectionEventsAnalyzer *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = objc_msgSend(v8, "isCurrentDevice");
    -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "resumeDurationCounter:", CFSTR("PrimaryResidentDurationSeconds"));
    else
      objc_msgSend(v10, "pauseDurationCounter:", CFSTR("PrimaryResidentDurationSeconds"));

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received update primary resident notification but the primary resident is nil", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

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
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  unint64_t v23;
  id v24;

  v6 = a4;
  v24 = a3;
  -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCurrentDeviceStartedLegacyElectionCount:", objc_msgSend(v7, "fetchEventCounterForEventName:forDate:", CFSTR("currentDeviceStartedElectionCount"), v6));

  -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setV2ElectionCoordinationMeshUpdateCount:", objc_msgSend(v8, "fetchEventCounterForEventName:forDate:", CFSTR("v2ElectionCoordinationMeshUpdateCount"), v6));

  -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setV2ElectionCoordinationMeshLeaderElectedCount:", objc_msgSend(v9, "fetchEventCounterForEventName:forDate:", CFSTR("v2ElectionCoordinationMeshLeaderElectedCount"), v6));

  -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setV2ElectionCoordinationMeshLeaderChangedCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("v2ElectionCoordinationMeshLeaderChangedCount"), v6));

  -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setV2ElectionPrimaryResidentElectionRunCount:", objc_msgSend(v11, "fetchEventCounterForEventName:forDate:", CFSTR("v2ElectionPrimaryResidentElectionRunCount"), v6));

  -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setV2ElectionPrimaryResidentChangedCount:", objc_msgSend(v12, "fetchEventCounterForEventName:forDate:", CFSTR("v2ElectionPrimaryResidentChangedCount"), v6));

  objc_msgSend(v24, "setV2ElectionCurrentDeviceInSecondaryCoordinationMesh:", -[HMDLogEventElectionEventsAnalyzer isCurrentDeviceInSecondaryResidentCoordinationMesh](self, "isCurrentDeviceInSecondaryResidentCoordinationMesh"));
  -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setV2ElectionCoordinationCurrentDeviceFlapCount:", objc_msgSend(v13, "fetchEventCounterForEventName:forDate:", CFSTR("v2ElectionCoordinationCurrentDeviceFlapCount"), v6));

  -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "durationForCounter:forDate:", CFSTR("PrimaryResidentDurationSeconds"), v6);
  v16 = v15;

  objc_msgSend(v24, "setPrimaryResidentDurationMinutes:", (uint64_t)((v16 + 59.0) / 60.0));
  -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "durationForCounter:forDate:", CFSTR("v2CurrentDeviceInPrimaryMeshDurationSeconds"), v6);
  v19 = v18;

  -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "durationForCounter:forDate:", CFSTR("v2CurrentDeviceInSecondaryMeshDurationSeconds"), v6);
  v22 = v21;

  if (v19 + v22 <= 0.0)
    v23 = 0;
  else
    v23 = llround(v19 * 100.0 / (v19 + v22));
  objc_msgSend(v24, "setV2ElectionPercentageDurationCurrentDeviceIsInPrimaryMesh:", v23);

}

- (void)resetAggregationAnalysisContext
{
  id v2;

  -[HMDLogEventElectionEventsAnalyzer counterGroup](self, "counterGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetEventCounters");

}

- (BOOL)isCurrentDeviceInSecondaryResidentCoordinationMesh
{
  return self->_isCurrentDeviceInSecondaryResidentCoordinationMesh;
}

- (void)setIsCurrentDeviceInSecondaryResidentCoordinationMesh:(BOOL)a3
{
  self->_isCurrentDeviceInSecondaryResidentCoordinationMesh = a3;
}

- (HMDEventCounterGroup)counterGroup
{
  return self->_counterGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterGroup, 0);
}

+ (id)managedEventCounterRequestGroups
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("HMDLogEventElectionEventsAnalyzerRequestGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
