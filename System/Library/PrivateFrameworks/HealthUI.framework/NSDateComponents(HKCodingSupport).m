@implementation NSDateComponents(HKCodingSupport)

- (uint64_t)hkui_codableDateComponents
{
  return objc_msgSend(a1, "_hkui_codableDateComponentsForCalendarUnits:", 65278);
}

- (HKCodableDateComponents)_hkui_codableDateComponentsForCalendarUnits:()HKCodingSupport
{
  HKCodableDateComponents *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc_init(HKCodableDateComponents);
    if ((a3 & 2) != 0 && objc_msgSend(a1, "era") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setEra:](v5, "setEra:", objc_msgSend(a1, "era"));
    if ((a3 & 4) != 0 && objc_msgSend(a1, "year") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setYear:](v5, "setYear:", objc_msgSend(a1, "year"));
    if ((a3 & 8) != 0 && objc_msgSend(a1, "month") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setMonth:](v5, "setMonth:", objc_msgSend(a1, "month"));
    if ((a3 & 0x10) != 0 && objc_msgSend(a1, "day") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setDay:](v5, "setDay:", objc_msgSend(a1, "day"));
    if ((a3 & 0x20) != 0 && objc_msgSend(a1, "hour") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setHour:](v5, "setHour:", objc_msgSend(a1, "hour"));
    if ((a3 & 0x40) != 0 && objc_msgSend(a1, "minute") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setMinute:](v5, "setMinute:", objc_msgSend(a1, "minute"));
    if ((a3 & 0x80) != 0 && objc_msgSend(a1, "second") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setSecond:](v5, "setSecond:", objc_msgSend(a1, "second"));
    if ((a3 & 0x200) != 0 && objc_msgSend(a1, "weekday") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setWeekday:](v5, "setWeekday:", objc_msgSend(a1, "weekday"));
    if ((a3 & 0x400) != 0 && objc_msgSend(a1, "weekdayOrdinal") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setWeekdayOrdinal:](v5, "setWeekdayOrdinal:", objc_msgSend(a1, "weekdayOrdinal"));
    if ((a3 & 0x800) != 0 && objc_msgSend(a1, "quarter") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setQuarter:](v5, "setQuarter:", objc_msgSend(a1, "quarter"));
    if ((a3 & 0x1000) != 0 && objc_msgSend(a1, "weekOfMonth") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setWeekOfMonth:](v5, "setWeekOfMonth:", objc_msgSend(a1, "weekOfMonth"));
    if ((a3 & 0x2000) != 0 && objc_msgSend(a1, "weekOfYear") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setWeekOfYear:](v5, "setWeekOfYear:", objc_msgSend(a1, "weekOfYear"));
    if ((a3 & 0x4000) != 0 && objc_msgSend(a1, "yearForWeekOfYear") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setYearForWeekOfYear:](v5, "setYearForWeekOfYear:", objc_msgSend(a1, "yearForWeekOfYear"));
    if (a3 < 0 && objc_msgSend(a1, "nanosecond") != 0x7FFFFFFFFFFFFFFFLL)
      -[HKCodableDateComponents setNanosecond:](v5, "setNanosecond:", objc_msgSend(a1, "nanosecond"));
    objc_msgSend(a1, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendarIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableDateComponents setCalendar:](v5, "setCalendar:", v7);

    objc_msgSend(a1, "timeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableDateComponents setTimeZone:](v5, "setTimeZone:", v9);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)_hkui_dateComponentsWithCodableDateComponents:()HKCodingSupport calendarUnits:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    goto LABEL_53;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  if ((a4 & 2) != 0 && objc_msgSend(v5, "hasEra"))
    objc_msgSend(v6, "setEra:", objc_msgSend(v5, "era"));
  if ((a4 & 4) != 0 && objc_msgSend(v5, "hasYear"))
    objc_msgSend(v6, "setYear:", objc_msgSend(v5, "year"));
  if ((a4 & 8) != 0 && objc_msgSend(v5, "hasMonth"))
    objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "month"));
  if ((a4 & 0x10) != 0 && objc_msgSend(v5, "hasDay"))
    objc_msgSend(v6, "setDay:", objc_msgSend(v5, "day"));
  if ((a4 & 0x20) != 0 && objc_msgSend(v5, "hasHour"))
    objc_msgSend(v6, "setHour:", objc_msgSend(v5, "hour"));
  if ((a4 & 0x40) != 0 && objc_msgSend(v5, "hasMinute"))
    objc_msgSend(v6, "setMinute:", objc_msgSend(v5, "minute"));
  if ((a4 & 0x80) != 0 && objc_msgSend(v5, "hasSecond"))
    objc_msgSend(v6, "setSecond:", objc_msgSend(v5, "second"));
  if ((a4 & 0x200) != 0 && objc_msgSend(v5, "hasWeekday"))
    objc_msgSend(v6, "setWeekday:", objc_msgSend(v5, "weekday"));
  if ((a4 & 0x400) != 0 && objc_msgSend(v5, "hasWeekdayOrdinal"))
    objc_msgSend(v6, "setWeekdayOrdinal:", objc_msgSend(v5, "weekdayOrdinal"));
  if ((a4 & 0x800) != 0 && objc_msgSend(v5, "hasQuarter"))
    objc_msgSend(v6, "setQuarter:", objc_msgSend(v5, "quarter"));
  if ((a4 & 0x1000) != 0 && objc_msgSend(v5, "hasWeekOfMonth"))
    objc_msgSend(v6, "setWeekOfMonth:", objc_msgSend(v5, "weekOfMonth"));
  if ((a4 & 0x2000) != 0 && objc_msgSend(v5, "hasWeekOfYear"))
    objc_msgSend(v6, "setWeekOfYear:", objc_msgSend(v5, "weekOfYear"));
  if ((a4 & 0x4000) != 0 && objc_msgSend(v5, "hasYearForWeekOfYear"))
    objc_msgSend(v6, "setYearForWeekOfYear:", objc_msgSend(v5, "yearForWeekOfYear"));
  if (a4 < 0 && objc_msgSend(v5, "hasNanosecond"))
    objc_msgSend(v6, "setNanosecond:", objc_msgSend(v5, "nanosecond"));
  if (objc_msgSend(v5, "hasCalendar"))
  {
    v7 = (void *)MEMORY[0x1E0C99D48];
    objc_msgSend(v5, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendarWithIdentifier:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_51;
    objc_msgSend(v6, "setCalendar:", v9);

  }
  if (!objc_msgSend(v5, "hasTimeZone"))
  {
LABEL_50:
    v9 = v6;
    goto LABEL_51;
  }
  v10 = (void *)MEMORY[0x1E0C99E80];
  objc_msgSend(v5, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeZoneWithName:", v11);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "setTimeZone:", v9);

    goto LABEL_50;
  }
LABEL_51:

LABEL_53:
  return v9;
}

+ (uint64_t)hkui_dateComponentsWithCodableDateComponents:()HKCodingSupport
{
  return objc_msgSend(MEMORY[0x1E0C99D78], "_hkui_dateComponentsWithCodableDateComponents:calendarUnits:", a3, 65278);
}

@end
