@implementation EKUIRecurrenceRuleBuilder

- (EKUIRecurrenceRuleBuilder)init
{
  EKUIRecurrenceRuleBuilder *v2;
  EKUIRecurrenceRuleBuilder *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIRecurrenceRuleBuilder;
  v2 = -[EKUIRecurrenceRuleBuilder init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[EKUIRecurrenceRuleBuilder _setDefaultValues](v2, "_setDefaultValues");
  return v3;
}

- (void)_setDefaultValues
{
  self->_interval = 1;
}

- (id)recurrenceRule
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v3 = -[EKUIRecurrenceRuleBuilder _frequencyToUse](self, "_frequencyToUse");
  objc_msgSend(MEMORY[0x1E0CAA120], "recurrenceRuleWithType:interval:end:", v3, -[EKUIRecurrenceRuleBuilder interval](self, "interval"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKUIRecurrenceRuleBuilder count](self, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CAA108], "recurrenceEndWithOccurrenceCount:", -[EKUIRecurrenceRuleBuilder count](self, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRecurrenceEnd:", v5);

  }
  -[EKUIRecurrenceRuleBuilder dayNumbers](self, "dayNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count")
    || -[EKUIRecurrenceRuleBuilder days](self, "days")
    || -[EKUIRecurrenceRuleBuilder ordinalValue](self, "ordinalValue"))
  {

  }
  else
  {
    -[EKUIRecurrenceRuleBuilder monthNumbers](self, "monthNumbers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (!v22)
      goto LABEL_32;
  }
  switch(v3)
  {
    case 3:
      -[EKUIRecurrenceRuleBuilder monthNumbers](self, "monthNumbers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMonthsOfTheYear:", v9);

      -[EKUIRecurrenceRuleBuilder setPositions](self, "setPositions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      if (v12 && -[EKUIRecurrenceRuleBuilder days](self, "days"))
      {
        -[EKUIRecurrenceRuleBuilder daysOfTheWeekWithWeek:](self, "daysOfTheWeekWithWeek:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_30:
        v19 = (void *)v13;
        objc_msgSend(v4, "setDaysOfTheWeek:", v13);
        goto LABEL_31;
      }
      if (!-[EKUIRecurrenceRuleBuilder days](self, "days"))
        goto LABEL_32;
      break;
    case 2:
      -[EKUIRecurrenceRuleBuilder monthNumbers](self, "monthNumbers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMonthsOfTheYear:", v14);

      if (-[EKUIRecurrenceRuleBuilder ordinalValue](self, "ordinalValue"))
      {
        if (-[EKUIRecurrenceRuleBuilder days](self, "days"))
        {
          -[EKUIRecurrenceRuleBuilder dayNumbers](self, "dayNumbers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          if (!v16)
          {
            -[EKUIRecurrenceRuleBuilder setPositions](self, "setPositions");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setSetPositions:", v23);

LABEL_29:
            -[EKUIRecurrenceRuleBuilder daysOfTheWeek](self, "daysOfTheWeek");
            v13 = objc_claimAutoreleasedReturnValue();
            goto LABEL_30;
          }
        }
      }
      -[EKUIRecurrenceRuleBuilder dayNumbers](self, "dayNumbers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count"))
      {
        v18 = -[EKUIRecurrenceRuleBuilder days](self, "days");

        if (!v18)
        {
          -[EKUIRecurrenceRuleBuilder dayNumbers](self, "dayNumbers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setDaysOfTheMonth:", v19);
LABEL_31:

LABEL_32:
          v20 = v4;
          goto LABEL_33;
        }
      }
      else
      {

      }
      break;
    case 1:
      if (-[EKUIRecurrenceRuleBuilder days](self, "days"))
      {
        -[EKUIRecurrenceRuleBuilder dayNumbers](self, "dayNumbers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (!v8)
          goto LABEL_29;
      }
      break;
  }
  v20 = 0;
LABEL_33:
  v24 = v20;

  return v24;
}

- (int64_t)_frequencyToUse
{
  int64_t result;

  result = -[EKUIRecurrenceRuleBuilder frequency](self, "frequency");
  if (result == 3)
  {
    if (-[EKUIRecurrenceRuleBuilder days](self, "days") == 127
      || -[EKUIRecurrenceRuleBuilder days](self, "days") == 62
      || -[EKUIRecurrenceRuleBuilder days](self, "days") == 65)
    {
      return 2;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

- (id)daysOfTheWeek
{
  return -[EKUIRecurrenceRuleBuilder daysOfTheWeekWithWeek:](self, "daysOfTheWeekWithWeek:", 0);
}

- (id)daysOfTheWeekWithWeek:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = (void *)objc_opt_new();
  if ((-[EKUIRecurrenceRuleBuilder days](self, "days") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CAA100], "dayOfWeek:weekNumber:", 1, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  if ((-[EKUIRecurrenceRuleBuilder days](self, "days") & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CAA100], "dayOfWeek:weekNumber:", 2, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  if ((-[EKUIRecurrenceRuleBuilder days](self, "days") & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CAA100], "dayOfWeek:weekNumber:", 3, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  if ((-[EKUIRecurrenceRuleBuilder days](self, "days") & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CAA100], "dayOfWeek:weekNumber:", 4, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  if ((-[EKUIRecurrenceRuleBuilder days](self, "days") & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CAA100], "dayOfWeek:weekNumber:", 5, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

  }
  if ((-[EKUIRecurrenceRuleBuilder days](self, "days") & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CAA100], "dayOfWeek:weekNumber:", 6, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  if ((-[EKUIRecurrenceRuleBuilder days](self, "days") & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CAA100], "dayOfWeek:weekNumber:", 7, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

  }
  if (objc_msgSend(v5, "count"))
    v13 = v5;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (id)setPositions
{
  int v2;

  v2 = -[EKUIRecurrenceRuleBuilder ordinalValue](self, "ordinalValue") - 1;
  if (v2 > 6)
    return 0;
  else
    return (id)qword_1E601A910[v2];
}

- (id)description
{
  __CFString *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v16;

  -[EKUIRecurrenceRuleBuilder recurrenceRule](self, "recurrenceRule");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[EKUIRecurrenceRuleBuilder frequency](self, "frequency");
  v6 = -[EKUIRecurrenceRuleBuilder interval](self, "interval");
  v7 = -[EKUIRecurrenceRuleBuilder count](self, "count");
  -[EKUIRecurrenceRuleBuilder dayNumbers](self, "dayNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EKUIRecurrenceRuleBuilder days](self, "days");
  v10 = -[EKUIRecurrenceRuleBuilder ordinalValue](self, "ordinalValue");
  -[EKUIRecurrenceRuleBuilder monthNumbers](self, "monthNumbers");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("NO VALID RULE");
  if (v3)
    v13 = v3;
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p> {\n\tFrequency: %ld\n\tInterval: %ld\n\tCount: %tu\n\tDay Number: %@\n\tDays: %d\n\tOrdinal: %d\n\tMonth Numbers: %@\n\tCurrent Rule: %@\n}"), v4, self, v5, v6, v7, v8, v9, v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(int64_t)a3
{
  self->_frequency = a3;
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSArray)dayNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDayNumbers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int)days
{
  return self->_days;
}

- (void)setDays:(int)a3
{
  self->_days = a3;
}

- (int)ordinalValue
{
  return self->_ordinalValue;
}

- (void)setOrdinalValue:(int)a3
{
  self->_ordinalValue = a3;
}

- (NSArray)monthNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMonthNumbers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthNumbers, 0);
  objc_storeStrong((id *)&self->_dayNumbers, 0);
}

@end
