@implementation NSCalendarDate

- (NSCalendarDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  self->_timeIntervalSinceReferenceDate = a3;
  if (!self->_timeZone)
    self->_timeZone = (NSTimeZone *)(id)objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  if (!self->_formatString)
    self->_formatString = (NSString *)CFSTR("%Y-%m-%d %H:%M:%S %z");
  return self;
}

- (NSInteger)secondOfMinute
{
  double timeIntervalSinceReferenceDate;
  uint64_t v3;
  double v4;

  timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  v3 = -[NSTimeZone secondsFromGMTForDate:](self->_timeZone, "secondsFromGMTForDate:", self);
  v4 = timeIntervalSinceReferenceDate + (double)v3 - floor((timeIntervalSinceReferenceDate + (double)v3) / 60.0) * 60.0;
  if ((uint64_t)v4 >= 0)
    return (uint64_t)v4;
  else
    return (uint64_t)v4 + 60;
}

- (double)timeIntervalSinceReferenceDate
{
  return self->_timeIntervalSinceReferenceDate;
}

- (NSCalendarDate)init
{
  return -[NSCalendarDate initWithTimeIntervalSinceReferenceDate:](self, "initWithTimeIntervalSinceReferenceDate:", CFAbsoluteTimeGetCurrent());
}

- (void)release
{
  NSCalendarDate *v3;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if ((release_do_check & 1) == 0)
  {
    if (_CFAppVersionCheckLessThan()
      || _CFAppVersionCheckLessThan()
      || _CFAppVersionCheckLessThan())
    {
      v3 = self;
    }
    else
    {
      release_do_check = 1;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NSCalendarDate;
  -[NSCalendarDate release](&v4, sel_release);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSCalendarDate;
  -[NSCalendarDate dealloc](&v3, sel_dealloc);
}

- (id)initWithString:(NSString *)description
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSCalendarDate;
  return -[NSCalendarDate initWithString:](&v4, sel_initWithString_, description);
}

+ (NSCalendarDate)distantFuture
{
  id v2;

  v2 = objc_allocWithZone((Class)a1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture"), "timeIntervalSinceReferenceDate");
  return (NSCalendarDate *)(id)objc_msgSend(v2, "initWithTimeIntervalSinceReferenceDate:");
}

+ (NSCalendarDate)distantPast
{
  id v2;

  v2 = objc_allocWithZone((Class)a1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"), "timeIntervalSinceReferenceDate");
  return (NSCalendarDate *)(id)objc_msgSend(v2, "initWithTimeIntervalSinceReferenceDate:");
}

- (id)initWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second timeZone:(NSTimeZone *)aTimeZone
{
  SInt8 v9;
  SInt8 v10;
  SInt8 v11;
  SInt8 v12;
  SInt32 v13;
  NSTimeZone *v15;
  double v16;
  CFGregorianDate v18;

  v9 = minute;
  v10 = hour;
  v11 = day;
  v12 = month;
  v13 = year;
  v15 = aTimeZone;
  v16 = (double)second;
  if (!aTimeZone)
    v15 = (NSTimeZone *)objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v18.hour = v10;
  v18.minute = v9;
  v18.day = v11;
  v18.month = v12;
  v18.year = v13;
  v18.second = v16;
  self->_timeIntervalSinceReferenceDate = CFGregorianDateGetAbsoluteTime(v18, (CFTimeZoneRef)v15);
  self->_timeZone = v15;
  if (!self->_formatString)
    self->_formatString = (NSString *)CFSTR("%Y-%m-%d %H:%M:%S %z");
  return self;
}

+ (id)calendarDate
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "init");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTimeIntervalSinceReferenceDate:", self->_timeIntervalSinceReferenceDate);
  objc_msgSend(v4, "setTimeZone:", self->_timeZone);
  objc_msgSend(v4, "setCalendarFormat:", self->_formatString);
  return v4;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(NSTimeZone *)aTimeZone
{
  NSTimeZone *v3;
  NSTimeZone *v5;

  v3 = aTimeZone;
  if (!aTimeZone)
    v3 = (NSTimeZone *)objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v5 = v3;

  self->_timeZone = v3;
}

- (NSString)calendarFormat
{
  return self->_formatString;
}

- (void)setCalendarFormat:(NSString *)format
{
  NSString *v5;
  NSString *v6;

  v5 = self->_formatString;
  if (format)
    v6 = -[NSString copyWithZone:](format, "copyWithZone:", 0);
  else
    v6 = (NSString *)CFSTR("%Y-%m-%d %H:%M:%S %z");
  self->_formatString = v6;
}

- (NSInteger)dayOfCommonEra
{
  double timeIntervalSinceReferenceDate;

  timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  return (uint64_t)((timeIntervalSinceReferenceDate
                  + (double)-[NSTimeZone secondsFromGMTForDate:](self->_timeZone, "secondsFromGMTForDate:", self))
                 / 86400.0
                 + 730486.0);
}

- (NSInteger)yearOfCommonEra
{
  return CFAbsoluteTimeGetGregorianDate(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone).year;
}

- (NSInteger)monthOfYear
{
  return (uint64_t)((unint64_t)*(_OWORD *)&CFAbsoluteTimeGetGregorianDate(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone) << 24) >> 56;
}

- (NSInteger)dayOfMonth
{
  return (uint64_t)((unint64_t)*(_OWORD *)&CFAbsoluteTimeGetGregorianDate(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone) << 16) >> 56;
}

- (NSInteger)dayOfWeek
{
  return CFAbsoluteTimeGetDayOfWeek(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone) % 7;
}

- (NSInteger)dayOfYear
{
  return CFAbsoluteTimeGetDayOfYear(self->_timeIntervalSinceReferenceDate, (CFTimeZoneRef)self->_timeZone);
}

- (NSInteger)hourOfDay
{
  double timeIntervalSinceReferenceDate;
  uint64_t v3;
  double v4;

  timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  v3 = -[NSTimeZone secondsFromGMTForDate:](self->_timeZone, "secondsFromGMTForDate:", self);
  v4 = (timeIntervalSinceReferenceDate + (double)v3) / 3600.0
     - floor((timeIntervalSinceReferenceDate + (double)v3) / 3600.0 / 24.0) * 24.0;
  if ((uint64_t)v4 >= 0)
    return (uint64_t)v4;
  else
    return (uint64_t)v4 + 24;
}

- (NSInteger)minuteOfHour
{
  double timeIntervalSinceReferenceDate;
  uint64_t v3;
  double v4;

  timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  v3 = -[NSTimeZone secondsFromGMTForDate:](self->_timeZone, "secondsFromGMTForDate:", self);
  v4 = (timeIntervalSinceReferenceDate + (double)v3) / 60.0
     - floor((timeIntervalSinceReferenceDate + (double)v3) / 60.0 / 60.0) * 60.0;
  if ((uint64_t)v4 >= 0)
    return (uint64_t)v4;
  else
    return (uint64_t)v4 + 60;
}

- (int64_t)microsecondOfSecond
{
  return (uint64_t)((self->_timeIntervalSinceReferenceDate - floor(self->_timeIntervalSinceReferenceDate)) * 1000000.0
                 + 0.5);
}

+ (id)dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second timeZone:(NSTimeZone *)aTimeZone
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithYear:month:day:hour:minute:second:timeZone:", year, month, day, hour, minute, second, aTimeZone);
}

- (NSCalendarDate)dateByAddingYears:(NSInteger)year months:(NSInteger)month days:(NSInteger)day hours:(NSInteger)hour minutes:(NSInteger)minute seconds:(NSInteger)second
{
  double timeIntervalSinceReferenceDate;
  NSTimeZone *timeZone;
  double v11;
  void *v12;
  CFGregorianUnits units;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  timeZone = self->_timeZone;
  units.years = year;
  units.months = month;
  units.days = day;
  units.hours = hour;
  units.minutes = minute;
  *(&units.minutes + 1) = 0;
  units.seconds = (double)second;
  v11 = CFAbsoluteTimeAddGregorianUnits(timeIntervalSinceReferenceDate, (CFTimeZoneRef)timeZone, &units);
  v12 = (void *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithTimeIntervalSinceReferenceDate:", v11);
  objc_msgSend(v12, "setTimeZone:", self->_timeZone);
  objc_msgSend(v12, "setCalendarFormat:", self->_formatString);
  return (NSCalendarDate *)v12;
}

- (void)years:(NSInteger *)yp months:(NSInteger *)mop days:(NSInteger *)dp hours:(NSInteger *)hp minutes:(NSInteger *)mip seconds:(NSInteger *)sp sinceDate:(NSCalendarDate *)date
{
  CFOptionFlags v16;
  double timeIntervalSinceReferenceDate;
  CFAbsoluteTime v18;
  void *v19;
  CFGregorianUnits v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!date)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: sinceDate: argument cannot be nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v19);
  }
  v16 = (yp != 0) | (2 * (mop != 0)) | (4 * (dp != 0)) | (8 * (hp != 0)) | (16 * (mip != 0)) | (32 * (sp != 0));
  timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
  -[NSCalendarDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
  CFAbsoluteTimeGetDifferenceAsGregorianUnits(&v20, timeIntervalSinceReferenceDate, v18, (CFTimeZoneRef)self->_timeZone, v16);
  if (yp)
    *yp = v20.years;
  if (mop)
    *mop = v20.months;
  if (dp)
    *dp = v20.days;
  if (hp)
    *hp = v20.hours;
  if (mip)
    *mip = v20.minutes;
  if (sp)
    *sp = (uint64_t)v20.seconds;
}

- (id)addTimeInterval:(double)a3
{
  double v5;
  NSCalendarDate *v6;

  -[NSCalendarDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
  v6 = +[NSCalendarDate dateWithTimeIntervalSinceReferenceDate:](NSCalendarDate, "dateWithTimeIntervalSinceReferenceDate:", v5 + a3);
  -[NSCalendarDate setTimeZone:](v6, "setTimeZone:", self->_timeZone);
  -[NSCalendarDate setCalendarFormat:](v6, "setCalendarFormat:", self->_formatString);
  return v6;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    -[NSCalendarDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.time"));
    objc_msgSend(a3, "encodeObject:forKey:", -[NSCalendarDate timeZone](self, "timeZone"), CFSTR("NS.timezone"));
    objc_msgSend(a3, "encodeObject:forKey:", -[NSCalendarDate calendarFormat](self, "calendarFormat"), CFSTR("NS.format"));
  }
  else
  {
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "d", &self->_timeIntervalSinceReferenceDate);
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "@", &self->_timeZone);
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "@", &self->_formatString);
  }
}

- (NSCalendarDate)initWithCoder:(id)a3
{
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  NSCalendarDate *v9;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = 0.0;
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.time")))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NS.time"));
      v5 = v6;
    }
    v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.timezone"));
    v8 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.format"));
    if (objc_msgSend(a3, "error"))
    {
      return 0;
    }
    else
    {
      v9 = -[NSCalendarDate initWithTimeIntervalSinceReferenceDate:](self, "initWithTimeIntervalSinceReferenceDate:", v5);
      self = v9;
      if (v9)
      {
        -[NSCalendarDate setTimeZone:](v9, "setTimeZone:", v7);
        -[NSCalendarDate setCalendarFormat:](self, "setCalendarFormat:", v8);
      }
    }
  }
  else
  {
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "d", &self->_timeIntervalSinceReferenceDate, 8);
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "@", &self->_timeZone, 8);
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "@", &self->_formatString, 8);
  }
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return -[NSCalendarDate descriptionWithCalendarFormat:locale:](self, "descriptionWithCalendarFormat:locale:", self->_formatString, 0);
}

- (NSString)descriptionWithLocale:(id)locale
{
  return -[NSCalendarDate descriptionWithCalendarFormat:locale:](self, "descriptionWithCalendarFormat:locale:", self->_formatString, locale);
}

- (NSString)descriptionWithCalendarFormat:(NSString *)format
{
  return -[NSCalendarDate descriptionWithCalendarFormat:locale:](self, "descriptionWithCalendarFormat:locale:", format, 0);
}

- (id)initWithString:(NSString *)description calendarFormat:(NSString *)format
{
  return -[NSCalendarDate initWithString:calendarFormat:locale:](self, "initWithString:calendarFormat:locale:", description, format, 0);
}

+ (id)dateWithString:(NSString *)description calendarFormat:(NSString *)format
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithString:calendarFormat:locale:", description, format, 0);
}

+ (id)dateWithString:(NSString *)description calendarFormat:(NSString *)format locale:(id)locale
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithString:calendarFormat:locale:", description, format, locale);
}

- (NSString)descriptionWithCalendarFormat:(NSString *)format locale:(id)locale
{
  NSString *v5;
  NSUInteger v6;
  NSCharacterSet *v7;
  NSCharacterSet *v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  _BOOL4 v15;
  BOOL v16;
  int v17;
  NSInteger v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  NSString *v23;
  double v24;
  double v25;
  double v26;
  int64_t v27;
  int v28;
  uint64_t v29;
  NSInteger v30;
  NSInteger v31;
  NSInteger v32;
  id v33;
  uint64_t v34;
  BOOL v35;
  const __CFString *v36;
  NSInteger v37;
  void *v38;
  void *v39;
  NSString *v40;
  NSString *v41;
  const __CFString *v42;
  uint64_t v43;
  NSInteger v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSInteger v48;
  void *v49;
  void *v50;
  const __CFLocale *v51;
  __CFDateFormatter *v52;
  CFAbsoluteTime v53;
  CFStringRef StringWithAbsoluteTime;
  uint64_t v55;
  const __CFString *v56;
  unint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const __CFAllocator *allocator;
  _WORD v72[3];
  char __str[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = (NSString *)(id)objc_msgSend(objc_allocWithZone((Class)NSMutableString), "init");
  v6 = -[NSString length](format, "length");
  v7 = +[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet");
  if (v6)
  {
    v8 = v7;
    v9 = 0;
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      v10 = -[NSString rangeOfString:options:range:](format, "rangeOfString:options:range:", CFSTR("%"), 0, v9, v6 - v9);
      v12 = v11;
      if (v11)
        v13 = v10;
      else
        v13 = v6;
      if (v13 > v9)
        -[NSString replaceCharactersInRange:withString:](v5, "replaceCharactersInRange:withString:", -[NSString length](v5, "length"), 0, -[NSString substringWithRange:](format, "substringWithRange:", v9, v13 - v9));
      v9 = v13 + v12;
      if (v12)
      {
        v14 = v13 + v12;
        if (v9 >= v6)
        {
          __str[0] = 0;
        }
        else
        {
          while (1)
          {
            v15 = -[NSCharacterSet characterIsMember:](v8, "characterIsMember:", -[NSString characterAtIndex:](format, "characterAtIndex:", v14));
            v16 = v15;
            if (!v15)
              break;
            if (++v14 >= v6)
            {
              v14 = v6;
              goto LABEL_15;
            }
          }
          if (v9 >= v14)
          {
            __str[0] = 0;
            goto LABEL_18;
          }
LABEL_15:
          snprintf(__str, 0x80uLL, "%%%sd", -[NSString UTF8String](-[NSString substringWithRange:](format, "substringWithRange:", v9, v14 - v9), "UTF8String"));
          v9 = v14;
          if (v16)
            continue;
LABEL_18:
          v9 = v14 + 1;
          v17 = -[NSString characterAtIndex:](format, "characterAtIndex:", v14);
          switch(v17)
          {
            case 'A':
              v18 = -[NSCalendarDate dayOfWeek](self, "dayOfWeek");
              v19 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("NSWeekDayNameArray"));
              v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Sunday"), CFSTR("Monday"), CFSTR("Tuesday"), CFSTR("Wednesday"), CFSTR("Thursday"), CFSTR("Friday"), CFSTR("Saturday"), 0, v64, v65, v66, v67, v68);
              goto LABEL_45;
            case 'B':
              v18 = -[NSCalendarDate monthOfYear](self, "monthOfYear") - 1;
              v19 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("NSMonthNameArray"));
              v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("January"), CFSTR("February"), CFSTR("March"), CFSTR("April"), CFSTR("May"), CFSTR("June"), CFSTR("July"), CFSTR("August"), CFSTR("September"), CFSTR("October"), CFSTR("November"), CFSTR("December"), 0);
              goto LABEL_45;
            case 'C':
            case 'D':
            case 'E':
            case 'G':
            case 'J':
            case 'K':
            case 'L':
            case 'N':
            case 'O':
            case 'P':
            case 'Q':
            case 'R':
            case 'T':
            case 'U':
            case 'V':
            case 'W':
            case '[':
            case '\\':
            case ']':
            case '^':
            case '_':
            case 'f':
            case 'g':
            case 'h':
            case 'k':
            case 'l':
LABEL_24:
              v21 = -[NSString length](v5, "length");
              v22 = v5;
              v23 = (NSString *)CFSTR("?");
              goto LABEL_65;
            case 'F':
              -[NSCalendarDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
              v25 = v24;
              -[NSCalendarDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
              v27 = vcvtmd_s64_f64((v25 - floor(v26)) * 1000.0);
              v28 = 5243
                  * (__int16)(v27
                            - 1000
                            * (((unint64_t)((unsigned __int128)(v27 * (__int128)0x20C49BA5E353F7CFLL) >> 64) >> 63)
                             + (((unsigned __int128)(v27 * (__int128)0x20C49BA5E353F7CFLL) >> 64) >> 7)));
              v72[0] = (v28 >> 19) + (v28 >> 31) + 48;
              v29 = ((unsigned __int128)(v27 * (__int128)(uint64_t)0xA3D70A3D70A3D70BLL) >> 64) + v27;
              LODWORD(v29) = 103 * (char)(v27 - 100 * ((v29 < 0) + (v29 >> 6)));
              v72[1] = (((v29 & 0x8000) != 0) + (v29 >> 10) + 48);
              v72[2] = v27
                     - 10
                     * (((unint64_t)((unsigned __int128)(v27 * (__int128)0x6666666666666667) >> 64) >> 63)
                      + (((unsigned __int128)(v27 * (__int128)0x6666666666666667) >> 64) >> 2))
                     + 48;
              -[NSString replaceCharactersInRange:withCharacters:length:](v5, "replaceCharactersInRange:withCharacters:length:", -[NSString length](v5, "length"), 0, v72, 3);
              break;
            case 'H':
              v30 = -[NSCalendarDate hourOfDay](self, "hourOfDay");
              goto LABEL_54;
            case 'I':
              v31 = -[NSCalendarDate hourOfDay](self, "hourOfDay");
              if (v31 % 12)
                v32 = v31 % 12;
              else
                v32 = 12;
              goto LABEL_55;
            case 'M':
              v30 = -[NSCalendarDate minuteOfHour](self, "minuteOfHour");
              goto LABEL_54;
            case 'S':
              v30 = -[NSCalendarDate secondOfMinute](self, "secondOfMinute");
              goto LABEL_54;
            case 'X':
              v33 = locale;
              v34 = objc_msgSend(locale, "objectForKey:", CFSTR("NSTimeDateFormatString"));
              v35 = v34 == 0;
              v36 = CFSTR("%H:%M:%S %Z");
              goto LABEL_61;
            case 'Y':
              v37 = -[NSCalendarDate yearOfCommonEra](self, "yearOfCommonEra");
              v38 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("AppleLocale"));
              if (!v38)
                goto LABEL_38;
              v39 = v38;
              if (objc_msgSend(v38, "isEqualToString:", CFSTR("ja_JP_TRADITIONAL")))
              {
LABEL_70:
                v51 = CFLocaleCreate(0, CFSTR("ja_JP_TRADITIONAL"));
                v52 = CFDateFormatterCreate(allocator, v51, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
                CFDateFormatterSetFormat(v52, CFSTR("Gy"));
                -[NSCalendarDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
                StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(allocator, v52, v53);
                -[NSString replaceCharactersInRange:withString:](v5, "replaceCharactersInRange:withString:", -[NSString length](v5, "length"), 0, StringWithAbsoluteTime);
                CFRelease(v51);
                CFRelease(v52);
                CFRelease(StringWithAbsoluteTime);
              }
              else
              {
                if (objc_msgSend(v39, "isEqualToString:", CFSTR("th_TH_TRADITIONAL")))
                  v37 += 543;
LABEL_38:
                v40 = v5;
                v32 = v37;
LABEL_58:
                v45 = "%ld";
LABEL_59:
                appendNumber(v40, v32, __str, v45);
              }
              break;
            case 'Z':
              v41 = -[NSTimeZone name](-[NSCalendarDate timeZone](self, "timeZone"), "name");
              if (v41)
                v42 = (const __CFString *)v41;
              else
                v42 = &stru_1E0F56070;
              -[NSString appendString:](v5, "appendString:", v42);
              break;
            case 'a':
              v18 = -[NSCalendarDate dayOfWeek](self, "dayOfWeek");
              v19 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("NSShortWeekDayNameArray"));
              v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Sun"), CFSTR("Mon"), CFSTR("Tue"), CFSTR("Wed"), CFSTR("Thu"), CFSTR("Fri"), CFSTR("Sat"), 0, v64, v65, v66, v67, v68);
              goto LABEL_45;
            case 'b':
              v18 = -[NSCalendarDate monthOfYear](self, "monthOfYear") - 1;
              v19 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("NSShortMonthNameArray"));
              v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Jan"), CFSTR("Feb"), CFSTR("Mar"), CFSTR("Apr"), CFSTR("May"), CFSTR("Jun"), CFSTR("Jul"), CFSTR("Aug"), CFSTR("Sep"), CFSTR("Oct"), CFSTR("Nov"), CFSTR("Dec"), 0);
LABEL_45:
              if (!v19)
                v19 = (void *)v20;
              v43 = -[NSString length](v5, "length");
              v23 = (NSString *)objc_msgSend(v19, "objectAtIndex:", v18);
              v22 = v5;
              v21 = v43;
              goto LABEL_65;
            case 'c':
              v33 = locale;
              v34 = objc_msgSend(locale, "objectForKey:", CFSTR("NSTimeDateFormatString"));
              v35 = v34 == 0;
              v36 = CFSTR("%a %b %d %H:%M:%S %Z %Y");
LABEL_61:
              if (v35)
                v46 = (uint64_t)v36;
              else
                v46 = v34;
              v47 = -[NSString length](v5, "length");
              v23 = -[NSCalendarDate descriptionWithCalendarFormat:locale:](self, "descriptionWithCalendarFormat:locale:", v46, v33);
              v22 = v5;
              v21 = v47;
LABEL_65:
              -[NSString replaceCharactersInRange:withString:](v22, "replaceCharactersInRange:withString:", v21, 0, v23);
              break;
            case 'd':
              v30 = -[NSCalendarDate dayOfMonth](self, "dayOfMonth");
              goto LABEL_54;
            case 'e':
              v44 = -[NSCalendarDate dayOfMonth](self, "dayOfMonth");
LABEL_57:
              v32 = v44;
              v40 = v5;
              goto LABEL_58;
            case 'i':
              v32 = -[NSCalendarDate hourOfDay](self, "hourOfDay") % 12;
              goto LABEL_55;
            case 'j':
              v32 = -[NSCalendarDate dayOfYear](self, "dayOfYear");
              v40 = v5;
              v45 = "%03ld";
              goto LABEL_59;
            case 'm':
              v30 = -[NSCalendarDate monthOfYear](self, "monthOfYear");
LABEL_54:
              v32 = v30;
              goto LABEL_55;
            default:
              switch(v17)
              {
                case 'p':
                  v18 = -[NSCalendarDate hourOfDay](self, "hourOfDay") > 11;
                  v19 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("NSAMPMDesignation"));
                  v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AM"), CFSTR("PM"), 0, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68);
                  goto LABEL_45;
                case 'q':
                case 'r':
                case 's':
                case 't':
                case 'u':
                case 'v':
                  goto LABEL_24;
                case 'w':
                  v44 = -[NSCalendarDate dayOfWeek](self, "dayOfWeek");
                  goto LABEL_57;
                case 'x':
                  v33 = locale;
                  v34 = objc_msgSend(locale, "objectForKey:", CFSTR("NSTimeDateFormatString"));
                  v35 = v34 == 0;
                  v36 = CFSTR("%a %b %d %Y");
                  goto LABEL_61;
                case 'y':
                  v48 = -[NSCalendarDate yearOfCommonEra](self, "yearOfCommonEra");
                  v49 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("AppleLocale"));
                  if (!v49)
                    goto LABEL_82;
                  v50 = v49;
                  if (objc_msgSend(v49, "isEqualToString:", CFSTR("ja_JP_TRADITIONAL")))
                    goto LABEL_70;
                  if (objc_msgSend(v50, "isEqualToString:", CFSTR("th_TH_TRADITIONAL")))
                    v48 += 543;
LABEL_82:
                  v32 = v48 % 100;
                  break;
                case 'z':
                  if (-[NSCalendarDate timeZone](self, "timeZone"))
                  {
                    v55 = -[NSTimeZone secondsFromGMTForDate:](-[NSCalendarDate timeZone](self, "timeZone"), "secondsFromGMTForDate:", self);
                    if (v55 >= 0)
                      v56 = CFSTR("+");
                    else
                      v56 = CFSTR("-");
                    if (v55 >= 0)
                      v57 = v55;
                    else
                      v57 = -v55;
                  }
                  else
                  {
                    v57 = 0;
                    v56 = CFSTR("+");
                  }
                  -[NSString replaceCharactersInRange:withString:](v5, "replaceCharactersInRange:withString:", -[NSString length](v5, "length"), 0, v56);
                  appendNumber(v5, v57 / 0xE10, "%02ld", "%02ld");
                  appendNumber(v5, v57 / 0x3C- 60 * ((unint64_t)((v57 / 0x3C * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1), "%02ld", "%02ld");
                  continue;
                default:
                  if (v17 != 37)
                    goto LABEL_24;
                  v21 = -[NSString length](v5, "length");
                  v22 = v5;
                  v23 = (NSString *)CFSTR("%");
                  goto LABEL_65;
              }
LABEL_55:
              v40 = v5;
              v45 = "%02ld";
              goto LABEL_59;
          }
        }
      }
    }
    while (v9 < v6);
  }
  return v5;
}

- (id)initWithString:(NSString *)description calendarFormat:(NSString *)format locale:(id)locale
{
  NSScanner *v7;
  NSScanner *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  int v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSScanner *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  NSString *v34;
  const __CFLocale *v35;
  __CFDateFormatter *v36;
  const __CFTimeZone *v37;
  SInt32 year;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSString *v45;
  const __CFLocale *v46;
  const __CFTimeZone *v47;
  SInt32 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  int64_t v63;
  uint64_t v64;
  unsigned __int8 v65;
  unsigned __int8 i;
  int v67;
  uint64_t v68;
  char v69;
  NSCalendarDate *v70;
  const __CFAllocator *allocator;
  NSString *v73;
  uint64_t v74;
  NSCharacterSet *v77;
  CFRange rangep;
  CFAbsoluteTime atp;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[3];

  v88[1] = *MEMORY[0x1E0C80C00];
  v7 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:");
  v8 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", format);
  v81 = 0;
  v77 = +[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet");
  if (oldInitWithString_doExcelLittleY == -1)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSUseExcelTwoDigitYearSemantics")))
    {
      v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSUseExcelTwoDigitYearSemantics"));
    }
    else
    {
      v9 = 1;
    }
    oldInitWithString_doExcelLittleY = v9;
  }
  v82 = 0;
  v83 = 0;
  v84 = 0;
  v85 = 0;
  v86 = 0;
  v87 = 0;
  v10 = -1;
  v88[0] = -1;
  v73 = format;
  if (!-[NSScanner isAtEnd](v8, "isAtEnd"))
  {
    v74 = 0;
    v14 = CFSTR("%");
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    while (1)
    {
      if (-[NSScanner isAtEnd](v7, "isAtEnd"))
        goto LABEL_136;
      skipWhitespace(v7);
      if (-[NSScanner isAtEnd](v7, "isAtEnd"))
        goto LABEL_136;
      if (!-[NSScanner scanString:intoString:](v8, "scanString:intoString:", v14, 0))
      {
        v17 = -[NSScanner scanLocation](v8, "scanLocation");
        v18 = -[NSScanner scanLocation](v7, "scanLocation");
        if (-[NSScanner isAtEnd](v8, "isAtEnd") && !-[NSScanner isAtEnd](v7, "isAtEnd"))
          goto LABEL_136;
        v19 = v14;
        v20 = -[NSString characterAtIndex:](format, "characterAtIndex:", v17);
        if (-[NSString characterAtIndex:](description, "characterAtIndex:", v18) != v20)
          goto LABEL_136;
        v14 = v19;
        -[NSScanner setScanLocation:](v7, "setScanLocation:", v18 + 1);
        v21 = v17 + 1;
        goto LABEL_109;
      }
      if (-[NSScanner isAtEnd](v8, "isAtEnd"))
        goto LABEL_136;
      -[NSScanner scanCharactersFromSet:intoString:](v8, "scanCharactersFromSet:intoString:", v77, 0);
      v15 = -[NSString characterAtIndex:](format, "characterAtIndex:", -[NSScanner scanLocation](v8, "scanLocation"));
      switch(v15)
      {
        case 'A':
          v23 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("NSWeekDayNameArray"));
          if (v23)
            goto LABEL_46;
          v24 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Sunday"), CFSTR("Monday"), CFSTR("Tuesday"), CFSTR("Wednesday"), CFSTR("Thursday"), CFSTR("Friday"), CFSTR("Saturday"), 0);
          goto LABEL_45;
        case 'B':
          v25 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("NSMonthNameArray"));
          if (v25)
            goto LABEL_53;
          v26 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("January"), CFSTR("February"), CFSTR("March"), CFSTR("April"), CFSTR("May"), CFSTR("June"), CFSTR("July"), CFSTR("August"), CFSTR("September"), CFSTR("October"), CFSTR("November"), CFSTR("December"), 0);
          goto LABEL_52;
        case 'C':
        case 'D':
        case 'E':
        case 'G':
        case 'J':
        case 'K':
        case 'L':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case '[':
        case '\\':
        case ']':
        case '^':
        case '_':
          goto LABEL_136;
        case 'F':
          v16 = &v82;
          v27 = v7;
          v28 = 3;
          goto LABEL_64;
        case 'H':
        case 'I':
          v16 = &v85;
          goto LABEL_63;
        case 'M':
          v16 = &v84;
          goto LABEL_63;
        case 'S':
          v16 = &v83;
          goto LABEL_63;
        case 'X':
          v29 = objc_msgSend(locale, "objectForKey:", CFSTR("NSTimeDateFormatString"));
          v30 = v29 == 0;
          v31 = CFSTR("%H:%M:%S %Z");
          goto LABEL_74;
        case 'Y':
          v32 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("AppleLocale"));
          if (v32)
          {
            v33 = v32;
            if (objc_msgSend(v32, "isEqualToString:", CFSTR("ja_JP_TRADITIONAL")))
            {
              v34 = -[NSString substringFromIndex:](description, "substringFromIndex:", -[NSScanner scanLocation](v7, "scanLocation"));
              v35 = CFLocaleCreate(0, CFSTR("ja_JP_TRADITIONAL"));
              v36 = CFDateFormatterCreate(allocator, v35, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
              CFDateFormatterSetFormat(v36, CFSTR("Gy"));
              CFRelease(v35);
              atp = 0.0;
              rangep.location = 0;
              rangep.length = 0;
              rangep.length = -[NSString length](v34, "length");
              if (!CFDateFormatterGetAbsoluteTimeFromString(v36, (CFStringRef)v34, &rangep, &atp))
                goto LABEL_148;
              -[NSScanner setScanLocation:](v7, "setScanLocation:", -[NSScanner scanLocation](v7, "scanLocation") + rangep.length);
              v37 = CFTimeZoneCopyDefault();
              year = CFAbsoluteTimeGetGregorianDate(atp, v37).year;
              CFRelease(v37);
              v88[0] = year;
              CFRelease(v36);
              v14 = CFSTR("%");
            }
            else
            {
              if (!-[NSScanner _scanDecimal:into:](v7, "_scanDecimal:into:", 4, v88))
                goto LABEL_136;
              if (objc_msgSend(v33, "isEqualToString:", CFSTR("th_TH_TRADITIONAL")))
              {
                v49 = v88[0] - 543;
                v88[0] -= 543;
                goto LABEL_97;
              }
            }
          }
          else if (!-[NSScanner _scanDecimal:into:](v7, "_scanDecimal:into:", 4, v88))
          {
            goto LABEL_136;
          }
          v49 = v88[0];
LABEL_97:
          if (v49 < 1)
            goto LABEL_136;
          goto LABEL_108;
        case 'Z':
          skipWhitespace(v7);
          if (!-[NSScanner scanUpToCharactersFromSet:intoString:](v7, "scanUpToCharactersFromSet:intoString:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"), &v81))goto LABEL_136;
          goto LABEL_108;
        case 'a':
          v23 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("NSShortWeekDayNameArray"));
          if (v23)
            goto LABEL_46;
          v24 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Sun"), CFSTR("Mon"), CFSTR("Tue"), CFSTR("Wed"), CFSTR("Thu"), CFSTR("Fri"), CFSTR("Sat"), 0);
LABEL_45:
          v23 = (void *)v24;
LABEL_46:
          v39 = 0;
          while (!-[NSScanner scanString:intoString:](v7, "scanString:intoString:", objc_msgSend(v23, "objectAtIndex:", v39), 0))
          {
            if (++v39 == 7)
              goto LABEL_136;
          }
          goto LABEL_108;
        case 'b':
          v25 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("NSShortMonthNameArray"));
          if (v25)
            goto LABEL_53;
          v26 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Jan"), CFSTR("Feb"), CFSTR("Mar"), CFSTR("Apr"), CFSTR("May"), CFSTR("Jun"), CFSTR("Jul"), CFSTR("Aug"), CFSTR("Sep"), CFSTR("Oct"), CFSTR("Nov"), CFSTR("Dec"), 0);
LABEL_52:
          v25 = (void *)v26;
LABEL_53:
          v40 = 1;
          while (!-[NSScanner scanString:intoString:](v7, "scanString:intoString:", objc_msgSend(v25, "objectAtIndex:", v40 - 1), 0))
          {
            if (++v40 == 13)
              goto LABEL_136;
          }
          v87 = v40;
          goto LABEL_108;
        case 'c':
          v29 = objc_msgSend(locale, "objectForKey:", CFSTR("NSTimeDateFormatString"));
          v30 = v29 == 0;
          v31 = CFSTR("%a %b %d %H:%M:%S %Z %Y");
LABEL_74:
          if (v30)
            v42 = (void *)v31;
          else
            v42 = (void *)v29;
          -[NSScanner setScanLocation:](v8, "setScanLocation:", -[NSScanner scanLocation](v8, "scanLocation") + 1);
          format = (NSString *)objc_msgSend(v42, "stringByAppendingString:", -[NSScanner _remainingString](v8, "_remainingString"));
          v8 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", format);
          goto LABEL_110;
        case 'd':
          v16 = &v86;
LABEL_63:
          v27 = v7;
          v28 = 2;
LABEL_64:
          if (!-[NSScanner _scanDecimal:into:](v27, "_scanDecimal:into:", v28, v16))
            goto LABEL_136;
          goto LABEL_108;
        case 'e':
          v80 = 0;
          if (!-[NSScanner scanInt:](v7, "scanInt:", &v80))
            goto LABEL_136;
          v86 = v80;
          goto LABEL_108;
        default:
          switch(v15)
          {
            case 'j':
              if (!-[NSScanner scanInt:](v7, "scanInt:", &v80))
                goto LABEL_136;
              v74 = v80;
              goto LABEL_108;
            case 'k':
            case 'l':
            case 'n':
            case 'o':
            case 'q':
            case 'r':
            case 's':
            case 't':
            case 'u':
            case 'v':
              goto LABEL_136;
            case 'm':
              v16 = &v87;
              goto LABEL_63;
            case 'p':
              v41 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("NSAMPMDesignation"));
              if (!v41)
                v41 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AM"), CFSTR("PM"), 0);
              if (-[NSScanner scanString:intoString:](v7, "scanString:intoString:", objc_msgSend(v41, "objectAtIndex:", 1), 0))
              {
                if (v85 <= 11)
                  v85 += 12;
              }
              else
              {
                if (!-[NSScanner scanString:intoString:](v7, "scanString:intoString:", objc_msgSend(v41, "objectAtIndex:", 0), 0))goto LABEL_136;
                if (v85 == 12)
                  v85 = 0;
              }
              goto LABEL_108;
            case 'w':
              v22 = -[NSScanner scanLocation](v7, "scanLocation");
              if (-[NSString characterAtIndex:](description, "characterAtIndex:", v22) - 48 > 6)
                goto LABEL_136;
              goto LABEL_72;
            case 'x':
              v29 = objc_msgSend(locale, "objectForKey:", CFSTR("NSTimeDateFormatString"));
              v30 = v29 == 0;
              v31 = CFSTR("%a %b %d %Y");
              goto LABEL_74;
            case 'y':
              v43 = (void *)objc_msgSend(locale, "objectForKey:", CFSTR("AppleLocale"));
              if (!v43)
              {
                if (!-[NSScanner _scanDecimal:into:](v7, "_scanDecimal:into:", 2, v88))
                  goto LABEL_136;
LABEL_102:
                if (oldInitWithString_doExcelLittleY)
                {
                  v51 = 1900;
                  if (v88[0] < 30)
                    v51 = 2000;
                  v50 = v51 + v88[0];
                }
                else
                {
                  v50 = v88[0] + 1900;
                }
                goto LABEL_107;
              }
              v44 = v43;
              if (objc_msgSend(v43, "isEqualToString:", CFSTR("ja_JP_TRADITIONAL")))
              {
                v45 = -[NSString substringFromIndex:](description, "substringFromIndex:", -[NSScanner scanLocation](v7, "scanLocation"));
                v46 = CFLocaleCreate(0, CFSTR("ja_JP_TRADITIONAL"));
                v36 = CFDateFormatterCreate(allocator, v46, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
                CFDateFormatterSetFormat(v36, CFSTR("Gy"));
                CFRelease(v46);
                atp = 0.0;
                rangep.location = 0;
                rangep.length = 0;
                rangep.length = -[NSString length](v45, "length");
                if (!CFDateFormatterGetAbsoluteTimeFromString(v36, (CFStringRef)v45, &rangep, &atp))
                {
LABEL_148:
                  CFRelease(v36);
                  goto LABEL_136;
                }
                -[NSScanner setScanLocation:](v7, "setScanLocation:", -[NSScanner scanLocation](v7, "scanLocation") + rangep.length);
                v47 = CFTimeZoneCopyDefault();
                v48 = CFAbsoluteTimeGetGregorianDate(atp, v47).year;
                CFRelease(v47);
                v88[0] = v48;
                CFRelease(v36);
                v14 = CFSTR("%");
                goto LABEL_108;
              }
              if (!-[NSScanner _scanDecimal:into:](v7, "_scanDecimal:into:", 2, v88))
                goto LABEL_136;
              if (!objc_msgSend(v44, "isEqualToString:", CFSTR("th_TH_TRADITIONAL")))
                goto LABEL_102;
              v50 = v88[0] + 1957;
LABEL_107:
              v88[0] = v50;
LABEL_108:
              v21 = -[NSScanner scanLocation](v8, "scanLocation") + 1;
LABEL_109:
              -[NSScanner setScanLocation:](v8, "setScanLocation:", v21);
LABEL_110:
              if (-[NSScanner isAtEnd](v8, "isAtEnd"))
                goto LABEL_8;
              break;
            case 'z':
              LODWORD(rangep.location) = 0;
              if (!-[NSScanner scanInt:](v7, "scanInt:", &rangep))
                goto LABEL_136;
              if ((rangep.location & 0x80000000) != 0)
                v10 = (int)(-60 * (-LODWORD(rangep.location) % 0x64u) - 3600 * (-LODWORD(rangep.location) / 0x64u));
              else
                v10 = 60 * (LODWORD(rangep.location) % 0x64) + 3600 * (LODWORD(rangep.location) / 0x64);
              goto LABEL_108;
            default:
              if (v15 != 37)
                goto LABEL_136;
              v22 = -[NSScanner scanLocation](v7, "scanLocation");
              if (-[NSString characterAtIndex:](-[NSScanner string](v7, "string"), "characterAtIndex:", v22) != 37)
                goto LABEL_136;
LABEL_72:
              -[NSScanner setScanLocation:](v7, "setScanLocation:", v22 + 1);
              goto LABEL_108;
          }
          break;
      }
    }
  }
  v74 = 0;
LABEL_8:
  if (!-[NSScanner isAtEnd](v8, "isAtEnd"))
    goto LABEL_136;
  if (v81)
  {
    v11 = objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:");
    v12 = v74;
    if (v11)
      goto LABEL_116;
    v13 = objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", v81);
  }
  else
  {
    v12 = v74;
    if (v10 == -1)
      v13 = objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    else
      v13 = objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", v10);
  }
  v11 = v13;
LABEL_116:
  v52 = v88[0];
  if (v88[0] == -1)
  {
    v52 = objc_msgSend(+[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate"), "yearOfCommonEra");
    v88[0] = v52;
    if (v12)
    {
LABEL_118:
      v53 = v52 - 1;
      v54 = v52 + 2;
      if (v52 >= 1)
        v54 = v52 - 1;
      v55 = v12 + 365 * (v52 - 1) + (v54 >> 2);
      v56 = ((unsigned __int128)(v53 * (__int128)0x5C28F5C28F5C28F5) >> 64) - v52 + 1;
      v57 = v55 + v53 / 400 + (v56 >> 6) + ((unint64_t)v56 >> 63);
      v58 = ((v57 / 366) << 16) + 0x10000;
      v59 = v57 / 366 - 1;
      v60 = ((v57 / 366) << 16) - 0x10000;
      do
      {
        v61 = absolute_from_gregorian(v58 & 0xFFFF0000 | 0x101);
        LODWORD(v58) = v58 + 0x10000;
        ++v59;
        v60 += 0x10000;
      }
      while (v61 <= v57);
      v62 = 0;
      v63 = v59 & 3;
      v64 = v59 % 400;
      v65 = 1;
      if ((v59 & 3) == 0)
        goto LABEL_125;
LABEL_130:
      for (i = days_per_month[v62]; ; i = 29)
      {
        v67 = v65;
        v59 = v59 & 0xFFFFFFFF00000000 | (v60 + v65 + (i << 8));
        if (absolute_from_gregorian(v59) >= v57)
          break;
        ++v62;
        v65 = v67 + 1;
        if (v63)
          goto LABEL_130;
LABEL_125:
        if (v62 != 1 || v64 == 100 || v64 == 300 || v64 == 200)
          goto LABEL_130;
      }
      v68 = (v62 + 1);
      v69 = absolute_from_gregorian(v67 + v60 + 256);
      if (v87 && v87 != v68 || (v87 = (v62 + 1), v86) && v86 != (v57 - v69 + 1))
      {
LABEL_136:

        return 0;
      }
      v86 = (v57 - v69 + 1);
      if ((_BYTE)v62 == 0xFF)
        goto LABEL_140;
      goto LABEL_141;
    }
  }
  else if (v12)
  {
    goto LABEL_118;
  }
  v68 = v87;
  if (!v87)
  {
LABEL_140:
    v68 = 1;
    v87 = 1;
  }
LABEL_141:
  if (!v86)
    v86 = 1;
  v70 = -[NSCalendarDate initWithYear:month:day:hour:minute:second:timeZone:](self, "initWithYear:month:day:hour:minute:second:timeZone:", v52, v68, v11);
  -[NSCalendarDate setCalendarFormat:](v70, "setCalendarFormat:", v73);
  if (v70 && v82)
    v70->_timeIntervalSinceReferenceDate = (double)v82 / 1000.0 + 0.0001 + v70->_timeIntervalSinceReferenceDate;
  return v70;
}

+ (NSCalendarDate)dateWithNaturalLanguageString:(id)a3 date:(id)a4 locale:(id)a5
{
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  NSCharacterSet *v14;
  id v15;
  NSScanner *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  __CFDictionary *v28;
  const void *Value;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __CFString *v56;
  __CFDictionary *v57;
  const void *v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  id v70;
  uint64_t v71;
  int v72;
  _BYTE *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  _BOOL8 v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  BOOL v85;
  _BOOL8 v86;
  unint64_t v87;
  BOOL v88;
  _BOOL8 v89;
  unint64_t v90;
  BOOL v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  char v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  BOOL v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSCharacterSet *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  NSCharacterSet *v120;
  id v121;
  NSCharacterSet *v122;
  uint64_t v123;
  __CFString *v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[55];
  _QWORD v128[3];

  v121 = a5;
  v128[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if (objc_msgSend(v8, "isEqual:", CFSTR("now")))
  {
    if (a4)
      return (NSCalendarDate *)a4;
    return (NSCalendarDate *)+[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate");
  }
  if (objc_msgSend(v8, "isEqual:", CFSTR("today")))
  {
    if (!a4)
      a4 = +[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate");
    v10 = objc_msgSend(a4, "yearOfCommonEra");
    v11 = objc_msgSend(a4, "monthOfYear");
    v12 = objc_msgSend(a4, "dayOfMonth");
    return (NSCalendarDate *)objc_msgSend(a1, "dateWithYear:month:day:hour:minute:second:timeZone:", v10, v11, v12, 0, 0, 0, objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone"));
  }
  v128[0] = 0;
  v13 = (__CFString *)objc_msgSend((id)objc_msgSend(v121, "objectForKey:", CFSTR("NSDateTimeOrdering")), "uppercaseString");
  if (!v13)
    v13 = CFSTR("MDYH");
  -[__CFString getCharacters:range:](v13, "getCharacters:range:", v128, 0, 4);
  v14 = +[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet");
  v122 = +[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet");
  v115 = +[NSCharacterSet alphanumericCharacterSet](NSCharacterSet, "alphanumericCharacterSet");
  v15 = -[NSMutableCharacterSet mutableCopyWithZone:](+[NSMutableCharacterSet decimalDigitCharacterSet](NSMutableCharacterSet, "decimalDigitCharacterSet"), "mutableCopyWithZone:", 0);
  v124 = 0;
  v16 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", a3);
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  *(_QWORD *)&v18 = -1;
  *((_QWORD *)&v18 + 1) = -1;
  v125 = v18;
  v126 = v18;
  v119 = v15;
  objc_msgSend(v15, "addCharactersInString:", CFSTR("-+"));
  if (dateWithNaturalLanguageString_date_locale__doExcelLittleY == -1)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSUseExcelTwoDigitYearSemantics")))
    {
      v19 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSUseExcelTwoDigitYearSemantics"));
    }
    else
    {
      v19 = 1;
    }
    dateWithNaturalLanguageString_date_locale__doExcelLittleY = v19;
  }
  memset(v127, 0, sizeof(v127));
  -[NSScanner setCharactersToBeSkipped:](v16, "setCharactersToBeSkipped:", 0);
  if (!-[NSScanner isAtEnd](v16, "isAtEnd"))
  {
    do
    {
      v20 = -[NSScanner scanCharactersFromSet:intoString:](v16, "scanCharactersFromSet:intoString:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"), 0);
      if (-[NSScanner isAtEnd](v16, "isAtEnd"))
        break;
      if (!-[NSScanner scanCharactersFromSet:intoString:](v16, "scanCharactersFromSet:intoString:", v122, &v124)
        && (!v20
         || !-[NSScanner scanCharactersFromSet:intoString:](v16, "scanCharactersFromSet:intoString:", v119, &v124))
        && !-[NSScanner scanCharactersFromSet:intoString:](v16, "scanCharactersFromSet:intoString:", v14, &v124)
        && !-[NSScanner scanUpToCharactersFromSet:intoString:](v16, "scanUpToCharactersFromSet:intoString:", v115, &v124))
      {
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("format error"), CFSTR("internal error"), 0));
      }
      objc_msgSend(v17, "addObject:", v124);
    }
    while (!-[NSScanner isAtEnd](v16, "isAtEnd"));
  }
  v108 = a1;
  v123 = objc_msgSend(v17, "count");
  if (v123 <= 0)
  {
    v24 = 0;
    v23 = 0;
    v22 = 0;
    v64 = 0;
    v65 = -1;
    *(_QWORD *)&v125 = -1;
    v25 = -1;
    goto LABEL_120;
  }
  v109 = a4;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v111 = -1;
  v112 = -1;
  v113 = -1;
  v114 = -1;
  v25 = -1;
  v116 = -1;
  v117 = 0;
  v120 = v14;
  do
  {
    v124 = (__CFString *)objc_msgSend(v17, "objectAtIndex:", v21);
    v26 = -[__CFString characterAtIndex:](v124, "characterAtIndex:", 0);
    if (-[NSCharacterSet characterIsMember:](v14, "characterIsMember:", v26))
    {
      v27 = v124;
      v28 = buildTokenMapWithDictionary(v121);
      Value = CFDictionaryGetValue(v28, (const void *)-[__CFString lowercaseString](v27, "lowercaseString"));
      if (Value && (unsigned __int16)Value != 65)
      {
        v127[(unsigned __int16)Value - 65] = 1;
        goto LABEL_29;
      }
      if (-[__CFString isEqual:](v124, "isEqual:", CFSTR("GMT")))
      {
        v33 = v21 + 1;
        v34 = objc_msgSend(v17, "count");
        v14 = v120;
        if (v21 + 1 < v34
          && objc_msgSend(v119, "characterIsMember:", objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v21 + 1), "characterAtIndex:", 0)))
        {
          v110 = v24;
          v21 += 2;
          v35 = objc_msgSend(v17, "count");
          v118 = (void *)MEMORY[0x1E0C99E80];
          v36 = (void *)objc_msgSend(CFSTR("GMT"), "stringByAppendingString:", objc_msgSend(v17, "objectAtIndex:", v33));
          if (v21 >= v35)
          {
            v117 = objc_msgSend(v118, "timeZoneWithAbbreviation:", v36);
            v21 = v33;
          }
          else
          {
            v117 = objc_msgSend(v118, "timeZoneWithAbbreviation:", objc_msgSend(v36, "stringByAppendingString:", objc_msgSend(v17, "objectAtIndex:", v21)));
          }
          goto LABEL_84;
        }
        v44 = (void *)MEMORY[0x1E0C99E80];
        v45 = CFSTR("GMT");
      }
      else
      {
        v42 = (void *)objc_msgSend(MEMORY[0x1E0C99E80], "abbreviationDictionary");
        v43 = objc_msgSend(v42, "objectForKey:", v124);
        v14 = v120;
        if (!v43)
          goto LABEL_58;
        v44 = (void *)MEMORY[0x1E0C99E80];
        v45 = v124;
      }
      v41 = objc_msgSend(v44, "timeZoneWithAbbreviation:", v45);
LABEL_57:
      v117 = v41;
      goto LABEL_58;
    }
    if (!-[NSCharacterSet characterIsMember:](v122, "characterIsMember:", v26))
    {
      if (!objc_msgSend(v119, "characterIsMember:", v26))
      {
        -[NSScanner scanUpToCharactersFromSet:intoString:](v16, "scanUpToCharactersFromSet:intoString:", v115, 0);
        goto LABEL_58;
      }
      v37 = -[__CFString integerValue](v124, "integerValue");
      if (v37 >= 0)
        v38 = v37;
      else
        v38 = -v37;
      v39 = -3600;
      if (v37 >= 0)
        v39 = 3600;
      v40 = -60;
      if (v37 >= 0)
        v40 = 60;
      v41 = objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", v38 % 0x64 * v40 + v38 / 0x64 * v39);
      goto LABEL_57;
    }
    v30 = -[__CFString integerValue](v124, "integerValue");
    v31 = v30;
    if (v30 < 32)
    {
      if (v30 >= 24 && v116 != -1)
      {
        v24 = v30;
        goto LABEL_58;
      }
      v46 = v21 + 1;
      if (v21 + 1 >= v123 || v30 >= 24)
      {
        v49 = v111;
        v50 = v112;
        if (v111 == -1)
          v51 = v30;
        else
          v51 = v111;
        if (v112 == -1)
        {
          v51 = v111;
          v52 = v30;
        }
        else
        {
          v52 = v112;
        }
        v53 = v113;
        v54 = v114;
        if (v113 == -1)
        {
          v51 = v111;
          v52 = v112;
          v55 = v30;
        }
        else
        {
          v55 = v113;
        }
        if (v114 != -1)
        {
          v49 = v51;
          v50 = v52;
        }
        v111 = v49;
        v112 = v50;
        if (v114 == -1)
          v54 = v30;
        else
          v53 = v55;
        v113 = v53;
        v114 = v54;
        goto LABEL_29;
      }
      v110 = v24;
      v124 = (__CFString *)objc_msgSend(v17, "objectAtIndex:", v21 + 1);
      v47 = -[__CFString characterAtIndex:](v124, "characterAtIndex:", 0);
      if ((_DWORD)v47 == 58)
      {
        if (v21 + 2 >= v123)
          goto LABEL_67;
        v107 = v21 + 2;
        v124 = (__CFString *)objc_msgSend(v17, "objectAtIndex:");
        v48 = -[__CFString characterAtIndex:](v124, "characterAtIndex:", 0);
        if (-[NSCharacterSet characterIsMember:](v122, "characterIsMember:", v48))
        {
          v105 = -[__CFString integerValue](v124, "integerValue");
          if (v105 > 59)
            goto LABEL_66;
          v46 = v21 + 3;
          if (v21 + 3 >= v123)
          {
            v25 = v31;
            v23 = v105;
LABEL_113:
            v21 = v107;
LABEL_84:
            v24 = v110;
LABEL_29:
            v14 = v120;
            goto LABEL_58;
          }
          v124 = (__CFString *)objc_msgSend(v17, "objectAtIndex:", v21 + 3);
          v61 = -[__CFString characterAtIndex:](v124, "characterAtIndex:", 0);
          v23 = v105;
          if ((_DWORD)v61 == 58)
          {
            if (v21 + 4 >= v123)
            {
LABEL_66:
              v25 = v31;
LABEL_67:
              v21 = v46;
              goto LABEL_84;
            }
            v107 = v21 + 4;
            v124 = (__CFString *)objc_msgSend(v17, "objectAtIndex:");
            v48 = -[__CFString characterAtIndex:](v124, "characterAtIndex:", 0);
            if (-[NSCharacterSet characterIsMember:](v122, "characterIsMember:", v48))
            {
              v62 = -[__CFString integerValue](v124, "integerValue");
              v25 = v31;
              if (v62 > 60)
                goto LABEL_113;
              v22 = v62;
            }
            else
            {
              v25 = v31;
              v107 = v21 + 3;
            }
          }
          else
          {
            v48 = v61;
            v25 = v31;
          }
          v31 = -1;
        }
        else
        {
          v107 = v21 + 1;
        }
      }
      else
      {
        v48 = v47;
        v107 = v21;
      }
      v14 = v120;
      if (-[NSCharacterSet characterIsMember:](v120, "characterIsMember:", v48))
      {
        v106 = v23;
        v56 = v124;
        v57 = buildTokenMapWithDictionary(v121);
        v58 = CFDictionaryGetValue(v57, (const void *)-[__CFString lowercaseString](v56, "lowercaseString"));
        v59 = (unsigned __int16)v58;
        if (!v58)
          v59 = 65;
        v24 = v110;
        if ((v59 & 0xFFFE) == 0x76)
        {
          *((_BYTE *)&v120 + v59 + 7) = 1;
          v23 = v106;
          v21 = v107 + 1;
          if (v25 == -1 && v31 != -1)
          {
            v25 = v31;
            goto LABEL_58;
          }
        }
        else
        {
          v23 = v106;
          v21 = v107;
        }
      }
      else
      {
        v21 = v107;
        v24 = v110;
      }
      if (v31 != -1)
      {
        if (v114 == -1)
        {
          v114 = v31;
        }
        else if (v113 == -1)
        {
          v113 = v31;
        }
        else if (v112 == -1)
        {
          v112 = v31;
        }
        else
        {
          v60 = v111;
          if (v111 == -1)
            v60 = v31;
          v111 = v60;
        }
      }
    }
    else
    {
      v32 = v30 + 1900;
      if ((unint64_t)v30 >= 0x64)
        v32 = v30;
      v116 = v32;
    }
LABEL_58:
    ++v21;
  }
  while (v21 < v123);
  *(_QWORD *)&v126 = v112;
  *((_QWORD *)&v126 + 1) = v111;
  *(_QWORD *)&v125 = v114;
  *((_QWORD *)&v125 + 1) = v113;
  if (v127[1])
  {
    v63 = 1;
    a4 = v109;
    v65 = v116;
    v64 = v117;
    goto LABEL_143;
  }
  a4 = v109;
  v65 = v116;
  v64 = v117;
  if (v127[2])
  {
    v63 = 2;
    goto LABEL_143;
  }
LABEL_120:
  if (v127[3])
  {
    v63 = 3;
  }
  else if (v127[4])
  {
    v63 = 4;
  }
  else if (v127[5])
  {
    v63 = 5;
  }
  else if (v127[6])
  {
    v63 = 6;
  }
  else if (v127[7])
  {
    v63 = 7;
  }
  else if (v127[8])
  {
    v63 = 8;
  }
  else if (v127[9])
  {
    v63 = 9;
  }
  else if (v127[10])
  {
    v63 = 10;
  }
  else if (v127[11])
  {
    v63 = 11;
  }
  else if (v127[12])
  {
    v63 = 12;
  }
  else
  {
    v63 = 0;
  }
LABEL_143:
  if (v127[15])
  {
    v66 = 1;
    goto LABEL_151;
  }
  if (v127[13])
  {
    v66 = 0;
    goto LABEL_151;
  }
  if (v127[16])
  {
    v66 = 2;
    goto LABEL_151;
  }
  if (v127[14])
  {
    v66 = -1;
LABEL_151:
    if (!a4)
      a4 = +[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate");
    v67 = (void *)objc_msgSend(a4, "dateByAddingYears:months:days:hours:minutes:seconds:", 0, 0, v66, 0, 0, 0);
    v63 = objc_msgSend(v67, "monthOfYear");
    v24 = objc_msgSend(v67, "dayOfMonth");
    v65 = objc_msgSend(v67, "yearOfCommonEra");
  }
  if (v127[26])
  {
    if (v127[24])
    {
      if (!a4)
        a4 = +[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate");
      v65 = objc_msgSend(a4, "yearOfCommonEra") + 1;
      v127[24] = 0;
    }
    else if (v127[25])
    {
      if (!a4)
        a4 = +[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate");
      v65 = objc_msgSend(a4, "yearOfCommonEra") - 1;
      v127[25] = 0;
    }
    goto LABEL_169;
  }
  if (!v127[27])
    goto LABEL_169;
  if (v127[24])
  {
    v127[24] = 0;
    v68 = 1;
    if (!a4)
      goto LABEL_162;
  }
  else
  {
    v72 = v127[25];
    v127[25] = 0;
    if (!v72)
      goto LABEL_169;
    v68 = -1;
    if (!a4)
LABEL_162:
      a4 = +[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate");
  }
  v69 = (void *)objc_msgSend(a4, "dateByAddingYears:months:days:hours:minutes:seconds:", 0, v68, 0, 0, 0, 0);
  v63 = objc_msgSend(v69, "monthOfYear");
  if (v65 == -1)
    v65 = objc_msgSend(v69, "yearOfCommonEra");
LABEL_169:
  if (!v24)
  {
    if (v127[17])
    {
      v71 = 0;
    }
    else if (v127[18])
    {
      v71 = 1;
    }
    else if (v127[19])
    {
      v71 = 2;
    }
    else if (v127[20])
    {
      v71 = 3;
    }
    else if (v127[21])
    {
      v71 = 4;
    }
    else if (v127[22])
    {
      v71 = 5;
    }
    else
    {
      if (!v127[23])
      {
        v70 = 0;
        goto LABEL_203;
      }
      v71 = 6;
    }
    if (v127[25])
    {
      v73 = &v127[25];
      if (!a4)
        a4 = +[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate");
      v74 = objc_msgSend(a4, "dayOfWeek");
      if (v71 >= v74)
        v75 = v71 - v74 - 7;
      else
        v75 = v71 - v74;
    }
    else
    {
      if (!a4)
        a4 = +[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate");
      v76 = objc_msgSend(a4, "dayOfWeek");
      if (v71 - v76 >= 1)
        v75 = v71 - v76;
      else
        v75 = v71 - v76 + 7;
      v73 = &v127[24];
    }
    *v73 = 0;
    if (v75)
      v70 = (id)objc_msgSend(a4, "dateByAddingYears:months:days:hours:minutes:seconds:", 0, 0, v75, 0, 0, 0);
    else
      v70 = a4;
LABEL_203:
    if (!v127[28])
      goto LABEL_208;
    if (v127[24])
    {
      v127[24] = 0;
      v77 = 7;
      if (a4)
      {
LABEL_207:
        v70 = (id)objc_msgSend(a4, "dateByAddingYears:months:days:hours:minutes:seconds:", 0, 0, v77, 0, 0, 0);
        goto LABEL_208;
      }
    }
    else
    {
      v104 = v127[25];
      v127[25] = 0;
      if (!v104)
        goto LABEL_208;
      v77 = -7;
      if (a4)
        goto LABEL_207;
    }
    a4 = +[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate");
    goto LABEL_207;
  }
  v70 = 0;
LABEL_208:
  for (i = 0; i != 24; ++i)
  {
    if (v127[i + 29])
    {
      v25 = i;
      v23 = 0;
      v22 = 0;
    }
  }
  v79 = v25 == -1;
  v80 = 1;
  if (v25 == -1)
    v80 = 2;
  if (v65 == -1)
    v79 = v80;
  v81 = v63 == 0;
  if (!v24)
    ++v81;
  v82 = v81 + v79;
  if (!(v81 + v79))
    goto LABEL_285;
  v83 = v125 != -1;
  v84 = 1;
  if ((_QWORD)v125 != -1)
    v84 = 2;
  if (*((_QWORD *)&v125 + 1) != -1)
    v83 = v84;
  if ((_QWORD)v126 != -1)
    ++v83;
  if (*((_QWORD *)&v126 + 1) != -1)
    ++v83;
  v85 = v25 == -1 && v82 > v83;
  v86 = v85;
  v87 = v82 - v86;
  v88 = v65 == -1 && v87 > v83;
  v89 = v88;
  v90 = v87 - v89;
  v91 = !v63 && v90 > v83;
  v92 = v91;
  if (!v83)
    goto LABEL_285;
  v93 = 0;
  while (2)
  {
    v94 = 0;
    v95 = *((_QWORD *)&v125 + v93);
    v96 = v25 != -1 || v86;
    if (v63)
      v97 = 1;
    else
      v97 = v92;
    v98 = v65 != -1 || v89;
    while (2)
    {
      v99 = *(unsigned __int16 *)((char *)v128 + v94);
      if (v99 <= 0x4C)
      {
        if (v99 == 68)
        {
          if (!v24)
          {
            v24 = *((_QWORD *)&v125 + v93);
            if (v95 > 31)
              return 0;
            goto LABEL_269;
          }
        }
        else
        {
          if (v99 != 72)
            return 0;
          if ((v96 & 1) == 0)
          {
            v25 = *((_QWORD *)&v125 + v93);
            if (v95 > 23)
              return 0;
            goto LABEL_269;
          }
        }
        goto LABEL_268;
      }
      if (v99 != 77)
      {
        if (v99 != 89)
          return 0;
        if ((v98 & 1) == 0)
        {
          if (v95 > 99)
          {
            v65 = *((_QWORD *)&v125 + v93);
          }
          else if (dateWithNaturalLanguageString_date_locale__doExcelLittleY)
          {
            if (v95 >= 30)
              v100 = 1900;
            else
              v100 = 2000;
            v65 = v100 + v95;
          }
          else
          {
            v65 = v95 + 1900;
          }
          goto LABEL_269;
        }
        goto LABEL_268;
      }
      if ((v97 & 1) != 0)
      {
LABEL_268:
        v94 += 2;
        if (v94 == 8)
          goto LABEL_269;
        continue;
      }
      break;
    }
    v63 = *((_QWORD *)&v125 + v93);
    if (v95 > 12)
      return 0;
LABEL_269:
    if (++v93 != v83)
      continue;
    break;
  }
LABEL_285:
  if (v25 != -1)
  {
    if (v127[53])
    {
      if (v25 == 12)
        v101 = 0;
      else
        v101 = v25;
      if (!v70)
        goto LABEL_305;
    }
    else
    {
      if (v127[54])
        v102 = v25 < 12;
      else
        v102 = 0;
      if (v102)
        v101 = v25 + 12;
      else
        v101 = v25;
      if (!v70)
        goto LABEL_305;
    }
LABEL_301:
    if (!v24 && !v63 && v65 == -1)
    {
      v24 = objc_msgSend(v70, "dayOfMonth");
      v63 = objc_msgSend(v70, "monthOfYear");
      v65 = objc_msgSend(v70, "yearOfCommonEra");
    }
    goto LABEL_305;
  }
  v101 = -1;
  if (v70)
    goto LABEL_301;
LABEL_305:
  if (!v24 && !v63 && v65 == -1 && v101 == -1)
    return 0;
  if (!v24)
  {
    if (!a4)
      a4 = +[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate");
    v24 = objc_msgSend(a4, "dayOfMonth");
  }
  if (!v63)
  {
    if (!a4)
      a4 = +[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate");
    v63 = objc_msgSend(a4, "monthOfYear");
  }
  if (v65 == -1)
  {
    if (!a4)
      a4 = +[NSCalendarDate calendarDate](NSCalendarDate, "calendarDate");
    v65 = objc_msgSend(a4, "yearOfCommonEra");
  }
  if (v101 == -1)
    v103 = 12;
  else
    v103 = v101;
  if (!v64)
    v64 = objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  a4 = 0;
  if ((unint64_t)(v65 - 4001) >= 0xFFFFFFFFFFFFF060 && v63 >= 1 && v63 <= 12 && v24 >= 1 && v24 <= 31)
    return (NSCalendarDate *)(id)objc_msgSend(v108, "dateWithYear:month:day:hour:minute:second:timeZone:", v65, v63, v24, v103, v23, v22, v64);
  return (NSCalendarDate *)a4;
}

- (id)replacementObjectForPortCoder:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isByref"))
  {
    v6.receiver = self;
    v6.super_class = (Class)NSCalendarDate;
    return -[NSDate replacementObjectForPortCoder:](&v6, sel_replacementObjectForPortCoder_, a3);
  }
  return self;
}

@end
