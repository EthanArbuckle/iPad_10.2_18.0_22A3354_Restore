@implementation BKBufferedEventEntry

- (__IOHIDEvent)event
{
  return (__IOHIDEvent *)self->_rawEvent;
}

- (void)setEvent:(__IOHIDEvent *)a3
{
  objc_storeStrong(&self->_rawEvent, a3);
}

- (void)invalidate
{
  BKHIDEventSenderInfo *sender;
  BKHIDEventDeliverySequence *sequence;
  id additionalContext;
  id rawEvent;

  sender = self->_sender;
  self->_sender = 0;

  sequence = self->_sequence;
  self->_sequence = 0;

  additionalContext = self->_additionalContext;
  self->_additionalContext = 0;

  rawEvent = self->_rawEvent;
  self->_rawEvent = 0;

}

- (BKHIDEventSenderInfo)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (BKHIDEventDeliverySequence)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
  objc_storeStrong((id *)&self->_sequence, a3);
}

- (id)additionalContext
{
  return self->_additionalContext;
}

- (void)setAdditionalContext:(id)a3
{
  objc_storeStrong(&self->_additionalContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_additionalContext, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong(&self->_rawEvent, 0);
}

@end
