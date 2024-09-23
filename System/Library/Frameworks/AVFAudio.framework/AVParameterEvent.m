@implementation AVParameterEvent

- (AVParameterEvent)initWithParameterID:(UInt32)parameterID scope:(UInt32)scope element:(UInt32)element value:(float)value
{
  AVParameterEvent *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVParameterEvent;
  result = -[AVParameterEvent init](&v11, sel_init);
  if (result)
  {
    result->_event.parameterID = parameterID;
    result->_event.scope = scope;
    result->_event.element = element;
    result->_event.value = value;
  }
  return result;
}

- (UInt32)parameterID
{
  return self->_event.parameterID;
}

- (void)setParameterID:(UInt32)parameterID
{
  self->_event.parameterID = parameterID;
}

- (UInt32)scope
{
  return self->_event.scope;
}

- (void)setScope:(UInt32)scope
{
  self->_event.scope = scope;
}

- (UInt32)element
{
  return self->_event.element;
}

- (void)setElement:(UInt32)element
{
  self->_event.element = element;
}

- (float)value
{
  return self->_event.value;
}

- (void)setValue:(float)value
{
  self->_event.value = value;
}

- (AVParameterEvent)initWithParameterEvent:(ParameterEvent *)a3
{
  AVParameterEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVParameterEvent;
  result = -[AVParameterEvent init](&v5, sel_init);
  if (result)
    result->_event = *a3;
  return result;
}

- (ParameterEvent)event
{
  return &self->_event;
}

@end
