@implementation __NSCFURLLocalStreamTaskFromDataTaskDataBlobby

- (void)dealloc
{
  NSObject *remainingData;
  void (**completion)(id, SEL);
  objc_super v5;

  remainingData = self->_remainingData;
  if (remainingData)
  {
    dispatch_release(remainingData);
    self->_remainingData = 0;
  }
  completion = (void (**)(id, SEL))self->_completion;
  if (completion)
  {
    self->_completion = 0;
    completion[2](completion, a2);
    _Block_release(completion);
  }
  v5.receiver = self;
  v5.super_class = (Class)__NSCFURLLocalStreamTaskFromDataTaskDataBlobby;
  -[__NSCFURLLocalStreamTaskFromDataTaskDataBlobby dealloc](&v5, sel_dealloc);
}

@end
