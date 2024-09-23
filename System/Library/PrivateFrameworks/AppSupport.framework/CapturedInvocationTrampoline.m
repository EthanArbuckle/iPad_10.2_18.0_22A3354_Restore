@implementation CapturedInvocationTrampoline

- (CapturedInvocationTrampoline)initWithTarget:(id)a3 outInvocation:(id *)a4
{
  CapturedInvocationTrampoline *v6;
  CapturedInvocationTrampoline *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CapturedInvocationTrampoline;
  v6 = -[CapturedInvocationTrampoline init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[InvocationTrampoline setTarget:](v6, "setTarget:", a3);
    v7->_outInvocation = a4;
  }
  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id *outInvocation;

  objc_msgSend(a3, "setTarget:", -[InvocationTrampoline target](self, "target"));
  outInvocation = self->_outInvocation;
  if (outInvocation)
    *outInvocation = a3;
}

@end
