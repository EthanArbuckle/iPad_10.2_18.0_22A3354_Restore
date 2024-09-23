@implementation BRCEventMetric

- (BRCEventMetric)initWithEventName:(id)a3
{
  id v5;
  BRCEventMetric *v6;
  BRCEventMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCEventMetric;
  v6 = -[BRCEventMetric init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventName, a3);
    v7->_isCKMetric = 1;
  }

  return v7;
}

- (id)description
{
  void *v3;
  NSString *eventName;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  eventName = self->_eventName;
  -[BRCEventMetric duration](self, "duration");
  v6 = v5;
  -[BRCEventMetric subDescription](self, "subDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ t:%.2fs%@>"), eventName, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)duration
{
  NSDate *endTime;
  double result;
  void *v5;
  double v6;
  double v7;

  endTime = self->_endTime;
  if (endTime)
  {
    -[NSDate timeIntervalSinceDate:](endTime, "timeIntervalSinceDate:", self->_startTime);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", self->_startTime);
    v7 = v6;

    return v7;
  }
  return result;
}

- (id)subDescription
{
  return &stru_1E8769030;
}

- (id)additionalPayload
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)associatedAppTelemetryEvent
{
  return 0;
}

- (void)associateWithCompletedOperation:(id)a3
{
  id v4;
  CKEventMetric *associatedCKEventMetricIfAvailable;
  CKEventMetric *v6;
  CKEventMetric *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  BRCEventMetric *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isCKMetric)
  {
    associatedCKEventMetricIfAvailable = self->_associatedCKEventMetricIfAvailable;
    if (!associatedCKEventMetricIfAvailable)
    {
      v6 = (CKEventMetric *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94D88]), "initWithEventName:", self->_eventName);
      v7 = self->_associatedCKEventMetricIfAvailable;
      self->_associatedCKEventMetricIfAvailable = v6;

      associatedCKEventMetricIfAvailable = self->_associatedCKEventMetricIfAvailable;
    }
    -[CKEventMetric associateWithCompletedOperation:](associatedCKEventMetricIfAvailable, "associateWithCompletedOperation:", v4);
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412802;
      v11 = objc_opt_class();
      v12 = 2112;
      v13 = self;
      v14 = 2112;
      v15 = v8;
      _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] associated %@ to event metric %@%@", (uint8_t *)&v10, 0x20u);
    }

  }
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (BOOL)isCKMetric
{
  return self->_isCKMetric;
}

- (void)setIsCKMetric:(BOOL)a3
{
  self->_isCKMetric = a3;
}

- (CKEventMetric)associatedCKEventMetricIfAvailable
{
  return self->_associatedCKEventMetricIfAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedCKEventMetricIfAvailable, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
