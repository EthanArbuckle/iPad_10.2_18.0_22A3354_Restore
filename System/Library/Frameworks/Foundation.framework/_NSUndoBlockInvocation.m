@implementation _NSUndoBlockInvocation

- (_NSUndoBlockInvocation)initWithTarget:(id)a3 handler:(id)a4
{
  _NSUndoBlockInvocation *v5;
  void *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_NSUndoBlockInvocation;
  v5 = -[_NSUndoObject initWithTarget:](&v8, sel_initWithTarget_, a3);
  if (v5)
  {
    v6 = _Block_copy(a4);
    v5->_handler = v6;
    if (!v6)
    {

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("unable to copy handler"), 0));
    }
  }
  return v5;
}

- (void)dealloc
{
  id handler;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    handler = self->_handler;
    if (handler)
    {
      _Block_release(handler);
      self->_handler = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)_NSUndoBlockInvocation;
  -[_NSUndoBlockInvocation dealloc](&v4, sel_dealloc);
}

- (void)invoke
{
  (*((void (**)(id, id))self->_handler + 2))(self->_handler, self->super._target);
}

@end
