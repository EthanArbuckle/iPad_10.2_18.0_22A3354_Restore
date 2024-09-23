@implementation IMInvocationTrampoline

- (void)dealloc
{
  id target;
  objc_super v4;

  target = self->_target;
  self->_target = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMInvocationTrampoline;
  -[IMInvocationTrampoline dealloc](&v4, sel_dealloc);
}

- (void)performInvocation:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = (void *)MEMORY[0x19400E788]();
  objc_msgSend_target(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invokeWithTarget_(v11, v9, (uint64_t)v8, v10);

  objc_autoreleasePoolPop(v4);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  IMInvocationTrampoline *v8;
  const char *v9;
  uint64_t v10;
  IMInvocationTrampoline *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IMInvocationTrampoline;
  if (-[IMInvocationTrampoline respondsToSelector:](&v14, sel_respondsToSelector_))
  {
    v8 = self;
  }
  else
  {
    objc_msgSend_target(self, v5, v6, v7);
    v8 = (IMInvocationTrampoline *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;
  objc_msgSend_methodSignatureForSelector_(v8, v9, (uint64_t)a3, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMInvocationTrampoline;
  if (-[IMInvocationTrampoline respondsToSelector:](&v10, sel_respondsToSelector_))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend_target(self, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

  }
  return v7 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_target(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invokeWithTarget_(v4, v8, (uint64_t)v10, v9);

}

- (id)target
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setTarget:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_target, 0);
}

@end
