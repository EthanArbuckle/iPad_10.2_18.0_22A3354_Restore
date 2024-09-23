@implementation NSDate

void __65__NSDate_CalendarAdditions__dateAtHour_minute_second_inTimeZone___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    _EKSharedGregorianCalendarForTimeZone(*(void **)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 30, *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setHour:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v2, "setMinute:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v2, "setSecond:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v2, "setTimeZone:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "dateFromComponents:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __55__NSDate_CalendarAdditions__dateForEndOfDayInTimeZone___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 32))
  {
    _EKSharedGregorianCalendarForTimeZone(*(void **)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingComponents:toDate:options:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void __65__NSDate_CalendarAdditions__dateWithoutTimeComponentsInTimeZone___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "dateRemovingTimeComponentsInCalendar:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __72__NSDate_CalendarAdditions___performBlockBehindDispatchSync_inTimeZone___block_invoke(uint64_t a1)
{
  id v2;

  _EKSharedGregorianCalendarForTimeZone(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __35__NSDate_CalClassAdditions__calGMT__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)calGMT_gmt;
  calGMT_gmt = v0;

}

void __72__NSDate_CalClassAdditions___stringWithUseAbbreviatedFormats_lowerCase___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_stringWithUseAbbreviatedFormats_lowerCase__calendar;
  _stringWithUseAbbreviatedFormats_lowerCase__calendar = v0;

}

@end
