@implementation NSStream(NSStream)

- (id)init
{
  id v1;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = a1;
  v3.super_class = (Class)NSStream_0;
  v1 = objc_msgSendSuper2(&v3, sel_init);
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _CFReadStreamInitialize();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        _CFWriteStreamInitialize();
    }
  }
  return v1;
}

- (void)open
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)close
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)delegate
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)setDelegate:()NSStream
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)propertyForKey:()NSStream
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)setProperty:()NSStream forKey:
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)scheduleInRunLoop:()NSStream forMode:
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)removeFromRunLoop:()NSStream forMode:
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)streamStatus
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)streamError
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSStream"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

@end
