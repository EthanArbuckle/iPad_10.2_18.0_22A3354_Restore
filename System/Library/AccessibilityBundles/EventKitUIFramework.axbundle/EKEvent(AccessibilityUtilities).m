@implementation EKEvent(AccessibilityUtilities)

- (id)_accessibilityDurationString
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v1 = a1;
  v2 = (void *)MEMORY[0x24BE13FF0];
  objc_msgSend(a1, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarDateWithDate:timeZone:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BE13FF0];
  objc_msgSend(v1, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "eventStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarDateWithDate:timeZone:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v1) = objc_msgSend(v1, "isAllDay");
  objc_msgSend(v6, "dayComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dayComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((_DWORD)v1)
  {
    if (v14)
    {
      accessibilityLocalizedString(CFSTR("all.day.event"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("all.day.multiple.days"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_accessibilityYearlessDayString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "date");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_accessibilityYearlessDayString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", v23, v25, v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("event.duration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_accessibilityTimeString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v14)
      objc_msgSend(v20, "_accessibilityTimeString");
    else
      AXDateStringForFormat();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v17, v19, v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

@end
