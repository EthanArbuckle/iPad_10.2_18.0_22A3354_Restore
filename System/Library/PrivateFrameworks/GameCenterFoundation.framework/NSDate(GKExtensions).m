@implementation NSDate(GKExtensions)

+ (id)_gkFormattedTimeIntervalStringWithStartDate:()GKExtensions endDate:calendarUnits:style:
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = (objc_class *)MEMORY[0x1E0CB3570];
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v9);
  objc_msgSend(v12, "setUnitsStyle:", a6);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "components:fromDate:toDate:options:", a5, v11, v10, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setAllowedUnits:", a5);
  objc_msgSend(v12, "stringFromDateComponents:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (uint64_t)_gkFormattedDateForStyle:()GKExtensions relative:
{
  if (_gkFormattedDateForStyle_relative__once != -1)
    dispatch_once(&_gkFormattedDateForStyle_relative__once, &__block_literal_global_60);
  if (objc_msgSend((id)_gkFormattedDateForStyle_relative__sDateFormatter, "doesRelativeDateFormatting") != (_DWORD)a4)
    objc_msgSend((id)_gkFormattedDateForStyle_relative__sDateFormatter, "setDoesRelativeDateFormatting:", a4);
  objc_msgSend((id)_gkFormattedDateForStyle_relative__sDateFormatter, "_gkUpdateLocale");
  objc_msgSend((id)_gkFormattedDateForStyle_relative__sDateFormatter, "setDateStyle:", a3);
  return objc_msgSend((id)_gkFormattedDateForStyle_relative__sDateFormatter, "stringFromDate:", a1);
}

- (id)_gkFormattedWhenStringWithOptions:()GKExtensions
{
  return GKDateAsWhenString(a1, a3);
}

@end
