@implementation HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)userResponseDelay
{
  return self->_userResponseDelay;
}

- (void)setUserResponseDelay:(unint64_t)a3
{
  self->_userResponseDelay = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
