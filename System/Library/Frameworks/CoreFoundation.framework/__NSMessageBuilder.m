@implementation __NSMessageBuilder

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend(self->_target, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "setTarget:", self->_target);
  if (self->_addr)
    *self->_addr = a3;
}

@end
