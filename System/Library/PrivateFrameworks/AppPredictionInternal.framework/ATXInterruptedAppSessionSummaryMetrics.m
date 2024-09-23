@implementation ATXInterruptedAppSessionSummaryMetrics

- (id)metricName
{
  return CFSTR("com.apple.ModeActivity.InterruptedAppSessions.summary");
}

- (ATXInterruptedAppSessionSummaryMetrics)initWithDimensions:(id)a3
{
  ATXInterruptedAppSessionSummaryMetrics *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ATXInterruptedAppSessionSummaryMetrics;
  result = -[_ATXCoreAnalyticsMetric initWithDimensions:](&v4, sel_initWithDimensions_, a3);
  if (result)
  {
    result->_totalAppSessions = 0;
    result->_interruptedAppSessions = 0;
  }
  return result;
}

- (double)percentageInterruptedAppSessions
{
  unint64_t totalAppSessions;

  totalAppSessions = self->_totalAppSessions;
  if (totalAppSessions)
    return (double)self->_interruptedAppSessions / (double)totalAppSessions;
  else
    return 0.0;
}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("totalAppSessions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXInterruptedAppSessionSummaryMetrics totalAppSessions](self, "totalAppSessions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("interruptedAppSessions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXInterruptedAppSessionSummaryMetrics interruptedAppSessions](self, "interruptedAppSessions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("pctInterruptedAppSessions");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXInterruptedAppSessionSummaryMetrics percentageInterruptedAppSessions](self, "percentageInterruptedAppSessions");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)totalAppSessions
{
  return self->_totalAppSessions;
}

- (void)setTotalAppSessions:(unint64_t)a3
{
  self->_totalAppSessions = a3;
}

- (unint64_t)interruptedAppSessions
{
  return self->_interruptedAppSessions;
}

- (void)setInterruptedAppSessions:(unint64_t)a3
{
  self->_interruptedAppSessions = a3;
}

@end
