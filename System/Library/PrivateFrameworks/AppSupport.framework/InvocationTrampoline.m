@implementation InvocationTrampoline

- (void)dealloc
{
  objc_super v3;

  self->_target = 0;
  v3.receiver = self;
  v3.super_class = (Class)InvocationTrampoline;
  -[InvocationTrampoline dealloc](&v3, sel_dealloc);
}

- (void)performInvocation:(id)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_msgSend(a3, "invokeWithTarget:", -[InvocationTrampoline target](self, "target"));

}

- (id)methodSignatureForSelector:(SEL)a3
{
  InvocationTrampoline *v4;
  objc_super v6;

  v4 = self;
  v6.receiver = self;
  v6.super_class = (Class)InvocationTrampoline;
  if (!-[InvocationTrampoline respondsToSelector:](&v6, sel_respondsToSelector_))
    v4 = -[InvocationTrampoline target](v4, "target");
  return -[InvocationTrampoline methodSignatureForSelector:](v4, "methodSignatureForSelector:", a3);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)InvocationTrampoline;
  if (-[InvocationTrampoline respondsToSelector:](&v6, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[InvocationTrampoline target](self, "target");
    v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "invokeWithTarget:", -[InvocationTrampoline target](self, "target"));
}

- (id)target
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setTarget:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

@end
