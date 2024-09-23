@implementation _NSUndoLightInvocation

- (_NSUndoLightInvocation)initWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  _NSUndoLightInvocation *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_NSUndoLightInvocation;
  v7 = -[_NSUndoObject initWithTarget:](&v9, sel_initWithTarget_, a3);
  v7->_selector = a4;
  v7->_arg = a5;
  return v7;
}

- (void)invoke
{
  objc_msgSend(self->super._target, self->_selector, self->_arg);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSUndoLightInvocation;
  -[_NSUndoLightInvocation dealloc](&v3, sel_dealloc);
}

- (id)_argument
{
  return self->_arg;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  id target;
  NSString *v6;
  objc_class *v7;
  NSString *v8;
  id arg;

  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  target = self->super._target;
  v6 = NSStringFromSelector(self->_selector);
  if (self->_arg)
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    arg = self->_arg;
  }
  else
  {
    arg = 0;
    v8 = (NSString *)CFSTR("none");
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("target: %@ %p -- selector:%@ -- arg:%@ %p"), v4, target, v6, v8, arg);
}

@end
