@implementation HMDLogEventReachabilityEventsAnalyzer

- (void)resetAggregationAnalysisContext
{
  id v2;

  -[HMDLogEventReachabilityEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetEventCountersForRequestGroup:", CFSTR("HMDLogEventReachabilityEventsAnalyzerRequestGroup"));

}

- (HMDLogEventReachabilityEventsAnalyzer)initWithEventCountersManager:(id)a3
{
  id v5;
  HMDLogEventReachabilityEventsAnalyzer *v6;
  HMDLogEventReachabilityEventsAnalyzer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLogEventReachabilityEventsAnalyzer;
  v6 = -[HMDLogEventReachabilityEventsAnalyzer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_eventCountersManager, a3);

  return v7;
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

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v12;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HMDLogEventReachabilityEventsAnalyzer _handleRemoteDeviceReachabilityChangedLogEvent:](self, "_handleRemoteDeviceReachabilityChangedLogEvent:", v5);
  }
  else
  {
    v6 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      -[HMDLogEventReachabilityEventsAnalyzer _handleCameraRecordingReachabilityLogEvent:](self, "_handleCameraRecordingReachabilityLogEvent:", v8);
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
        -[HMDLogEventReachabilityEventsAnalyzer _handleReachabiltiyAddRemoveEvent:](self, "_handleReachabiltiyAddRemoveEvent:", v11);

    }
  }

}

- (void)_handleReachabiltiyAddRemoveEvent:(id)a3
{
  id v3;

  -[HMDLogEventReachabilityEventsAnalyzer eventCountersManager](self, "eventCountersManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventReachabilityEventsAnalyzerReachabilityChangedCounter"), CFSTR("HMDLogEventReachabilityEventsAnalyzerRequestGroup"));

}

- (void)_handleRemoteDeviceReachabilityChangedLogEvent:(id)a3
{
  id v3;

  -[HMDLogEventReachabilityEventsAnalyzer eventCountersManager](self, "eventCountersManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventReachabilityEventsAnalyzerHomeHubReachabilityChangedCounter"), CFSTR("HMDLogEventReachabilityEventsAnalyzerRequestGroup"));

}

- (void)_handleCameraRecordingReachabilityLogEvent:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "didCreateEventModel"))
  {
    -[HMDLogEventReachabilityEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventReachabilityEventsAnalyzerCameraRecordingReachabilityChangedCounter"), CFSTR("HMDLogEventReachabilityEventsAnalyzerRequestGroup"));

    objc_msgSend(v8, "offlineDuration");
    if (v5 > 0.0)
    {
      -[HMDLogEventReachabilityEventsAnalyzer eventCountersManager](self, "eventCountersManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "offlineDuration");
      objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventReachabilityEventsAnalyzerCameraRecordingOfflineDurationCounter"), CFSTR("HMDLogEventReachabilityEventsAnalyzerRequestGroup"), (unint64_t)v7);

    }
  }

}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HMDLogEventReachabilityEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "counterGroupForName:", CFSTR("HMDLogEventReachabilityEventsAnalyzerRequestGroup"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setCameraRecordingReachabilityChangedCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventReachabilityEventsAnalyzerCameraRecordingReachabilityChangedCounter"), v6));
  objc_msgSend(v7, "setCameraRecordingReachabilityOfflineDuration:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventReachabilityEventsAnalyzerCameraRecordingOfflineDurationCounter"), v6));
  objc_msgSend(v7, "setHomeHubReachabilityChangedCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventReachabilityEventsAnalyzerHomeHubReachabilityChangedCounter"), v6));
  v9 = objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventReachabilityEventsAnalyzerReachabilityChangedCounter"), v6);

  objc_msgSend(v7, "setIpAccessoryReachabilityChangedCount:", v9);
}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
}

+ (id)managedEventCounterRequestGroups
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("HMDLogEventReachabilityEventsAnalyzerRequestGroup");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
