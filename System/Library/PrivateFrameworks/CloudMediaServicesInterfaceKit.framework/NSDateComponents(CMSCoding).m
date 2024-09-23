@implementation NSDateComponents(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
      cmsDateFormatter();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateFromString:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        cmsDateCalender();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "components:fromDate:", 2130174, v7);
        v9 = v4;
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v8, "count");
        if (v12 != 1)
        {
          if (v12 != 2)
          {
            if (v12 != 3)
            {
LABEL_14:

              goto LABEL_15;
            }
            objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setDay:", objc_msgSend(v13, "integerValue"));

          }
          objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setMonth:", objc_msgSend(v14, "integerValue"));

        }
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setYear:", objc_msgSend(v9, "integerValue"));
      }

      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v3;
      objc_msgSend(v4, "setEra:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", CFSTR("era"), objc_msgSend(v4, "era")));
      objc_msgSend(v4, "setYear:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", CFSTR("year"), objc_msgSend(v4, "year")));
      objc_msgSend(v4, "setMonth:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", CFSTR("month"), objc_msgSend(v4, "month")));
      objc_msgSend(v4, "setDay:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", CFSTR("day"), objc_msgSend(v4, "day")));
      objc_msgSend(v4, "setHour:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", CFSTR("hour"), objc_msgSend(v4, "hour")));
      objc_msgSend(v4, "setMinute:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", CFSTR("minute"), objc_msgSend(v4, "minute")));
      objc_msgSend(v4, "setSecond:", objc_msgSend(v10, "cmsIntegerForKey:withDefault:", CFSTR("second"), objc_msgSend(v4, "second")));
      v11 = (void *)MEMORY[0x24BDBCF38];
      objc_msgSend(v10, "cmsOptionalStringForKey:", CFSTR("timeZone"));
      v5 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "timeZoneWithName:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTimeZone:", v7);
LABEL_15:

    }
  }
  cmsDateCalender();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalendar:", v15);

  return v4;
}

- (id)cmsCoded
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v28 = objc_msgSend(a1, "era");
  v2 = objc_msgSend(a1, "year");
  v31 = objc_msgSend(a1, "month");
  v30 = objc_msgSend(a1, "day");
  v29 = objc_msgSend(a1, "hour");
  v26 = objc_msgSend(a1, "minute");
  v27 = objc_msgSend(a1, "second");
  v3 = objc_msgSend(a1, "nanosecond");
  v4 = (2 * (v28 != 0x7FFFFFFFFFFFFFFFLL)) | (4 * (v2 != 0x7FFFFFFFFFFFFFFFLL)) | (8
                                                                                     * (v31 != 0x7FFFFFFFFFFFFFFFLL)) | (16 * (v30 != 0x7FFFFFFFFFFFFFFFLL)) | (32 * (v29 != 0x7FFFFFFFFFFFFFFFLL)) | ((unint64_t)(v26 != 0x7FFFFFFFFFFFFFFFLL) << 6);
  v5 = v4 | ((unint64_t)(v27 != 0x7FFFFFFFFFFFFFFFLL) << 7);
  v6 = v5 | ((unint64_t)(v3 != 0x7FFFFFFFFFFFFFFFLL) << 15);
  if (v6 == 28)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%04d-%02d-%02d"), v2, v31, v30);
    goto LABEL_7;
  }
  if (v6 == 12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%04d-%02d"), v2, v31, v25);
    goto LABEL_7;
  }
  if (v6 != 4)
  {
    if ((v5 & 0xFFFFFFFFFFFF7FFFLL) == 0xFC)
    {
      cmsDateFormatter();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromDate:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
    v11 = v3;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
    objc_msgSend(a1, "calendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "timeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v12, "calendarIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v14, CFSTR("calendarIdentifier"));

    }
    if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v15, CFSTR("era"));

    }
    if (v2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v16, CFSTR("year"));

    }
    if (v31 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v17, CFSTR("month"));

    }
    if (v30 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v18, CFSTR("day"));

    }
    if (v29 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v19, CFSTR("hour"));

    }
    if (v4 >= 0x40)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v20, CFSTR("minute"));

    }
    if (v5 >= 0x80)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v22, CFSTR("second"));

      if ((v6 & 0x8000) == 0)
      {
LABEL_27:
        if (v13)
        {
LABEL_28:
          objc_msgSend(v13, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setValue:forKey:", v21, CFSTR("timeZone"));

LABEL_32:
          return v7;
        }
LABEL_31:
        objc_msgSend(v7, "setValue:forKey:", CFSTR("UTC"), CFSTR("timeZone"));
        goto LABEL_32;
      }
    }
    else if ((v6 & 0x8000) == 0)
    {
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v23, CFSTR("nanosecond"));

    if (v13)
      goto LABEL_28;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%04d"), v2, v24, v25);
LABEL_7:
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

@end
