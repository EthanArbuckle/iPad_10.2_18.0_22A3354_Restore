@implementation _HKDateCalendarUnitKey

- (_HKDateCalendarUnitKey)initWithDate:(id)a3 calendar:(id)a4 unit:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  _HKDateCalendarUnitKey *v12;
  uint64_t v13;
  NSDate *date;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSCalendar+HKCalendar.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSCalendar+HKCalendar.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("calendar != nil"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)_HKDateCalendarUnitKey;
  v12 = -[_HKDateCalendarUnitKey init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    date = v12->_date;
    v12->_date = (NSDate *)v13;

    objc_storeStrong((id *)&v12->_calendar, a4);
    v12->_calendarUnit = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v18;
  void *v19;
  void *v20;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    -[_HKDateCalendarUnitKey date](self, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 != v10)
    {
      objc_msgSend(v8, "date");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v12 = 0;
        goto LABEL_20;
      }
      v3 = (void *)v11;
      -[_HKDateCalendarUnitKey date](self, "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "isEqualToDate:", v5))
      {
        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v18 = v5;
      v19 = v4;
      v20 = v3;
    }
    -[_HKDateCalendarUnitKey calendar](self, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
      goto LABEL_12;
    objc_msgSend(v8, "calendar");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {

      v12 = 0;
      goto LABEL_18;
    }
    v4 = (void *)v15;
    -[_HKDateCalendarUnitKey calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v3))
    {
LABEL_12:
      v16 = -[_HKDateCalendarUnitKey calendarUnit](self, "calendarUnit");
      v12 = v16 == objc_msgSend(v8, "calendarUnit");
      if (v13 == v14)
      {

        goto LABEL_17;
      }
    }
    else
    {
      v12 = 0;
    }

LABEL_17:
LABEL_18:
    v4 = v19;
    v3 = v20;
    v5 = v18;
    if (v9 != v10)
      goto LABEL_19;
LABEL_20:

    goto LABEL_21;
  }
  v12 = 0;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;

  -[_HKDateCalendarUnitKey date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_HKDateCalendarUnitKey calendarUnit](self, "calendarUnit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[_HKDateCalendarUnitKey calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4 ^ objc_msgSend(v8, "hash");
  -[_HKDateCalendarUnitKey calendar](self, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6 ^ v9 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (NSDate)date
{
  return self->_date;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (unint64_t)calendarUnit
{
  return self->_calendarUnit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
