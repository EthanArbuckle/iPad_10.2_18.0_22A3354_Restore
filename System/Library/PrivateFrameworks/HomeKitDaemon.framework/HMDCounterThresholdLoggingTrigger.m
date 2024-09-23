@implementation HMDCounterThresholdLoggingTrigger

- (int64_t)threshold
{
  return self->_threshold;
}

- (HMDCounterThresholdLoggingTrigger)initWithThreshold:(int64_t)a3 counterName:(id)a4 ewsLogger:(id)a5
{
  return -[HMDCounterThresholdLoggingTrigger initWithThreshold:counterName:uploadImmediately:ewsLogger:](self, "initWithThreshold:counterName:uploadImmediately:ewsLogger:", a3, a4, 0, a5);
}

- (HMDCounterThresholdLoggingTrigger)initWithThreshold:(int64_t)a3 counterName:(id)a4 uploadImmediately:(BOOL)a5 ewsLogger:(id)a6
{
  id v11;
  id v12;
  HMDCounterThresholdLoggingTrigger *v13;
  HMDCounterThresholdLoggingTrigger *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HMDCounterThresholdLoggingTrigger;
  v13 = -[HMDCounterThresholdLoggingTrigger init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_threshold = a3;
    objc_storeStrong((id *)&v13->_counterName, a4);
    v14->_uploadImmediately = a5;
    objc_storeStrong((id *)&v14->_ewsLogger, a6);
  }

  return v14;
}

- (void)updatedCounter:(id)a3 fromOldValue:(int64_t)a4 toNewValue:(int64_t)a5
{
  if (-[HMDCounterThresholdLoggingTrigger threshold](self, "threshold", a3) <= a5
    && -[HMDCounterThresholdLoggingTrigger threshold](self, "threshold") > a4)
  {
    -[HMDCounterThresholdLoggingTrigger logThresholdTrigger:triggerValue:](self, "logThresholdTrigger:triggerValue:", CFSTR("Trigger threshold met"), a5);
  }
  if (!a5 && -[HMDCounterThresholdLoggingTrigger threshold](self, "threshold") <= a4)
    -[HMDCounterThresholdLoggingTrigger logThresholdTrigger:triggerValue:](self, "logThresholdTrigger:triggerValue:", CFSTR("Max value above threshold"), a4);
}

- (void)logThresholdTrigger:(id)a3 triggerValue:(unint64_t)a4
{
  id v6;
  void *v7;
  HMDCounterThresholdLoggingTrigger *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCounterThresholdLoggingTrigger counterName](v8, "counterName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = v10;
    v21 = 2114;
    v22 = v6;
    v23 = 2114;
    v24 = v11;
    v25 = 2048;
    v26 = a4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@EWS threshold trigger: trigger=%{public}@, counter=%{public}@, value=%lu", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDCounterThresholdLoggingTrigger ewsLogger](v8, "ewsLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDCounterThresholdLoggingTrigger uploadImmediately](v8, "uploadImmediately");
  -[HMDCounterThresholdLoggingTrigger counterName](v8, "counterName", CFSTR("counter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("value");
  v18[0] = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitEventWithName:serviceName:uploadImmediately:payload:", v6, CFSTR("Counter Trigger"), v13, v16);

}

- (NSString)counterName
{
  return self->_counterName;
}

- (BOOL)uploadImmediately
{
  return self->_uploadImmediately;
}

- (HMDEWSLogging)ewsLogger
{
  return self->_ewsLogger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ewsLogger, 0);
  objc_storeStrong((id *)&self->_counterName, 0);
}

@end
