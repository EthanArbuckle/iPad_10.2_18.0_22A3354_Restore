@implementation __NSPlaceholderTimeZone

- (__NSPlaceholderTimeZone)initWithName:(id)a3
{
  if (a3)
    return (__NSPlaceholderTimeZone *)(id)+[NSTimeZone _timeZoneWithName:](NSTimeZone, "_timeZoneWithName:");
  else
    return 0;
}

- (__NSPlaceholderTimeZone)initWithName:(id)a3 data:(id)a4
{
  if (a3)
    return (__NSPlaceholderTimeZone *)(id)+[NSTimeZone _timeZoneWithName:data:](NSTimeZone, "_timeZoneWithName:data:", a3, a4);
  else
    return 0;
}

- (__NSPlaceholderTimeZone)init
{

  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

- (id)name
{
  objc_class *v4;
  uint64_t v5;
  NSException *v6;

  v4 = __CFLookUpClass("NSTimeZone");
  v5 = __CFFullMethodName(v4, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized time zone object"), v5);
  v6 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v6);
}

- (id)data
{
  objc_class *v4;
  uint64_t v5;
  NSException *v6;

  v4 = __CFLookUpClass("NSTimeZone");
  v5 = __CFFullMethodName(v4, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized time zone object"), v5);
  v6 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v6);
}

- (int64_t)secondsFromGMTForDate:(id)a3
{
  objc_class *v5;
  uint64_t v6;
  NSException *v7;

  v5 = __CFLookUpClass("NSTimeZone");
  v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized time zone object"), v6);
  v7 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v7);
}

- (id)abbreviationForDate:(id)a3
{
  objc_class *v5;
  uint64_t v6;
  NSException *v7;

  v5 = __CFLookUpClass("NSTimeZone");
  v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized time zone object"), v6);
  v7 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v7);
}

- (BOOL)isDaylightSavingTimeForDate:(id)a3
{
  objc_class *v5;
  uint64_t v6;
  NSException *v7;

  v5 = __CFLookUpClass("NSTimeZone");
  v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized time zone object"), v6);
  v7 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v7);
}

- (double)daylightSavingTimeOffsetForDate:(id)a3
{
  objc_class *v5;
  uint64_t v6;
  NSException *v7;

  v5 = __CFLookUpClass("NSTimeZone");
  v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized time zone object"), v6);
  v7 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v7);
}

- (id)nextDaylightSavingTimeTransitionAfterDate:(id)a3
{
  objc_class *v5;
  uint64_t v6;
  NSException *v7;

  v5 = __CFLookUpClass("NSTimeZone");
  v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized time zone object"), v6);
  v7 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v7);
}

@end
