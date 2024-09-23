@implementation ICSDate(SGCalendarAttachmentDissector)

- (void)copyDateWithNewComponents:()SGCalendarAttachmentDissector
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "tzid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTzid:", 0);
  if ((objc_msgSend(a1, "hasFloatingTimeZone") & 1) != 0)
    objc_msgSend(v4, "timeZone");
  else
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB800]), "initWithYear:month:day:hour:minute:second:timeZone:", objc_msgSend(v4, "year"), objc_msgSend(v4, "month"), objc_msgSend(v4, "day"), objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), objc_msgSend(v4, "second"), v6);
  objc_msgSend(a1, "setTzid:", v5);
  objc_msgSend(v7, "setTzid:", v5);

  return v7;
}

- (id)validatedCompleteDateTime
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a1, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "year") == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v2, "month") == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v2, "day") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    if (objc_msgSend(v2, "hour") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v2, "minute") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v2, "second") == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v2, "hour") == 0x7FFFFFFFFFFFFFFFLL)
        v5 = 0;
      else
        v5 = objc_msgSend(v2, "hour");
      objc_msgSend(v2, "setHour:", v5);
      if (objc_msgSend(v2, "minute") == 0x7FFFFFFFFFFFFFFFLL)
        v6 = 0;
      else
        v6 = objc_msgSend(v2, "minute");
      objc_msgSend(v2, "setMinute:", v6);
      if (objc_msgSend(v2, "second") == 0x7FFFFFFFFFFFFFFFLL)
        v7 = 0;
      else
        v7 = objc_msgSend(v2, "second");
      objc_msgSend(v2, "setSecond:", v7);
      v8 = (id)objc_msgSend(a1, "copyDateWithNewComponents:", v2);
    }
    else
    {
      v8 = a1;
    }
    v3 = v8;
  }

  return v3;
}

- (id)gmtOffsetTimeZoneWithCalendar:()SGCalendarAttachmentDissector withEvent:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99D48]);
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(a1, "components");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateFromComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E80];
  objc_msgSend(a1, "tzid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "gmtOffsetTimeZoneFromString:forDate:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && !v14)
  {
    v15 = (void *)MEMORY[0x1E0C99E80];
    objc_msgSend(v7, "firstValueOfPropertyForName:", *MEMORY[0x1E0DDBB98]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "gmtOffsetTimeZoneFromString:forDate:", v16, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v7 && !v14)
  {
    v17 = (void *)MEMORY[0x1E0C99E80];
    objc_msgSend(v7, "firstValueOfPropertyForName:", *MEMORY[0x1E0DDBBA0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "gmtOffsetTimeZoneFromString:forDate:", v18, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6 && !v14)
  {
    v19 = (void *)MEMORY[0x1E0C99E80];
    objc_msgSend(v6, "x_wr_timezone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "gmtOffsetTimeZoneFromString:forDate:", v20, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)systemTimeZoneWithCalendar:()SGCalendarAttachmentDissector withEvent:withCorrectnessFlag:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "validate:", 0)
    || (objc_msgSend(v8, "systemTimeZoneForDate:", a1), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_msgSend(a1, "hasFloatingTimeZone") & 1) == 0)
      *a5 = 0;
    v11 = (void *)MEMORY[0x1E0C99E80];
    objc_msgSend(a1, "tzid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemTimeZoneFromString:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      if (v9)
      {
        v14 = (void *)MEMORY[0x1E0C99E80];
        objc_msgSend(v9, "firstValueOfPropertyForName:", *MEMORY[0x1E0DDBB98]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "systemTimeZoneFromString:", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          goto LABEL_6;
        v16 = (void *)MEMORY[0x1E0C99E80];
        objc_msgSend(v9, "firstValueOfPropertyForName:", *MEMORY[0x1E0DDBBA0]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "systemTimeZoneFromString:", v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }
      if (v8 && !v10)
      {
        v18 = (void *)MEMORY[0x1E0C99E80];
        objc_msgSend(v8, "x_wr_timezone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "systemTimeZoneFromString:", v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (!v10)
      {
        objc_msgSend(a1, "gmtOffsetTimeZoneWithCalendar:withEvent:", v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
LABEL_6:

  return v10;
}

@end
