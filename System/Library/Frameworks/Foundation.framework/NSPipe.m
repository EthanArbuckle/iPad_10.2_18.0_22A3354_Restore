@implementation NSPipe

- (NSPipe)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSPipe;
  return -[NSPipe init](&v3, sel_init);
}

+ (NSPipe)allocWithZone:(_NSZone *)a3
{
  if (NSPipe == a1)
    a1 = (id)objc_opt_self();
  return (NSPipe *)NSAllocateObject((Class)a1, 0, a3);
}

+ (NSPipe)pipe
{
  return (NSPipe *)(id)objc_msgSend(objc_allocWithZone((Class)NSPipe), "init");
}

- (NSFileHandle)fileHandleForReading
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSPipe"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSFileHandle)fileHandleForWriting
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSPipe"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end
