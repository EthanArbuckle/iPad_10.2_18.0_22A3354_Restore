@implementation IDSParakeetMessagingStopStateMachine

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[IDSParakeetMessagingStopStateMachine finalAckTimer](self, "finalAckTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)IDSParakeetMessagingStopStateMachine;
  -[IDSParakeetMessagingStopStateMachine dealloc](&v4, sel_dealloc);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (IMDispatchTimer)finalAckTimer
{
  return self->_finalAckTimer;
}

- (void)setFinalAckTimer:(id)a3
{
  objc_storeStrong((id *)&self->_finalAckTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalAckTimer, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
