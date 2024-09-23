@implementation ATXDuetEvent

+ (int64_t)_secondsInDayFromDate:(id)a3 calendar:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a3;
  objc_msgSend(a4, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  return (uint64_t)v8;
}

- (int64_t)startDateSecondsAfterMidnight
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ATXDuetEvent startDate](self, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[ATXDuetEvent _secondsInDayFromDate:calendar:](ATXDuetEvent, "_secondsInDayFromDate:calendar:", v2, v3);

  return v4;
}

- (int64_t)endDateSecondsAfterMidnight
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ATXDuetEvent endDate](self, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[ATXDuetEvent _secondsInDayFromDate:calendar:](ATXDuetEvent, "_secondsInDayFromDate:calendar:", v2, v3);

  return v4;
}

- (BOOL)isStartDateOnWeekday
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isDateInWeekend:", v4);

  return v5 ^ 1;
}

- (BOOL)isEndDateOnWeekday
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent endDate](self, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isDateInWeekend:", v4);

  return v5 ^ 1;
}

- (id)locationIdentifierUUIDString
{
  void *v3;
  void *v4;
  void *v5;

  -[ATXDuetEvent locationIdentifier](self, "locationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ATXDuetEvent locationIdentifier](self, "locationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (ATXDuetEvent)initWithDKEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  ATXDuetEvent *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXDuetEvent.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXDuetEvent initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v6, v7);

  return v8;
}

- (ATXDuetEvent)initWithCurrentContextStoreValues
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXDuetEvent.m"), 38, CFSTR("Should be implemented by subclasses"));

  return 0;
}

- (ATXDuetEvent)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  ATXDuetEvent *v8;
  uint64_t v9;
  NSDate *startDate;
  uint64_t v11;
  NSDate *endDate;
  ATXDuetEvent *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)ATXDuetEvent;
    v8 = -[ATXDuetEvent init](&v15, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v6, "copy");
      startDate = v8->_startDate;
      v8->_startDate = (NSDate *)v9;

      v11 = objc_msgSend(v7, "copy");
      endDate = v8->_endDate;
      v8->_endDate = (NSDate *)v11;

    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)identifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXDuetEvent.m"), 59, CFSTR("Must be implemented by the subclass."));

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  ATXDuetEvent *v4;
  id *v5;
  NSDate *startDate;
  NSDate *v7;
  NSDate *v8;
  NSDate *v9;
  char v10;
  char v11;
  NSDate *endDate;
  NSDate *v13;
  NSDate *v14;
  NSDate *v15;
  char v16;
  void *v17;
  void *v18;

  v4 = (ATXDuetEvent *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      startDate = self->_startDate;
      v7 = (NSDate *)v5[1];
      if (startDate == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = startDate;
        v10 = -[NSDate isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_11;
      }
      endDate = self->_endDate;
      v13 = (NSDate *)v5[2];
      if (endDate == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = endDate;
        v16 = -[NSDate isEqual:](v15, "isEqual:", v14);

        if ((v16 & 1) == 0)
        {
LABEL_11:
          v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      -[ATXDuetEvent identifier](self, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v17, "isEqualToString:", v18);

      goto LABEL_14;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSDate hash](self->_startDate, "hash");
  v4 = -[NSDate hash](self->_endDate, "hash") - v3 + 32 * v3;
  -[ATXDuetEvent identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[ATXDuetEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("codingKeyForDuetEventStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("codingKeyForDuetEventEndDate"));

}

- (ATXDuetEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXDuetEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_anchor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForDuetEventStartDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_anchor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForDuetEventEndDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      self = -[ATXDuetEvent initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v8, v14);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSUUID)locationIdentifier
{
  return self->_locationIdentifier;
}

- (void)setLocationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
