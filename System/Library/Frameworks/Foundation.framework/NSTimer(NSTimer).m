@implementation NSTimer(NSTimer)

+ (id)timerWithTimeInterval:()NSTimer target:selector:userInfo:repeats:
{
  id v12;

  v12 = objc_allocWithZone(a1);
  return (id)objc_msgSend(v12, "initWithFireDate:interval:target:selector:userInfo:repeats:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a2), a4, a5, a6, a7, a2);
}

+ (__CFRunLoopTimer)scheduledTimerWithTimeInterval:()NSTimer target:selector:userInfo:repeats:
{
  id v12;
  __CFRunLoopTimer *v13;
  __CFRunLoop *Current;

  v12 = objc_allocWithZone(a1);
  v13 = (__CFRunLoopTimer *)(id)objc_msgSend(v12, "initWithFireDate:interval:target:selector:userInfo:repeats:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a2), a4, a5, a6, a7, a2);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(Current, v13, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  return v13;
}

+ (__CFRunLoopTimer)scheduledTimerWithTimeInterval:()NSTimer repeats:block:
{
  id v8;
  __CFRunLoopTimer *v9;
  __CFRunLoop *Current;

  v8 = objc_allocWithZone(a1);
  v9 = (__CFRunLoopTimer *)(id)objc_msgSend(v8, "initWithFireDate:interval:repeats:block:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a2), a4, a5, a2);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(Current, v9, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  return v9;
}

+ (id)timerWithTimeInterval:()NSTimer repeats:block:
{
  id v8;

  v8 = objc_allocWithZone(a1);
  return (id)objc_msgSend(v8, "initWithFireDate:interval:repeats:block:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a2), a4, a5, a2);
}

+ (NSCFTimer)allocWithZone:()NSTimer
{
  if ((objc_class *)MEMORY[0x1E0C99E88] == a1)
    return +[NSCFTimer allocWithZone:](NSCFTimer, "allocWithZone:");
  else
    return (NSCFTimer *)NSAllocateObject(a1, 0, a3);
}

- (uint64_t)initWithFireDate:()NSTimer interval:repeats:block:
{
  _NSTimerBlockTarget *v11;
  _QWORD *v12;
  uint64_t v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = [_NSTimerBlockTarget alloc];
  if (v11)
  {
    v15.receiver = v11;
    v15.super_class = (Class)_NSTimerBlockTarget;
    v12 = objc_msgSendSuper2(&v15, sel_init);
    v12[1] = _Block_copy(a6);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(a1, "initWithFireDate:interval:target:selector:userInfo:repeats:", a4, v12, sel_fire_, 0, a5, a2);

  return v13;
}

+ (id)timerWithTimeInterval:()NSTimer invocation:repeats:
{
  id v9;

  objc_msgSend(a4, "retainArguments");
  v9 = objc_allocWithZone(a1);
  return (id)objc_msgSend(v9, "initWithFireDate:interval:target:selector:userInfo:repeats:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a2), a4, sel_invoke, 0, a5, a2);
}

+ (__CFRunLoopTimer)scheduledTimerWithTimeInterval:()NSTimer invocation:repeats:
{
  id v9;
  __CFRunLoopTimer *v10;
  __CFRunLoop *Current;

  objc_msgSend(a4, "retainArguments");
  v9 = objc_allocWithZone(a1);
  v10 = (__CFRunLoopTimer *)(id)objc_msgSend(v9, "initWithFireDate:interval:target:selector:userInfo:repeats:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a2), a4, sel_invoke, 0, a5, a2);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(Current, v10, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  return v10;
}

+ (id)timerWithFireDate:()NSTimer target:selector:userInfo:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithFireDate:interval:target:selector:userInfo:repeats:", a3, a4, a5, a6, 0, 0.0);
}

- (void)initWithFireDate:()NSTimer interval:target:selector:userInfo:repeats:
{
  _NSRequestConcreteObject(a1, a2);
}

- (void)invalidate
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTimer"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)isValid
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTimer"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)timeInterval
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTimer"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)tolerance
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTimer"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)setTolerance:()NSTimer
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTimer"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)fire
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTimer"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)fireDate
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTimer"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)setFireDate:()NSTimer
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSTimer"));
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (uint64_t)userInfo
{
  return 0;
}

- (id)copyDebugDescription
{
  return (id)objc_msgSend(a1, "debugDescription");
}

- (uint64_t)order
{
  return 0;
}

- (uint64_t)fireTime
{
  return objc_msgSend((id)objc_msgSend(a1, "fireDate"), "timeIntervalSinceReferenceDate");
}

- (uint64_t)setFireTime:()NSTimer
{
  return objc_msgSend(a1, "setFireDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:"));
}

- (double)context
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

- (uint64_t)_cffireTime
{
  return objc_msgSend((id)objc_msgSend(a1, "fireDate"), "timeIntervalSinceReferenceDate");
}

@end
