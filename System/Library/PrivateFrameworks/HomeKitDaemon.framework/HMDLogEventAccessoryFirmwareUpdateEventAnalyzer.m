@implementation HMDLogEventAccessoryFirmwareUpdateEventAnalyzer

- (HMDLogEventAccessoryFirmwareUpdateEventAnalyzer)initWithEventCountersManager:(id)a3
{
  id v5;
  HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *v6;
  HMDLogEventAccessoryFirmwareUpdateEventAnalyzer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLogEventAccessoryFirmwareUpdateEventAnalyzer;
  v6 = -[HMDLogEventAccessoryFirmwareUpdateEventAnalyzer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_eventCountersManager, a3);

  return v7;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
    -[HMDLogEventAccessoryFirmwareUpdateEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventPeakConcurrentIPAccessoryUpdateStagingCounter"), CFSTR("HMDLogEventAccessoryFirmwareUpdateRequestGroup"), objc_msgSend(v5, "peakConcurrentIPAccessoryUpdateStaging"));

    -[HMDLogEventAccessoryFirmwareUpdateEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventPeakConcurrentIPAccessoryUpdateApplyCounter"), CFSTR("HMDLogEventAccessoryFirmwareUpdateRequestGroup"), objc_msgSend(v5, "peakConcurrentIPAccessoryUpdateApply"));

    -[HMDLogEventAccessoryFirmwareUpdateEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventPeakConcurrentBLEAccessoryUpdateStagingCounter"), CFSTR("HMDLogEventAccessoryFirmwareUpdateRequestGroup"), objc_msgSend(v5, "peakConcurrentBLEAccessoryUpdateStaging"));

    -[HMDLogEventAccessoryFirmwareUpdateEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventPeakConcurrentBLEAccessoryUpdateApplyCounter"), CFSTR("HMDLogEventAccessoryFirmwareUpdateRequestGroup"), objc_msgSend(v5, "peakConcurrentBLEAccessoryUpdateApply"));

    -[HMDLogEventAccessoryFirmwareUpdateEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventPeakConcurrentThreadAccessoryUpdateStagingCounter"), CFSTR("HMDLogEventAccessoryFirmwareUpdateRequestGroup"), objc_msgSend(v5, "peakConcurrentThreadAccessoryUpdateStaging"));

    -[HMDLogEventAccessoryFirmwareUpdateEventAnalyzer eventCountersManager](self, "eventCountersManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventPeakConcurrentThreadAccessoryUpdateApplyCounter"), CFSTR("HMDLogEventAccessoryFirmwareUpdateRequestGroup"), objc_msgSend(v5, "peakConcurrentThreadAccessoryUpdateApply"));

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
  -[HMDLogEventAccessoryFirmwareUpdateEventAnalyzer eventCountersManager](self, "eventCountersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "counterGroupForName:", CFSTR("HMDLogEventAccessoryFirmwareUpdateRequestGroup"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPeakConcurrentIPAccessoryUpdateStaging:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventPeakConcurrentIPAccessoryUpdateStagingCounter"), v6));
  objc_msgSend(v7, "setPeakConcurrentIPAccessoryUpdateApply:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventPeakConcurrentIPAccessoryUpdateApplyCounter"), v6));
  objc_msgSend(v7, "setPeakConcurrentBLEAccessoryUpdateStaging:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventPeakConcurrentBLEAccessoryUpdateStagingCounter"), v6));
  objc_msgSend(v7, "setPeakConcurrentBLEAccessoryUpdateApply:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventPeakConcurrentBLEAccessoryUpdateApplyCounter"), v6));
  objc_msgSend(v7, "setPeakConcurrentThreadAccessoryUpdateStaging:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventPeakConcurrentThreadAccessoryUpdateStagingCounter"), v6));
  v9 = objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventPeakConcurrentThreadAccessoryUpdateApplyCounter"), v6);

  objc_msgSend(v7, "setPeakConcurrentThreadAccessoryUpdateApply:", v9);
}

- (void)resetAggregationAnalysisContext
{
  id v2;

  -[HMDLogEventAccessoryFirmwareUpdateEventAnalyzer eventCountersManager](self, "eventCountersManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetEventCountersForRequestGroup:", CFSTR("HMDLogEventAccessoryFirmwareUpdateRequestGroup"));

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
  v3[0] = CFSTR("HMDLogEventAccessoryFirmwareUpdateRequestGroup");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
