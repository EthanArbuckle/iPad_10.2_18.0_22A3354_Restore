@implementation HMDHomePrimaryResidentMessagingHandlerPendingMessageContext

- (HMDHomePrimaryResidentMessagingHandlerPendingMessageContext)initWithMessage:(id)a3 messageTimerContext:(id)a4
{
  id v7;
  id v8;
  HMDHomePrimaryResidentMessagingHandlerPendingMessageContext *v9;
  HMDHomePrimaryResidentMessagingHandlerPendingMessageContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomePrimaryResidentMessagingHandlerPendingMessageContext;
  v9 = -[HMDHomePrimaryResidentMessagingHandlerPendingMessageContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    objc_storeStrong((id *)&v10->_messageTimerContext, a4);
  }

  return v10;
}

- (HMFMessage)message
{
  return self->_message;
}

- (HMFTimerManagerTimerContext)messageTimerContext
{
  return self->_messageTimerContext;
}

- (HMFTimerManagerTimerContext)queueTimerContext
{
  return self->_queueTimerContext;
}

- (void)setQueueTimerContext:(id)a3
{
  objc_storeStrong((id *)&self->_queueTimerContext, a3);
}

- (NSUUID)lastPrimaryResidentDestinationUUID
{
  return self->_lastPrimaryResidentDestinationUUID;
}

- (void)setLastPrimaryResidentDestinationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_lastPrimaryResidentDestinationUUID, a3);
}

- (BOOL)isMessageInFlight
{
  return self->_messageInFlight;
}

- (void)setMessageInFlight:(BOOL)a3
{
  self->_messageInFlight = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_lastPrimaryResidentDestinationUUID, 0);
  objc_storeStrong((id *)&self->_queueTimerContext, 0);
  objc_storeStrong((id *)&self->_messageTimerContext, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
