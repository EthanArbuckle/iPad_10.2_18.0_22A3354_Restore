@implementation HMDLogEventProcessMemoryEventsAnalyzer

- (HMDEventCountersManager)eventCountersManager
{
  return (HMDEventCountersManager *)objc_getProperty(self, a2, 8, 1);
}

- (HMDLogEventProcessMemoryEventsAnalyzer)initWithDataSource:(id)a3
{
  id v4;
  HMDLogEventProcessMemoryEventsAnalyzer *v5;
  uint64_t v6;
  HMDEventCountersManager *eventCountersManager;
  uint64_t v8;
  HMMRadarInitiating *radarInitiator;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDLogEventProcessMemoryEventsAnalyzer;
  v5 = -[HMDLogEventProcessMemoryEventsAnalyzer init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "legacyCountersManager");
    v6 = objc_claimAutoreleasedReturnValue();
    eventCountersManager = v5->_eventCountersManager;
    v5->_eventCountersManager = (HMDEventCountersManager *)v6;

    objc_msgSend(v4, "radarInitiator");
    v8 = objc_claimAutoreleasedReturnValue();
    radarInitiator = v5->_radarInitiator;
    v5->_radarInitiator = (HMMRadarInitiating *)v8;

  }
  return v5;
}

- (unint64_t)storedAverageProcessMemoryKB
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMDLogEventProcessMemoryEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fetchEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerProcessMemorySampleEventCount"), CFSTR("HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"));

  if (!v4)
    return 0;
  -[HMDLogEventProcessMemoryEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fetchEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerProcessMemorySampleAggregateValueKB"), CFSTR("HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"));

  return v6 / v4;
}

- (unint64_t)storedPeakProcessMemoryKB
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDLogEventProcessMemoryEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "counterGroupForName:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "fetchMaxValueForStatisticsName:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerProcessMemorySamplePeakValueKB"));
  return v4;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
    -[HMDLogEventProcessMemoryEventsAnalyzer _handleMemoryPressureNotificationLogEvent:](self, "_handleMemoryPressureNotificationLogEvent:", v6);
  v9 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
    -[HMDLogEventProcessMemoryEventsAnalyzer _handleMemorySampleLogEvent:](self, "_handleMemorySampleLogEvent:", v8);

}

- (void)_handleMemoryPressureNotificationLogEvent:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "processMemoryState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("HMFProcessMemoryStateWarning"));

  if (v5)
  {
    -[HMDLogEventProcessMemoryEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerProcessMemoryPressureStateWarningEventCounter"), CFSTR("HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"));
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v10, "processMemoryState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("HMFProcessMemoryStateCritical"));

  if (v8)
  {
    -[HMDLogEventProcessMemoryEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerProcessMemoryPressureStateCriticalEventCounter"), CFSTR("HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"));

    -[HMDLogEventProcessMemoryEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forceSave");
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_handleMemorySampleLogEvent:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
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
  v4 = ((unint64_t)objc_msgSend(v15, "currentMemoryUsage") >> 10);
  v5 = ((unint64_t)objc_msgSend(v15, "intervalMaxMemoryUsage") >> 10);
  -[HMDLogEventProcessMemoryEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "counterGroupForName:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addValue:toStatisticsName:", v5, CFSTR("HMDLogEventProcessMemoryEventsAnalyzerProcessMemorySamplePeakValueKB"));
  -[HMDLogEventProcessMemoryEventsAnalyzer radarInitiator](self, "radarInitiator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v5 > 0x1E000)
  {
    -[HMDLogEventProcessMemoryEventsAnalyzer radarInitiator](self, "radarInitiator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("homed used excessive memory: %lu KB"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1302798);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestRadarWithMessage:radarTitle:componentName:componentVersion:componentID:", v10, CFSTR("homed using excessive memory"), CFSTR("HomeKit"), CFSTR("Performance - Memory"), v12);

  }
  if (objc_msgSend(v15, "reason") == 1)
  {
    -[HMDLogEventProcessMemoryEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "incrementEventCounterForEventName:requestGroup:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerProcessMemorySampleEventCount"), CFSTR("HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"));

    -[HMDLogEventProcessMemoryEventsAnalyzer eventCountersManager](self, "eventCountersManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "incrementEventCounterForEventName:requestGroup:withValue:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerProcessMemorySampleAggregateValueKB"), CFSTR("HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"), v4);

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
  -[HMDLogEventProcessMemoryEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "counterGroupForName:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProcessMemoryPressureStateWarningCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerProcessMemoryPressureStateWarningEventCounter"), v6));
  v9 = objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerProcessMemoryPressureStateCriticalEventCounter"), v6);

  objc_msgSend(v7, "setProcessMemoryPressureStateCriticalCount:", v9);
  objc_msgSend(v7, "setSampledAverageProcessMemoryUsageMB:", -[HMDLogEventProcessMemoryEventsAnalyzer storedAverageProcessMemoryKB](self, "storedAverageProcessMemoryKB") >> 10);
  objc_msgSend(v7, "setSampledPeakProcessMemoryUsageMB:", -[HMDLogEventProcessMemoryEventsAnalyzer storedPeakProcessMemoryKB](self, "storedPeakProcessMemoryKB") >> 10);

}

- (void)resetAggregationAnalysisContext
{
  id v2;

  -[HMDLogEventProcessMemoryEventsAnalyzer eventCountersManager](self, "eventCountersManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetEventCountersForRequestGroup:", CFSTR("HMDLogEventProcessMemoryEventsAnalyzerRequestGroup"));

}

- (HMMRadarInitiating)radarInitiator
{
  return (HMMRadarInitiating *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarInitiator, 0);
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
}

+ (id)managedEventCounterRequestGroups
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("HMDLogEventProcessMemoryEventsAnalyzerRequestGroup");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
