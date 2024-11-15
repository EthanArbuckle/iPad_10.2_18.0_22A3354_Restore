@implementation NNMKMessageContentResult

- (NNMKProtoMessageContentSync)protoMessageContentSync
{
  return self->_protoMessageContentSync;
}

- (void)setProtoMessageContentSync:(id)a3
{
  objc_storeStrong((id *)&self->_protoMessageContentSync, a3);
}

- (unint64_t)resendInterval
{
  return self->_resendInterval;
}

- (void)setResendInterval:(unint64_t)a3
{
  self->_resendInterval = a3;
}

- (int64_t)compressedTextDataLength
{
  return self->_compressedTextDataLength;
}

- (void)setCompressedTextDataLength:(int64_t)a3
{
  self->_compressedTextDataLength = a3;
}

- (BOOL)isContentCompletelySynced
{
  return self->_isContentCompletelySynced;
}

- (void)setIsContentCompletelySynced:(BOOL)a3
{
  self->_isContentCompletelySynced = a3;
}

- (BOOL)isNotificationPriority
{
  return self->_isNotificationPriority;
}

- (void)setIsNotificationPriority:(BOOL)a3
{
  self->_isNotificationPriority = a3;
}

- (BOOL)isUserRequest
{
  return self->_isUserRequest;
}

- (void)setIsUserRequest:(BOOL)a3
{
  self->_isUserRequest = a3;
}

- (BOOL)alreadySyncedWithCurrentPriority
{
  return self->_alreadySyncedWithCurrentPriority;
}

- (void)setAlreadySyncedWithCurrentPriority:(BOOL)a3
{
  self->_alreadySyncedWithCurrentPriority = a3;
}

- (BOOL)messageDoesNotExist
{
  return self->_messageDoesNotExist;
}

- (void)setMessageDoesNotExist:(BOOL)a3
{
  self->_messageDoesNotExist = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoMessageContentSync, 0);
}

@end
