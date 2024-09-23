@implementation IMCapturedInvocationTrampoline

- (IMCapturedInvocationTrampoline)initWithTarget:(id)a3 outInvocation:(id *)a4
{
  id v6;
  IMCapturedInvocationTrampoline *v7;
  const char *v8;
  uint64_t v9;
  IMCapturedInvocationTrampoline *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMCapturedInvocationTrampoline;
  v7 = -[IMCapturedInvocationTrampoline init](&v12, sel_init);
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setTarget_(v7, v8, (uint64_t)v6, v9);
    v10->_outInvocation = a4;
  }

  return v10;
}

- (void)forwardInvocation:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id *outInvocation;
  id v11;

  v11 = a3;
  objc_msgSend_target(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTarget_(v11, v8, (uint64_t)v7, v9);

  outInvocation = self->_outInvocation;
  if (outInvocation)
    *outInvocation = v11;

}

@end
