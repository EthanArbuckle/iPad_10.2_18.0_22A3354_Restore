@implementation GEOHoursTestHelper

+ (id)dateWithString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _MergedGlobals_203;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_MergedGlobals_203, &__block_literal_global_41);
  objc_msgSend((id)qword_1ECDBBBB8, "dateFromString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __37__GEOHoursTestHelper_dateWithString___block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECDBBBB8;
  qword_1ECDBBBB8 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECDBBBB8, "setLocale:", v2);
  objc_msgSend((id)qword_1ECDBBBB8, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));

}

+ (id)testBusinessHoursForMKLocalizedHoursBuilderTest
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  GEOBusinessHours *v6;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/New_York"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "setTimeZone:", v2);
  LOBYTE(v8) = 0;
  +[GEOHoursTestHelper _pdHoursFromHour:fromMinute:toHour:toMinute:inTimeZone:onDay:month:year:openingThreshold:closingThreshold:shouldGoOverMidnight:](GEOHoursTestHelper, "_pdHoursFromHour:fromMinute:toHour:toMinute:inTimeZone:onDay:month:year:openingThreshold:closingThreshold:shouldGoOverMidnight:", 10, 30, 15, 30, v2, 1, 3600.0, 3600.0, 1, 2018, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOBusinessHours initWithGEOPDHours:timeZone:]([GEOBusinessHours alloc], "initWithGEOPDHours:timeZone:", v5, v2);

  return v6;
}

+ (id)testBusinessHoursWithPermanentlyClosedHoursTypeForMKLocalizedHoursBuilderTest
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  GEOPDBusinessHours *v6;
  void *v7;
  GEOBusinessHours *v8;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/New_York"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "setTimeZone:", v2);
  LOBYTE(v10) = 0;
  +[GEOHoursTestHelper _pdHoursFromHour:fromMinute:toHour:toMinute:inTimeZone:onDay:month:year:openingThreshold:closingThreshold:shouldGoOverMidnight:](GEOHoursTestHelper, "_pdHoursFromHour:fromMinute:toHour:toMinute:inTimeZone:onDay:month:year:openingThreshold:closingThreshold:shouldGoOverMidnight:", 10, 30, 15, 30, v2, 1, 3600.0, 3600.0, 1, 2018, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(GEOPDBusinessHours);
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  -[GEOPDBusinessHours setWeeklyHours:]((uint64_t)v6, v7);

  if (v6)
  {
    *(_WORD *)&v6->_flags |= 0x100u;
    *(_WORD *)&v6->_flags |= 4u;
    v6->_hoursType = 4;
  }
  v8 = -[GEOBusinessHours initWithGEOPDBusinessHours:timeZone:]([GEOBusinessHours alloc], "initWithGEOPDBusinessHours:timeZone:", v6, v2);

  return v8;
}

+ (id)testBusinessHoursWithTemporaryClosedHoursTypeForMKLocalizedHoursBuilderTest
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  GEOPDBusinessHours *v6;
  void *v7;
  GEOBusinessHours *v8;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/New_York"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "setTimeZone:", v2);
  LOBYTE(v10) = 0;
  +[GEOHoursTestHelper _pdHoursFromHour:fromMinute:toHour:toMinute:inTimeZone:onDay:month:year:openingThreshold:closingThreshold:shouldGoOverMidnight:](GEOHoursTestHelper, "_pdHoursFromHour:fromMinute:toHour:toMinute:inTimeZone:onDay:month:year:openingThreshold:closingThreshold:shouldGoOverMidnight:", 10, 30, 15, 30, v2, 1, 3600.0, 3600.0, 1, 2018, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(GEOPDBusinessHours);
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  -[GEOPDBusinessHours setWeeklyHours:]((uint64_t)v6, v7);

  if (v6)
  {
    *(_WORD *)&v6->_flags |= 0x100u;
    *(_WORD *)&v6->_flags |= 4u;
    v6->_hoursType = 3;
  }
  v8 = -[GEOBusinessHours initWithGEOPDBusinessHours:timeZone:]([GEOBusinessHours alloc], "initWithGEOPDBusinessHours:timeZone:", v6, v2);

  return v8;
}

+ (id)testDateForMKLocalizedHoursBuilderTest
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  unsigned int v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setDay:", 1);
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setDay:", -1);
  objc_msgSend(v4, "components:fromDate:", 512, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "weekday");
  v9 = v8 - 2;
  if (v8 == 2)
  {
    v17 = v2;
  }
  else
  {
    v10 = v8;
    v11 = 2 - v8;
    v12 = objc_msgSend(v2, "copy");
    v13 = (void *)v12;
    if (v10 >= 2)
      v14 = v9;
    else
      v14 = v11;
    if (v14 < 1)
    {
      v17 = (id)v12;
    }
    else
    {
      if (v10 >= 2)
        v15 = v6;
      else
        v15 = v5;
      v16 = v14 + 1;
      do
      {
        objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v15, v13, 0);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        --v16;
        v13 = v17;
      }
      while (v16 > 1);
    }
  }

  return v17;
}

+ (id)testTimeZoneForMKLocalizedHoursBuilderTest
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/New_York"));
}

+ (id)testTimeZoneForGEOPlaceDailyHoursTest
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/Cupertino"));
}

+ (id)_pdHoursFromHour:(int64_t)a3 fromMinute:(int64_t)a4 toHour:(int64_t)a5 toMinute:(int64_t)a6 inTimeZone:(id)a7 onDay:(int64_t)a8 month:(int64_t)a9 year:(int64_t)a10 openingThreshold:(double)a11 closingThreshold:(double)a12 shouldGoOverMidnight:(BOOL)a13
{
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  GEOPDHours *v26;
  uint64_t v27;
  unsigned int v28;
  GEOPDHours *v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  GEOPDHoursThreshold *v35;
  GEOPDHoursThreshold *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  int64_t v44;
  int64_t v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v44 = a5;
  v45 = a6;
  v53 = *MEMORY[0x1E0C80C00];
  v18 = a7;
  v19 = (void *)objc_opt_new();
  v20 = objc_alloc(MEMORY[0x1E0C99D48]);
  v21 = (void *)objc_msgSend(v20, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v22 = v21;
  if (v18)
  {
    objc_msgSend(v21, "timeZone");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    if (v23 != v18)
      objc_msgSend(v22, "setTimeZone:", v18);
  }
  v47 = v18;
  v24 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v24, "setYear:", a10);
  objc_msgSend(v24, "setMonth:", a9);
  objc_msgSend(v24, "setDay:", a8);
  objc_msgSend(v24, "setHour:", a3);
  objc_msgSend(v24, "setMinute:", a4);
  objc_msgSend(v22, "dateFromComponents:", v24);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "components:fromDate:", 512);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc_init(GEOPDHours);
  if (a13)
  {
    v27 = +[GEOHoursTestHelper _rangeWithFromHour:fromMinute:toHour:toMinute:](GEOHoursTestHelper, "_rangeWithFromHour:fromMinute:toHour:toMinute:", a3, a4, 24, 0);
    -[GEOPDHours addTimeRange:](v26, "addTimeRange:", v27, v28);
    -[GEOPDHours addDay:](v26, "addDay:", objc_msgSend(v25, "weekday"));
    v29 = objc_alloc_init(GEOPDHours);
    v30 = +[GEOHoursTestHelper _rangeWithFromHour:fromMinute:toHour:toMinute:](GEOHoursTestHelper, "_rangeWithFromHour:fromMinute:toHour:toMinute:", 0, 0, v44, v45);
    -[GEOPDHours addTimeRange:](v29, "addTimeRange:", v30, v31);
    if (objc_msgSend(v25, "weekday") == 7)
      v32 = 1;
    else
      v32 = objc_msgSend(v25, "weekday") + 1;
    -[GEOPDHours addDay:](v29, "addDay:", v32, v44, v45);
    objc_msgSend(v19, "addObject:", v26);
    objc_msgSend(v19, "addObject:", v29);

  }
  else
  {
    v33 = +[GEOHoursTestHelper _rangeWithFromHour:fromMinute:toHour:toMinute:](GEOHoursTestHelper, "_rangeWithFromHour:fromMinute:toHour:toMinute:", a3, a4, v44, v45);
    -[GEOPDHours addTimeRange:](v26, "addTimeRange:", v33, v34);
    -[GEOPDHours addDay:](v26, "addDay:", objc_msgSend(v25, "weekday"));
    objc_msgSend(v19, "addObject:", v26);
  }

  v35 = objc_alloc_init(GEOPDHoursThreshold);
  v36 = v35;
  if (v35)
  {
    *(_BYTE *)&v35->_flags |= 2u;
    v35->_openingSoonMessageThresholdSecond = a11;
    *(_BYTE *)&v35->_flags |= 1u;
    v35->_closingSoonMessageThresholdSecond = a12;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v37 = v19;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v49 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "setHoursThreshold:", v36, v44, v45);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v39);
  }

  v42 = (void *)objc_msgSend(v37, "copy");
  return v42;
}

+ (GEOPDLocalTimeRange)_rangeWithFromHour:(int64_t)a3 fromMinute:(int64_t)a4 toHour:(int64_t)a5 toMinute:(int64_t)a6
{
  unint64_t v6;
  $7D24B5AD5894795FD85A0EE1D817D743 v7;
  GEOPDLocalTimeRange result;

  v6 = (3600 * a3 + 60 * a4) | ((unint64_t)((3600 * a5 + 60 * a6) >> 2) << 34);
  v7 = ($7D24B5AD5894795FD85A0EE1D817D743)3;
  result.var0 = v6;
  result.var1 = HIDWORD(v6);
  result.var2 = v7;
  return result;
}

+ (id)testingDictionaryForIsWeekdayInRange
{
  return &unk_1E1E85B30;
}

@end
