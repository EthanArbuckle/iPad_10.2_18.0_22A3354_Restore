@implementation HMDAnalyticsAddEventTriggerData

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (HMDAnalyticsEventTriggerData)eventTrigger
{
  return self->_eventTrigger;
}

- (void)setEventTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_eventTrigger, a3);
}

- (int)requestOrigin
{
  return self->_requestOrigin;
}

- (void)setRequestOrigin:(int)a3
{
  self->_requestOrigin = a3;
}

- (unsigned)resultErrorCode
{
  return self->_resultErrorCode;
}

- (void)setResultErrorCode:(unsigned int)a3
{
  self->_resultErrorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTrigger, 0);
}

@end
