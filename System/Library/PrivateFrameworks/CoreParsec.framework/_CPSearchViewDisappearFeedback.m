@implementation _CPSearchViewDisappearFeedback

- (_CPSearchViewDisappearFeedback)init
{
  _CPSearchViewDisappearFeedback *v2;
  _CPSearchViewDisappearFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPSearchViewDisappearFeedback;
  v2 = -[_CPSearchViewDisappearFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPSearchViewDisappearFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPSearchViewDisappearFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_CPSearchViewDisappearFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  if (-[_CPSearchViewDisappearFeedback viewDisappearEvent](self, "viewDisappearEvent"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  int viewDisappearEvent;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (timestamp = self->_timestamp, timestamp == objc_msgSend(v4, "timestamp")))
  {
    viewDisappearEvent = self->_viewDisappearEvent;
    v7 = viewDisappearEvent == objc_msgSend(v4, "viewDisappearEvent");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (2654435761 * self->_viewDisappearEvent) ^ (2654435761u * self->_timestamp);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (int)viewDisappearEvent
{
  return self->_viewDisappearEvent;
}

- (void)setViewDisappearEvent:(int)a3
{
  self->_viewDisappearEvent = a3;
}

- (_CPSearchViewDisappearFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPSearchViewDisappearFeedback *v5;
  _CPSearchViewDisappearFeedback *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CPSearchViewDisappearFeedback;
  v5 = -[_CPSearchViewDisappearFeedback init](&v8, sel_init);
  if (v5)
  {
    -[_CPSearchViewDisappearFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    -[_CPSearchViewDisappearFeedback setViewDisappearEvent:](v5, "setViewDisappearEvent:", objc_msgSend(v4, "viewDisappearEvent"));
    v6 = v5;
  }

  return v5;
}

@end
