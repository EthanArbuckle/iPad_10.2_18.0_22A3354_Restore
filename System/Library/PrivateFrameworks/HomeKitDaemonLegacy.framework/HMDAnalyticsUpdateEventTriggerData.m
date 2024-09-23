@implementation HMDAnalyticsUpdateEventTriggerData

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
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

- (int)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(int)a3
{
  self->_updateType = a3;
}

@end
