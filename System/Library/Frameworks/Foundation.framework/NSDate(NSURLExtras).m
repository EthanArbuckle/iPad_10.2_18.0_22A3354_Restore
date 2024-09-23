@implementation NSDate(NSURLExtras)

- (NSString)_web_RFC1123DateString
{
  double v1;
  double v2;
  id v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  if (v1 < -1.26227808e10)
    v1 = -1.26227808e10;
  if (v1 <= 1.26227808e10)
    v2 = v1;
  else
    v2 = 1.26227808e10;
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (id)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "setTimeZone:", objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT")));
  v5 = (void *)objc_msgSend(v4, "components:fromDate:", 764, objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v2));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s, %02ld %s %ld %02ld:%02ld:%02ld GMT"), kDayStrs[objc_msgSend(v5, "weekday") - 1], objc_msgSend(v5, "day"), kMonthStrs[objc_msgSend(v5, "month") - 1], objc_msgSend(v5, "year"), objc_msgSend(v5, "hour"), objc_msgSend(v5, "minute"), objc_msgSend(v5, "second"));
}

- (uint64_t)_web_compareDay:()NSURLExtras
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  if (a1 == a3)
    return 0;
  v5 = objc_alloc(MEMORY[0x1E0C99D48]);
  v6 = (id)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v7 = (void *)objc_msgSend(v6, "components:fromDate:", 28, a1);
  v8 = (void *)objc_msgSend(v6, "components:fromDate:", 28, a3);
  v9 = objc_msgSend(v7, "year");
  v10 = objc_msgSend(v8, "year");
  if (v9 < v10)
    return -1;
  if (v9 > v10)
    return 1;
  v11 = objc_msgSend(v7, "month");
  v12 = objc_msgSend(v8, "month");
  if (v11 < v12)
    return -1;
  if (v11 > v12)
    return 1;
  v14 = objc_msgSend(v7, "day");
  v15 = objc_msgSend(v8, "day");
  if (v14 < v15)
    return -1;
  else
    return v14 > v15;
}

- (BOOL)_web_isToday
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "_web_compareDay:", a1) == 0;
}

@end
