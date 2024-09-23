@implementation HMProxyObject

- (HMProxyObject)self
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("You must override %@ in a subclass"), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v2);
}

- (Class)superclass
{
  return (Class)objc_msgSend((id)objc_opt_self(), "superclass");
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_opt_self();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return objc_msgSend((id)objc_opt_self(), "isMemberOfClass:", a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  return objc_msgSend((id)objc_opt_self(), "conformsToProtocol:", a3);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_opt_self();
  return objc_opt_respondsToSelector() & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend((id)objc_opt_self(), "methodSignatureForSelector:", a3);
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-[??? %@]: unrecognized selector sent to invalid proxy"), NSStringFromSelector(a3)), 0);
  objc_exception_throw(v3);
}

- (id)performSelector:(SEL)a3
{
  return (id)objc_msgSend((id)objc_opt_self(), "performSelector:", a3);
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  return (id)objc_msgSend((id)objc_opt_self(), "performSelector:withObject:", a3, a4);
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  return (id)objc_msgSend((id)objc_opt_self(), "performSelector:withObject:withObject:", a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  return objc_msgSend((id)objc_opt_self(), "isEqual:", self);
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_self(), "hash");
}

- (id)description
{
  return (id)objc_msgSend((id)objc_opt_self(), "description");
}

- (id)debugDescription
{
  return (id)objc_msgSend((id)objc_opt_self(), "debugDescription");
}

@end
