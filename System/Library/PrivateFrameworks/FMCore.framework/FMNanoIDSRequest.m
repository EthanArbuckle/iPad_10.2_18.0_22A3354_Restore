@implementation FMNanoIDSRequest

- (NSString)idsMessageID
{
  return self->_idsMessageID;
}

- (void)setIdsMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_idsMessageID, a3);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (FMDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_idsMessageID, 0);
}

@end
