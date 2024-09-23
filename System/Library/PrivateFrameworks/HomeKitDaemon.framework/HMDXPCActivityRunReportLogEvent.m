@implementation HMDXPCActivityRunReportLogEvent

- (HMDXPCActivityRunReportLogEvent)initWithActivityName:(id)a3 definedInterval:(double)a4 activityShouldWake:(BOOL)a5 timeSinceLastRun:(double)a6
{
  id v11;
  HMDXPCActivityRunReportLogEvent *v12;
  HMDXPCActivityRunReportLogEvent *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDXPCActivityRunReportLogEvent;
  v12 = -[HMMLogEvent init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activityName, a3);
    v13->_activityDefinedIntervalInMinutes = (uint64_t)(a4 / 3600.0);
    v13->_activityShouldWake = a5;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmf_dateComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_activityRunHourOfDay = objc_msgSend(v15, "hour");

    v13->_activityTimeSinceLastRunInMinutes = (uint64_t)(a6 / 60.0);
  }

  return v13;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homed.HMDXPCActivityRunReport");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("activityName");
  -[HMDXPCActivityRunReportLogEvent activityName](self, "activityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("activityShouldWake");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDXPCActivityRunReportLogEvent activityShouldWake](self, "activityShouldWake"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("activityDefinedIntervalInMinutes");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDXPCActivityRunReportLogEvent activityDefinedIntervalInMinutes](self, "activityDefinedIntervalInMinutes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("activityRunHourOfDay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDXPCActivityRunReportLogEvent activityRunHourOfDay](self, "activityRunHourOfDay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("activityTimeSinceLastRunInMinutes");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDXPCActivityRunReportLogEvent activityTimeSinceLastRunInMinutes](self, "activityTimeSinceLastRunInMinutes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (int64_t)activityDefinedIntervalInMinutes
{
  return self->_activityDefinedIntervalInMinutes;
}

- (BOOL)activityShouldWake
{
  return self->_activityShouldWake;
}

- (int64_t)activityRunHourOfDay
{
  return self->_activityRunHourOfDay;
}

- (int64_t)activityTimeSinceLastRunInMinutes
{
  return self->_activityTimeSinceLastRunInMinutes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityName, 0);
}

@end
