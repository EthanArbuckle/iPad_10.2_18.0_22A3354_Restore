@implementation NSDateComponents(_)

- (uint64_t)encodeWithCoder:()_
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSDateComponents requires a keyed encoder"), 0));
  v5 = objc_msgSend(a1, "calendar");
  if (v5)
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NS.calendar"));
  v6 = objc_msgSend(a1, "timeZone");
  if (v6)
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NS.timezone"));
  v7 = objc_msgSend(a1, "era");
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v7, CFSTR("NS.era"));
  v8 = objc_msgSend(a1, "year");
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v8, CFSTR("NS.year"));
  v9 = objc_msgSend(a1, "month");
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v9, CFSTR("NS.month"));
  v10 = objc_msgSend(a1, "day");
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v10, CFSTR("NS.day"));
  v11 = objc_msgSend(a1, "hour");
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v11, CFSTR("NS.hour"));
  v12 = objc_msgSend(a1, "minute");
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v12, CFSTR("NS.minute"));
  v13 = objc_msgSend(a1, "second");
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v13, CFSTR("NS.second"));
  v14 = objc_msgSend(a1, "week");
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v14, CFSTR("NS.week"));
  v15 = objc_msgSend(a1, "weekday");
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v15, CFSTR("NS.weekday"));
  v16 = objc_msgSend(a1, "weekdayOrdinal");
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v16, CFSTR("NS.weekdayOrdinal"));
  v17 = objc_msgSend(a1, "quarter");
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v17, CFSTR("NS.quarter"));
  v18 = objc_msgSend(a1, "nanosecond");
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v18, CFSTR("NS.nanosec"));
  v19 = objc_msgSend(a1, "weekOfMonth");
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v19, CFSTR("NS.weekOfMonth"));
  v20 = objc_msgSend(a1, "weekOfYear");
  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v20, CFSTR("NS.weekOfYear"));
  v21 = objc_msgSend(a1, "yearForWeekOfYear");
  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v21, CFSTR("NS.yearForWOY"));
  v22 = objc_msgSend(a1, "dayOfYear");
  if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a3, "encodeInteger:forKey:", v22, CFSTR("NS.dayOfYear"));
  return objc_msgSend(a3, "encodeInteger:forKey:", objc_msgSend(a1, "isLeapMonth"), CFSTR("NS.leapMonth"));
}

- (void)initWithCoder:()_
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString **v8;
  const __CFString **v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSDateComponents requires a keyed encoder"), 0));
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.calendar")))
  {
    v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.calendar"));
    if (!v5 || (v6 = v5, (objc_opt_isKindOfClass() & 1) == 0))
    {

      v35 = CFSTR("NSLocalizedDescription");
      v36[0] = CFSTR("Calendar has been corrupted!");
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = (const __CFString **)v36;
      v9 = &v35;
LABEL_11:
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 1)));
      return 0;
    }
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.timezone")))
  {
    v10 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.timezone"));
    if (!v10 || (v11 = v10, (objc_opt_isKindOfClass() & 1) == 0))
    {

      v33 = CFSTR("NSLocalizedDescription");
      v34 = CFSTR("Time zone has been corrupted!");
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = &v34;
      v9 = &v33;
      goto LABEL_11;
    }
  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.era")))
    v32 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.era"));
  else
    v32 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.year")))
    v31 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.year"));
  else
    v31 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.month")))
    v30 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.month"));
  else
    v30 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.day")))
    v29 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.day"));
  else
    v29 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.hour")))
    v28 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.hour"));
  else
    v28 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.minute")))
    v27 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.minute"));
  else
    v27 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.second")))
    v26 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.second"));
  else
    v26 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.week")))
    v25 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.week"));
  else
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.weekday")))
    v24 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.weekday"));
  else
    v24 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.weekdayOrdinal")))
    v23 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.weekdayOrdinal"));
  else
    v23 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.quarter")))
    v13 = objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.nanosec"), objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.quarter")));
  else
    v13 = objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.nanosec"), 0x7FFFFFFFFFFFFFFFLL);
  if (v13)
    v14 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.nanosec"));
  else
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.weekOfMonth")))
    v15 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.weekOfMonth"));
  else
    v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.weekOfYear")))
    v16 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.weekOfYear"));
  else
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.yearForWOY")))
    v17 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.yearForWOY"));
  else
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.dayOfYear")))
    v18 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.dayOfYear"));
  else
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.leapMonth")))
    v19 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.leapMonth")) != 0;
  else
    v19 = 0;
  v20 = (void *)objc_msgSend(a1, "init");
  v12 = v20;
  if (v20)
  {
    if (v6)
      objc_msgSend(v20, "setCalendar:", v6);
    if (v11)
      objc_msgSend(v12, "setTimeZone:", v11);
    objc_msgSend(v12, "setEra:", v32);
    objc_msgSend(v12, "setYear:", v31);
    objc_msgSend(v12, "setMonth:", v30);
    objc_msgSend(v12, "setDay:", v29);
    objc_msgSend(v12, "setHour:", v28);
    objc_msgSend(v12, "setMinute:", v27);
    objc_msgSend(v12, "setSecond:", v26);
    objc_msgSend(v12, "setWeek:", v25);
    objc_msgSend(v12, "setWeekday:", v24);
    objc_msgSend(v12, "setWeekdayOrdinal:", v23);
    objc_msgSend(v12, "setQuarter:", v22);
    objc_msgSend(v12, "setNanosecond:", v14);
    objc_msgSend(v12, "setWeekOfMonth:", v15);
    objc_msgSend(v12, "setWeekOfYear:", v16);
    objc_msgSend(v12, "setYearForWeekOfYear:", v17);
    objc_msgSend(v12, "setDayOfYear:", v18);
    if (v19)
      objc_msgSend(v12, "setLeapMonth:", 1);
  }
  return v12;
}

@end
