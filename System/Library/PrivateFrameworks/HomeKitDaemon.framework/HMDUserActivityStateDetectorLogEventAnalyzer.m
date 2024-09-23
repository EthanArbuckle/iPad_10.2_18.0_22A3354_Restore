@implementation HMDUserActivityStateDetectorLogEventAnalyzer

- (HMDUserActivityStateDetectorLogEventAnalyzer)initWithDataSource:(id)a3
{
  id v5;
  HMDUserActivityStateDetectorLogEventAnalyzer *v6;
  HMDUserActivityStateDetectorLogEventAnalyzer *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HMDEventCounterGroup *type6DetectorTransitionCounterGroup;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDEventCounterGroup *type3DetectorTransitionCounterGroup;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDUserActivityStateDetectorLogEventAnalyzer;
  v6 = -[HMDUserActivityStateDetectorLogEventAnalyzer init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    objc_msgSend(v5, "legacyCountersManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HMDUserActivityStateType6Transitions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "counterGroupForName:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    type6DetectorTransitionCounterGroup = v7->_type6DetectorTransitionCounterGroup;
    v7->_type6DetectorTransitionCounterGroup = (HMDEventCounterGroup *)v10;

    objc_msgSend(v5, "legacyCountersManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HMDUserActivityType3StateDailyCountLogEvent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "counterGroupForName:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    type3DetectorTransitionCounterGroup = v7->_type3DetectorTransitionCounterGroup;
    v7->_type3DetectorTransitionCounterGroup = (HMDEventCounterGroup *)v14;

  }
  -[HMDUserActivityStateDetectorLogEventAnalyzer configure](v7, "configure");

  return v7;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  -[HMDUserActivityStateDetectorLogEventAnalyzer dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dailyScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerDailyTaskRunner:", self);

  -[HMDUserActivityStateDetectorLogEventAnalyzer dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forEventClasses:", self, v7);

}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v9;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HMDUserActivityStateDetectorLogEventAnalyzer handleType6TransitionLogEvent:](self, "handleType6TransitionLogEvent:", v5);
  }
  else
  {
    v6 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
      -[HMDUserActivityStateDetectorLogEventAnalyzer handleType3LogEvent:](self, "handleType3LogEvent:", v8);

  }
}

- (void)handleType6TransitionLogEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDUserActivityStateDetectorLogEventAnalyzer *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "eventString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Incrementing daily total counters for %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDUserActivityStateDetectorLogEventAnalyzer type6DetectorTransitionCounterGroup](v7, "type6DetectorTransitionCounterGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "incrementEventCounterForEventName:", v5);

  if (objc_msgSend(v4, "trackerType") == 2 && objc_msgSend(v4, "reason") == 2)
  {
    v11 = objc_msgSend(v4, "stateEndOffset");
    if (v11 > -[HMDUserActivityStateDetectorLogEventAnalyzer maxCoreLocationStateEndOffset](v7, "maxCoreLocationStateEndOffset"))-[HMDUserActivityStateDetectorLogEventAnalyzer setMaxCoreLocationStateEndOffset:](v7, "setMaxCoreLocationStateEndOffset:", objc_msgSend(v4, "stateEndOffset"));
  }

}

- (void)handleType3LogEvent:(id)a3
{
  unint64_t v4;
  __CFString **v5;
  void *v6;
  unint64_t v7;
  __CFString ***v8;
  __CFString **v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "logReason") - 1;
  if (v4 <= 2)
  {
    v5 = off_24E7834A8[v4];
    -[HMDUserActivityStateDetectorLogEventAnalyzer type3DetectorTransitionCounterGroup](self, "type3DetectorTransitionCounterGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "incrementEventCounterForEventName:", *v5);

  }
  if (objc_msgSend(v11, "didEnterType5"))
  {
    v7 = objc_msgSend(v11, "logReason") - 1;
    if (v7 < 3)
    {
      v8 = off_24E7834C0;
LABEL_9:
      v9 = v8[v7];
      -[HMDUserActivityStateDetectorLogEventAnalyzer type3DetectorTransitionCounterGroup](self, "type3DetectorTransitionCounterGroup");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "incrementEventCounterForEventName:", *v9);

      goto LABEL_10;
    }
  }
  if (objc_msgSend(v11, "didEnterTransition"))
  {
    v7 = objc_msgSend(v11, "logReason") - 1;
    if (v7 < 3)
    {
      v8 = off_24E7834D8;
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)runDailyTask
{
  -[HMDUserActivityStateDetectorLogEventAnalyzer submitCounterGroups](self, "submitCounterGroups");
  -[HMDUserActivityStateDetectorLogEventAnalyzer resetCounterGroups](self, "resetCounterGroups");
}

- (void)submitCounterGroups
{
  -[HMDUserActivityStateDetectorLogEventAnalyzer submitType6DetectorTransitionCounterGroups](self, "submitType6DetectorTransitionCounterGroups");
  -[HMDUserActivityStateDetectorLogEventAnalyzer submitType3DetectorCounterGroups](self, "submitType3DetectorCounterGroups");
}

- (void)submitType6DetectorTransitionCounterGroups
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v42;

  -[HMDUserActivityStateDetectorLogEventAnalyzer type6DetectorTransitionCounterGroup](self, "type6DetectorTransitionCounterGroup");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("None"), CFSTR("EndedHome"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v42, "fetchEventCounterForEventName:", v2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("CoreLocation"), CFSTR("Started"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_msgSend(v42, "fetchEventCounterForEventName:", v3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("CoreLocation"), CFSTR("EndedHome"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_msgSend(v42, "fetchEventCounterForEventName:", v4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("CoreLocation"), CFSTR("ArrivedHomeWithVisit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_msgSend(v42, "fetchEventCounterForEventName:", v5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("CoreLocation"), CFSTR("ArrivedNonHome"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v42, "fetchEventCounterForEventName:", v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("CoreLocation"), CFSTR("EndedTooFarAway"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v42, "fetchEventCounterForEventName:", v8) + v7;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("CoreLocation"), CFSTR("EndedTooLongAway"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v42, "fetchEventCounterForEventName:", v10);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("CoreLocation"), CFSTR("EndedNoProgress"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v42, "fetchEventCounterForEventName:", v12);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("CoreLocation"), CFSTR("EndDateUpdated"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v42, "fetchEventCounterForEventName:", v14);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("CoreLocation"), CFSTR("IgnoredVisitExit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v42, "fetchEventCounterForEventName:", v16);
  v30 = v17 + v34;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("CoreLocation"), CFSTR("IgnoredVisitEntry"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v42, "fetchEventCounterForEventName:", v38);
  v19 = v9 + v34 + v36 + v32 + v11 + v13 + v15 + v17 + v18;
  v20 = v18 + v32;
  v21 = [HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v39);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9 + v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityStateDetectorLogEventAnalyzer maxCoreLocationStateEndOffset](self, "maxCoreLocationStateEndOffset"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent initWithEndedHomeCount:coreLocationCount:coreLocationEndedHomeCount:coreLocationEndedNonHome:coreLocationEndedNotMakingProgress:coreLocationResume:coreLocationEndDateUpdated:coreLocationVisitExit:coreLocationVisitEntry:maxCoreLocationStateEndOffset:](v21, "initWithEndedHomeCount:coreLocationCount:coreLocationEndedHomeCount:coreLocationEndedNonHome:coreLocationEndedNotMakingProgress:coreLocationResume:coreLocationEndDateUpdated:coreLocationVisitExit:coreLocationVisitEntry:maxCoreLocationStateEndOffset:", v22, v40, v37, v35, v23, v31, v24, v25, v26, v27);

  -[HMDUserActivityStateDetectorLogEventAnalyzer dataSource](self, "dataSource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "logEventSubmitter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "submitLogEvent:", v33);

}

- (void)submitType3DetectorCounterGroups
{
  HMDUserActivityType3StateDailyCountLogEvent *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDUserActivityStateDetectorLogEventAnalyzer type3DetectorTransitionCounterGroup](self, "type3DetectorTransitionCounterGroup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[HMDUserActivityType3StateDailyCountLogEvent initWithTotalManualScheduleUpdateCount:totalAutomaticScheduleStateUpdateCount:totalManualFocusUpdateCount:enterType5ByManualScheduleUpdateCount:enterType5ByAutomaticScheduleStateUpdateCount:enterType5ByManualFocusUpdateCount:enterTransitionByManualScheduleUpdateCount:enterTransitionByAutomaticScheduleStateUpdateCount:enterTransitionByManualFocusUpdateCount:]([HMDUserActivityType3StateDailyCountLogEvent alloc], "initWithTotalManualScheduleUpdateCount:totalAutomaticScheduleStateUpdateCount:totalManualFocusUpdateCount:enterType5ByManualScheduleUpdateCount:enterType5ByAutomaticScheduleStateUpdateCount:enterType5ByManualFocusUpdateCount:enterTransitionByManualScheduleUpdateCount:enterTransitionByAutomaticScheduleStateUpdateCount:enterTransitionByManualFocusUpdateCount:", objc_msgSend(v6, "fetchEventCounterForEventName:", CFSTR("totalManualScheduleUpdateCount")), objc_msgSend(v6, "fetchEventCounterForEventName:", CFSTR("totalAutomaticScheduleStateUpdateCount")), objc_msgSend(v6, "fetchEventCounterForEventName:", CFSTR("totalManualFocusUpdateCount")), objc_msgSend(v6, "fetchEventCounterForEventName:", CFSTR("enterType5ByManualScheduleUpdateCount")), objc_msgSend(v6, "fetchEventCounterForEventName:", CFSTR("enterType5ByAutomaticScheduleStateUpdateCount")), objc_msgSend(v6, "fetchEventCounterForEventName:", CFSTR("enterType5ByManualFocusUpdateCount")), objc_msgSend(v6, "fetchEventCounterForEventName:", CFSTR("enterTransitionByManualScheduleUpdateCount")), objc_msgSend(v6, "fetchEventCounterForEventName:", CFSTR("enterTransitionByAutomaticScheduleStateUpdateCount")), objc_msgSend(v6, "fetchEventCounterForEventName:", CFSTR("enterTransitionByManualFocusUpdateCount")));
  -[HMDUserActivityStateDetectorLogEventAnalyzer dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEventSubmitter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitLogEvent:", v3);

}

- (void)resetCounterGroups
{
  id v3;

  -[HMDUserActivityStateDetectorLogEventAnalyzer resetType6DetectorTransitionCounterGroup](self, "resetType6DetectorTransitionCounterGroup");
  -[HMDUserActivityStateDetectorLogEventAnalyzer type3DetectorTransitionCounterGroup](self, "type3DetectorTransitionCounterGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetEventCounters");

}

- (void)resetType6DetectorTransitionCounterGroup
{
  id v3;

  -[HMDUserActivityStateDetectorLogEventAnalyzer setMaxCoreLocationStateEndOffset:](self, "setMaxCoreLocationStateEndOffset:", 0);
  -[HMDUserActivityStateDetectorLogEventAnalyzer type6DetectorTransitionCounterGroup](self, "type6DetectorTransitionCounterGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetEventCounters");

}

- (HMDLogEventAnalyzerDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)maxCoreLocationStateEndOffset
{
  return self->_maxCoreLocationStateEndOffset;
}

- (void)setMaxCoreLocationStateEndOffset:(unint64_t)a3
{
  self->_maxCoreLocationStateEndOffset = a3;
}

- (HMDEventCounterGroup)type6DetectorTransitionCounterGroup
{
  return (HMDEventCounterGroup *)objc_getProperty(self, a2, 24, 1);
}

- (HMDEventCounterGroup)type3DetectorTransitionCounterGroup
{
  return self->_type3DetectorTransitionCounterGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type3DetectorTransitionCounterGroup, 0);
  objc_storeStrong((id *)&self->_type6DetectorTransitionCounterGroup, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
