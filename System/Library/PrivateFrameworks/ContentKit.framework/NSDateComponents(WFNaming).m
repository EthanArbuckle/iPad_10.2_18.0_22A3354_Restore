@implementation NSDateComponents(WFNaming)

- (id)wfName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;

  v2 = objc_msgSend(a1, "wf_displayableCalendarUnits");
  v3 = objc_msgSend(a1, "wf_dateFormatterDateStyleForDisplayableCalendarUnits:", v2);
  v4 = objc_msgSend(a1, "wf_dateFormatterTimeStyleForDisplayableCalendarUnits:", v2);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "timeZone");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_3;
  v8 = (void *)v7;
  objc_msgSend(a1, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "abbreviation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "abbreviation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    v15 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v15, "setTimeStyle:", v4);
    objc_msgSend(v15, "setDateStyle:", v3);
    objc_msgSend(v15, "dateFormat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "localizedCaseInsensitiveContainsString:", CFSTR("z"));

    if ((v17 & 1) == 0)
    {
      objc_msgSend(v15, "dateFormat");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingString:", CFSTR(" z"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDateFormat:", v19);

    }
    objc_msgSend(a1, "timeZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTimeZone:", v20);

    objc_msgSend(v15, "stringFromDate:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_3:
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v6, v3, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (uint64_t)wf_displayableCalendarUnits
{
  _BOOL4 v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "valueForComponent:", 4) != 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a1, "valueForComponent:", 8) == 0x7FFFFFFFFFFFFFFFLL)
    v3 = 4 * v2;
  else
    v3 = (4 * v2) | 8;
  if (objc_msgSend(a1, "valueForComponent:", 0x2000) != 0x7FFFFFFFFFFFFFFFLL)
    v3 |= 0x2000uLL;
  if (objc_msgSend(a1, "valueForComponent:", 16) != 0x7FFFFFFFFFFFFFFFLL)
    v3 |= 0x10uLL;
  if (objc_msgSend(a1, "valueForComponent:", 32) != 0x7FFFFFFFFFFFFFFFLL)
    v3 |= 0x20uLL;
  if (objc_msgSend(a1, "valueForComponent:", 64) != 0x7FFFFFFFFFFFFFFFLL)
    v3 |= 0x40uLL;
  if (objc_msgSend(a1, "valueForComponent:", 128) == 0x7FFFFFFFFFFFFFFFLL)
    return v3;
  else
    return v3 | 0x80;
}

- (uint64_t)wf_dateFormatterDateStyleForDisplayableCalendarUnits:()WFNaming
{
  return 2 * ((a3 & 0x201C) != 0);
}

- (BOOL)wf_dateFormatterTimeStyleForDisplayableCalendarUnits:()WFNaming
{
  return (a3 & 0xE0) != 0;
}

@end
