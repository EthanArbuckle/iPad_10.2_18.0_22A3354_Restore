@implementation EKRecurrenceDayOfWeek

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (EKRecurrenceDayOfWeek)dayOfWeek:(EKWeekday)dayOfTheWeek
{
  return (EKRecurrenceDayOfWeek *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDayOfTheWeek:weekNumber:", dayOfTheWeek, 0);
}

+ (EKRecurrenceDayOfWeek)dayOfWeek:(EKWeekday)dayOfTheWeek weekNumber:(NSInteger)weekNumber
{
  return (EKRecurrenceDayOfWeek *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDayOfTheWeek:weekNumber:", dayOfTheWeek, weekNumber);
}

- (id)initWithDayOfTheWeek:(EKWeekday)dayOfTheWeek weekNumber:(NSInteger)weekNumber
{
  id result;
  objc_super v8;

  if ((unint64_t)(dayOfTheWeek - 8) <= 0xFFFFFFFFFFFFFFF8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid day number"));
  v8.receiver = self;
  v8.super_class = (Class)EKRecurrenceDayOfWeek;
  result = -[EKRecurrenceDayOfWeek init](&v8, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = dayOfTheWeek;
    *((_QWORD *)result + 2) = weekNumber;
  }
  return result;
}

- (EKRecurrenceDayOfWeek)initWithCoder:(id)a3
{
  id v4;
  EKRecurrenceDayOfWeek *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EKRecurrenceDayOfWeek;
  v5 = -[EKRecurrenceDayOfWeek init](&v7, sel_init);
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

+ (id)iCalendarValueFromDayOfTheWeek:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return &stru_1E4789A58;
  else
    return off_1E4787730[a3 - 1];
}

+ (int64_t)icsWeekDayFromDayOfTheWeek:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 6)
    return 1;
  else
    return a3;
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
    objc_msgSend((id)objc_opt_class(), "iCalendarValueFromDayOfTheWeek:", self->_dayOfTheWeek);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%ld%@"), weekNumber, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "iCalendarValueFromDayOfTheWeek:", self->_dayOfTheWeek);
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
  -[EKRecurrenceDayOfWeek iCalendarDescription](self, "iCalendarDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> { %@ }"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  EKWeekday v3;

  v3 = -[EKRecurrenceDayOfWeek dayOfTheWeek](self, "dayOfTheWeek");
  return -[EKRecurrenceDayOfWeek weekNumber](self, "weekNumber") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  EKRecurrenceDayOfWeek *v4;
  uint64_t v5;
  EKWeekday v6;
  NSInteger v7;
  BOOL v8;

  v4 = (EKRecurrenceDayOfWeek *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (v6 = -[EKRecurrenceDayOfWeek dayOfTheWeek](self, "dayOfTheWeek"),
          v6 == -[EKRecurrenceDayOfWeek dayOfTheWeek](v4, "dayOfTheWeek")))
    {
      v7 = -[EKRecurrenceDayOfWeek weekNumber](self, "weekNumber");
      v8 = v7 == -[EKRecurrenceDayOfWeek weekNumber](v4, "weekNumber");
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (EKWeekday)dayOfTheWeek
{
  return self->_dayOfTheWeek;
}

- (NSInteger)weekNumber
{
  return self->_weekNumber;
}

@end
