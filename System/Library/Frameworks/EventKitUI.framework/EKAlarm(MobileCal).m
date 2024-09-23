@implementation EKAlarm(MobileCal)

+ (id)defaultDesignator
{
  void *v0;
  void *v1;

  EventKitUIBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Default (%@)"), &stru_1E601DFA8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)_localizedDescription:()MobileCal isAllDay:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;

  if (objc_msgSend(a1, "isAbsolute"))
  {
    objc_msgSend(a1, "absoluteDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a3 & 1) != 0)
      CUIKLongStringForDateAndTime();
    else
      CUIKStringForDateAndTime();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "owner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "travelTime");
      objc_msgSend(v7, "defaultAlarms");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(a1, "relativeOffset");
    v12 = v11;
    if (objc_msgSend(a1, "isDefaultAlarm") && v9)
    {
      objc_msgSend(v9, "relativeOffset");
      v12 = v13;
    }
    CalStringForRelativeOffset(a4, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "isDefaultAlarm"))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CA9FB8], "defaultDesignator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), 0, v10);
      v16 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v16;
    }

  }
  return v10;
}

- (uint64_t)longLocalizedDescription
{
  return objc_msgSend(a1, "_localizedDescription:isAllDay:", 1, 0);
}

- (uint64_t)longLocalizedAllDayDescription
{
  return objc_msgSend(a1, "_localizedDescription:isAllDay:", 1, 1);
}

- (uint64_t)localizedDescription
{
  return objc_msgSend(a1, "_localizedDescription:isAllDay:", 0, 0);
}

- (uint64_t)localizedAllDayDescription
{
  return objc_msgSend(a1, "_localizedDescription:isAllDay:", 0, 1);
}

@end
