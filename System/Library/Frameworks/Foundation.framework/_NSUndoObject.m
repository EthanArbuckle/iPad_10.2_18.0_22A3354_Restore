@implementation _NSUndoObject

- (_NSUndoObject)init
{
  return -[_NSUndoObject initWithTarget:](self, "initWithTarget:", 0);
}

- (_NSUndoObject)initWithTarget:(id)a3
{
  _NSUndoObject *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)_NSUndoObject;
  result = -[_NSUndoObject init](&v5, sel_init);
  result->_target = a3;
  return result;
}

- (BOOL)isBeginMark
{
  return 0;
}

- (BOOL)isEndMark
{
  return 0;
}

- (void)invoke
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("- invoke is Subclass responsability"), 0));
}

- (id)target
{
  return self->_target;
}

@end
