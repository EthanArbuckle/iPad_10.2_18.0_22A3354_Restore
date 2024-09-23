@implementation HMDAnalyticsEventTriggerExecutionSessionData

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (int)executionState
{
  return self->_executionState;
}

- (void)setExecutionState:(int)a3
{
  self->_executionState = a3;
}

- (int)resultErrorCode
{
  return self->_resultErrorCode;
}

- (void)setResultErrorCode:(int)a3
{
  self->_resultErrorCode = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)triggerEvents
{
  return self->_triggerEvents;
}

- (void)setTriggerEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)endEvents
{
  return self->_endEvents;
}

- (void)setEndEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEvents, 0);
  objc_storeStrong((id *)&self->_triggerEvents, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
