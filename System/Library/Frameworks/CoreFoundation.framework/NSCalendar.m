@implementation NSCalendar

- (unint64_t)hash
{
  return -[NSString hash](-[NSCalendar calendarIdentifier](self, "calendarIdentifier"), "hash");
}

+ (NSCalendar)calendarWithIdentifier:(NSCalendarIdentifier)calendarIdentifierConstant
{
  return (NSCalendar *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCalendarIdentifier:", calendarIdentifierConstant);
}

+ (NSCalendar)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSCalendar == a1)
    return (NSCalendar *)-[objc_class allocWithZone:](objc_lookUpClass("_NSSwiftCalendar"), "allocWithZone:", a3);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSCalendar;
  return (NSCalendar *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

+ (NSCalendar)currentCalendar
{
  return (NSCalendar *)+[NSCalendar _current](NSCalendar, "_current");
}

- (id)gregorianStartDate
{
  return 0;
}

+ (NSCalendar)autoupdatingCurrentCalendar
{
  return (NSCalendar *)+[NSCalendar _autoupdatingCurrent](NSCalendar, "_autoupdatingCurrent");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSCalendar)init
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a3 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v15 = v5;
    v16 = v4;
    v17 = v3;
    if (!a3 || (objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_18;
    LODWORD(v11) = -[NSString isEqual:](-[NSCalendar calendarIdentifier](self, "calendarIdentifier"), "isEqual:", objc_msgSend(a3, "calendarIdentifier"));
    if ((_DWORD)v11)
    {
      LODWORD(v11) = -[NSTimeZone isEqual:](-[NSCalendar timeZone](self, "timeZone"), "isEqual:", objc_msgSend(a3, "timeZone"));
      if ((_DWORD)v11)
      {
        LODWORD(v11) = -[NSLocale isEqual:](-[NSCalendar locale](self, "locale"), "isEqual:", objc_msgSend(a3, "locale"));
        if ((_DWORD)v11)
        {
          v12 = -[NSCalendar firstWeekday](self, "firstWeekday");
          if (v12 != objc_msgSend(a3, "firstWeekday"))
            goto LABEL_18;
          v13 = -[NSCalendar minimumDaysInFirstWeek](self, "minimumDaysInFirstWeek");
          if (v13 != objc_msgSend(a3, "minimumDaysInFirstWeek"))
            goto LABEL_18;
          if (-[NSCalendar gregorianStartDate](self, "gregorianStartDate") && objc_msgSend(a3, "gregorianStartDate"))
          {
            if ((objc_msgSend(-[NSCalendar gregorianStartDate](self, "gregorianStartDate"), "isEqual:", objc_msgSend(a3, "gregorianStartDate")) & 1) != 0)
            {
LABEL_20:
              LOBYTE(v11) = 1;
              return v11;
            }
LABEL_18:
            LOBYTE(v11) = 0;
            return v11;
          }
          if (!-[NSCalendar gregorianStartDate](self, "gregorianStartDate", v6, v15, v16, v17, v7, v8)
            || (v11 = objc_msgSend(a3, "gregorianStartDate")) != 0)
          {
            if (-[NSCalendar gregorianStartDate](self, "gregorianStartDate") || !objc_msgSend(a3, "gregorianStartDate"))
              goto LABEL_20;
            goto LABEL_18;
          }
        }
      }
    }
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCalendarIdentifier:", -[NSCalendar calendarIdentifier](self, "calendarIdentifier"));
  objc_msgSend(v4, "setLocale:", -[NSCalendar locale](self, "locale"));
  objc_msgSend(v4, "setTimeZone:", -[NSCalendar timeZone](self, "timeZone"));
  objc_msgSend(v4, "setFirstWeekday:", -[NSCalendar firstWeekday](self, "firstWeekday"));
  objc_msgSend(v4, "setMinimumDaysInFirstWeek:", -[NSCalendar minimumDaysInFirstWeek](self, "minimumDaysInFirstWeek"));
  objc_msgSend(v4, "setGregorianStartDate:", -[NSCalendar gregorianStartDate](self, "gregorianStartDate"));
  return v4;
}

- (NSCalendar)initWithCoder:(id)a3
{
  return 0;
}

- (void)getEra:(NSInteger *)eraValuePointer year:(NSInteger *)yearValuePointer month:(NSInteger *)monthValuePointer day:(NSInteger *)dayValuePointer fromDate:(NSDate *)date
{
  NSDateComponents *v13;
  NSDateComponents *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    v13 = -[NSCalendar components:fromDate:](self, "components:fromDate:", 30, date);
    v14 = v13;
    if (eraValuePointer)
      *eraValuePointer = -[NSDateComponents era](v13, "era");
    if (yearValuePointer)
      *yearValuePointer = -[NSDateComponents year](v14, "year");
    if (monthValuePointer)
      *monthValuePointer = -[NSDateComponents month](v14, "month");
    if (dayValuePointer)
      *dayValuePointer = -[NSDateComponents day](v14, "day");
  }
  else
  {
    v15 = getEra_year_month_day_fromDate____count__;
    if (getEra_year_month_day_fromDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, (uint64_t)CFSTR("*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v16, v17, v18, v19, v20, v21, (__int16)"-[NSCalendar getEra:year:month:day:fromDate:]");
      v15 = getEra_year_month_day_fromDate____count__;
    }
    getEra_year_month_day_fromDate____count__ = v15 + 1;
  }
}

- (void)getEra:(NSInteger *)eraValuePointer yearForWeekOfYear:(NSInteger *)yearValuePointer weekOfYear:(NSInteger *)weekValuePointer weekday:(NSInteger *)weekdayValuePointer fromDate:(NSDate *)date
{
  NSDateComponents *v13;
  NSDateComponents *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    v13 = -[NSCalendar components:fromDate:](self, "components:fromDate:", 25090, date);
    v14 = v13;
    if (eraValuePointer)
      *eraValuePointer = -[NSDateComponents era](v13, "era");
    if (yearValuePointer)
      *yearValuePointer = -[NSDateComponents yearForWeekOfYear](v14, "yearForWeekOfYear");
    if (weekValuePointer)
      *weekValuePointer = -[NSDateComponents weekOfYear](v14, "weekOfYear");
    if (weekdayValuePointer)
      *weekdayValuePointer = -[NSDateComponents weekday](v14, "weekday");
  }
  else
  {
    v15 = getEra_yearForWeekOfYear_weekOfYear_weekday_fromDate____count__;
    if (getEra_yearForWeekOfYear_weekOfYear_weekday_fromDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, (uint64_t)CFSTR("*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v16, v17, v18, v19, v20, v21, (__int16)"-[NSCalendar getEra:yearForWeekOfYear:weekOfYear:weekday:fromDate:]");
      v15 = getEra_yearForWeekOfYear_weekOfYear_weekday_fromDate____count__;
    }
    getEra_yearForWeekOfYear_weekOfYear_weekday_fromDate____count__ = v15 + 1;
  }
}

- (void)getHour:(NSInteger *)hourValuePointer minute:(NSInteger *)minuteValuePointer second:(NSInteger *)secondValuePointer nanosecond:(NSInteger *)nanosecondValuePointer fromDate:(NSDate *)date
{
  NSDateComponents *v13;
  NSDateComponents *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    v13 = -[NSCalendar components:fromDate:](self, "components:fromDate:", 32992, date);
    v14 = v13;
    if (hourValuePointer)
      *hourValuePointer = -[NSDateComponents hour](v13, "hour");
    if (minuteValuePointer)
      *minuteValuePointer = -[NSDateComponents minute](v14, "minute");
    if (secondValuePointer)
      *secondValuePointer = -[NSDateComponents second](v14, "second");
    if (nanosecondValuePointer)
      *nanosecondValuePointer = -[NSDateComponents nanosecond](v14, "nanosecond");
  }
  else
  {
    v15 = getHour_minute_second_nanosecond_fromDate____count__;
    if (getHour_minute_second_nanosecond_fromDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, (uint64_t)CFSTR("*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v16, v17, v18, v19, v20, v21, (__int16)"-[NSCalendar getHour:minute:second:nanosecond:fromDate:]");
      v15 = getHour_minute_second_nanosecond_fromDate____count__;
    }
    getHour_minute_second_nanosecond_fromDate____count__ = v15 + 1;
  }
}

- (NSInteger)component:(NSCalendarUnit)unit fromDate:(NSDate *)date
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
    return -[NSDateComponents valueForComponent:](-[NSCalendar components:fromDate:](self, "components:fromDate:", unit, date), "valueForComponent:", unit);
  v8 = component_fromDate____count__;
  if (component_fromDate____count__ <= 13)
  {
    objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
    CFLog(3, (uint64_t)CFSTR("*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v9, v10, v11, v12, v13, v14, (__int16)"-[NSCalendar component:fromDate:]");
    v8 = component_fromDate____count__;
  }
  component_fromDate____count__ = v8 + 1;
  return 0;
}

- (NSDate)dateWithEra:(NSInteger)eraValue year:(NSInteger)yearValue month:(NSInteger)monthValue day:(NSInteger)dayValue hour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue nanosecond:(NSInteger)nanosecondValue
{
  id v17;

  v17 = (id)objc_opt_new();
  objc_msgSend(v17, "setEra:", eraValue);
  objc_msgSend(v17, "setYear:", yearValue);
  objc_msgSend(v17, "setMonth:", monthValue);
  objc_msgSend(v17, "setDay:", dayValue);
  objc_msgSend(v17, "setHour:", hourValue);
  objc_msgSend(v17, "setMinute:", minuteValue);
  objc_msgSend(v17, "setSecond:", secondValue);
  objc_msgSend(v17, "setNanosecond:", nanosecondValue);
  return -[NSCalendar dateFromComponents:](self, "dateFromComponents:", v17);
}

- (NSDate)dateWithEra:(NSInteger)eraValue yearForWeekOfYear:(NSInteger)yearValue weekOfYear:(NSInteger)weekValue weekday:(NSInteger)weekdayValue hour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue nanosecond:(NSInteger)nanosecondValue
{
  id v17;

  v17 = (id)objc_opt_new();
  objc_msgSend(v17, "setEra:", eraValue);
  objc_msgSend(v17, "setYearForWeekOfYear:", yearValue);
  objc_msgSend(v17, "setWeekOfYear:", weekValue);
  objc_msgSend(v17, "setWeekday:", weekdayValue);
  objc_msgSend(v17, "setHour:", hourValue);
  objc_msgSend(v17, "setMinute:", minuteValue);
  objc_msgSend(v17, "setSecond:", secondValue);
  objc_msgSend(v17, "setNanosecond:", nanosecondValue);
  return -[NSCalendar dateFromComponents:](self, "dateFromComponents:", v17);
}

- (NSDate)startOfDayForDate:(NSDate *)date
{
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5[0] = 0;
  -[NSCalendar rangeOfUnit:startDate:interval:forDate:](self, "rangeOfUnit:startDate:interval:forDate:", 16, v5, &v4, date);
  return (NSDate *)v5[0];
}

- (NSDateComponents)componentsInTimeZone:(NSTimeZone *)timezone fromDate:(NSDate *)date
{
  NSTimeZone *v7;
  NSDateComponents *v8;

  v7 = -[NSCalendar timeZone](self, "timeZone");
  -[NSCalendar setTimeZone:](self, "setTimeZone:", timezone);
  v8 = -[NSCalendar components:fromDate:](self, "components:fromDate:", 3276542, date);
  -[NSCalendar setTimeZone:](self, "setTimeZone:", v7);
  return v8;
}

- (NSComparisonResult)compareDate:(NSDate *)date1 toDate:(NSDate *)date2 toUnitGranularity:(NSCalendarUnit)unit
{
  NSComparisonResult v5;
  double v10;
  double v11;
  double v12;
  long double v13;
  long double v14;
  double v15;
  double v16;
  BOOL v17;
  NSComparisonResult v18;
  long double v19;
  long double v20;
  NSComparisonResult result;
  uint64_t *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  NSDateComponents *v31;
  NSDateComponents *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  _BOOL4 v38;
  int v39;
  int v40;
  NSComparisonResult v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _OWORD __y[2];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[NSDate timeIntervalSinceReferenceDate](date1, "timeIntervalSinceReferenceDate");
  v11 = v10;
  -[NSDate timeIntervalSinceReferenceDate](date2, "timeIntervalSinceReferenceDate");
  if (v11 <= -2.11845067e11 || v11 >= 1.59271755e13 || v12 >= 1.59271755e13 || v12 <= -2.11845067e11)
  {
    v17 = v11 == v12;
    v18 = NSOrderedAscending;
    if (v11 > v12)
      v18 = NSOrderedDescending;
    goto LABEL_20;
  }
  if ((uint64_t)unit <= 127)
  {
    if (unit == 16 || unit == 32)
    {
      *(_QWORD *)&__y[0] = 0;
      *(_QWORD *)&v43 = 0;
      -[NSCalendar rangeOfUnit:startDate:interval:forDate:](self, "rangeOfUnit:startDate:interval:forDate:", unit, __y, &v43, date1);
      objc_msgSend(*(id *)&__y[0], "timeIntervalSinceReferenceDate");
      v25 = v24;
      -[NSDate timeIntervalSinceReferenceDate](date2, "timeIntervalSinceReferenceDate");
      if (v25 <= v26 && v26 < v25 + *(double *)&v43)
        return 0;
      if (v26 < v25)
        return 1;
      return -1;
    }
    if (unit == 64)
    {
      *(_QWORD *)&__y[0] = 0;
      *(_QWORD *)&v43 = 0;
      -[NSDate timeIntervalSinceReferenceDate](date1, "timeIntervalSinceReferenceDate");
      -[NSDate timeIntervalSinceReferenceDate](date2, "timeIntervalSinceReferenceDate", (double)modf(v19, (long double *)__y));
      modf(v20, (long double *)&v43);
      v15 = floor(*(double *)__y / 60.0);
      v16 = floor(*(double *)&v43 / 60.0);
      goto LABEL_17;
    }
  }
  else if ((uint64_t)unit >= 0x100000)
  {
    result = NSOrderedSame;
    if (unit == 0x100000 || unit == 0x200000)
      return result;
  }
  else if (unit == 128 || unit == 0x8000)
  {
    *(_QWORD *)&__y[0] = 0;
    -[NSDate timeIntervalSinceReferenceDate](date1, "timeIntervalSinceReferenceDate", 0);
    -[NSDate timeIntervalSinceReferenceDate](date2, "timeIntervalSinceReferenceDate", (double)modf(v13, (long double *)__y));
    modf(v14, (long double *)&v43);
    v15 = *(double *)__y;
    v16 = *(double *)&v43;
LABEL_17:
    v18 = NSOrderedAscending;
    if (v16 < v15)
      v18 = NSOrderedDescending;
    v17 = v15 == v16;
LABEL_20:
    if (v17)
      return 0;
    else
      return v18;
  }
  __y[0] = xmmword_182DC7250;
  __y[1] = xmmword_182DC7260;
  v47 = 16;
  v43 = xmmword_182DC7250;
  v44 = xmmword_182DC7270;
  v45 = 512;
  if ((uint64_t)unit <= 4095)
  {
    if (unit != 512)
    {
      if (unit != 1024)
      {
LABEL_42:
        v22 = &qword_182DC7280;
        v23 = 4;
        goto LABEL_43;
      }
      v22 = (uint64_t *)__y;
      goto LABEL_41;
    }
LABEL_40:
    v22 = (uint64_t *)&v43;
LABEL_41:
    v23 = 5;
    goto LABEL_43;
  }
  if (unit == 4096)
    goto LABEL_40;
  v22 = &qword_182DC72A0;
  v23 = 4;
  if (unit != 0x2000 && unit != 0x4000)
    goto LABEL_42;
LABEL_43:
  v27 = 0;
  v28 = v22;
  v29 = v23;
  do
  {
    v30 = *v28++;
    v27 |= v30;
    --v29;
  }
  while (v29);
  v31 = -[NSCalendar components:fromDate:](self, "components:fromDate:", v27, date1, v43, v44, v45);
  v32 = -[NSCalendar components:fromDate:](self, "components:fromDate:", v27, date2);
  v33 = v23 - 1;
  while (1)
  {
    v34 = v33;
    v35 = -[NSDateComponents valueForComponent:](v31, "valueForComponent:", *v22);
    v36 = -[NSDateComponents valueForComponent:](v32, "valueForComponent:", *v22);
    if (v35 > v36)
      return 1;
    if (v35 < v36)
      break;
    if (*v22 == 8
      && -[NSString isEqualToString:](-[NSCalendar calendarIdentifier](self, "calendarIdentifier"), "isEqualToString:", CFSTR("chinese")))
    {
      v37 = -[NSDateComponents isLeapMonth](v31, "isLeapMonth");
      v38 = -[NSDateComponents isLeapMonth](v32, "isLeapMonth");
      v39 = v37 || !v38;
      v40 = !v37 || v38;
      if (v40)
        v41 = v5;
      else
        v41 = NSOrderedDescending;
      if (v39)
        result = v41;
      else
        result = NSOrderedAscending;
      if (v39 != 1 || !v40)
        return result;
    }
    else
    {
      result = v5;
    }
    v42 = *v22++;
    if (v42 == unit)
      return 0;
    v33 = v34 - 1;
    v5 = result;
    result = NSOrderedSame;
    if (!v34)
      return result;
  }
  return -1;
}

- (BOOL)isDate:(NSDate *)date1 equalToDate:(NSDate *)date2 toUnitGranularity:(NSCalendarUnit)unit
{
  BOOL result;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (date1 || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    if (date2 || !_CFExecutableLinkedOnOrAfter(9uLL))
    {
      return -[NSCalendar compareDate:toDate:toUnitGranularity:](self, "compareDate:toDate:toUnitGranularity:", date1, date2, unit) == NSOrderedSame;
    }
    else
    {
      v17 = isDate_equalToDate_toUnitGranularity____count___17;
      if (isDate_equalToDate_toUnitGranularity____count___17 <= 13)
      {
        objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
        CFLog(3, (uint64_t)CFSTR("*** %s: date2 cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v18, v19, v20, v21, v22, v23, (__int16)"-[NSCalendar isDate:equalToDate:toUnitGranularity:]");
        v17 = isDate_equalToDate_toUnitGranularity____count___17;
      }
      result = 0;
      isDate_equalToDate_toUnitGranularity____count___17 = v17 + 1;
    }
  }
  else
  {
    v10 = isDate_equalToDate_toUnitGranularity____count__;
    if (isDate_equalToDate_toUnitGranularity____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, (uint64_t)CFSTR("*** %s: date1 cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v11, v12, v13, v14, v15, v16, (__int16)"-[NSCalendar isDate:equalToDate:toUnitGranularity:]");
      v10 = isDate_equalToDate_toUnitGranularity____count__;
    }
    result = 0;
    isDate_equalToDate_toUnitGranularity____count__ = v10 + 1;
  }
  return result;
}

- (BOOL)isDate:(NSDate *)date1 inSameDayAsDate:(NSDate *)date2
{
  BOOL result;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (date1 || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    if (date2 || !_CFExecutableLinkedOnOrAfter(9uLL))
    {
      return -[NSCalendar compareDate:toDate:toUnitGranularity:](self, "compareDate:toDate:toUnitGranularity:", date1, date2, 16) == NSOrderedSame;
    }
    else
    {
      v15 = isDate_inSameDayAsDate____count___20;
      if (isDate_inSameDayAsDate____count___20 <= 13)
      {
        objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
        CFLog(3, (uint64_t)CFSTR("*** %s: date2 cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v16, v17, v18, v19, v20, v21, (__int16)"-[NSCalendar isDate:inSameDayAsDate:]");
        v15 = isDate_inSameDayAsDate____count___20;
      }
      result = 0;
      isDate_inSameDayAsDate____count___20 = v15 + 1;
    }
  }
  else
  {
    v8 = isDate_inSameDayAsDate____count__;
    if (isDate_inSameDayAsDate____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, (uint64_t)CFSTR("*** %s: date1 cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v9, v10, v11, v12, v13, v14, (__int16)"-[NSCalendar isDate:inSameDayAsDate:]");
      v8 = isDate_inSameDayAsDate____count__;
    }
    result = 0;
    isDate_inSameDayAsDate____count__ = v8 + 1;
  }
  return result;
}

- (BOOL)isDateInToday:(NSDate *)date
{
  BOOL result;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
    return -[NSCalendar compareDate:toDate:toUnitGranularity:](self, "compareDate:toDate:toUnitGranularity:", date, +[NSDate date](NSDate, "date"), 16) == NSOrderedSame;
  v6 = isDateInToday____count__;
  if (isDateInToday____count__ <= 13)
  {
    objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
    CFLog(3, (uint64_t)CFSTR("*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v7, v8, v9, v10, v11, v12, (__int16)"-[NSCalendar isDateInToday:]");
    v6 = isDateInToday____count__;
  }
  result = 0;
  isDateInToday____count__ = v6 + 1;
  return result;
}

- (BOOL)isDateInYesterday:(NSDate *)date
{
  _BOOL4 v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x1E0C80C00];
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    v14 = 0;
    v15[0] = 0;
    v5 = -[NSCalendar rangeOfUnit:startDate:interval:forDate:](self, "rangeOfUnit:startDate:interval:forDate:", 16, v15, &v14, +[NSDate date](NSDate, "date"));
    if (v5)
      LOBYTE(v5) = -[NSCalendar compareDate:toDate:toUnitGranularity:](self, "compareDate:toDate:toUnitGranularity:", date, objc_msgSend(v15[0], "dateByAddingTimeInterval:", -60.0), 16) == NSOrderedSame;
  }
  else
  {
    v6 = isDateInYesterday____count__;
    if (isDateInYesterday____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, (uint64_t)CFSTR("*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v7, v8, v9, v10, v11, v12, (__int16)"-[NSCalendar isDateInYesterday:]");
      v6 = isDateInYesterday____count__;
    }
    LOBYTE(v5) = 0;
    isDateInYesterday____count__ = v6 + 1;
  }
  return v5;
}

- (BOOL)isDateInTomorrow:(NSDate *)date
{
  _BOOL4 v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x1E0C80C00];
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    v14 = 0.0;
    v15[0] = 0;
    v5 = -[NSCalendar rangeOfUnit:startDate:interval:forDate:](self, "rangeOfUnit:startDate:interval:forDate:", 16, v15, &v14, +[NSDate date](NSDate, "date"));
    if (v5)
      LOBYTE(v5) = -[NSCalendar compareDate:toDate:toUnitGranularity:](self, "compareDate:toDate:toUnitGranularity:", date, objc_msgSend(v15[0], "dateByAddingTimeInterval:", v14 + 60.0), 16) == NSOrderedSame;
  }
  else
  {
    v6 = isDateInTomorrow____count__;
    if (isDateInTomorrow____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, (uint64_t)CFSTR("*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v7, v8, v9, v10, v11, v12, (__int16)"-[NSCalendar isDateInTomorrow:]");
      v6 = isDateInTomorrow____count__;
    }
    LOBYTE(v5) = 0;
    isDateInTomorrow____count__ = v6 + 1;
  }
  return v5;
}

- (BOOL)rangeOfWeekendStartDate:(NSDate *)datep interval:(NSTimeInterval *)tip containingDate:(NSDate *)date
{
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v16;
  uint64_t v17;
  NSDate *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19[0] = 0;
  v16 = 0.0;
  v17 = 0;
  if (-[NSCalendar nextWeekendStartDate:interval:options:afterDate:](self, "nextWeekendStartDate:interval:options:afterDate:", v19, &v17, 0, date))
  {
    v9 = !-[NSCalendar nextWeekendStartDate:interval:options:afterDate:](self, "nextWeekendStartDate:interval:options:afterDate:", &v18, &v16, 4, v19[0]);
  }
  else
  {
    v9 = 1;
  }
  -[NSDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
  v11 = v10;
  -[NSDate timeIntervalSinceReferenceDate](v18, "timeIntervalSinceReferenceDate");
  if ((v9 & 1) != 0)
    return 0;
  v13 = v16;
  if (v12 > v11 || v11 >= v12 + v16)
    return 0;
  if (datep)
    *datep = v18;
  if (tip)
    *tip = v13;
  return 1;
}

- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDateComponents:(NSDateComponents *)startingDateComp toDateComponents:(NSDateComponents *)resultDateComp options:(NSCalendarOptions)options
{
  NSCalendar *v11;
  uint64_t v12;
  NSCalendar *v13;

  v11 = -[NSDateComponents calendar](startingDateComp, "calendar");
  if (!v11)
    v11 = self;
  v12 = -[NSCalendar dateFromComponents:](v11, "dateFromComponents:", startingDateComp);
  v13 = -[NSDateComponents calendar](resultDateComp, "calendar");
  if (!v13)
    v13 = self;
  return -[NSCalendar components:fromDate:toDate:options:](self, "components:fromDate:toDate:options:", unitFlags, v12, -[NSCalendar dateFromComponents:](v13, "dateFromComponents:", resultDateComp), options);
}

- (NSDate)dateByAddingUnit:(NSCalendarUnit)unit value:(NSInteger)value toDate:(NSDate *)date options:(NSCalendarOptions)options
{
  id v11;

  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setValue:forComponent:", value, unit);
  return -[NSCalendar dateByAddingComponents:toDate:options:](self, "dateByAddingComponents:toDate:options:", v11, date, options);
}

- (NSDate)nextDateAfterDate:(NSDate *)date matchingComponents:(NSDateComponents *)comps options:(NSCalendarOptions)options
{
  NSDate *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__NSCalendar_nextDateAfterDate_matchingComponents_options___block_invoke;
  v7[3] = &unk_1E13346C0;
  v7[4] = &v8;
  -[NSCalendar enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:](self, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:", date, comps, options, v7);
  v5 = (NSDate *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __59__NSCalendar_nextDateAfterDate_matchingComponents_options___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) = a2;
  *a4 = 1;
  return result;
}

- (NSDate)nextDateAfterDate:(NSDate *)date matchingUnit:(NSCalendarUnit)unit value:(NSInteger)value options:(NSCalendarOptions)options
{
  id v11;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    v11 = (id)objc_opt_new();
    objc_msgSend(v11, "setValue:forComponent:", value, unit);
    return -[NSCalendar nextDateAfterDate:matchingComponents:options:](self, "nextDateAfterDate:matchingComponents:options:", date, v11, options);
  }
  else
  {
    v13 = nextDateAfterDate_matchingUnit_value_options____count__;
    if (nextDateAfterDate_matchingUnit_value_options____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, (uint64_t)CFSTR("*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v14, v15, v16, v17, v18, v19, (__int16)"-[NSCalendar nextDateAfterDate:matchingUnit:value:options:]");
      v13 = nextDateAfterDate_matchingUnit_value_options____count__;
    }
    nextDateAfterDate_matchingUnit_value_options____count__ = v13 + 1;
    return 0;
  }
}

- (NSDate)nextDateAfterDate:(NSDate *)date matchingHour:(NSInteger)hourValue minute:(NSInteger)minuteValue second:(NSInteger)secondValue options:(NSCalendarOptions)options
{
  id v13;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    v13 = (id)objc_opt_new();
    objc_msgSend(v13, "setHour:", hourValue);
    objc_msgSend(v13, "setMinute:", minuteValue);
    objc_msgSend(v13, "setSecond:", secondValue);
    return -[NSCalendar nextDateAfterDate:matchingComponents:options:](self, "nextDateAfterDate:matchingComponents:options:", date, v13, options);
  }
  else
  {
    v15 = nextDateAfterDate_matchingHour_minute_second_options____count__;
    if (nextDateAfterDate_matchingHour_minute_second_options____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, (uint64_t)CFSTR("*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v16, v17, v18, v19, v20, v21, (__int16)"-[NSCalendar nextDateAfterDate:matchingHour:minute:second:options:]");
      v15 = nextDateAfterDate_matchingHour_minute_second_options____count__;
    }
    nextDateAfterDate_matchingHour_minute_second_options____count__ = v15 + 1;
    return 0;
  }
}

- (NSDate)dateBySettingUnit:(NSCalendarUnit)unit value:(NSInteger)v ofDate:(NSDate *)date options:(NSCalendarOptions)opts
{
  NSDate *v7;
  NSCalendarOptions v11;
  NSDateComponents *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;

  v7 = date;
  v21 = *MEMORY[0x1E0C80C00];
  if (-[NSCalendar component:fromDate:](self, "component:fromDate:", unit, date) != v)
  {
    if (opts)
      v11 = opts;
    else
      v11 = 1024;
    v12 = objc_alloc_init(NSDateComponents);
    -[NSDateComponents setValue:forComponent:](v12, "setValue:forComponent:", v, unit);
    v15 = 0;
    v16 = &v15;
    v17 = 0x3052000000;
    v18 = __Block_byref_object_copy__1;
    v19 = __Block_byref_object_dispose__1;
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__NSCalendar_dateBySettingUnit_value_ofDate_options___block_invoke;
    v14[3] = &unk_1E13346C0;
    v14[4] = &v15;
    -[NSCalendar enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:](self, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:", v7, v12, v11, v14);

    v7 = (NSDate *)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  return v7;
}

uint64_t __53__NSCalendar_dateBySettingUnit_value_ofDate_options___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) = a2;
  *a4 = 1;
  return result;
}

- (NSDate)dateBySettingHour:(NSInteger)h minute:(NSInteger)m second:(NSInteger)s ofDate:(NSDate *)date options:(NSCalendarOptions)opts
{
  __int16 v7;
  NSDateComponents *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDate *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  id v27[2];

  v7 = opts;
  v27[1] = *(id *)MEMORY[0x1E0C80C00];
  if (date || !_CFExecutableLinkedOnOrAfter(9uLL))
  {
    v26 = 0;
    v27[0] = 0;
    -[NSCalendar rangeOfUnit:startDate:interval:forDate:](self, "rangeOfUnit:startDate:interval:forDate:", 16, v27, &v26, date);
    if (v27[0])
    {
      v13 = objc_alloc_init(NSDateComponents);
      -[NSDateComponents setHour:](v13, "setHour:", h);
      -[NSDateComponents setMinute:](v13, "setMinute:", m);
      -[NSDateComponents setSecond:](v13, "setSecond:", s);
      v14 = 2;
      if ((v7 & 2) == 0)
        v14 = 1024;
      v15 = 0x2000;
      if ((v7 & 0x2000) == 0)
        v15 = 4096;
      v16 = v14 | v15;
      v17 = -[NSCalendar nextDateAfterDate:matchingComponents:options:](self, "nextDateAfterDate:matchingComponents:options:", objc_msgSend(v27[0], "dateByAddingTimeInterval:", -0.5), v13, v14 | v15);
      if (-[NSDate compare:](v17, "compare:", v27[0]) == NSOrderedAscending)
        v17 = -[NSCalendar nextDateAfterDate:matchingComponents:options:](self, "nextDateAfterDate:matchingComponents:options:", v27[0], v13, v16);

    }
    else
    {
      return 0;
    }
  }
  else
  {
    v18 = dateBySettingHour_minute_second_ofDate_options____count__;
    if (dateBySettingHour_minute_second_ofDate_options____count__ <= 13)
    {
      objc_msgSend((id)-[objc_class callStackSymbols](__CFLookUpClass("NSThread"), "callStackSymbols"), "description");
      CFLog(3, (uint64_t)CFSTR("*** %s: date cannot be nil\nFuture exception.\nA few of these errors are going to be reported with this complaint, then further violations will simply be ignored.\nHere is the backtrace where this occurred this time (some frames may be missing due to compiler optimizations):\n%@"), v19, v20, v21, v22, v23, v24, (__int16)"-[NSCalendar dateBySettingHour:minute:second:ofDate:options:]");
      v18 = dateBySettingHour_minute_second_ofDate_options____count__;
    }
    v17 = 0;
    dateBySettingHour_minute_second_ofDate_options____count__ = v18 + 1;
  }
  return v17;
}

- (BOOL)date:(NSDate *)date matchesComponents:(NSDateComponents *)components
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSDateComponents *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v7 = 0;
  v8 = 0;
  do
  {
    v9 = qword_182DC72C0[v7];
    if (-[NSDateComponents valueForComponent:](components, "valueForComponent:", v9) == 0x7FFFFFFFFFFFFFFFLL)
      v10 = 0;
    else
      v10 = v9;
    v8 |= v10;
    ++v7;
  }
  while (v7 != 14);
  if (!v8 && -[NSDateComponents isLeapMonthSet](components, "isLeapMonthSet"))
    return -[NSDateComponents isLeapMonthSet](-[NSCalendar components:fromDate:](self, "components:fromDate:", 8, date), "isLeapMonthSet");
  v12 = -[NSCalendar components:fromDate:](self, "components:fromDate:", v8, date);
  v13 = (id)-[NSDateComponents copy](components, "copy");
  if (-[NSDateComponents isLeapMonthSet](v12, "isLeapMonthSet")
    && !-[NSDateComponents isLeapMonthSet](components, "isLeapMonthSet"))
  {
    objc_msgSend(v13, "setLeapMonth:", -[NSDateComponents isLeapMonth](v12, "isLeapMonth"));
  }
  v14 = -[NSDateComponents valueForComponent:](v12, "valueForComponent:", 0x8000);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v14;
    v16 = objc_msgSend(v13, "valueForComponent:", 0x8000);
    v17 = v15 - v16;
    if (v15 - v16 < 0)
      v17 = v16 - v15;
    if (v17 > 0x1F4)
      return 0;
    -[NSDateComponents setNanosecond:](v12, "setNanosecond:", 0);
    objc_msgSend(v13, "setNanosecond:", 0);
  }
  return objc_msgSend(v13, "isEqual:", v12);
}

- (BOOL)rangeOfUnit:(NSCalendarUnit)unit startDate:(NSDate *)datep interval:(NSTimeInterval *)tip forDate:(NSDate *)date
{
  return 0;
}

- (NSArray)eraSymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterEraSymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)monthSymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterMonthSymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)shortMonthSymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterShortMonthSymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)weekdaySymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterWeekdaySymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)shortWeekdaySymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterShortWeekdaySymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSString)AMSymbol
{
  __CFDateFormatter *v3;
  NSString *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterAMSymbolKey"));
  CFRelease(v3);
  return v4;
}

- (NSString)PMSymbol
{
  __CFDateFormatter *v3;
  NSString *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterPMSymbolKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)longEraSymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterLongEraSymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)veryShortMonthSymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterVeryShortMonthSymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)standaloneMonthSymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterStandaloneMonthSymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)shortStandaloneMonthSymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterShortStandaloneMonthSymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)veryShortStandaloneMonthSymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterVeryShortStandaloneMonthSymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)veryShortWeekdaySymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterVeryShortWeekdaySymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)standaloneWeekdaySymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterStandaloneWeekdaySymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)shortStandaloneWeekdaySymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterShortStandaloneWeekdaySymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)veryShortStandaloneWeekdaySymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterVeryShortStandaloneWeekdaySymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)quarterSymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterQuarterSymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)shortQuarterSymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterShortQuarterSymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)standaloneQuarterSymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterStandaloneQuarterSymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (NSArray)shortStandaloneQuarterSymbols
{
  __CFDateFormatter *v3;
  NSArray *v4;

  v3 = CFDateFormatterCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleRef)-[NSCalendar locale](self, "locale"), kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFDateFormatterSetProperty(v3, CFSTR("kCFDateFormatterCalendarKey"), self);
  v4 = (id)CFDateFormatterCopyProperty(v3, CFSTR("kCFDateFormatterShortStandaloneQuarterSymbolsKey"));
  CFRelease(v3);
  return v4;
}

- (BOOL)isDateInWeekend:(NSDate *)date
{
  objc_class *v3;

  OUTLINED_FUNCTION_1_15();
  v3 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v3);
}

- (BOOL)nextWeekendStartDate:(NSDate *)datep interval:(NSTimeInterval *)tip options:(NSCalendarOptions)options afterDate:(NSDate *)date
{
  objc_class *v6;

  OUTLINED_FUNCTION_1_15();
  v6 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v6);
}

- (void)enumerateDatesStartingAfterDate:(NSDate *)start matchingComponents:(NSDateComponents *)comps options:(NSCalendarOptions)opts usingBlock:(void *)block
{
  objc_class *v6;
  uint64_t v7;

  OUTLINED_FUNCTION_1_15();
  __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_11(v6, v7);
}

- (NSCalendarIdentifier)calendarIdentifier
{
  objc_class *v2;

  OUTLINED_FUNCTION_1_15();
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v2);
}

- (void)setLocale:(NSLocale *)locale
{
  objc_class *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_15();
  __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_11(v3, v4);
}

- (NSLocale)locale
{
  objc_class *v2;

  OUTLINED_FUNCTION_1_15();
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v2);
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  objc_class *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_15();
  __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_11(v3, v4);
}

- (NSTimeZone)timeZone
{
  objc_class *v2;

  OUTLINED_FUNCTION_1_15();
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v2);
}

- (void)setFirstWeekday:(NSUInteger)firstWeekday
{
  objc_class *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_15();
  __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_11(v3, v4);
}

- (NSUInteger)firstWeekday
{
  objc_class *v2;

  OUTLINED_FUNCTION_1_15();
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v2);
}

- (void)setMinimumDaysInFirstWeek:(NSUInteger)minimumDaysInFirstWeek
{
  objc_class *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_15();
  __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_11(v3, v4);
}

- (NSUInteger)minimumDaysInFirstWeek
{
  objc_class *v2;

  OUTLINED_FUNCTION_1_15();
  v2 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v2);
}

- (NSRange)minimumRangeOfUnit:(NSCalendarUnit)unit
{
  objc_class *v3;

  OUTLINED_FUNCTION_1_15();
  v3 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v3);
}

- (NSRange)maximumRangeOfUnit:(NSCalendarUnit)unit
{
  objc_class *v3;

  OUTLINED_FUNCTION_1_15();
  v3 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v3);
}

- (NSRange)rangeOfUnit:(NSCalendarUnit)smaller inUnit:(NSCalendarUnit)larger forDate:(NSDate *)date
{
  objc_class *v5;

  OUTLINED_FUNCTION_1_15();
  v5 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v5);
}

- (NSUInteger)ordinalityOfUnit:(NSCalendarUnit)smaller inUnit:(NSCalendarUnit)larger forDate:(NSDate *)date
{
  objc_class *v5;

  OUTLINED_FUNCTION_1_15();
  v5 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v5);
}

- (NSDate)dateFromComponents:(NSDateComponents *)comps
{
  objc_class *v3;

  OUTLINED_FUNCTION_1_15();
  v3 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v3);
}

- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)date
{
  objc_class *v4;

  OUTLINED_FUNCTION_1_15();
  v4 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v4);
}

- (NSDate)dateByAddingComponents:(NSDateComponents *)comps toDate:(NSDate *)date options:(NSCalendarOptions)opts
{
  objc_class *v5;

  OUTLINED_FUNCTION_1_15();
  v5 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v5);
}

- (NSDateComponents)components:(NSCalendarUnit)unitFlags fromDate:(NSDate *)startingDate toDate:(NSDate *)resultDate options:(NSCalendarOptions)opts
{
  objc_class *v6;

  OUTLINED_FUNCTION_1_15();
  v6 = __CFLookUpClass("NSCalendar");
  OUTLINED_FUNCTION_0_24(v6);
}

@end
