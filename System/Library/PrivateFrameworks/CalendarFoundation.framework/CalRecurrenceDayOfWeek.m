@implementation CalRecurrenceDayOfWeek

+ (id)dayOfWeek:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDayOfTheWeek:weekNumber:", a3, 0);
}

+ (id)dayOfWeek:(int64_t)a3 weekNumber:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDayOfTheWeek:weekNumber:", a3, a4);
}

- (CalRecurrenceDayOfWeek)initWithDayOfTheWeek:(int64_t)a3 weekNumber:(int64_t)a4
{
  CalRecurrenceDayOfWeek *result;
  objc_super v8;

  if ((unint64_t)(a3 - 8) <= 0xFFFFFFFFFFFFFFF8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid day number"));
  v8.receiver = self;
  v8.super_class = (Class)CalRecurrenceDayOfWeek;
  result = -[CalRecurrenceDayOfWeek init](&v8, sel_init);
  if (result)
  {
    result->_dayOfTheWeek = a3;
    result->_weekNumber = a4;
  }
  return result;
}

- (CalRecurrenceDayOfWeek)initWithCoder:(id)a3
{
  id v4;
  CalRecurrenceDayOfWeek *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CalRecurrenceDayOfWeek;
  v5 = -[CalRecurrenceDayOfWeek init](&v7, sel_init);
  if (v5)
  {
    v5->_dayOfTheWeek = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dayOfTheWeek"));
    v5->_weekNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("weekNumber"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t dayOfTheWeek;
  id v5;

  dayOfTheWeek = self->_dayOfTheWeek;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", dayOfTheWeek, CFSTR("dayOfTheWeek"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_weekNumber, CFSTR("weekNumber"));

}

- (id)iCalendarValueFromDayOfTheWeek:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return &stru_1E2A86598;
  else
    return off_1E2A85350[a3 - 1];
}

- (id)iCalendarDescription
{
  int64_t weekNumber;
  void *v3;
  void *v4;
  void *v5;

  weekNumber = self->_weekNumber;
  if (weekNumber)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[CalRecurrenceDayOfWeek iCalendarValueFromDayOfTheWeek:](self, "iCalendarValueFromDayOfTheWeek:", self->_dayOfTheWeek);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%ld%@"), weekNumber, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CalRecurrenceDayOfWeek iCalendarValueFromDayOfTheWeek:](self, "iCalendarValueFromDayOfTheWeek:", self->_dayOfTheWeek);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CalRecurrenceDayOfWeek iCalendarDescription](self, "iCalendarDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> { %@ }"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[CalRecurrenceDayOfWeek dayOfTheWeek](self, "dayOfTheWeek");
  return -[CalRecurrenceDayOfWeek weekNumber](self, "weekNumber") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  CalRecurrenceDayOfWeek *v4;
  CalRecurrenceDayOfWeek *v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;

  v4 = (CalRecurrenceDayOfWeek *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[CalRecurrenceDayOfWeek dayOfTheWeek](self, "dayOfTheWeek");
      if (v6 == -[CalRecurrenceDayOfWeek dayOfTheWeek](v5, "dayOfTheWeek"))
      {
        v7 = -[CalRecurrenceDayOfWeek weekNumber](self, "weekNumber");
        v8 = v7 == -[CalRecurrenceDayOfWeek weekNumber](v5, "weekNumber");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (int64_t)dayOfTheWeek
{
  return self->_dayOfTheWeek;
}

- (int64_t)weekNumber
{
  return self->_weekNumber;
}

@end
