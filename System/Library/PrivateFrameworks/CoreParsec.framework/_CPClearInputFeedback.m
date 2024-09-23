@implementation _CPClearInputFeedback

- (_CPClearInputFeedback)init
{
  _CPClearInputFeedback *v2;
  _CPClearInputFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPClearInputFeedback;
  v2 = -[_CPClearInputFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPClearInputFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPClearInputFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_CPClearInputFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  if (-[_CPClearInputFeedback triggerEvent](self, "triggerEvent"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  int triggerEvent;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (timestamp = self->_timestamp, timestamp == objc_msgSend(v4, "timestamp")))
  {
    triggerEvent = self->_triggerEvent;
    v7 = triggerEvent == objc_msgSend(v4, "triggerEvent");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (2654435761 * self->_triggerEvent) ^ (2654435761u * self->_timestamp);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (_CPClearInputFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPClearInputFeedback *v5;
  _CPClearInputFeedback *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CPClearInputFeedback;
  v5 = -[_CPClearInputFeedback init](&v8, sel_init);
  if (v5)
  {
    -[_CPClearInputFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    -[_CPClearInputFeedback setTriggerEvent:](v5, "setTriggerEvent:", objc_msgSend(v4, "triggerEvent"));
    v6 = v5;
  }

  return v5;
}

@end
