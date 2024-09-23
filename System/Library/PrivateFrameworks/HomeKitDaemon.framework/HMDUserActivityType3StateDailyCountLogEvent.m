@implementation HMDUserActivityType3StateDailyCountLogEvent

- (HMDUserActivityType3StateDailyCountLogEvent)initWithTotalManualScheduleUpdateCount:(unint64_t)a3 totalAutomaticScheduleStateUpdateCount:(unint64_t)a4 totalManualFocusUpdateCount:(unint64_t)a5 enterType5ByManualScheduleUpdateCount:(unint64_t)a6 enterType5ByAutomaticScheduleStateUpdateCount:(unint64_t)a7 enterType5ByManualFocusUpdateCount:(unint64_t)a8 enterTransitionByManualScheduleUpdateCount:(unint64_t)a9 enterTransitionByAutomaticScheduleStateUpdateCount:(unint64_t)a10 enterTransitionByManualFocusUpdateCount:(unint64_t)a11
{
  HMDUserActivityType3StateDailyCountLogEvent *result;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HMDUserActivityType3StateDailyCountLogEvent;
  result = -[HMMLogEvent init](&v18, sel_init);
  if (result)
  {
    result->_totalManualScheduleUpdateCount = a3;
    result->_totalAutomaticScheduleStateUpdateCount = a4;
    result->_totalManualFocusUpdateCount = a5;
    result->_enterType5ByManualScheduleUpdateCount = a6;
    result->_enterType5ByAutomaticScheduleStateUpdateCount = a7;
    result->_enterType5ByManualFocusUpdateCount = a8;
    result->_enterTransitionByManualScheduleUpdateCount = a9;
    result->_enterTransitionByAutomaticScheduleStateUpdateCount = a10;
    result->_enterTransitionByManualFocusUpdateCount = a11;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homed.HomeAS.HMDUserActivityType3StateDailyCountLogEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[9];
  _QWORD v15[11];

  v15[9] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent totalManualScheduleUpdateCount](self, "totalManualScheduleUpdateCount", CFSTR("totalManualScheduleUpdateCount")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("totalAutomaticScheduleStateUpdateCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent totalAutomaticScheduleStateUpdateCount](self, "totalAutomaticScheduleStateUpdateCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("totalManualFocusUpdateCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent totalManualFocusUpdateCount](self, "totalManualFocusUpdateCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v5;
  v14[3] = CFSTR("enterType5ByManualScheduleUpdateCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent enterType5ByManualScheduleUpdateCount](self, "enterType5ByManualScheduleUpdateCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v6;
  v14[4] = CFSTR("enterType5ByAutomaticScheduleStateUpdateCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent enterType5ByAutomaticScheduleStateUpdateCount](self, "enterType5ByAutomaticScheduleStateUpdateCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v7;
  v14[5] = CFSTR("enterType5ByManualFocusUpdateCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent enterType5ByManualFocusUpdateCount](self, "enterType5ByManualFocusUpdateCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v8;
  v14[6] = CFSTR("enterTransitionByManualScheduleUpdateCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent enterTransitionByManualScheduleUpdateCount](self, "enterTransitionByManualScheduleUpdateCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v9;
  v14[7] = CFSTR("enterTransitionByAutomaticScheduleStateUpdateCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent enterTransitionByAutomaticScheduleStateUpdateCount](self, "enterTransitionByAutomaticScheduleStateUpdateCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v10;
  v14[8] = CFSTR("enterTransitionByManualFocusUpdateCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent enterTransitionByManualFocusUpdateCount](self, "enterTransitionByManualFocusUpdateCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (unint64_t)totalManualScheduleUpdateCount
{
  return self->_totalManualScheduleUpdateCount;
}

- (unint64_t)totalAutomaticScheduleStateUpdateCount
{
  return self->_totalAutomaticScheduleStateUpdateCount;
}

- (unint64_t)totalManualFocusUpdateCount
{
  return self->_totalManualFocusUpdateCount;
}

- (unint64_t)enterType5ByManualScheduleUpdateCount
{
  return self->_enterType5ByManualScheduleUpdateCount;
}

- (unint64_t)enterType5ByAutomaticScheduleStateUpdateCount
{
  return self->_enterType5ByAutomaticScheduleStateUpdateCount;
}

- (unint64_t)enterType5ByManualFocusUpdateCount
{
  return self->_enterType5ByManualFocusUpdateCount;
}

- (unint64_t)enterTransitionByManualScheduleUpdateCount
{
  return self->_enterTransitionByManualScheduleUpdateCount;
}

- (unint64_t)enterTransitionByAutomaticScheduleStateUpdateCount
{
  return self->_enterTransitionByAutomaticScheduleStateUpdateCount;
}

- (unint64_t)enterTransitionByManualFocusUpdateCount
{
  return self->_enterTransitionByManualFocusUpdateCount;
}

@end
