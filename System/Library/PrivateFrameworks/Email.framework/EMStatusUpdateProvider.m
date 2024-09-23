@implementation EMStatusUpdateProvider

- (id)statusUpdateStringWithDate:(id)a3 now:(id)a4 nextTransition:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a3;
  v9 = a4;
  v10 = -[EMStatusUpdateProvider statusUpdateWithDate:now:nextTransition:](self, "statusUpdateWithDate:now:nextTransition:", v8, v9, a5);
  v11 = &stru_1E70F6E90;
  switch(v10)
  {
    case 0uLL:
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("UPDATED_JUST_NOW"), &stru_1E70F6E90, CFSTR("Main"));
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[EMStatusUpdateProvider _statusUpdatedMinutesAgoWithDate:now:](self, "_statusUpdatedMinutesAgoWithDate:now:", v8, v9);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3uLL:
      -[EMStatusUpdateProvider _statusUpdatedAtTimeWithDate:](self, "_statusUpdatedAtTimeWithDate:", v8);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("UPDATED_YESTERDAY"), &stru_1E70F6E90, CFSTR("Main"));
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v11 = (__CFString *)v13;

      break;
    case 5uLL:
      -[EMStatusUpdateProvider _statusUpdatedOnDayWithDate:](self, "_statusUpdatedOnDayWithDate:", v8);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6uLL:
      -[EMStatusUpdateProvider _statusUpdatedOnDateWithDate:](self, "_statusUpdatedOnDateWithDate:", v8);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v11 = (__CFString *)v14;
      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (unint64_t)statusUpdateWithDate:(id)a3 now:(id)a4 nextTransition:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v20;
  id *v21;
  void *v22;
  void *v23;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v11, "components:fromDate:", 30, v9);
    v21 = a5;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateFromComponents:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v14, "setDay:", -6);
    objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v14, v13, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "compare:") == -1)
    {
      v18 = 0;
      v10 = 6;
    }
    else
    {
      v20 = v12;
      objc_msgSend(v11, "components:fromDate:toDate:options:", 112, v7, v9, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "day") <= 0 && objc_msgSend(v15, "hour") <= 0 && objc_msgSend(v15, "minute") < 6)
      {
        v18 = v7;
        if (objc_msgSend(v15, "minute") < 2)
        {
          objc_msgSend(v12, "setMinute:", 2);
          v10 = 1;
        }
        else
        {
          objc_msgSend(v12, "setMinute:", objc_msgSend(v15, "minute") + 1);
          v10 = 2;
        }
      }
      else
      {
        v16 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        objc_msgSend(v16, "setDay:", -1);
        objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v16, v13, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "compare:", v17) == -1)
        {
          v10 = 5;
        }
        else if (objc_msgSend(v7, "compare:", v13) == -1)
        {
          v10 = 4;
        }
        else
        {
          v10 = 3;
        }
        v18 = v13;
        objc_msgSend(v20, "setDay:", 1);

        v12 = v20;
      }

      if (v21 && v18)
      {
        objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v12, v18, 0);
        *v21 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_weekdayFormatter, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
}

- (id)_statusUpdatedMinutesAgoWithDate:(id)a3 now:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:toDate:options:", 64, v5, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("UPDATED_N_MINUTES_AGO_FORMAT%1$ld"), &stru_1E70F6E90, CFSTR("Main"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v11, objc_msgSend(v8, "minute"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_statusUpdatedAtTimeWithDate:(id)a3
{
  id v4;
  NSDateFormatter *v5;
  NSDateFormatter *timeFormatter;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (!self->_timeFormatter)
  {
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    timeFormatter = self->_timeFormatter;
    self->_timeFormatter = v5;

    -[NSDateFormatter setDateStyle:](self->_timeFormatter, "setDateStyle:", 0);
    -[NSDateFormatter setTimeStyle:](self->_timeFormatter, "setTimeStyle:", 1);
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UPDATED_AT_TIME_FORMAT"), &stru_1E70F6E90, CFSTR("Main"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[NSDateFormatter stringFromDate:](self->_timeFormatter, "stringFromDate:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_statusUpdatedOnDayWithDate:(id)a3
{
  id v4;
  NSDateFormatter *v5;
  NSDateFormatter *weekdayFormatter;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (!self->_weekdayFormatter)
  {
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    weekdayFormatter = self->_weekdayFormatter;
    self->_weekdayFormatter = v5;

    -[NSDateFormatter setDateFormat:](self->_weekdayFormatter, "setDateFormat:", CFSTR("EEEE"));
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UPDATED_WEEKDAY_FORMAT"), &stru_1E70F6E90, CFSTR("Main"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[NSDateFormatter stringFromDate:](self->_weekdayFormatter, "stringFromDate:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_statusUpdatedOnDateWithDate:(id)a3
{
  id v4;
  NSDateFormatter *v5;
  NSDateFormatter *dateFormatter;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (!self->_dateFormatter)
  {
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v5;

    -[NSDateFormatter setDateStyle:](self->_dateFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](self->_dateFormatter, "setTimeStyle:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UPDATED_ON_DATE_FORMAT"), &stru_1E70F6E90, CFSTR("Main"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
