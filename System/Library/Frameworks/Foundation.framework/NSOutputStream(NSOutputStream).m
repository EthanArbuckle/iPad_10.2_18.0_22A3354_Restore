@implementation NSOutputStream(NSOutputStream)

+ (id)outputStreamToMemory
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initToMemory");
}

+ (id)outputStreamWithURL:()NSOutputStream append:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithURL:append:", a3, a4);
}

+ (id)outputStreamToFileAtPath:()NSOutputStream append:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initToFileAtPath:append:", a3, a4);
}

+ (NSCFOutputStream)allocWithZone:()NSOutputStream
{
  if ((objc_class *)MEMORY[0x1E0C99E48] == a1)
    return +[NSCFOutputStream allocWithZone:](NSCFOutputStream, "allocWithZone:");
  else
    return (NSCFOutputStream *)NSAllocateObject(a1, 0, a3);
}

- (void)write:()NSOutputStream maxLength:
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)hasSpaceAvailable
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

+ (id)outputStreamToBuffer:()NSOutputStream capacity:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initToBuffer:capacity:", a3, a4);
}

- (id)initToMemory
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = a1;
  v2.super_class = (Class)NSOutputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)initToBuffer:()NSOutputStream capacity:
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = a1;
  v2.super_class = (Class)NSOutputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)initWithURL:()NSOutputStream append:
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = a1;
  v2.super_class = (Class)NSOutputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  MEMORY[0x186DA7E5C]();
  v3.receiver = a1;
  v3.super_class = (Class)NSOutputStream_0;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

@end
