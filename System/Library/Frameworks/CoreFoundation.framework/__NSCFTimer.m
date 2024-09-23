@implementation __NSCFTimer

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (void)setFireDate:(id)a3
{
  CFAbsoluteTime v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  CFRunLoopTimerSetNextFireDate((CFRunLoopTimerRef)self, v4);
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (id)userInfo
{
  CFRunLoopTimerContext v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(&v3, 0, sizeof(v3));
  CFRunLoopTimerGetContext((CFRunLoopTimerRef)self, &v3);
  return (id)*((_QWORD *)v3.info + 3);
}

- (void)fire
{
  __NSCFTimer *v3;
  double v4;
  CFRunLoopTimerContext v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (-[__NSCFTimer isValid](self, "isValid"))
  {
    v3 = self;
    memset(&v5, 0, sizeof(v5));
    CFRunLoopTimerGetContext((CFRunLoopTimerRef)self, &v5);
    __CFFireTimer(self, (uint64_t)v5.info);
    -[__NSCFTimer timeInterval](self, "timeInterval");
    if (v4 == 0.0)
      -[__NSCFTimer invalidate](self, "invalidate");

  }
}

- (BOOL)isValid
{
  return CFRunLoopTimerIsValid((CFRunLoopTimerRef)self) != 0;
}

- (id)fireDate
{
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", CFRunLoopTimerGetNextFireDate((CFRunLoopTimerRef)self));
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (self == a3)
    return 1;
  return _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (__NSCFTimer)initWithFireDate:(id)a3 interval:(double)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7 repeats:(BOOL)a8
{
  _BOOL4 v8;
  malloc_zone_t *v14;
  _QWORD *v15;
  _QWORD *v16;
  CFAbsoluteTime v17;
  double v18;
  CFRunLoopTimerContext v20;
  uint64_t v21;

  v8 = a8;
  v21 = *MEMORY[0x1E0C80C00];
  v14 = malloc_default_zone();
  v15 = malloc_type_zone_calloc(v14, 1uLL, 0x20uLL, 0x10800406BDE4C18uLL);
  v16 = v15;
  v20.version = 0;
  v20.info = v15;
  v20.retain = (const void *(__cdecl *)(const void *))_timerRetain;
  v20.release = (void (__cdecl *)(const void *))_timerRelease;
  v20.copyDescription = 0;
  if (a4 <= 0.0)
    a4 = 0.0001;
  *(_DWORD *)v15 = 0;
  v15[1] = a5;
  v16[2] = a6;
  v16[3] = a7;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate", v20.version, v20.info, v20.retain, v20.release, v20.copyDescription, v21);
  v18 = 0.0;
  if (v8)
    v18 = a4;
  return (__NSCFTimer *)CFRunLoopTimerCreate(0, v17, v18, 0, 0, (CFRunLoopTimerCallBack)__CFFireTimer, &v20);
}

- (__NSCFTimer)init
{
  return 0;
}

@end
