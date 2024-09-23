@implementation AVEventWaiter

- (AVEventWaiter)init
{
  AVEventWaiter *v2;
  AVEventWaiter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVEventWaiter;
  v2 = -[AVEventWaiter init](&v5, sel_init);
  if (v2)
  {
    v2->_condition = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
    v2->_eventCompleted = 0;
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVEventWaiter;
  -[AVEventWaiter dealloc](&v3, sel_dealloc);
}

- (void)markEventAsCompleted
{
  -[NSCondition lock](self->_condition, "lock");
  self->_eventCompleted = 1;
  -[NSCondition signal](self->_condition, "signal");
  -[NSCondition unlock](self->_condition, "unlock");
}

- (void)waitUntilEventIsCompleted
{
  -[NSCondition lock](self->_condition, "lock");
  while (!self->_eventCompleted)
    -[NSCondition wait](self->_condition, "wait");
  -[NSCondition unlock](self->_condition, "unlock");
}

@end
