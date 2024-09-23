@implementation DelayedInvocationTrampoline

- (DelayedInvocationTrampoline)initWithTarget:(id)a3 delay:(double)a4
{
  DelayedInvocationTrampoline *v6;
  DelayedInvocationTrampoline *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DelayedInvocationTrampoline;
  v6 = -[DelayedInvocationTrampoline init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[InvocationTrampoline setTarget:](v6, "setTarget:", a3);
    v7->_delay = a4;
  }
  return v7;
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "retainArguments");
  -[DelayedInvocationTrampoline performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_performInvocation_, a3, self->_delay);
}

@end
