@implementation HMDCounterRateLoggingTrigger

- (unint64_t)windowCount
{
  return self->_windowCount;
}

- (HMDCounterRateLoggingTrigger)initWithThreshold:(int64_t)a3 windowSize:(int64_t)a4 counterName:(id)a5 ewsLogger:(id)a6
{
  return -[HMDCounterRateLoggingTrigger initWithThreshold:windowSize:counterName:uploadImmediately:ewsLogger:](self, "initWithThreshold:windowSize:counterName:uploadImmediately:ewsLogger:", a3, a4, a5, 0, a6);
}

- (HMDCounterRateLoggingTrigger)initWithThreshold:(int64_t)a3 windowSize:(int64_t)a4 counterName:(id)a5 uploadImmediately:(BOOL)a6 ewsLogger:(id)a7
{
  return -[HMDCounterRateLoggingTrigger initWithThreshold:windowSize:counterName:uploadImmediately:ewsLogger:timeSourceBlock:](self, "initWithThreshold:windowSize:counterName:uploadImmediately:ewsLogger:timeSourceBlock:", a3, a4, a5, a6, a7, &__block_literal_global_31285);
}

- (HMDCounterRateLoggingTrigger)initWithThreshold:(int64_t)a3 windowSize:(int64_t)a4 counterName:(id)a5 uploadImmediately:(BOOL)a6 ewsLogger:(id)a7 timeSourceBlock:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMDCounterRateLoggingTrigger *v18;
  HMDCounterRateLoggingTrigger *v19;
  void *v20;
  id timeSourceBlock;
  objc_super v23;

  v15 = a5;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDCounterRateLoggingTrigger;
  v18 = -[HMDCounterRateLoggingTrigger init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_windowSize = a4;
    v18->_windowThreshold = a3;
    v18->_intervalSize = a4 / 10;
    v18->_intervalCounts = (unint64_t *)malloc_type_malloc(0x50uLL, 0x100004000313F17uLL);
    objc_storeStrong((id *)&v19->_counterName, a5);
    v19->_uploadImmediately = a6;
    objc_storeStrong((id *)&v19->_ewsLogger, a7);
    v20 = _Block_copy(v17);
    timeSourceBlock = v19->_timeSourceBlock;
    v19->_timeSourceBlock = v20;

  }
  return v19;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_intervalCounts);
  v3.receiver = self;
  v3.super_class = (Class)HMDCounterRateLoggingTrigger;
  -[HMDCounterRateLoggingTrigger dealloc](&v3, sel_dealloc);
}

- (void)updatedCounter:(id)a3 fromOldValue:(int64_t)a4 toNewValue:(int64_t)a5
{
  unint64_t v8;
  uint64_t (**v9)(void);
  unint64_t v10;
  unint64_t v11;
  uint64_t i;
  unint64_t *v13;
  int64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v8 = -[HMDCounterRateLoggingTrigger windowCount](self, "windowCount", a3);
  -[HMDCounterRateLoggingTrigger timeSourceBlock](self, "timeSourceBlock");
  v9 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v10 = v9[2]();
  v11 = v10 / -[HMDCounterRateLoggingTrigger intervalSize](self, "intervalSize");

  if (v11 - -[HMDCounterRateLoggingTrigger lastUpdatedInterval](self, "lastUpdatedInterval") < 0xA)
  {
    for (;
          -[HMDCounterRateLoggingTrigger lastUpdatedInterval](self, "lastUpdatedInterval") < v11;
          v13[-[HMDCounterRateLoggingTrigger lastUpdatedInterval](self, "lastUpdatedInterval") % 0xA] = 0)
    {
      -[HMDCounterRateLoggingTrigger setLastUpdatedInterval:](self, "setLastUpdatedInterval:", -[HMDCounterRateLoggingTrigger lastUpdatedInterval](self, "lastUpdatedInterval") + 1);
      -[HMDCounterRateLoggingTrigger setWindowCount:](self, "setWindowCount:", -[HMDCounterRateLoggingTrigger windowCount](self, "windowCount")- -[HMDCounterRateLoggingTrigger intervalCounts](self, "intervalCounts")[8* (-[HMDCounterRateLoggingTrigger lastUpdatedInterval](self, "lastUpdatedInterval")% 0xA)]);
      v13 = -[HMDCounterRateLoggingTrigger intervalCounts](self, "intervalCounts");
    }
  }
  else
  {
    for (i = 0; i != 80; i += 8)
      -[HMDCounterRateLoggingTrigger intervalCounts](self, "intervalCounts")[i] = 0;
    -[HMDCounterRateLoggingTrigger setLastUpdatedInterval:](self, "setLastUpdatedInterval:", v11);
    -[HMDCounterRateLoggingTrigger setWindowCount:](self, "setWindowCount:", 0);
  }
  if (a5)
  {
    v14 = a5 - a4;
    v15 = -[HMDCounterRateLoggingTrigger intervalCounts](self, "intervalCounts");
    v15[v11 % 0xA] += v14;
    -[HMDCounterRateLoggingTrigger setWindowCount:](self, "setWindowCount:", -[HMDCounterRateLoggingTrigger windowCount](self, "windowCount") + v14);
    v16 = -[HMDCounterRateLoggingTrigger windowCount](self, "windowCount");
    if (v16 > -[HMDCounterRateLoggingTrigger maxWindowCount](self, "maxWindowCount"))
      -[HMDCounterRateLoggingTrigger setMaxWindowCount:](self, "setMaxWindowCount:", -[HMDCounterRateLoggingTrigger windowCount](self, "windowCount"));
  }
  v17 = -[HMDCounterRateLoggingTrigger windowCount](self, "windowCount");
  if (v17 >= -[HMDCounterRateLoggingTrigger windowThreshold](self, "windowThreshold")
    && v8 < -[HMDCounterRateLoggingTrigger windowThreshold](self, "windowThreshold"))
  {
    -[HMDCounterRateLoggingTrigger logRateTrigger:triggerValue:](self, "logRateTrigger:triggerValue:", CFSTR("Rate threshold met"), -[HMDCounterRateLoggingTrigger windowCount](self, "windowCount"));
  }
  v18 = -[HMDCounterRateLoggingTrigger windowCount](self, "windowCount");
  if (v18 >= -[HMDCounterRateLoggingTrigger windowThreshold](self, "windowThreshold"))
  {
    if (a5)
      return;
    goto LABEL_18;
  }
  v19 = -[HMDCounterRateLoggingTrigger windowThreshold](self, "windowThreshold");
  if (!a5 || v8 >= v19)
  {
LABEL_18:
    v20 = -[HMDCounterRateLoggingTrigger maxWindowCount](self, "maxWindowCount");
    if (v20 >= -[HMDCounterRateLoggingTrigger windowThreshold](self, "windowThreshold"))
    {
      -[HMDCounterRateLoggingTrigger logRateTrigger:triggerValue:](self, "logRateTrigger:triggerValue:", CFSTR("Max rate above threshold"), -[HMDCounterRateLoggingTrigger maxWindowCount](self, "maxWindowCount"));
      -[HMDCounterRateLoggingTrigger setMaxWindowCount:](self, "setMaxWindowCount:", 0);
    }
  }
}

- (void)logRateTrigger:(id)a3 triggerValue:(unint64_t)a4
{
  id v6;
  void *v7;
  HMDCounterRateLoggingTrigger *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[3];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCounterRateLoggingTrigger counterName](v8, "counterName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v21 = v10;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = v11;
    v26 = 2048;
    v27 = a4;
    v28 = 2048;
    v29 = -[HMDCounterRateLoggingTrigger windowSize](v8, "windowSize");
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@EWS rate trigger: trigger=%{public}@, counter=%{public}@, value=%lu, windowSize=%lu", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDCounterRateLoggingTrigger ewsLogger](v8, "ewsLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDCounterRateLoggingTrigger uploadImmediately](v8, "uploadImmediately");
  -[HMDCounterRateLoggingTrigger counterName](v8, "counterName", CFSTR("counter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  v18[1] = CFSTR("value");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v15;
  v18[2] = CFSTR("windowSize");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDCounterRateLoggingTrigger windowSize](v8, "windowSize"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitEventWithName:serviceName:uploadImmediately:payload:", v6, CFSTR("Counter Trigger"), v13, v17);

}

- (int64_t)windowSize
{
  return self->_windowSize;
}

- (int64_t)windowThreshold
{
  return self->_windowThreshold;
}

- (NSString)counterName
{
  return self->_counterName;
}

- (BOOL)uploadImmediately
{
  return self->_uploadImmediately;
}

- (id)timeSourceBlock
{
  return self->_timeSourceBlock;
}

- (HMDEWSLogging)ewsLogger
{
  return self->_ewsLogger;
}

- (int64_t)intervalSize
{
  return self->_intervalSize;
}

- (unint64_t)intervalCounts
{
  return self->_intervalCounts;
}

- (void)setIntervalCounts:(unint64_t *)a3
{
  self->_intervalCounts = a3;
}

- (void)setWindowCount:(unint64_t)a3
{
  self->_windowCount = a3;
}

- (unint64_t)maxWindowCount
{
  return self->_maxWindowCount;
}

- (void)setMaxWindowCount:(unint64_t)a3
{
  self->_maxWindowCount = a3;
}

- (unint64_t)lastUpdatedInterval
{
  return self->_lastUpdatedInterval;
}

- (void)setLastUpdatedInterval:(unint64_t)a3
{
  self->_lastUpdatedInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ewsLogger, 0);
  objc_storeStrong(&self->_timeSourceBlock, 0);
  objc_storeStrong((id *)&self->_counterName, 0);
}

unint64_t __101__HMDCounterRateLoggingTrigger_initWithThreshold_windowSize_counterName_uploadImmediately_ewsLogger___block_invoke()
{
  void *v0;
  double v1;
  unint64_t v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = (unint64_t)v1;

  return v2;
}

@end
