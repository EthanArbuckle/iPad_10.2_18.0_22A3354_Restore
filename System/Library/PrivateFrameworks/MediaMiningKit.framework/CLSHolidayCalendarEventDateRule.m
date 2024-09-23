@implementation CLSHolidayCalendarEventDateRule

- (CLSHolidayCalendarEventDateRule)initWithEventDescription:(id)a3
{
  id v4;
  char *v5;
  CLSHolidayCalendarEventDateRule *v6;
  NSDateComponents *v7;
  NSDateComponents *simpleRuleComponents;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *relativeToRuleUUID;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CLSHolidayCalendarEventDateRule;
  v5 = -[CLSHolidayCalendarEventDateRule init](&v21, sel_init);
  v6 = (CLSHolidayCalendarEventDateRule *)v5;
  if (v5)
  {
    *(int64x2_t *)(v5 + 24) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v7 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E0C99D78]);
    simpleRuleComponents = v6->_simpleRuleComponents;
    v6->_simpleRuleComponents = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("year"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      -[NSDateComponents setYear:](v6->_simpleRuleComponents, "setYear:", objc_msgSend(v9, "integerValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("month"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[NSDateComponents setMonth:](v6->_simpleRuleComponents, "setMonth:", objc_msgSend(v11, "integerValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("day"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[NSDateComponents setDay:](v6->_simpleRuleComponents, "setDay:", objc_msgSend(v12, "integerValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weekday"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[NSDateComponents setWeekday:](v6->_simpleRuleComponents, "setWeekday:", objc_msgSend(v13, "integerValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weekdayOrdinal"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[NSDateComponents setWeekdayOrdinal:](v6->_simpleRuleComponents, "setWeekdayOrdinal:", objc_msgSend(v14, "integerValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startYear"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v6->_startYear = objc_msgSend(v15, "integerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endYear"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      v6->_endYear = objc_msgSend(v16, "integerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relativeToRule"));
    v17 = objc_claimAutoreleasedReturnValue();
    relativeToRuleUUID = v6->_relativeToRuleUUID;
    v6->_relativeToRuleUUID = (NSString *)v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetDays"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_offsetDays = objc_msgSend(v19, "integerValue");

  }
  return v6;
}

- (id)localDateByEvaluatingRuleForYear:(int64_t)a3
{
  void *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t offsetDays;
  uint64_t v12;

  if (self->_relativeToRuleUUID)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "dateForRuleWithUUID:byEvaluatingForYear:", self->_relativeToRuleUUID, a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        +[CLSCalendar components:fromDate:](CLSCalendar, "components:fromDate:", 28, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setYear:", a3);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
    goto LABEL_12;
  }
  v7 = (void *)-[NSDateComponents copy](self->_simpleRuleComponents, "copy");
  objc_msgSend(v7, "setYear:", a3);
  if (objc_msgSend(v7, "weekdayOrdinal") == -1)
  {
    +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v7, 0);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSCalendar rangeOfUnit:inUnit:forDate:](CLSCalendar, "rangeOfUnit:inUnit:forDate:", 1024, 8, WeakRetained);
    objc_msgSend(v7, "setWeekdayOrdinal:", v9);
    +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[CLSCalendar monthFromDate:](CLSCalendar, "monthFromDate:", v8);
    if (v10 == objc_msgSend(v7, "month"))
      goto LABEL_13;

    objc_msgSend(v7, "setWeekdayOrdinal:", objc_msgSend(v7, "weekdayOrdinal") - 1);
LABEL_12:
    v8 = 0;
LABEL_13:

    if (v8)
      goto LABEL_16;
    goto LABEL_14;
  }
  v8 = 0;
LABEL_14:
  if (v7)
  {
    +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_16:
  if (v8)
  {
    offsetDays = self->_offsetDays;
    if (offsetDays)
    {
      +[CLSCalendar dateByAddingDays:toDate:](CLSCalendar, "dateByAddingDays:toDate:", offsetDays, v8);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
  }

  return v8;
}

- (BOOL)hasStartYear
{
  return self->_startYear != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasEndYear
{
  return self->_endYear != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasExplicitYear
{
  return -[NSDateComponents year](self->_simpleRuleComponents, "year") != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)matchesExplicitYear:(int64_t)a3
{
  return -[NSDateComponents year](self->_simpleRuleComponents, "year") == a3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CLSHolidayCalendarEventDateRule _stringDescriptionForDateRuleComponentValue:](self, "_stringDescriptionForDateRuleComponentValue:", -[NSDateComponents year](self->_simpleRuleComponents, "year"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSHolidayCalendarEventDateRule _stringDescriptionForDateRuleComponentValue:](self, "_stringDescriptionForDateRuleComponentValue:", -[NSDateComponents month](self->_simpleRuleComponents, "month"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSHolidayCalendarEventDateRule _stringDescriptionForDateRuleComponentValue:](self, "_stringDescriptionForDateRuleComponentValue:", -[NSDateComponents day](self->_simpleRuleComponents, "day"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSHolidayCalendarEventDateRule _stringDescriptionForDateRuleComponentValue:](self, "_stringDescriptionForDateRuleComponentValue:", -[NSDateComponents weekday](self->_simpleRuleComponents, "weekday"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSHolidayCalendarEventDateRule _stringDescriptionForDateRuleComponentValue:](self, "_stringDescriptionForDateRuleComponentValue:", -[NSDateComponents weekdayOrdinal](self->_simpleRuleComponents, "weekdayOrdinal"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSHolidayCalendarEventDateRule _stringDescriptionForDateRuleComponentValue:](self, "_stringDescriptionForDateRuleComponentValue:", self->_startYear);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSHolidayCalendarEventDateRule _stringDescriptionForDateRuleComponentValue:](self, "_stringDescriptionForDateRuleComponentValue:", self->_endYear);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%@, weekday %@, weekdayOrd %@, startY: %@, endY: %@"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_stringDescriptionForDateRuleComponentValue:(int64_t)a3
{
  __CFString *v3;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = CFSTR("N/A");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (CLSHolidayCalendarEventDateRuleDelegate)delegate
{
  return (CLSHolidayCalendarEventDateRuleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDateComponents)simpleRuleComponents
{
  return self->_simpleRuleComponents;
}

- (void)setSimpleRuleComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)startYear
{
  return self->_startYear;
}

- (void)setStartYear:(int64_t)a3
{
  self->_startYear = a3;
}

- (int64_t)endYear
{
  return self->_endYear;
}

- (void)setEndYear:(int64_t)a3
{
  self->_endYear = a3;
}

- (int64_t)offsetDays
{
  return self->_offsetDays;
}

- (void)setOffsetDays:(int64_t)a3
{
  self->_offsetDays = a3;
}

- (NSString)relativeToRuleUUID
{
  return self->_relativeToRuleUUID;
}

- (void)setRelativeToRuleUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeToRuleUUID, 0);
  objc_storeStrong((id *)&self->_simpleRuleComponents, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
