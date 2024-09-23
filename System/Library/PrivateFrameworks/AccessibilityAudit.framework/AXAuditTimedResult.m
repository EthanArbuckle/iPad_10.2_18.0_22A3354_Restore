@implementation AXAuditTimedResult

- (NSString)executionTimeString
{
  void *v3;
  void *v4;
  void *v5;

  -[AXAuditTimedResult endTime](self, "endTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditTimedResult startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axAuditLogStringForDifferenceFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
