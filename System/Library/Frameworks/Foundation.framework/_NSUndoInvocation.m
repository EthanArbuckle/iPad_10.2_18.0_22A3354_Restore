@implementation _NSUndoInvocation

- (_NSUndoInvocation)initWithTarget:(id)a3 invocation:(id)a4
{
  _NSUndoInvocation *v5;
  NSInvocation *v6;

  v5 = -[_NSUndoObject initWithTarget:](self, "initWithTarget:", a3);
  v6 = (NSInvocation *)a4;
  v5->_invocation = v6;
  -[NSInvocation retainArguments](v6, "retainArguments");
  return v5;
}

- (void)invoke
{
  -[NSInvocation invokeWithTarget:](self->_invocation, "invokeWithTarget:", self->super._target);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSUndoInvocation;
  -[_NSUndoInvocation dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;

  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("target: %@ %p -- selector:%@"), v4, self->super._target, NSStringFromSelector(-[NSInvocation selector](self->_invocation, "selector")));
}

@end
