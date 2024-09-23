@implementation NSDateComponents(ABSimplePropertyCell)

- (uint64_t)contactViewControllerCellClassForPropertyType:()ABSimplePropertyCell
{
  return objc_opt_class();
}

- (id)displayString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  id v10;
  void *v11;

  if (displayString_onceToken != -1)
    dispatch_once(&displayString_onceToken, &__block_literal_global_41649);
  +[CNUIDate dateFromComponents:destinationCalendar:](CNUIDate, "dateFromComponents:destinationCalendar:", a1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D3EFB0];
    objc_msgSend(v4, "calendarIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeForCalendarID:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  if (+[CNUIDate isYearlessComponents:](CNUIDate, "isYearlessComponents:", a1))
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("MMMMd"), 0, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = &yearlessFormatter_41651;
    objc_msgSend((id)yearlessFormatter_41651, "setDateFormat:", v8);

  }
  else
  {
    v9 = &fullFormatter_41652;
  }
  v10 = (id)*v9;
  objc_msgSend(v10, "setLocale:", v3);
  objc_msgSend(v10, "setCalendar:", v4);
  objc_msgSend(v10, "stringFromDate:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
