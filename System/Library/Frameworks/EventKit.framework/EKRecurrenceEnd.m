@implementation EKRecurrenceEnd

+ (EKRecurrenceEnd)recurrenceEndWithEndDate:(NSDate *)endDate
{
  NSDate *v3;
  EKRecurrenceEnd *v4;

  v3 = endDate;
  v4 = -[EKRecurrenceEnd initWithEndDate:]([EKRecurrenceEnd alloc], "initWithEndDate:", v3);

  return v4;
}

+ (EKRecurrenceEnd)recurrenceEndWithOccurrenceCount:(NSUInteger)occurrenceCount
{
  return -[EKRecurrenceEnd initWithOccurrenceCount:]([EKRecurrenceEnd alloc], "initWithOccurrenceCount:", occurrenceCount);
}

- (EKRecurrenceEnd)initWithEndDate:(id)a3
{
  id v4;
  EKRecurrenceEnd *v5;
  void *v6;
  double v7;
  uint64_t v8;
  NSDate *endDate;
  objc_super v11;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("endDate is nil"));
  v11.receiver = self;
  v11.super_class = (Class)EKRecurrenceEnd;
  v5 = -[EKRecurrenceEnd init](&v11, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v4, "timeIntervalSinceReferenceDate");
      objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:", floor(v7));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

  }
  return v5;
}

- (EKRecurrenceEnd)initWithOccurrenceCount:(unint64_t)a3
{
  EKRecurrenceEnd *result;
  objc_super v6;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("occurrenceCount == 0"));
  v6.receiver = self;
  v6.super_class = (Class)EKRecurrenceEnd;
  result = -[EKRecurrenceEnd init](&v6, sel_init);
  if (result)
    result->_occurrenceCount = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EKRecurrenceEnd)initWithCoder:(id)a3
{
  id v4;
  EKRecurrenceEnd *v5;
  uint64_t v6;
  NSDate *endDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKRecurrenceEnd;
  v5 = -[EKRecurrenceEnd init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v6;

    v5->_occurrenceCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("occurrenceCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *endDate;
  id v5;

  endDate = self->_endDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_occurrenceCount, CFSTR("occurrenceCount"));

}

- (BOOL)usesEndDate
{
  return self->_endDate != 0;
}

- (id)description
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[EKRecurrenceEnd usesEndDate](self, "usesEndDate");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  if (v3)
  {
    -[EKRecurrenceEnd endDate](self, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKRecurrenceRule iCalendarValueFromDate:isDateOnly:isFloating:](EKRecurrenceRule, "iCalendarValueFromDate:isDateOnly:isFloating:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <%p> { UNTIL=%@ } "), v5, self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <%p> { COUNT=%lu }"), v5, self, -[EKRecurrenceEnd occurrenceCount](self, "occurrenceCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[EKRecurrenceEnd occurrenceCount](self, "occurrenceCount");
  -[EKRecurrenceEnd endDate](self, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  EKRecurrenceEnd *v4;
  uint64_t v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (EKRecurrenceEnd *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (v6 = -[EKRecurrenceEnd occurrenceCount](self, "occurrenceCount"),
          v6 == -[EKRecurrenceEnd occurrenceCount](v4, "occurrenceCount")))
    {
      -[EKRecurrenceEnd endDate](self, "endDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKRecurrenceEnd endDate](v4, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {
        v11 = 1;
      }
      else
      {
        -[EKRecurrenceEnd endDate](self, "endDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKRecurrenceEnd endDate](v4, "endDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToDate:", v10);

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSUInteger)occurrenceCount
{
  return self->_occurrenceCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end
