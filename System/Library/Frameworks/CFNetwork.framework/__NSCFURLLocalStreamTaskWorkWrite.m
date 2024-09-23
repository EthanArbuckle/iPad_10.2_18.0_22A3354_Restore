@implementation __NSCFURLLocalStreamTaskWorkWrite

- (void)dealloc
{
  id completion;
  objc_super v4;

  completion = self->_completion;
  if (completion)
  {
    _Block_release(completion);
    self->_completion = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)__NSCFURLLocalStreamTaskWorkWrite;
  -[__NSCFURLLocalStreamTaskWorkWrite dealloc](&v4, sel_dealloc);
}

@end
