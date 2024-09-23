@implementation MTRDeviceStorageBehaviorConfiguration

+ (MTRDeviceStorageBehaviorConfiguration)configurationWithReportToPersistenceDelayTime:(double)a3 reportToPersistenceDelayTimeMax:(double)a4 recentReportTimesMaxCount:(unint64_t)a5 timeBetweenReportsTooShortThreshold:(double)a6 timeBetweenReportsTooShortMinThreshold:(double)a7 reportToPersistenceDelayMaxMultiplier:(double)a8 deviceReportingExcessivelyIntervalThreshold:(double)a9
{
  MTRDeviceStorageBehaviorConfiguration *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;

  v16 = objc_alloc_init(MTRDeviceStorageBehaviorConfiguration);
  objc_msgSend_setReportToPersistenceDelayTime_(v16, v17, v18, a3);
  objc_msgSend_setReportToPersistenceDelayTimeMax_(v16, v19, v20, a4);
  objc_msgSend_setRecentReportTimesMaxCount_(v16, v21, a5);
  objc_msgSend_setTimeBetweenReportsTooShortThreshold_(v16, v22, v23, a6);
  objc_msgSend_setTimeBetweenReportsTooShortMinThreshold_(v16, v24, v25, a7);
  objc_msgSend_setReportToPersistenceDelayMaxMultiplier_(v16, v26, v27, a8);
  objc_msgSend_setDeviceReportingExcessivelyIntervalThreshold_(v16, v28, v29, a9);
  return v16;
}

+ (MTRDeviceStorageBehaviorConfiguration)configurationWithDefaultStorageBehavior
{
  MTRDeviceStorageBehaviorConfiguration *v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc_init(MTRDeviceStorageBehaviorConfiguration);
  objc_msgSend_checkValuesAndResetToDefaultIfNecessary(v2, v3, v4);
  return v2;
}

+ (MTRDeviceStorageBehaviorConfiguration)configurationWithStorageBehaviorOptimizationDisabled
{
  MTRDeviceStorageBehaviorConfiguration *v2;
  const char *v3;

  v2 = objc_alloc_init(MTRDeviceStorageBehaviorConfiguration);
  objc_msgSend_setDisableStorageBehaviorOptimization_(v2, v3, 1);
  return v2;
}

- (id)description
{
  if (self->_disableStorageBehaviorOptimization)
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("<MTRDeviceStorageBehaviorConfiguration(%p): disabled %s reportToPersistenceDelayTime %lf reportToPersistenceDelayTimeMax %lf recentReportTimesMaxCount %lu timeBetweenReportsTooShortThreshold %lf timeBetweenReportsTooShortMinThreshold %lf reportToPersistenceDelayMaxMultiplier %lf deviceReportingExcessivelyIntervalThreshold %lf"), self, "YES", *(_QWORD *)&self->_reportToPersistenceDelayTime, *(_QWORD *)&self->_reportToPersistenceDelayTimeMax, self->_recentReportTimesMaxCount, *(_QWORD *)&self->_timeBetweenReportsTooShortThreshold, *(_QWORD *)&self->_timeBetweenReportsTooShortMinThreshold, *(_QWORD *)&self->_reportToPersistenceDelayMaxMultiplier, *(_QWORD *)&self->_deviceReportingExcessivelyIntervalThreshold);
  else
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("<MTRDeviceStorageBehaviorConfiguration(%p): disabled %s reportToPersistenceDelayTime %lf reportToPersistenceDelayTimeMax %lf recentReportTimesMaxCount %lu timeBetweenReportsTooShortThreshold %lf timeBetweenReportsTooShortMinThreshold %lf reportToPersistenceDelayMaxMultiplier %lf deviceReportingExcessivelyIntervalThreshold %lf"), self, "NO", *(_QWORD *)&self->_reportToPersistenceDelayTime, *(_QWORD *)&self->_reportToPersistenceDelayTimeMax, self->_recentReportTimesMaxCount, *(_QWORD *)&self->_timeBetweenReportsTooShortThreshold, *(_QWORD *)&self->_timeBetweenReportsTooShortMinThreshold, *(_QWORD *)&self->_reportToPersistenceDelayMaxMultiplier, *(_QWORD *)&self->_deviceReportingExcessivelyIntervalThreshold);
}

- (void)checkValuesAndResetToDefaultIfNecessary
{
  double reportToPersistenceDelayTime;
  double reportToPersistenceDelayTimeMax;
  BOOL v5;
  double timeBetweenReportsTooShortThreshold;
  double timeBetweenReportsTooShortMinThreshold;
  BOOL v8;
  NSObject *v9;
  uint8_t buf[4];
  MTRDeviceStorageBehaviorConfiguration *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!self->_disableStorageBehaviorOptimization)
  {
    reportToPersistenceDelayTime = self->_reportToPersistenceDelayTime;
    if (reportToPersistenceDelayTime <= 0.0
      || ((reportToPersistenceDelayTimeMax = self->_reportToPersistenceDelayTimeMax,
           reportToPersistenceDelayTimeMax > 0.0)
        ? (v5 = reportToPersistenceDelayTimeMax < reportToPersistenceDelayTime)
        : (v5 = 1),
          v5
       || self->_recentReportTimesMaxCount < 2
       || (timeBetweenReportsTooShortThreshold = self->_timeBetweenReportsTooShortThreshold,
           timeBetweenReportsTooShortThreshold <= 0.0)
       || ((timeBetweenReportsTooShortMinThreshold = self->_timeBetweenReportsTooShortMinThreshold,
            timeBetweenReportsTooShortMinThreshold > 0.0)
         ? (v8 = timeBetweenReportsTooShortMinThreshold <= timeBetweenReportsTooShortThreshold)
         : (v8 = 0),
           !v8
        || self->_reportToPersistenceDelayMaxMultiplier <= 1.0
        || self->_deviceReportingExcessivelyIntervalThreshold <= 0.0)))
    {
      sub_234117B80(0, "NotSpecified");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = self;
        _os_log_impl(&dword_233BF3000, v9, OS_LOG_TYPE_DEFAULT, "%@ storage behavior: MTRDeviceStorageBehaviorConfiguration values out of bounds - resetting to default", buf, 0xCu);
      }

      if (sub_234114844(2u))
        sub_2341147D0(0, 2);
      *(_OWORD *)&self->_reportToPersistenceDelayTime = xmmword_2342D8A60;
      self->_recentReportTimesMaxCount = 12;
      *(_OWORD *)&self->_timeBetweenReportsTooShortThreshold = xmmword_2342D8A70;
      *(_OWORD *)&self->_reportToPersistenceDelayMaxMultiplier = xmmword_2342D8A80;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDeviceStorageBehaviorConfiguration *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v4 = objc_alloc_init(MTRDeviceStorageBehaviorConfiguration);
  objc_msgSend_setDisableStorageBehaviorOptimization_(v4, v5, self->_disableStorageBehaviorOptimization);
  objc_msgSend_setReportToPersistenceDelayTime_(v4, v6, v7, self->_reportToPersistenceDelayTime);
  objc_msgSend_setReportToPersistenceDelayTimeMax_(v4, v8, v9, self->_reportToPersistenceDelayTimeMax);
  objc_msgSend_setRecentReportTimesMaxCount_(v4, v10, self->_recentReportTimesMaxCount);
  objc_msgSend_setTimeBetweenReportsTooShortThreshold_(v4, v11, v12, self->_timeBetweenReportsTooShortThreshold);
  objc_msgSend_setTimeBetweenReportsTooShortMinThreshold_(v4, v13, v14, self->_timeBetweenReportsTooShortMinThreshold);
  objc_msgSend_setReportToPersistenceDelayMaxMultiplier_(v4, v15, v16, self->_reportToPersistenceDelayMaxMultiplier);
  objc_msgSend_setDeviceReportingExcessivelyIntervalThreshold_(v4, v17, v18, self->_deviceReportingExcessivelyIntervalThreshold);
  return v4;
}

- (BOOL)disableStorageBehaviorOptimization
{
  return self->_disableStorageBehaviorOptimization;
}

- (void)setDisableStorageBehaviorOptimization:(BOOL)a3
{
  self->_disableStorageBehaviorOptimization = a3;
}

- (double)reportToPersistenceDelayTime
{
  return self->_reportToPersistenceDelayTime;
}

- (void)setReportToPersistenceDelayTime:(double)a3
{
  self->_reportToPersistenceDelayTime = a3;
}

- (double)reportToPersistenceDelayTimeMax
{
  return self->_reportToPersistenceDelayTimeMax;
}

- (void)setReportToPersistenceDelayTimeMax:(double)a3
{
  self->_reportToPersistenceDelayTimeMax = a3;
}

- (unint64_t)recentReportTimesMaxCount
{
  return self->_recentReportTimesMaxCount;
}

- (void)setRecentReportTimesMaxCount:(unint64_t)a3
{
  self->_recentReportTimesMaxCount = a3;
}

- (double)timeBetweenReportsTooShortThreshold
{
  return self->_timeBetweenReportsTooShortThreshold;
}

- (void)setTimeBetweenReportsTooShortThreshold:(double)a3
{
  self->_timeBetweenReportsTooShortThreshold = a3;
}

- (double)timeBetweenReportsTooShortMinThreshold
{
  return self->_timeBetweenReportsTooShortMinThreshold;
}

- (void)setTimeBetweenReportsTooShortMinThreshold:(double)a3
{
  self->_timeBetweenReportsTooShortMinThreshold = a3;
}

- (double)reportToPersistenceDelayMaxMultiplier
{
  return self->_reportToPersistenceDelayMaxMultiplier;
}

- (void)setReportToPersistenceDelayMaxMultiplier:(double)a3
{
  self->_reportToPersistenceDelayMaxMultiplier = a3;
}

- (double)deviceReportingExcessivelyIntervalThreshold
{
  return self->_deviceReportingExcessivelyIntervalThreshold;
}

- (void)setDeviceReportingExcessivelyIntervalThreshold:(double)a3
{
  self->_deviceReportingExcessivelyIntervalThreshold = a3;
}

@end
