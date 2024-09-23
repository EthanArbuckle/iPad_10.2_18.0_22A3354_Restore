@implementation CATIDSServiceConnectionConfiguration

- (CATIDSServiceConnectionConfiguration)init
{
  CATIDSServiceConnectionConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CATIDSServiceConnectionConfiguration;
  result = -[CATIDSServiceConnectionConfiguration init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_maxDataSendSize = xmmword_2095E2730;
    *(_OWORD *)&result->_keepAliveCheckinInterval = xmmword_2095E2740;
    *(_OWORD *)&result->_missingItemsCheckinInterval = xmmword_2095E2750;
  }
  return result;
}

- (int64_t)maxDataSendSize
{
  return self->_maxDataSendSize;
}

- (void)setMaxDataSendSize:(int64_t)a3
{
  self->_maxDataSendSize = a3;
}

- (unint64_t)keepAliveAttemptCount
{
  return self->_keepAliveAttemptCount;
}

- (void)setKeepAliveAttemptCount:(unint64_t)a3
{
  self->_keepAliveAttemptCount = a3;
}

- (double)keepAliveCheckinInterval
{
  return self->_keepAliveCheckinInterval;
}

- (void)setKeepAliveCheckinInterval:(double)a3
{
  self->_keepAliveCheckinInterval = a3;
}

- (double)invitationAcknowledgeTimeout
{
  return self->_invitationAcknowledgeTimeout;
}

- (void)setInvitationAcknowledgeTimeout:(double)a3
{
  self->_invitationAcknowledgeTimeout = a3;
}

- (double)missingItemsCheckinInterval
{
  return self->_missingItemsCheckinInterval;
}

- (void)setMissingItemsCheckinInterval:(double)a3
{
  self->_missingItemsCheckinInterval = a3;
}

- (double)messageQueueFlushPromptInterval
{
  return self->_messageQueueFlushPromptInterval;
}

- (void)setMessageQueueFlushPromptInterval:(double)a3
{
  self->_messageQueueFlushPromptInterval = a3;
}

@end
