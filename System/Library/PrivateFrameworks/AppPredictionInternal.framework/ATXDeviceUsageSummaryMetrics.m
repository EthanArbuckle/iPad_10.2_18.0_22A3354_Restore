@implementation ATXDeviceUsageSummaryMetrics

- (id)metricName
{
  return CFSTR("com.apple.ModeActivity.DeviceUsage.summary");
}

- (ATXDeviceUsageSummaryMetrics)initWithDimensions:(id)a3
{
  ATXDeviceUsageSummaryMetrics *v3;
  ATXDeviceUsageSummaryMetrics *v4;
  NSDate *lastEntryTime;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXDeviceUsageSummaryMetrics;
  v3 = -[_ATXCoreAnalyticsMetric initWithDimensions:](&v7, sel_initWithDimensions_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_devicePickupCount = 0;
    v3->_totalDeviceOnTime = 0.0;
    v3->_totalTime = 0.0;
    lastEntryTime = v3->_lastEntryTime;
    v3->_lastEntryTime = 0;

  }
  return v4;
}

- (double)averagePickupDuration
{
  unint64_t devicePickupCount;

  devicePickupCount = self->_devicePickupCount;
  if (devicePickupCount)
    return self->_totalDeviceOnTime / (double)devicePickupCount;
  else
    return 0.0;
}

- (void)handleConfigurationEntry:(id)a3
{
  objc_storeStrong((id *)&self->_lastEntryTime, a3);
}

- (void)handleConfigurationExit:(id)a3
{
  NSDate *lastEntryTime;
  double v5;
  NSDate *v6;
  NSObject *v7;

  lastEntryTime = self->_lastEntryTime;
  if (lastEntryTime)
  {
    objc_msgSend(a3, "timeIntervalSinceDate:", lastEntryTime);
    self->_totalTime = v5 + self->_totalTime;
    v6 = self->_lastEntryTime;
    self->_lastEntryTime = 0;

  }
  else
  {
    __atxlog_handle_metrics();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXDeviceUsageSummaryMetrics handleConfigurationExit:].cold.1(v7);

  }
}

- (void)handleOnInterval:(id)a3
{
  double v4;
  id v5;

  ++self->_devicePickupCount;
  objc_msgSend(a3, "onInterval");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  self->_totalDeviceOnTime = v4 + self->_totalDeviceOnTime;

}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("devicePickupCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDeviceUsageSummaryMetrics devicePickupCount](self, "devicePickupCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("averagePickupDuration");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXDeviceUsageSummaryMetrics averagePickupDuration](self, "averagePickupDuration");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("totalTime");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXDeviceUsageSummaryMetrics totalTime](self, "totalTime");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = CFSTR("totalDeviceOnTime");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXDeviceUsageSummaryMetrics totalDeviceOnTime](self, "totalDeviceOnTime");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)devicePickupCount
{
  return self->_devicePickupCount;
}

- (double)totalDeviceOnTime
{
  return self->_totalDeviceOnTime;
}

- (double)totalTime
{
  return self->_totalTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEntryTime, 0);
}

- (void)handleConfigurationExit:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Unexpectedly received exit event prior to entry", v1, 2u);
}

@end
