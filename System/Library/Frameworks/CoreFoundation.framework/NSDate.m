@implementation NSDate

+ (NSDate)distantFuture
{
  return (NSDate *)&_NSConstantDateDistantFuture;
}

- (unint64_t)hash
{
  double v2;
  double v3;
  long double v4;
  double v5;
  unint64_t result;

  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  v3 = -v2;
  if (v2 >= 0.0)
    v3 = v2;
  v4 = floor(v3 + 0.5);
  v5 = (v3 - v4) * 1.84467441e19;
  result = 2654435761u * (unint64_t)fmod(v4, 1.84467441e19);
  if (v5 >= 0.0)
  {
    if (v5 > 0.0)
      result += (unint64_t)v5;
  }
  else
  {
    result -= (unint64_t)fabs(v5);
  }
  return result;
}

- (NSString)description
{
  return -[NSDate descriptionWithLocale:](self, "descriptionWithLocale:", 0);
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3)
  {
    v5 = _NSIsNSDate((uint64_t)a3);
    if (v5)
      LOBYTE(v5) = -[NSDate isEqualToDate:](self, "isEqualToDate:", a3);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isNSDate__
{
  return 1;
}

- (NSDate)initWithTimeInterval:(NSTimeInterval)secsToBeAdded sinceDate:(NSDate *)date
{
  double v6;

  if (date)
    -[NSDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
  else
    v6 = NAN;
  return -[NSDate initWithTimeIntervalSinceReferenceDate:](self, "initWithTimeIntervalSinceReferenceDate:", v6 + secsToBeAdded);
}

- (NSDate)initWithTimeIntervalSinceNow:(NSTimeInterval)secs
{
  timespec __tp;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return -[NSDate initWithTimeIntervalSinceReferenceDate:](self, "initWithTimeIntervalSinceReferenceDate:", (double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001 + secs);
}

- (NSDate)earlierDate:(NSDate *)anotherDate
{
  double v5;
  double v6;
  double v7;

  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  v6 = v5;
  if (anotherDate)
    -[NSDate timeIntervalSinceReferenceDate](anotherDate, "timeIntervalSinceReferenceDate");
  else
    v7 = NAN;
  if (v6 <= v7)
    return self;
  else
    return anotherDate;
}

+ (NSDate)dateWithTimeInterval:(NSTimeInterval)secsToBeAdded sinceDate:(NSDate *)date
{
  double v6;
  double v7;

  if (date)
  {
    -[NSDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
    v7 = v6;
  }
  else
  {
    v7 = NAN;
  }
  return (NSDate *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithTimeIntervalSinceReferenceDate:", v7 + secsToBeAdded);
}

+ (NSDate)dateWithTimeIntervalSinceNow:(NSTimeInterval)secs
{
  id v4;
  timespec __tp;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc((Class)a1);
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return (NSDate *)(id)objc_msgSend(v4, "initWithTimeIntervalSinceReferenceDate:", (double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001 + secs);
}

+ (NSDate)now
{
  NSDate *v2;
  timespec __tp;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = [NSDate alloc];
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return -[NSDate initWithTimeIntervalSinceReferenceDate:](v2, "initWithTimeIntervalSinceReferenceDate:", (double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001);
}

+ (NSDate)dateWithTimeIntervalSince1970:(NSTimeInterval)secs
{
  return (NSDate *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithTimeIntervalSinceReferenceDate:", secs + -978307200.0);
}

- (NSTimeInterval)timeIntervalSinceNow
{
  double v2;
  double v3;
  timespec __tp;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  v3 = v2;
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return v3 - ((double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001);
}

- (NSDate)laterDate:(NSDate *)anotherDate
{
  double v5;
  double v6;
  double v7;

  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  v6 = v5;
  if (anotherDate)
    -[NSDate timeIntervalSinceReferenceDate](anotherDate, "timeIntervalSinceReferenceDate");
  else
    v7 = NAN;
  if (v6 >= v7)
    return self;
  else
    return anotherDate;
}

- (NSTimeInterval)timeIntervalSince1970
{
  double v2;

  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  return v2 + 978307200.0;
}

- (NSDate)dateByAddingTimeInterval:(NSTimeInterval)ti
{
  double v4;

  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  return (NSDate *)objc_msgSend((id)objc_opt_class(), "dateWithTimeIntervalSinceReferenceDate:", v4 + ti);
}

- (BOOL)isEqualToDate:(NSDate *)otherDate
{
  double v4;
  double v5;
  double v6;

  if (!otherDate)
    return 0;
  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  v5 = v4;
  -[NSDate timeIntervalSinceReferenceDate](otherDate, "timeIntervalSinceReferenceDate");
  return v5 == v6;
}

+ (NSDate)date
{
  id v2;
  timespec __tp;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)a1);
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return (NSDate *)(id)objc_msgSend(v2, "initWithTimeIntervalSinceReferenceDate:", (double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001);
}

+ (NSDate)dateWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti
{
  return (NSDate *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithTimeIntervalSinceReferenceDate:", ti);
}

+ (NSDate)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSDate == a1)
    return (NSDate *)&___immutablePlaceholderDate;
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSDate;
  return (NSDate *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSComparisonResult)compare:(NSDate *)other
{
  double v4;
  double v5;
  double v6;

  if (self == other)
    return 0;
  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  v5 = v4;
  if (other)
    -[NSDate timeIntervalSinceReferenceDate](other, "timeIntervalSinceReferenceDate");
  else
    v6 = NAN;
  if (v5 < v6)
    return -1;
  else
    return (unint64_t)(v5 > v6);
}

- (NSTimeInterval)timeIntervalSinceDate:(NSDate *)anotherDate
{
  double v4;
  double v5;
  double v6;

  -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  v5 = v4;
  if (anotherDate)
    -[NSDate timeIntervalSinceReferenceDate](anotherDate, "timeIntervalSinceReferenceDate");
  else
    v6 = NAN;
  return v5 - v6;
}

+ (NSDate)distantPast
{
  return (NSDate *)&_NSConstantDateDistantPast;
}

- (NSString)descriptionWithLocale:(id)locale
{
  CFTypeID v5;
  const __CFLocale *v6;
  NSString *v7;
  BOOL v8;
  char v9;
  __CFDateFormatter *v10;
  int v11;
  const __CFLocale *v12;
  CFTimeZoneRef v13;
  CFTimeZoneRef v14;
  BOOL v15;
  __CFDateFormatter *v16;
  char v17;
  CFTypeRef v18;
  CFTypeRef v19;

  if (!locale)
  {
    v6 = CFLocaleCopyCurrent();
    os_unfair_lock_lock_with_options();
    v8 = (const __CFLocale *)descriptionWithLocale__cached_loc != v6 || descriptionWithLocale__cached_df == 0;
    v9 = !v8;
    if (!v8)
    {
      v10 = (__CFDateFormatter *)CFRetain((CFTypeRef)descriptionWithLocale__cached_df);
      os_unfair_lock_unlock((os_unfair_lock_t)&descriptionWithLocale__lock);
      if (!v10)
      {
        v7 = 0;
        goto LABEL_44;
      }
      v11 = 0;
      goto LABEL_25;
    }
    v11 = ++descriptionWithLocale__changeCounter;
    os_unfair_lock_unlock((os_unfair_lock_t)&descriptionWithLocale__lock);
    v13 = CFTimeZoneCreateWithTimeIntervalFromGMT((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0.0);
    v14 = v13;
    if (v13)
      v15 = v6 == 0;
    else
      v15 = 1;
    if (v15)
    {
      if (!v13)
        goto LABEL_28;
    }
    else
    {
      v16 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v6, kCFDateFormatterFullStyle, kCFDateFormatterFullStyle);
      if (v16)
      {
        v10 = v16;
        CFDateFormatterSetProperty(v16, CFSTR("kCFDateFormatterTimeZoneKey"), v14);
        CFDateFormatterSetFormat(v10, CFSTR("uuuu-MM-dd HH:mm:ss '+0000'"));
        CFRelease(v14);
LABEL_25:
        CFDateFormatterCreateStringWithDate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v10, (CFDateRef)self);
        v7 = (NSString *)_CFAutoreleasePoolAddObject();
        if ((v9 & 1) != 0)
          goto LABEL_43;
        v17 = 0;
LABEL_29:
        os_unfair_lock_lock_with_options();
        if (descriptionWithLocale__changeCounter == v11)
        {
          if (descriptionWithLocale__cached_loc)
            CFRelease((CFTypeRef)descriptionWithLocale__cached_loc);
          if (v6)
            v18 = CFRetain(v6);
          else
            v18 = 0;
          descriptionWithLocale__cached_loc = (uint64_t)v18;
          if (descriptionWithLocale__cached_df)
            CFRelease((CFTypeRef)descriptionWithLocale__cached_df);
          if ((v17 & 1) != 0)
            v19 = 0;
          else
            v19 = CFRetain(v10);
          descriptionWithLocale__cached_df = (uint64_t)v19;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&descriptionWithLocale__lock);
        if ((v17 & 1) != 0)
        {
LABEL_44:
          if (!v6)
            goto LABEL_46;
          goto LABEL_45;
        }
LABEL_43:
        CFRelease(v10);
        goto LABEL_44;
      }
    }
    CFRelease(v14);
LABEL_28:
    v7 = 0;
    v10 = 0;
    v17 = 1;
    goto LABEL_29;
  }
  v5 = CFGetTypeID(locale);
  if (v5 != CFLocaleGetTypeID())
  {
    v12 = CFLocaleCopyCurrent();
    v6 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v12, kCFDateFormatterFullStyle, kCFDateFormatterFullStyle);
    CFRelease(v12);
    if (v6)
      goto LABEL_4;
LABEL_15:
    v7 = 0;
    goto LABEL_46;
  }
  v6 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)locale, kCFDateFormatterFullStyle, kCFDateFormatterFullStyle);
  if (!v6)
    goto LABEL_15;
LABEL_4:
  CFDateFormatterCreateStringWithDate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v6, (CFDateRef)self);
  v7 = (NSString *)_CFAutoreleasePoolAddObject();
LABEL_45:
  CFRelease(v6);
LABEL_46:
  if (v7)
    return v7;
  else
    return (NSString *)CFSTR("<description unavailable>");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSTimeInterval)timeIntervalSinceReferenceDate
{
  timespec __tp;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return (double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001;
}

- (unint64_t)_cfTypeID
{
  return 42;
}

- (NSDate)initWithTimeIntervalSince1970:(NSTimeInterval)secs
{
  return -[NSDate initWithTimeIntervalSinceReferenceDate:](self, "initWithTimeIntervalSinceReferenceDate:", secs + -978307200.0);
}

+ (NSDate)dateWithDate:(id)a3
{
  double v4;
  double v5;

  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v5 = v4;
  }
  else
  {
    v5 = NAN;
  }
  return (NSDate *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithTimeIntervalSinceReferenceDate:", v5);
}

- (NSDate)initWithDate:(id)a3
{
  double v4;

  if (a3)
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  else
    v4 = NAN;
  return -[NSDate initWithTimeIntervalSinceReferenceDate:](self, "initWithTimeIntervalSinceReferenceDate:", v4);
}

+ (id)dateWithString:(NSString *)aString
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", aString);
}

- (id)initWithString:(NSString *)description
{
  NSDate *v5;
  const char *v6;
  const char *v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  _BYTE *v12;
  uint64_t v13;
  int v14;
  int v15;
  _BYTE *v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  _BYTE *v21;
  uint64_t v22;
  int v23;
  int v24;
  _BYTE *v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  _BYTE *v30;
  uint64_t v31;
  int v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  unsigned __int8 *v39;
  int v40;
  NSCalendar *v41;
  NSDate *v42;

  v5 = (NSDate *)objc_opt_new();
  v6 = -[NSString UTF8String](description, "UTF8String");
  if (!v6)
    goto LABEL_60;
  v7 = v6;
  v8 = *(unsigned __int8 *)v6;
  if ((v8 - 48) > 9)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    do
    {
      v10 = *(unsigned __int8 *)++v7;
      v9 = (v8 - 48) + 10 * v9;
      v8 = v10;
    }
    while ((v10 - 48) < 0xA);
  }
  -[NSDate setYear:](v5, "setYear:", v9);
  if (!*v7)
    goto LABEL_60;
  v12 = v7 + 1;
  v11 = *((unsigned __int8 *)v7 + 1);
  if ((v11 - 48) > 9)
  {
    v13 = 0;
  }
  else
  {
    v13 = 0;
    do
    {
      v13 = (v11 - 48) + 10 * v13;
      v14 = *++v12;
      v11 = v14;
    }
    while ((v14 - 48) < 0xA);
    v7 = v12 - 1;
  }
  -[NSDate setMonth:](v5, "setMonth:", v13);
  if (!*v12)
    goto LABEL_60;
  v17 = *((unsigned __int8 *)v7 + 2);
  v16 = v7 + 2;
  v15 = v17;
  if ((v17 - 48) > 9)
  {
    v18 = 0;
  }
  else
  {
    v18 = 0;
    do
    {
      v19 = *++v16;
      v18 = (v15 - 48) + 10 * v18;
      v15 = v19;
    }
    while ((v19 - 48) < 0xA);
  }
  -[NSDate setDay:](v5, "setDay:", v18);
  if (!*v16)
    goto LABEL_60;
  v21 = v16 + 1;
  v20 = v16[1];
  if ((v20 - 48) > 9)
  {
    v22 = 0;
  }
  else
  {
    v22 = 0;
    do
    {
      v22 = (v20 - 48) + 10 * v22;
      v23 = *++v21;
      v20 = v23;
    }
    while ((v23 - 48) < 0xA);
    v16 = v21 - 1;
  }
  -[NSDate setHour:](v5, "setHour:", v22);
  if (!*v21)
    goto LABEL_60;
  v26 = v16[2];
  v25 = v16 + 2;
  v24 = v26;
  if ((v26 - 48) > 9)
  {
    v27 = 0;
  }
  else
  {
    v27 = 0;
    do
    {
      v28 = *++v25;
      v27 = (v24 - 48) + 10 * v27;
      v24 = v28;
    }
    while ((v28 - 48) < 0xA);
  }
  -[NSDate setMinute:](v5, "setMinute:", v27);
  if (!*v25)
    goto LABEL_60;
  v30 = v25 + 1;
  v29 = v25[1];
  if ((v29 - 48) > 9)
  {
    v31 = 0;
  }
  else
  {
    v31 = 0;
    do
    {
      v31 = (v29 - 48) + 10 * v31;
      v32 = *++v30;
      v29 = v32;
    }
    while ((v32 - 48) < 0xA);
    v25 = v30 - 1;
  }
  -[NSDate setSecond:](v5, "setSecond:", v31);
  if (!*v30
    || _CFAppVersionCheck(CFSTR("com.apple.ist.Radar"), 0)
    && -[NSString hasSuffix:](description, "hasSuffix:", CFSTR("GMT")))
  {
    goto LABEL_60;
  }
  if (!strncmp("GMT", v25 + 2, 3uLL))
  {
    v33 = v25[5];
    if (v33 <= 0x2A)
    {
      v36 = 0;
      if (v25[5] && v33 != 32)
        goto LABEL_60;
      goto LABEL_57;
    }
    v34 = 5;
    if (v33 != 45 && v33 != 43)
      goto LABEL_60;
  }
  else
  {
    v33 = v25[2];
    v34 = 2;
  }
  if (v33 == 45)
  {
    v35 = -60;
  }
  else
  {
    if ((char)v33 != 43)
    {
LABEL_60:

      v42 = 0;
      goto LABEL_61;
    }
    v35 = 60;
  }
  v37 = v25[v34 + 1];
  if ((v37 - 48) > 9)
  {
    v38 = 0;
  }
  else
  {
    v38 = 0;
    v39 = &v25[v34 + 2];
    do
    {
      v38 = (v37 - 48) + 10 * v38;
      v40 = *v39++;
      v37 = v40;
    }
    while ((v40 - 48) < 0xA);
    if (v38 > 1600)
      goto LABEL_60;
  }
  v36 = v35 * (v38 % 100 + 60 * (v38 / 100));
LABEL_57:
  v41 = -[NSCalendar initWithCalendarIdentifier:]([NSCalendar alloc], "initWithCalendarIdentifier:", CFSTR("gregorian"));
  -[NSCalendar setTimeZone:](v41, "setTimeZone:", +[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", v36));
  -[NSDate timeIntervalSinceReferenceDate](-[NSCalendar dateFromComponents:](v41, "dateFromComponents:", v5), "timeIntervalSinceReferenceDate");
  v42 = -[NSDate initWithTimeIntervalSinceReferenceDate:](self, "initWithTimeIntervalSinceReferenceDate:");
  self = v5;
LABEL_61:

  return v42;
}

- (NSDate)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (BOOL)isInToday
{
  return -[NSCalendar isDateInToday:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "isDateInToday:", self);
}

- (BOOL)isInTomorrow
{
  return -[NSCalendar isDateInTomorrow:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "isDateInTomorrow:", self);
}

- (BOOL)isInYesterday
{
  return -[NSCalendar isDateInYesterday:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "isDateInYesterday:", self);
}

- (BOOL)isInSameDayAsDate:(id)a3
{
  return -[NSCalendar isDate:inSameDayAsDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "isDate:inSameDayAsDate:", self, a3);
}

- (BOOL)isEqual:(id)a3 toUnitGranularity:(unint64_t)a4
{
  return -[NSCalendar compareDate:toDate:toUnitGranularity:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "compareDate:toDate:toUnitGranularity:", self, a3, a4) == NSOrderedSame;
}

- (int64_t)compare:(id)a3 toUnitGranularity:(unint64_t)a4
{
  if (self == a3)
    return 0;
  else
    return -[NSCalendar compareDate:toDate:toUnitGranularity:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "compareDate:toDate:toUnitGranularity:", self, a3, a4);
}

- (NSTimeInterval)timeIntervalSinceReferenceDate
{
  objc_class *v2;

  v2 = __CFLookUpClass("NSDate");
  OUTLINED_FUNCTION_0_16(v2);
}

- (NSDate)initWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti
{
  objc_class *v3;

  v3 = __CFLookUpClass("NSDate");
  OUTLINED_FUNCTION_0_16(v3);
}

@end
