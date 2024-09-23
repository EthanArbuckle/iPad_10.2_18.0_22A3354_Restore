@implementation SPRemoteInterfaceOpenParentRequest

- (BOOL)waitingForReply
{
  return self->_waitingForReply;
}

- (void)setWaitingForReply:(BOOL)a3
{
  self->_waitingForReply = a3;
}

- (NSData)userInfoData
{
  return self->_userInfoData;
}

- (void)setUserInfoData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reply, 0);
  objc_storeStrong((id *)&self->_userInfoData, 0);
}

@end
