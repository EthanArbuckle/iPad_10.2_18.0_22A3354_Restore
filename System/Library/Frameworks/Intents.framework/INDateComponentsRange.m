@implementation INDateComponentsRange

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INDateComponentsRange startDateComponents](self, "startDateComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[INDateComponentsRange startDateComponents](self, "startDateComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateFromComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  -[INDateComponentsRange endDateComponents](self, "endDateComponents");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[INDateComponentsRange endDateComponents](self, "endDateComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateFromComponents:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v12 != 0;
    v18 = v16 != 0;
    if (v12 && v16)
    {
      v19 = objc_alloc_init(MEMORY[0x1E0CB3590]);
      objc_msgSend(v19, "setLocale:", v8);
      objc_msgSend(v19, "stringFromDate:toDate:", v12, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
  }
  else
  {
    v18 = 0;
    v16 = 0;
    v17 = v12 != 0;
  }
  if (v17 || v18)
  {
    if (v17)
      v21 = v12;
    else
      v21 = v16;
    objc_msgSend(v21, "_intents_readableTitleWithLocalizer:metadata:", v6, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_16:

  return v20;
}

- (INDateComponentsRange)initWithStartDateComponents:(NSDateComponents *)startDateComponents endDateComponents:(NSDateComponents *)endDateComponents
{
  return -[INDateComponentsRange initWithStartDateComponents:endDateComponents:recurrenceRule:](self, "initWithStartDateComponents:endDateComponents:recurrenceRule:", startDateComponents, endDateComponents, 0);
}

- (INDateComponentsRange)initWithStartDateComponents:(NSDateComponents *)startDateComponents endDateComponents:(NSDateComponents *)endDateComponents recurrenceRule:(INRecurrenceRule *)recurrenceRule
{
  NSDateComponents *v8;
  NSDateComponents *v9;
  INRecurrenceRule *v10;
  INDateComponentsRange *v11;
  uint64_t v12;
  NSDateComponents *v13;
  uint64_t v14;
  NSDateComponents *v15;
  uint64_t v16;
  INRecurrenceRule *v17;
  objc_super v19;

  v8 = startDateComponents;
  v9 = endDateComponents;
  v10 = recurrenceRule;
  v19.receiver = self;
  v19.super_class = (Class)INDateComponentsRange;
  v11 = -[INDateComponentsRange init](&v19, sel_init);
  if (v11)
  {
    v12 = -[NSDateComponents copy](v8, "copy");
    v13 = v11->_startDateComponents;
    v11->_startDateComponents = (NSDateComponents *)v12;

    v14 = -[NSDateComponents copy](v9, "copy");
    v15 = v11->_endDateComponents;
    v11->_endDateComponents = (NSDateComponents *)v14;

    v16 = -[INRecurrenceRule copy](v10, "copy");
    v17 = v11->_recurrenceRule;
    v11->_recurrenceRule = (INRecurrenceRule *)v16;

  }
  return v11;
}

- (NSDateComponents)startDateComponents
{
  return (NSDateComponents *)(id)-[NSDateComponents copy](self->_startDateComponents, "copy");
}

- (NSDateComponents)endDateComponents
{
  return (NSDateComponents *)(id)-[NSDateComponents copy](self->_endDateComponents, "copy");
}

- (INRecurrenceRule)recurrenceRule
{
  return (INRecurrenceRule *)(id)-[INRecurrenceRule copy](self->_recurrenceRule, "copy");
}

- (INDateComponentsRange)initWithStartDate:(id)a3 endDate:(id)a4 onCalendar:(id)a5 inTimeZone:(id)a6
{
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  INDateComponentsRange *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a5;
  v13 = a6;
  if (v10 | v11)
  {
    v15 = v12;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v13;
    if (v16 || (objc_msgSend(v15, "timeZone"), (v16 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (v10)
        goto LABEL_8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
LABEL_8:
        objc_msgSend(v15, "componentsInTimeZone:fromDate:", v16, v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
LABEL_9:
          objc_msgSend(v15, "componentsInTimeZone:fromDate:", v16, v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
          v14 = -[INDateComponentsRange initWithStartDateComponents:endDateComponents:](self, "initWithStartDateComponents:endDateComponents:", v17, v18);

          goto LABEL_14;
        }
LABEL_12:
        v18 = 0;
        goto LABEL_13;
      }
    }
    v17 = 0;
    if (v11)
      goto LABEL_9;
    goto LABEL_12;
  }
  v14 = -[INDateComponentsRange initWithStartDateComponents:endDateComponents:recurrenceRule:](self, "initWithStartDateComponents:endDateComponents:recurrenceRule:", 0, 0, 0);
LABEL_14:

  return v14;
}

- (INDateComponentsRange)initWithDateInterval:(id)a3 onCalendar:(id)a4 inTimeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  INDateComponentsRange *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[INDateComponentsRange initWithStartDate:endDate:onCalendar:inTimeZone:](self, "initWithStartDate:endDate:onCalendar:inTimeZone:", v11, v12, v9, v8);
  return v13;
}

- (INDateComponentsRange)initWithDate:(id)a3 onCalendar:(id)a4 inTimeZone:(id)a5
{
  return -[INDateComponentsRange initWithStartDate:endDate:onCalendar:inTimeZone:](self, "initWithStartDate:endDate:onCalendar:inTimeZone:", a3, a3, a4, a5);
}

- (INDateComponentsRange)initWithStartDateComponents:(id)a3 endDateComponents:(id)a4 recurrenceRule:(id)a5 userInput:(id)a6 allDay:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  INDateComponentsRange *v17;
  uint64_t v18;
  NSDateComponents *startDateComponents;
  uint64_t v20;
  NSDateComponents *endDateComponents;
  uint64_t v22;
  INRecurrenceRule *recurrenceRule;
  uint64_t v24;
  NSString *userInput;
  uint64_t v26;
  NSNumber *allDay;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)INDateComponentsRange;
  v17 = -[INDateComponentsRange init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    startDateComponents = v17->_startDateComponents;
    v17->_startDateComponents = (NSDateComponents *)v18;

    v20 = objc_msgSend(v13, "copy");
    endDateComponents = v17->_endDateComponents;
    v17->_endDateComponents = (NSDateComponents *)v20;

    v22 = objc_msgSend(v14, "copy");
    recurrenceRule = v17->_recurrenceRule;
    v17->_recurrenceRule = (INRecurrenceRule *)v22;

    v24 = objc_msgSend(v15, "copy");
    userInput = v17->_userInput;
    v17->_userInput = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    allDay = v17->_allDay;
    v17->_allDay = (NSNumber *)v26;

  }
  return v17;
}

- (id)_userInput
{
  return (id)-[NSString copy](self->_userInput, "copy");
}

- (NSDateInterval)dateInterval
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[INDateComponentsRange startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INDateComponentsRange endDate](self, "endDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v3, v4);

  return (NSDateInterval *)v6;
}

- (NSDate)startDate
{
  NSDateComponents *startDateComponents;
  void *v4;
  void *v5;

  startDateComponents = self->_startDateComponents;
  if (startDateComponents)
  {
    -[NSDateComponents date](startDateComponents, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateFromComponents:", self->_startDateComponents);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)endDate
{
  NSDateComponents *endDateComponents;
  void *v4;
  void *v5;

  endDateComponents = self->_endDateComponents;
  if (endDateComponents)
  {
    -[NSDateComponents date](endDateComponents, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateFromComponents:", self->_endDateComponents);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (INDateComponentsRange)initWithEKRecurrenceRule:(EKRecurrenceRule *)recurrenceRule
{
  EKRecurrenceRule *v4;
  INRecurrenceRule *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  INRecurrenceRule *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  INDateComponentsRange *v15;

  v4 = recurrenceRule;
  v5 = [INRecurrenceRule alloc];
  v6 = -[EKRecurrenceRule interval](v4, "interval");
  v7 = -[EKRecurrenceRule frequency](v4, "frequency");
  if ((unint64_t)(v7 - 1) >= 3)
    v8 = 3;
  else
    v8 = v7 + 3;
  v9 = -[INRecurrenceRule initWithInterval:frequency:](v5, "initWithInterval:frequency:", v6, v8);
  -[EKRecurrenceRule daysOfTheWeek](v4, "daysOfTheWeek");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[EKRecurrenceRule daysOfTheWeek](v4, "daysOfTheWeek");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v14, "setWeekday:", objc_msgSend(v13, "dayOfTheWeek"));
    objc_msgSend(v14, "setWeekdayOrdinal:", objc_msgSend(v13, "weekNumber"));

  }
  else
  {
    v14 = 0;
  }
  v15 = -[INDateComponentsRange initWithStartDateComponents:endDateComponents:recurrenceRule:](self, "initWithStartDateComponents:endDateComponents:recurrenceRule:", v14, 0, v9);

  return v15;
}

- (EKRecurrenceRule)EKRecurrenceRule
{
  INRecurrenceRule *recurrenceRule;
  INRecurrenceFrequency v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  NSInteger v10;
  NSInteger v11;
  void *v12;
  void *v14;
  objc_class *v15;
  id v16;
  NSUInteger v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  recurrenceRule = self->_recurrenceRule;
  if (!recurrenceRule
    || -[INRecurrenceRule frequency](recurrenceRule, "frequency") == INRecurrenceFrequencyMinute
    || -[INRecurrenceRule frequency](self->_recurrenceRule, "frequency") == INRecurrenceFrequencyHourly
    || -[INRecurrenceRule frequency](self->_recurrenceRule, "frequency") == INRecurrenceFrequencyUnknown)
  {
    v12 = 0;
  }
  else
  {
    v4 = -[INRecurrenceRule frequency](self->_recurrenceRule, "frequency");
    if ((unint64_t)(v4 - 4) >= 3)
      v5 = 0;
    else
      v5 = v4 - 3;
    v6 = 0;
    if (-[NSDateComponents weekday](self->_startDateComponents, "weekday") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v7 = (void *)getEKRecurrenceDayOfWeekClass_softClass;
      v27 = getEKRecurrenceDayOfWeekClass_softClass;
      if (!getEKRecurrenceDayOfWeekClass_softClass)
      {
        v19 = MEMORY[0x1E0C809B0];
        v20 = 3221225472;
        v21 = __getEKRecurrenceDayOfWeekClass_block_invoke;
        v22 = &unk_1E22953C0;
        v23 = &v24;
        __getEKRecurrenceDayOfWeekClass_block_invoke((uint64_t)&v19);
        v7 = (void *)v25[3];
      }
      v8 = objc_retainAutorelease(v7);
      _Block_object_dispose(&v24, 8);
      v9 = [v8 alloc];
      v10 = -[NSDateComponents weekday](self->_startDateComponents, "weekday");
      if (-[NSDateComponents weekdayOrdinal](self->_startDateComponents, "weekdayOrdinal") == 0x7FFFFFFFFFFFFFFFLL)
        v11 = 0;
      else
        v11 = -[NSDateComponents weekdayOrdinal](self->_startDateComponents, "weekdayOrdinal");
      v6 = (void *)objc_msgSend(v9, "initWithDayOfTheWeek:weekNumber:", v10, v11);
    }
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v14 = (void *)getEKRecurrenceRuleClass_softClass;
    v27 = getEKRecurrenceRuleClass_softClass;
    if (!getEKRecurrenceRuleClass_softClass)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __getEKRecurrenceRuleClass_block_invoke;
      v22 = &unk_1E22953C0;
      v23 = &v24;
      __getEKRecurrenceRuleClass_block_invoke((uint64_t)&v19);
      v14 = (void *)v25[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v24, 8);
    v16 = [v15 alloc];
    v17 = -[INRecurrenceRule interval](self->_recurrenceRule, "interval");
    if (v6)
    {
      v28[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v16, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v5, v17, v18, 0, 0, 0, 0, 0, 0);

    }
    else
    {
      v12 = (void *)objc_msgSend(v16, "initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v5, v17, 0, 0, 0, 0, 0, 0, 0);
    }

  }
  return (EKRecurrenceRule *)v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSDateComponents hash](self->_startDateComponents, "hash");
  v4 = -[NSDateComponents hash](self->_endDateComponents, "hash") ^ v3;
  return v4 ^ -[INRecurrenceRule hash](self->_recurrenceRule, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSDateComponents *startDateComponents;
  NSDateComponents *endDateComponents;
  INRecurrenceRule *recurrenceRule;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    startDateComponents = self->_startDateComponents;
    v9 = 0;
    if (startDateComponents == (NSDateComponents *)v5[1]
      || -[NSDateComponents isEqual:](startDateComponents, "isEqual:"))
    {
      endDateComponents = self->_endDateComponents;
      if (endDateComponents == (NSDateComponents *)v5[2]
        || -[NSDateComponents isEqual:](endDateComponents, "isEqual:"))
      {
        recurrenceRule = self->_recurrenceRule;
        if (recurrenceRule == (INRecurrenceRule *)v5[3] || -[INRecurrenceRule isEqual:](recurrenceRule, "isEqual:"))
          v9 = 1;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateComponents *startDateComponents;
  id v5;

  startDateComponents = self->_startDateComponents;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDateComponents, CFSTR("startDateComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDateComponents, CFSTR("endDateComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recurrenceRule, CFSTR("recurrenceRule"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInput, CFSTR("userInput"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allDay, CFSTR("allDay"));

}

- (INDateComponentsRange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  INDateComponentsRange *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDateComponents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDateComponents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recurrenceRule"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userInput"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allDay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[INDateComponentsRange initWithStartDateComponents:endDateComponents:recurrenceRule:userInput:allDay:](self, "initWithStartDateComponents:endDateComponents:recurrenceRule:userInput:allDay:", v5, v6, v7, v8, v9);
  return v10;
}

- (NSString)description
{
  return (NSString *)-[INDateComponentsRange descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INDateComponentsRange;
  -[INDateComponentsRange description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INDateComponentsRange _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSDateComponents *startDateComponents;
  void *v4;
  NSDateComponents *endDateComponents;
  void *v6;
  INRecurrenceRule *recurrenceRule;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("startDateComponents");
  startDateComponents = self->_startDateComponents;
  v4 = startDateComponents;
  if (!startDateComponents)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("endDateComponents");
  endDateComponents = self->_endDateComponents;
  v6 = endDateComponents;
  if (!endDateComponents)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("recurrenceRule");
  recurrenceRule = self->_recurrenceRule;
  v8 = recurrenceRule;
  if (!recurrenceRule)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (recurrenceRule)
  {
    if (endDateComponents)
      goto LABEL_9;
LABEL_12:

    if (startDateComponents)
      return v9;
LABEL_13:

    return v9;
  }

  if (!endDateComponents)
    goto LABEL_12;
LABEL_9:
  if (!startDateComponents)
    goto LABEL_13;
  return v9;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (NSNumber)allDay
{
  return self->_allDay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDay, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_recurrenceRule, 0);
  objc_storeStrong((id *)&self->_endDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
