@implementation NSDateComponents

- (NSInteger)weekOfYear
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 0x2000);
}

- (NSInteger)nanosecond
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 0x8000);
}

- (NSInteger)weekOfMonth
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 4096);
}

- (NSInteger)era
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 2);
}

- (NSInteger)weekday
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 512);
}

- (NSInteger)weekdayOrdinal
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 1024);
}

- (NSInteger)yearForWeekOfYear
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 0x4000);
}

- (NSInteger)quarter
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 2048);
}

- (NSInteger)week
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 256);
}

- (NSDate)date
{
  NSTimeZone *v3;

  v3 = -[NSDateComponents timeZone](self, "timeZone");
  if (v3)
    -[NSCalendar setTimeZone:](-[NSDateComponents calendar](self, "calendar"), "setTimeZone:", v3);
  return -[NSCalendar dateFromComponents:](-[NSDateComponents calendar](self, "calendar"), "dateFromComponents:", self);
}

- (BOOL)isValidDateInCalendar:(NSCalendar *)calendar
{
  _QWORD **IndexedIvars;
  BOOL result;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (calendar || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
    return CFDateComponentsIsValidDateInCalendar(*IndexedIvars, calendar);
  }
  else
  {
    v7 = isValidDateInCalendar____count__;
    if (isValidDateInCalendar____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, (uint64_t)CFSTR("*** %s: calendar cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v8, v9, v10, v11, v12, v13, (__int16)"-[NSDateComponents isValidDateInCalendar:]");
      v7 = isValidDateInCalendar____count__;
    }
    result = 0;
    isValidDateInCalendar____count__ = v7 + 1;
  }
  return result;
}

- (NSInteger)day
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 16);
}

- (NSInteger)year
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 4);
}

- (NSInteger)month
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 8);
}

- (NSInteger)hour
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 32);
}

- (NSInteger)second
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 128);
}

- (NSInteger)minute
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 64);
}

- (BOOL)isLeapMonth
{
  uint64_t *IndexedIvars;
  uint64_t Value;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  Value = CFDateComponentsGetValue(*IndexedIvars, 0x40000000);
  return Value != 0x7FFFFFFFFFFFFFFFLL && Value != 0;
}

- (BOOL)isLeapMonthSet
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 0x40000000) != 0x7FFFFFFFFFFFFFFFLL;
}

- (__CFDateComponents)_dateComponents
{
  return *(__CFDateComponents **)object_getIndexedIvars(self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  __objc2_class *v5;
  __objc2_class *v6;

  v5 = (__objc2_class *)objc_opt_class();
  if (v5 == NSDateComponents)
    return -[NSDateComponents _initWithCFDateComponents:](+[NSDateComponents allocWithZone:](NSDateComponents, "allocWithZone:", a3), "_initWithCFDateComponents:", *(_QWORD *)object_getIndexedIvars(self));
  v6 = -[__objc2_class init](-[__objc2_class allocWithZone:](v5, "allocWithZone:", a3), "init");
  -[__objc2_class setCalendar:](v6, "setCalendar:", -[NSDateComponents calendar](self, "calendar"));
  -[__objc2_class setTimeZone:](v6, "setTimeZone:", -[NSDateComponents timeZone](self, "timeZone"));
  -[__objc2_class setEra:](v6, "setEra:", -[NSDateComponents era](self, "era"));
  -[__objc2_class setYear:](v6, "setYear:", -[NSDateComponents year](self, "year"));
  -[__objc2_class setQuarter:](v6, "setQuarter:", -[NSDateComponents quarter](self, "quarter"));
  -[__objc2_class setMonth:](v6, "setMonth:", -[NSDateComponents month](self, "month"));
  -[__objc2_class setDay:](v6, "setDay:", -[NSDateComponents day](self, "day"));
  -[__objc2_class setHour:](v6, "setHour:", -[NSDateComponents hour](self, "hour"));
  -[__objc2_class setMinute:](v6, "setMinute:", -[NSDateComponents minute](self, "minute"));
  -[__objc2_class setSecond:](v6, "setSecond:", -[NSDateComponents second](self, "second"));
  -[__objc2_class setNanosecond:](v6, "setNanosecond:", -[NSDateComponents nanosecond](self, "nanosecond"));
  -[__objc2_class setWeek:](v6, "setWeek:", -[NSDateComponents week](self, "week"));
  -[__objc2_class setWeekOfYear:](v6, "setWeekOfYear:", -[NSDateComponents weekOfYear](self, "weekOfYear"));
  -[__objc2_class setWeekOfMonth:](v6, "setWeekOfMonth:", -[NSDateComponents weekOfMonth](self, "weekOfMonth"));
  -[__objc2_class setYearForWeekOfYear:](v6, "setYearForWeekOfYear:", -[NSDateComponents yearForWeekOfYear](self, "yearForWeekOfYear"));
  -[__objc2_class setWeekday:](v6, "setWeekday:", -[NSDateComponents weekday](self, "weekday"));
  -[__objc2_class setWeekdayOrdinal:](v6, "setWeekdayOrdinal:", -[NSDateComponents weekdayOrdinal](self, "weekdayOrdinal"));
  -[__objc2_class setDayOfYear:](v6, "setDayOfYear:", -[NSDateComponents dayOfYear](self, "dayOfYear"));
  if (-[NSDateComponents isLeapMonthSet](self, "isLeapMonthSet"))
    -[__objc2_class setLeapMonth:](v6, "setLeapMonth:", -[NSDateComponents isLeapMonth](self, "isLeapMonth"));
  return v6;
}

+ (NSDateComponents)allocWithZone:(_NSZone *)a3
{
  return (NSDateComponents *)__CFAllocateObject((objc_class *)a1, 8uLL);
}

- (void)dealloc
{
  const void *v3;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = *(const void **)object_getIndexedIvars(self);
  if (v3)
    CFRelease(v3);
  v4.receiver = self;
  v4.super_class = (Class)NSDateComponents;
  -[NSDateComponents dealloc](&v4, sel_dealloc);
}

- (NSDateComponents)init
{
  _QWORD *IndexedIvars;
  uint64_t v4;

  IndexedIvars = object_getIndexedIvars(self);
  CFDateComponentsCreate(&__kCFAllocatorSystemDefault);
  *IndexedIvars = v4;
  return self;
}

- (void)setDay:(NSInteger)day
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 16, day);
}

- (void)setYear:(NSInteger)year
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 4, year);
}

- (void)setMonth:(NSInteger)month
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 8, month);
}

- (void)setSecond:(NSInteger)second
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 128, second);
}

- (void)setHour:(NSInteger)hour
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 32, hour);
}

- (void)setMinute:(NSInteger)minute
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 64, minute);
}

- (id)_initWithCFDateComponents:(__CFDateComponents *)a3
{
  _QWORD *IndexedIvars;

  IndexedIvars = object_getIndexedIvars(self);
  *IndexedIvars = CFDateComponentsCreateCopy(&__kCFAllocatorSystemDefault, (uint64_t)a3);
  return self;
}

- (NSCalendar)calendar
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return (NSCalendar *)(id)CFDateComponentsCopyCalendar(*IndexedIvars);
}

- (NSTimeZone)timeZone
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return (NSTimeZone *)(id)CFDateComponentsCopyTimeZone(*IndexedIvars);
}

- (void)setLeapMonth:(BOOL)leapMonth
{
  _BOOL4 v3;
  _QWORD **IndexedIvars;

  v3 = leapMonth;
  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 0x40000000, v3);
}

- (void)setEra:(NSInteger)era
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 2, era);
}

- (void)setCalendar:(NSCalendar *)calendar
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  CFDateComponentsSetCalendar(*IndexedIvars, calendar);
}

- (NSInteger)valueForComponent:(NSCalendarUnit)unit
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, unit);
}

- (void)setNanosecond:(NSInteger)nanosecond
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 0x8000, nanosecond);
}

- (void)setValue:(NSInteger)value forComponent:(NSCalendarUnit)unit
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, unit, value);
}

- (void)setWeekOfMonth:(NSInteger)weekOfMonth
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 4096, weekOfMonth);
}

- (void)setWeekday:(NSInteger)weekday
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 512, weekday);
}

- (void)setWeekOfYear:(NSInteger)weekOfYear
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 0x2000, weekOfYear);
}

- (void)setYearForWeekOfYear:(NSInteger)yearForWeekOfYear
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 0x4000, yearForWeekOfYear);
}

- (void)setWeekdayOrdinal:(NSInteger)weekdayOrdinal
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 1024, weekdayOrdinal);
}

- (void)setQuarter:(NSInteger)quarter
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 2048, quarter);
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  CFDateComponentsSetTimeZone(*IndexedIvars, timeZone);
}

- (void)setWeek:(NSInteger)v
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 256, v);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  const void *v5;
  CFTypeRef *IndexedIvars;

  if (a3 == self)
    return 1;
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = *(const void **)object_getIndexedIvars(self);
  IndexedIvars = (CFTypeRef *)object_getIndexedIvars(a3);
  return CFEqual(v5, *IndexedIvars) != 0;
}

- (unint64_t)hash
{
  CFTypeRef *IndexedIvars;

  IndexedIvars = (CFTypeRef *)object_getIndexedIvars(self);
  return CFHash(*IndexedIvars);
}

- (NSDateComponents)initWithCoder:(id)a3
{
  return 0;
}

- (int64_t)dayOfYear
{
  uint64_t *IndexedIvars;

  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  return CFDateComponentsGetValue(*IndexedIvars, 0x10000);
}

- (void)setDayOfYear:(int64_t)a3
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  CFDateComponentsSetValue(*IndexedIvars, 0x10000, a3);
}

- (BOOL)isValidDate
{
  _QWORD **IndexedIvars;

  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  return CFDateComponentsIsValidDate(*IndexedIvars);
}

- (id)description
{
  _QWORD **IndexedIvars;
  __CFString *v4;
  id v5;
  __CFString *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  IndexedIvars = (_QWORD **)object_getIndexedIvars(self);
  v4 = _CFDateComponentsCopyDescriptionInner(*IndexedIvars);
  v8.receiver = self;
  v8.super_class = (Class)NSDateComponents;
  v5 = -[NSObject description](&v8, sel_description);
  v6 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@ %@"), v5, v4);
  CFRelease(v4);
  return v6;
}

@end
