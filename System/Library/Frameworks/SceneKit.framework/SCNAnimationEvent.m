@implementation SCNAnimationEvent

- (SCNAnimationEvent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNAnimationEvent;
  return -[SCNAnimationEvent init](&v3, sel_init);
}

- (void)dealloc
{
  id eventBlock;
  objc_super v4;

  eventBlock = self->_eventBlock;
  if (eventBlock)
    _Block_release(eventBlock);
  v4.receiver = self;
  v4.super_class = (Class)SCNAnimationEvent;
  -[SCNAnimationEvent dealloc](&v4, sel_dealloc);
}

- (double)time
{
  return self->_eventTime;
}

- (void)setTime:(double)a3
{
  self->_eventTime = a3;
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void)setEventBlock:(id)a3
{
  id eventBlock;

  eventBlock = self->_eventBlock;
  if (eventBlock)
    _Block_release(eventBlock);
  self->_eventBlock = _Block_copy(a3);
}

+ (SCNAnimationEvent)animationEventWithKeyTime:(CGFloat)time block:(SCNAnimationEventBlock)eventBlock
{
  SCNAnimationEvent *v6;

  v6 = (SCNAnimationEvent *)objc_alloc_init((Class)a1);
  -[SCNAnimationEvent setTime:](v6, "setTime:", time);
  -[SCNAnimationEvent setEventBlock:](v6, "setEventBlock:", eventBlock);
  return v6;
}

@end
