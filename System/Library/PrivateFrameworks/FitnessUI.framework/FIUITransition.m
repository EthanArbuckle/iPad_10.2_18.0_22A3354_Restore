@implementation FIUITransition

- (void)setToState:(id)a3
{
  objc_storeWeak((id *)&self->_toState, a3);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setGate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)label
{
  return self->_label;
}

- (FIUIState)toState
{
  return (FIUIState *)objc_loadWeakRetained((id *)&self->_toState);
}

- (int64_t)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_gate, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_toState);
  objc_storeStrong((id *)&self->_label, 0);
}

- (id)handler
{
  return self->_handler;
}

- (id)gate
{
  return self->_gate;
}

@end
