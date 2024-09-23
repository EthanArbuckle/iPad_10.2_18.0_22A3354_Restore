@implementation _MNTracePlayerTimelineStreamSearchObject

- (_MNTracePlayerTimelineStreamSearchObject)initWithPosition:(double)a3
{
  _MNTracePlayerTimelineStreamSearchObject *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MNTracePlayerTimelineStreamSearchObject;
  result = -[_MNTracePlayerTimelineStreamSearchObject init](&v5, sel_init);
  if (result)
    result->_position = a3;
  return result;
}

- (double)position
{
  return self->_position;
}

@end
