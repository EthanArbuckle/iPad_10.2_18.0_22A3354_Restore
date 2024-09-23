@implementation NSInputStream(NSInputStream)

+ (id)inputStreamWithData:()NSInputStream
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithData:", a3);
}

+ (NSCFInputStream)allocWithZone:()NSInputStream
{
  if ((objc_class *)MEMORY[0x1E0C99DB0] == a1)
    return +[NSCFInputStream allocWithZone:](NSCFInputStream, "allocWithZone:");
  else
    return (NSCFInputStream *)NSAllocateObject(a1, 0, a3);
}

+ (id)inputStreamWithFileAtPath:()NSInputStream
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithFileAtPath:", a3);
}

+ (id)inputStreamWithURL:()NSInputStream
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithURL:", a3);
}

- (id)initWithData:()NSInputStream
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = a1;
  v2.super_class = (Class)NSInputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)initWithURL:()NSInputStream
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = a1;
  v2.super_class = (Class)NSInputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  MEMORY[0x186DA7B74]();
  v3.receiver = a1;
  v3.super_class = (Class)NSInputStream_0;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

- (void)read:()NSInputStream maxLength:
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)getBuffer:()NSInputStream length:
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)hasBytesAvailable
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

@end
