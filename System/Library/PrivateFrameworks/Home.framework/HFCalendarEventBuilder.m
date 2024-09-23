@implementation HFCalendarEventBuilder

- (id)compareToObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFCalendarEventBuilder;
  -[HFEventBuilder compareToObject:](&v13, sel_compareToObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsCriticalDifference") & 1) == 0)
  {
    -[HFCalendarEventBuilder fireDate](self, "fireDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fireDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v6, v7, CFSTR("fireDate"), 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v8);

    -[HFCalendarEventBuilder fireTimeComponents](self, "fireTimeComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fireTimeComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v9, v10, CFSTR("fireTimeComponents"), 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v11);

  }
  return v5;
}

- (HFCalendarEventBuilder)initWithEvent:(id)a3
{
  id v4;
  HFCalendarEventBuilder *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFCalendarEventBuilder;
  v5 = -[HFEventBuilder initWithEvent:](&v8, sel_initWithEvent_, v4);
  if (v5)
  {
    objc_msgSend(v4, "fireDateComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCalendarEventBuilder setFireTimeComponents:](v5, "setFireTimeComponents:", v6);

  }
  return v5;
}

- (id)buildNewEventsFromCurrentState
{
  void *v3;
  void *v4;
  void *v5;

  -[HFCalendarEventBuilder effectiveFireTimeComponents](self, "effectiveFireTimeComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    NSLog(CFSTR("Attempting to create an HMCalendarEvent without valid fireDateComponents for event builder %@!"), self);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA3A0]), "initWithFireDateComponents:", v3);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)naturalLanguageNameOfType:(unint64_t)a3 withHome:(id)a4 recurrences:(id)a5
{
  id v8;
  id v9;
  HFTriggerNaturalLanguageOptions *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = -[HFTriggerNaturalLanguageOptions initWithHome:nameType:]([HFTriggerNaturalLanguageOptions alloc], "initWithHome:nameType:", v9, a3);

  -[HFCalendarEventBuilder naturalLanguageNameWithOptions:recurrences:](self, "naturalLanguageNameWithOptions:recurrences:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)naturalLanguageNameWithOptions:(id)a3 recurrences:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CBA910];
  v7 = a4;
  v8 = a3;
  -[HFCalendarEventBuilder effectiveFireDate](self, "effectiveFireDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_naturalLanguageNameWithOptions:fireDate:recurrences:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  return -[HFCalendarEventBuilder naturalLanguageNameWithOptions:recurrences:](self, "naturalLanguageNameWithOptions:recurrences:", a3, MEMORY[0x1E0C9AA60]);
}

- (id)performValidation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HFCalendarEventBuilder effectiveFireDate](self, "effectiveFireDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0D519C0];
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "futureWithError:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)updateBaseFireDateForTrigger
{
  void *v3;
  void *v4;
  void *v5;

  -[HFCalendarEventBuilder fireTimeComponents](self, "fireTimeComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[HFCalendarEventBuilder fireDate](self, "fireDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[HFCalendarEventBuilder effectiveFireTimeComponents](self, "effectiveFireTimeComponents");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCalendarEventBuilder setFireTimeComponents:](self, "setFireTimeComponents:", v5);

      -[HFCalendarEventBuilder setFireDate:](self, "setFireDate:", 0);
    }
  }
}

- (id)effectiveFireTimeComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HFCalendarEventBuilder fireTimeComponents](self, "fireTimeComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFCalendarEventBuilder fireTimeComponents](self, "fireTimeComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFCalendarEventBuilder fireDate](self, "fireDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCalendarEventBuilder fireDate](self, "fireDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "components:fromDate:", 96, v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (NSDate)effectiveFireDate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[HFCalendarEventBuilder fireDate](self, "fireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCalendarEventBuilder fireTimeComponents](self, "fireTimeComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HFCalendarEventBuilder fireTimeComponents](self, "fireTimeComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCalendarEventBuilder _fireDateForTimeComponents:](self, "_fireDateForTimeComponents:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return (NSDate *)v3;
}

- (id)_fireDateForTimeComponents:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99D48];
    v4 = a3;
    objc_msgSend(v3, "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startOfDayForDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v4, "hour");
    v9 = objc_msgSend(v4, "minute");
    v10 = objc_msgSend(v4, "second");

    objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", v8, v9, v10, v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingTimeInterval:", 60.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "earlierDate:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v11)
    {
      objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1, v11, 0);
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
    }
    objc_msgSend(v5, "dateBySettingUnit:value:ofDate:options:", 128, 0, v11, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dateBySettingUnit:value:ofDate:options:", 0x8000, 0, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCalendarEventBuilder fireDate](self, "fireDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("fireDate"));

  -[HFCalendarEventBuilder fireTimeComponents](self, "fireTimeComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("fireTimeComponents"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)eventType
{
  return CFSTR("HFEventTypeTime");
}

- (id)comparisonKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)HFCalendarEventBuilder;
  -[HFEventBuilder comparisonKey](&v9, sel_comparisonKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCalendarEventBuilder effectiveFireDate](self, "effectiveFireDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCalendarEventBuilder fireTimeComponents](self, "fireTimeComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@:%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDateComponents)fireTimeComponents
{
  return self->_fireTimeComponents;
}

- (void)setFireTimeComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireTimeComponents, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
}

@end
