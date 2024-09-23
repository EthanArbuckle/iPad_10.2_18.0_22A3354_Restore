@implementation NSDateComponents(HealthKit)

- (id)hk_populatedCalendarGregorianCalendarDefault
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "calendar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

+ (uint64_t)hk_oneDay
{
  return objc_msgSend(a1, "hk_componentsWithDays:", 1);
}

+ (id)hk_oneWeek
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v0, "setWeekOfYear:", 1);
  return v0;
}

+ (id)hk_componentsWithDays:()HealthKit
{
  id v4;

  v4 = objc_alloc_init(a1);
  objc_msgSend(v4, "setDay:", a3);
  return v4;
}

+ (id)hk_dateComponentsForCalendarUnit:()HealthKit
{
  id v4;

  v4 = objc_alloc_init(a1);
  objc_msgSend(v4, "setValue:forComponent:", 1, a3);
  return v4;
}

- (double)hk_approximateDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_dateByAddingInterval:toDate:", 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v2);
  v5 = v4;

  return v5;
}

- (id)hk_dateByAddingInterval:()HealthKit toDate:
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v7 = a4;
  v8 = objc_msgSend(a1, "hk_maxComponentValue");
  if (v8 < 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", v10, CFSTR("Date components with negative attributes are incompatible with %@"), v11);

    if (!a3)
    {
LABEL_17:
      v15 = v7;
      goto LABEL_18;
    }
  }
  else if (!a3)
  {
    goto LABEL_17;
  }
  if ((v8 & 0x7FFFFFFFFFFFFFFFLL) == 0)
    goto LABEL_17;
  v12 = 0x7FFFFFFF / v8;
  do
  {
    if (a3 >= 0)
      v13 = a3;
    else
      v13 = -a3;
    if (v13 >= v12)
      v13 = v12;
    if (a3 >= 0)
      v14 = v13;
    else
      v14 = -v13;
    objc_msgSend(a1, "_hk_dateByAddingFilteredInterval:toDate:", v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v15;
    a3 -= v14;
  }
  while (a3);
LABEL_18:
  v16 = v15;

  return v16;
}

- (id)_hk_dateByAddingFilteredInterval:()HealthKit toDate:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a1, "_hk_dateComponentsMultipliedByCount:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v7, v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_hk_dateComponentsMultipliedByCount:()HealthKit
{
  id v4;

  if (a3 == 1)
  {
    v4 = a1;
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    if (objc_msgSend(a1, "year") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "setYear:", objc_msgSend(a1, "year") * a3);
    if (objc_msgSend(a1, "month") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "setMonth:", objc_msgSend(a1, "month") * a3);
    if (objc_msgSend(a1, "weekOfYear") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "setWeekOfYear:", objc_msgSend(a1, "weekOfYear") * a3);
    if (objc_msgSend(a1, "weekOfMonth") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "setWeekOfMonth:", objc_msgSend(a1, "weekOfMonth") * a3);
    if (objc_msgSend(a1, "day") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "setDay:", objc_msgSend(a1, "day") * a3);
    if (objc_msgSend(a1, "hour") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "setHour:", objc_msgSend(a1, "hour") * a3);
    if (objc_msgSend(a1, "minute") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "setMinute:", objc_msgSend(a1, "minute") * a3);
    if (objc_msgSend(a1, "second") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "setSecond:", objc_msgSend(a1, "second") * a3);
    if (objc_msgSend(a1, "nanosecond") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "setNanosecond:", objc_msgSend(a1, "nanosecond") * a3);
  }
  return v4;
}

- (uint64_t)hk_maxComponentValue
{
  uint64_t v2;

  v2 = 0x8000000000000000;
  if (objc_msgSend(a1, "year") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(a1, "year") != 0x8000000000000000)
    v2 = objc_msgSend(a1, "year");
  if (objc_msgSend(a1, "month") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(a1, "month") > v2)
    v2 = objc_msgSend(a1, "month");
  if (objc_msgSend(a1, "weekOfYear") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(a1, "weekOfYear") > v2)
    v2 = objc_msgSend(a1, "weekOfYear");
  if (objc_msgSend(a1, "weekOfMonth") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(a1, "weekOfMonth") > v2)
    v2 = objc_msgSend(a1, "weekOfMonth");
  if (objc_msgSend(a1, "day") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(a1, "day") > v2)
    v2 = objc_msgSend(a1, "day");
  if (objc_msgSend(a1, "hour") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(a1, "hour") > v2)
    v2 = objc_msgSend(a1, "hour");
  if (objc_msgSend(a1, "minute") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(a1, "minute") > v2)
    v2 = objc_msgSend(a1, "minute");
  if (objc_msgSend(a1, "second") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(a1, "second") > v2)
    v2 = objc_msgSend(a1, "second");
  if (objc_msgSend(a1, "nanosecond") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(a1, "nanosecond") <= v2)
    return v2;
  else
    return objc_msgSend(a1, "nanosecond");
}

- (id)hk_translateDateComponentsToCalendar:()HealthKit calendarUnits:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0C99E80];
  v7 = a3;
  objc_msgSend(v6, "systemTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_populatedCalendarGregorianCalendarDefault");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  objc_msgSend(v10, "setTimeZone:", v8);
  v11 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v11, "setTimeZone:", v8);
  objc_msgSend(v10, "dateFromComponents:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "components:fromDate:", a4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCalendar:", v7);

  return v13;
}

- (uint64_t)hk_negativeComponents
{
  return objc_msgSend(a1, "_hk_dateComponentsMultipliedByCount:", -1);
}

- (uint64_t)hk_ageWithCurrentDate:()HealthKit
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "hk_populatedCalendarGregorianCalendarDefault");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "components:fromDateComponents:toDateComponents:options:", 4, a1, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "year");

  return v8;
}

- (HKDateInterval)hk_dateIntervalForDate:()HealthKit anchorDate:outIndex:
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  HKDateInterval *v14;
  void *v15;
  void *v16;
  HKDateInterval *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  HKDateInterval *v24;
  void *v25;
  HKDateInterval *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  HKDateInterval *v37;
  void *v38;
  HKDateInterval *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10;
  objc_msgSend(a1, "hk_approximateDuration");
  v13 = vcvtmd_s64_f64(v11 / v12);
  v14 = [HKDateInterval alloc];
  objc_msgSend(a1, "hk_dateByAddingInterval:toDate:", v13, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_dateByAddingInterval:toDate:", v13 + 1, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HKDateInterval initWithStartDate:endDate:](v14, "initWithStartDate:endDate:", v15, v16);

  -[HKDateInterval startDate](v17, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  v20 = v19;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v22 = v21;

  if (v20 <= v22)
  {
    v26 = v17;
  }
  else
  {
    do
    {
      --v13;
      -[HKDateInterval startDate](v17, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = [HKDateInterval alloc];
      objc_msgSend(a1, "hk_dateByAddingInterval:toDate:", -1, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[HKDateInterval initWithStartDate:endDate:](v24, "initWithStartDate:endDate:", v25, v23);

      -[HKDateInterval startDate](v26, "startDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSinceReferenceDate");
      v29 = v28;
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      v31 = v30;

      v17 = v26;
    }
    while (v29 > v31);
  }
  -[HKDateInterval endDate](v26, "endDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "timeIntervalSinceReferenceDate");
  v34 = v33;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v36 = v35;

  if (v34 <= v36)
  {
    do
    {
      ++v13;
      -[HKDateInterval endDate](v26, "endDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = [HKDateInterval alloc];
      objc_msgSend(a1, "hk_dateByAddingInterval:toDate:", 1, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[HKDateInterval initWithStartDate:endDate:](v39, "initWithStartDate:endDate:", v38, v40);

      -[HKDateInterval endDate](v37, "endDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "timeIntervalSinceReferenceDate");
      v43 = v42;
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      v45 = v44;

      v26 = v37;
    }
    while (v43 <= v45);
  }
  else
  {
    v37 = v26;
  }
  if (a5)
    *a5 = v13;

  return v37;
}

- (uint64_t)hk_indexForDate:()HealthKit anchorDate:
{
  id v4;
  uint64_t v6;

  v6 = 0;
  v4 = (id)objc_msgSend(a1, "hk_dateIntervalForDate:anchorDate:outIndex:", a3, a4, &v6);
  return v6;
}

@end
