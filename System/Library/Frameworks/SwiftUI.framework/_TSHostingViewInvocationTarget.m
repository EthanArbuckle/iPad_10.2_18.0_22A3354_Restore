@implementation _TSHostingViewInvocationTarget

- (_TSHostingViewInvocationTarget)initWithHandler:(id)a3
{
  void *v4;
  id handler;

  v4 = _Block_copy(a3);
  handler = self->_handler;
  self->_handler = v4;

  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", "v@:@");
}

- (void)forwardInvocation:(id)a3
{
  (*((void (**)(id, uint64_t))self->_handler + 2))(self->_handler, objc_msgSend(a3, "selector"));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
