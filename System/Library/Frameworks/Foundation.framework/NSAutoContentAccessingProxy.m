@implementation NSAutoContentAccessingProxy

+ (id)proxyWithTarget:(id)a3
{
  NSAutoContentAccessingProxy *v4;

  if (!objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCD11F0)
    || !objc_msgSend(a3, "beginContentAccess"))
  {
    return 0;
  }
  v4 = [NSAutoContentAccessingProxy alloc];
  v4->_target = a3;
  return v4;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_target;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend(self->_target, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "setTarget:", self->_target);
  objc_msgSend(a3, "invoke");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(self->_target, "endContentAccess");

  v3.receiver = self;
  v3.super_class = (Class)NSAutoContentAccessingProxy;
  -[NSProxy dealloc](&v3, sel_dealloc);
}

@end
