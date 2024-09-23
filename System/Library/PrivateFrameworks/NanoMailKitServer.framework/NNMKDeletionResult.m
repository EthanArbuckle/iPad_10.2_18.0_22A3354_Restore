@implementation NNMKDeletionResult

- (NNMKProtoMessageDeletions)protectedProtobuf
{
  return self->_protectedProtobuf;
}

- (void)setProtectedProtobuf:(id)a3
{
  objc_storeStrong((id *)&self->_protectedProtobuf, a3);
}

- (NNMKProtoMessageDeletions)unprotectedNotificationProtobuf
{
  return self->_unprotectedNotificationProtobuf;
}

- (void)setUnprotectedNotificationProtobuf:(id)a3
{
  objc_storeStrong((id *)&self->_unprotectedNotificationProtobuf, a3);
}

- (NNMKProtoMessageDeletions)unprotectedDefaultProtobuf
{
  return self->_unprotectedDefaultProtobuf;
}

- (void)setUnprotectedDefaultProtobuf:(id)a3
{
  objc_storeStrong((id *)&self->_unprotectedDefaultProtobuf, a3);
}

- (NSArray)protectedMessageIds
{
  return self->_protectedMessageIds;
}

- (void)setProtectedMessageIds:(id)a3
{
  objc_storeStrong((id *)&self->_protectedMessageIds, a3);
}

- (NSArray)unprotectedNotificationMessageIds
{
  return self->_unprotectedNotificationMessageIds;
}

- (void)setUnprotectedNotificationMessageIds:(id)a3
{
  objc_storeStrong((id *)&self->_unprotectedNotificationMessageIds, a3);
}

- (NSArray)unprotectedDefaultMessageIds
{
  return self->_unprotectedDefaultMessageIds;
}

- (void)setUnprotectedDefaultMessageIds:(id)a3
{
  objc_storeStrong((id *)&self->_unprotectedDefaultMessageIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unprotectedDefaultMessageIds, 0);
  objc_storeStrong((id *)&self->_unprotectedNotificationMessageIds, 0);
  objc_storeStrong((id *)&self->_protectedMessageIds, 0);
  objc_storeStrong((id *)&self->_unprotectedDefaultProtobuf, 0);
  objc_storeStrong((id *)&self->_unprotectedNotificationProtobuf, 0);
  objc_storeStrong((id *)&self->_protectedProtobuf, 0);
}

@end
