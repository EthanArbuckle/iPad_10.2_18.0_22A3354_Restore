@implementation BCSOpenHours

- (BCSOpenHours)initWithTimeRanges:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  BCSOpenHours *v8;
  uint64_t v9;
  NSDictionary *timeRanges;
  uint64_t v11;
  NSTimeZone *localTimeZone;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BCSOpenHours;
  v8 = -[BCSOpenHours init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    timeRanges = v8->_timeRanges;
    v8->_timeRanges = (NSDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    localTimeZone = v8->_localTimeZone;
    v8->_localTimeZone = (NSTimeZone *)v11;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *timeRanges;
  id v5;

  timeRanges = self->_timeRanges;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timeRanges, CFSTR("kBCSOpenHoursCoderTimeRangeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localTimeZone, CFSTR("kBCSOpenHoursCodertimeZoneKey"));

}

- (BCSOpenHours)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BCSOpenHours *v13;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("kBCSOpenHoursCoderTimeRangeKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSOpenHoursCodertimeZoneKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[BCSOpenHours initWithTimeRanges:timeZone:](self, "initWithTimeRanges:timeZone:", v10, v12);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isOpenAtDate:(id)a3
{
  id v3;
  NSTimeZone *localTimeZone;
  id v6;
  NSTimeZone *v7;
  uint64_t v8;
  NSDictionary *timeRanges;
  void *v10;
  NSDictionary *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSTimeZone *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v28;
  uint64_t v29;
  id v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v3 = a3;
  v40 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    localTimeZone = self->_localTimeZone;
    v6 = a3;
    v7 = localTimeZone;
    if (-[NSDictionary count](self->_timeRanges, "count"))
    {
      v8 = -[BCSOpenHours _weekdayOrdinalFromDate:timeZone:](v6, v7);
      timeRanges = self->_timeRanges;
      v10 = (void *)MEMORY[0x24BDD16E0];
      v11 = timeRanges;
      v29 = v8;
      objc_msgSend(v10, "numberWithUnsignedInteger:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](v11, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      obj = v13;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v14)
      {
        v15 = v14;
        v32 = *(_QWORD *)v34;
        v30 = v3;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v34 != v32)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            v18 = -[BCSOpenHours _validTimeRange:](v17);
            if (!v18)
            {
              ABSLogCommon();
              v19 = objc_claimAutoreleasedReturnValue();
              v3 = v30;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                v38 = v29;
                _os_log_error_impl(&dword_20ACAD000, v19, OS_LOG_TYPE_ERROR, "Does not have valid time range for weekdayIndex:%lu", buf, 0xCu);
              }
              goto LABEL_21;
            }
            objc_msgSend(v17, "objectForKey:", CFSTR("from"));
            v19 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKey:", CFSTR("to"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v6;
            v22 = v7;
            v23 = -[BCSOpenHours _totalSecondsInLocalTimeFromPreviousMidnightWithDate:timeZone:](v6, v7);
            v24 = -[NSObject integerValue](v19, "integerValue");
            v25 = objc_msgSend(v20, "integerValue");

            if (v23 >= v24 && v23 <= v25)
            {
              v3 = v30;
              v7 = v22;
LABEL_21:

              goto LABEL_22;
            }

            v7 = v22;
            v6 = v21;
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          v18 = 0;
          v3 = v30;
          if (v15)
            continue;
          break;
        }
      }
      else
      {
        v18 = 0;
      }
LABEL_22:

    }
    else
    {
      v18 = 1;
    }
  }
  else
  {
    v28 = a3;
    v7 = 0;
    v18 = 0;
  }

  return v18;
}

- (uint64_t)_weekdayOrdinalFromDate:(void *)a1 timeZone:(void *)a2
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v4);

  objc_msgSend(v6, "components:fromDate:", 512, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "weekday");
  return v8 - 1;
}

- (BOOL)_validTimeRange:(void *)a1
{
  id v1;
  id v2;
  _BOOL8 v3;
  void *v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v3 = 0;
  if (v1 && v2 != v1)
  {
    objc_msgSend(v1, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "count") == 2;

  }
  return v3;
}

- (uint64_t)_totalSecondsInLocalTimeFromPreviousMidnightWithDate:(void *)a1 timeZone:(void *)a2
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v4);

  objc_msgSend(v6, "components:fromDate:", 96, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "hour");
  v9 = objc_msgSend(v7, "minute");

  return 60 * (v9 + 60 * v8);
}

- (id)dateWhenOpenNextAfterDate:(id)a3
{
  id v3;
  BCSOpenHours *v4;
  NSTimeZone *localTimeZone;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSDictionary *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v24;
  NSObject *v26;
  double v27;
  void *v28;
  NSTimeZone *v29;
  id v31;
  void *v32;
  NSTimeZone *v33;
  BCSOpenHours *v35;
  unsigned int v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    v4 = self;
    localTimeZone = self->_localTimeZone;
    v6 = a3;
    v33 = localTimeZone;
    v37 = -[BCSOpenHours _weekdayOrdinalFromDate:timeZone:](v6, v33);
    v32 = v6;
    v7 = -[BCSOpenHours _totalSecondsInLocalTimeFromPreviousMidnightWithDate:timeZone:](v6, v4->_localTimeZone);
    if (-[BCSOpenHours _validTimeRange:](0))
    {
      v36 = 0;
      v8 = 0;
    }
    else
    {
      v8 = 0;
      v36 = 0;
      v9 = 0;
      v35 = v4;
      do
      {
        v10 = ((v9 + v37) * (unsigned __int128)0x2492492492492493uLL) >> 64;
        v11 = v9 + v37 - 7 * ((v10 + ((v9 + v37 - v10) >> 1)) >> 2);
        v12 = (void *)MEMORY[0x24BDD16E0];
        v13 = v4->_timeRanges;
        objc_msgSend(v12, "numberWithUnsignedInteger:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](v13, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v39 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              if (-[BCSOpenHours _validTimeRange:](v21))
              {
                objc_msgSend(v21, "objectForKey:", CFSTR("from"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (v7 < objc_msgSend(v22, "integerValue") || v9 != 0)
                {
                  v24 = v21;

                  v36 = v9;
                  v8 = v24;
                  goto LABEL_19;
                }

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          }
          while (v18);
LABEL_19:
          v4 = v35;
        }

        if (-[BCSOpenHours _validTimeRange:](v8))
          break;
      }
      while (v9++ < 7);
    }
    if (-[BCSOpenHours _validTimeRange:](v8))
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("from"));
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSince1970");
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(86400 * v36 - v7 + -[NSObject integerValue](v26, "integerValue") + (uint64_t)v27));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      ABSLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v43 = v32;
        v44 = 2048;
        v45 = v37;
        _os_log_error_impl(&dword_20ACAD000, v26, OS_LOG_TYPE_ERROR, "Valid date not found for open next after date:%@ weekdayIndex:%lu", buf, 0x16u);
      }
      v28 = 0;
    }
    v29 = v33;
    v3 = a3;

  }
  else
  {
    v31 = a3;
    v29 = 0;
    v28 = 0;
  }

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSTimeZone *v6;
  uint64_t v7;
  void *v8;
  NSDictionary *timeRanges;
  NSDictionary *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    if (self)
    {
      v6 = self->_localTimeZone;
      v7 = -[NSTimeZone copyWithZone:](v6, "copyWithZone:", a3);
      v8 = (void *)v5[2];
      v5[2] = v7;

      timeRanges = self->_timeRanges;
    }
    else
    {
      v14 = objc_msgSend(0, "copyWithZone:", a3);
      v15 = (void *)v5[2];
      v5[2] = v14;

      timeRanges = 0;
    }
    v10 = timeRanges;
    v11 = -[NSDictionary copyWithZone:](v10, "copyWithZone:", a3);
    v12 = (void *)v5[1];
    v5[1] = v11;

  }
  return v5;
}

- (id)debugDescription
{
  BCSOpenHours *v2;
  uint64_t v3;
  __CFString *v4;
  NSDictionary *timeRanges;
  void *v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v2 = self;
  v3 = 0;
  v4 = &stru_24C39D888;
  v31 = *MEMORY[0x24BDAC8D0];
  do
  {
    if (v2)
      timeRanges = v2->_timeRanges;
    else
      timeRanges = 0;
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = timeRanges;
    objc_msgSend(v6, "numberWithInt:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v10 = CFSTR("Invalid week index");
      if (v3 <= 6)
        v10 = off_24C39BD88[v3];
    }
    else
    {
      v10 = 0;
    }
    v25 = v3;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:\n"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      v4 = (__CFString *)v12;
      do
      {
        v17 = 0;
        v18 = v4;
        do
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v17);
          objc_msgSend(v19, "objectForKey:", CFSTR("from"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKey:", CFSTR("to"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t%d - %d\n"), objc_msgSend(v20, "intValue"), objc_msgSend(v21, "intValue"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v22);
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v17;
          v18 = v4;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }
    else
    {
      v4 = (__CFString *)v12;
    }

    v3 = (v25 + 1);
    v2 = self;
  }
  while (v25 != 6);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTimeZone, 0);
  objc_storeStrong((id *)&self->_timeRanges, 0);
}

- (BCSOpenHours)initWithHoursPeriodMessage:(id)a3 timeZone:(id)a4
{
  id v6;
  void *v7;
  BCSOpenHours *v8;

  v6 = a4;
  objc_msgSend(a3, "hours");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BCSOpenHours initWithHoursMessages:timeZone:](self, "initWithHoursMessages:timeZone:", v7, v6);

  return v8;
}

- (BCSOpenHours)initWithHoursMessages:(id)a3 timeZone:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BCSOpenHours *v21;
  BCSOpenHours *v23;
  id v24;
  id obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v23 = self;
  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v24 = a4;
  v27 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v36;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(obj);
        v30 = v6;
        v7 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v6);
        objc_msgSend(v7, "timeRanges", v23);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(int *)objc_msgSend(v7, "days");
        v9 = (void *)objc_opt_new();
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v32 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              if (objc_msgSend(v15, "hasAllDay") && objc_msgSend(v15, "allDay"))
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 86400);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = &unk_24C3B8478;
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v15, "from"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v15, "to"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v39[0] = CFSTR("from");
              v39[1] = CFSTR("to");
              v40[0] = v17;
              v40[1] = v16;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v18);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
          }
          while (v12);
        }

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v29 - 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKey:", v9, v19);

        v6 = v30 + 1;
      }
      while (v30 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v28);
  }

  v20 = (void *)objc_msgSend(v27, "copy");
  v21 = -[BCSOpenHours initWithTimeRanges:timeZone:](v23, "initWithTimeRanges:timeZone:", v20, v24);

  return v21;
}

- (BCSOpenHours)initWithJSONObj:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BCSOpenHours *v10;
  uint64_t v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 1, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v10 = 0;
    }
    else
    {
      self = -[BCSOpenHours initWithOpenHours:timeZone:](self, "initWithOpenHours:timeZone:", v9, v7);
      v10 = self;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BCSOpenHours)initWithOpenHours:(id)a3 timeZone:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  NSObject *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BCSOpenHours *v27;
  void *v29;
  id v30;
  void *v31;
  id obj;
  void *v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[16];
  _QWORD v50[2];
  _QWORD v51[2];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v30 = a4;
  v33 = (void *)objc_opt_new();
  v31 = v5;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hours"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    ABSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_ERROR, "Open Hours dictionary doesn't have array at first level", buf, 2u);
    }

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hours"), v6);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("day"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[BCSOpenHours _weekdayIndexFromWeekdayString:](self, "_weekdayIndexFromWeekdayString:", v13);
        if (v14 != -1)
        {
          v37 = v14;
          v38 = v13;
          v39 = v12;
          v40 = i;
          v15 = (void *)objc_opt_new();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("timeRange"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v42;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v42 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("from"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("to"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v50[0] = CFSTR("from");
                v50[1] = CFSTR("to");
                v51[0] = v22;
                v51[1] = v23;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "addObject:", v24);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
            }
            while (v18);
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v37);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKey:", v15, v25);

          v12 = v39;
          i = v40;
          v13 = v38;
        }

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v36);
  }
  v26 = (void *)objc_msgSend(v33, "copy");
  v27 = -[BCSOpenHours initWithTimeRanges:timeZone:](self, "initWithTimeRanges:timeZone:", v26, v30);

  return v27;
}

@end
