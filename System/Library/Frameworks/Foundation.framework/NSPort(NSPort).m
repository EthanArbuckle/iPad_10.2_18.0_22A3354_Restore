@implementation NSPort(NSPort)

+ (id)port
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "init");
}

+ (id)allocWithZone:()NSPort
{
  if ((objc_class *)MEMORY[0x1E0C99E50] == a1)
    return (id)objc_msgSend(MEMORY[0x1E0C99DD0], "allocWithZone:");
  else
    return NSAllocateObject(a1, 0, a3);
}

+ (id)portWithMachPort:()NSPort
{
  return (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DD0]), "initWithMachPort:", a3);
}

- (uint64_t)initWithMachPort:()NSPort
{
  return 0;
}

- (void)invalidate
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSPort"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)isValid
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSPort"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (uint64_t)machPort
{
  return 0;
}

- (void)setDelegate:()NSPort
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSPort"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)delegate
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSPort"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (uint64_t)reservedSpaceLength
{
  return 0;
}

- (uint64_t)replacementObjectForCoder:()NSPort
{
  return 0;
}

- (uint64_t)classForPortCoder
{
  return objc_opt_self();
}

- (void)classForCoder
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_class();
  v1 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ asked to archive; %@ only codes for port coding (Distributed Objects)."),
                   v0,
                   objc_opt_class()),
                 0);
  objc_exception_throw(v1);
}

- (uint64_t)initWithCoder:()NSPort
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = a1;
  v2.super_class = (Class)NSPort_0;
  objc_msgSendSuper2(&v2, sel_dealloc);
  return 0;
}

- (void)sendBeforeDate:()NSPort components:from:reserved:
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSPort"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (uint64_t)sendBeforeDate:()NSPort msgid:components:from:reserved:
{
  return objc_msgSend(a1, "sendBeforeDate:components:from:reserved:", a3, a5, a6, a7);
}

@end
