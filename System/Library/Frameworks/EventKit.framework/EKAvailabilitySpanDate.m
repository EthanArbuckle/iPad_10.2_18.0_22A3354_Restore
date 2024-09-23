@implementation EKAvailabilitySpanDate

- (EKAvailabilitySpanDate)initWithDate:(id)a3 dateType:(int64_t)a4 spanType:(int64_t)a5
{
  id v9;
  EKAvailabilitySpanDate *v10;
  EKAvailabilitySpanDate *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKAvailabilitySpanDate;
  v10 = -[EKAvailabilitySpanDate init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_spanDate, a3);
    v11->_dateType = a4;
    v11->_spanType = a5;
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unsigned int v8;
  int64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[EKAvailabilitySpanDate spanDate](self, "spanDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spanDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_msgSend((id)objc_opt_class(), "valueForSpanType:", -[EKAvailabilitySpanDate spanType](self, "spanType"));
    if (v8 > objc_msgSend((id)objc_opt_class(), "valueForSpanType:", objc_msgSend(v4, "spanType")))
      v9 = -1;
    else
      v9 = 1;
  }
  else
  {
    -[EKAvailabilitySpanDate spanDate](self, "spanDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spanDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "compare:", v11);

  }
  return v9;
}

+ (unsigned)valueForSpanType:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return dword_1A244A448[a3];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EKAvailabilitySpanDate spanDate](self, "spanDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  EKAvailabilitySpanTypeAsString(-[EKAvailabilitySpanDate spanType](self, "spanType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EKAvailabilitySpanDate dateType](self, "dateType");
  v7 = CFSTR("end");
  if (!v6)
    v7 = CFSTR("start");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \t%@\t%@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)spanDate
{
  return self->_spanDate;
}

- (void)setSpanDate:(id)a3
{
  objc_storeStrong((id *)&self->_spanDate, a3);
}

- (int64_t)dateType
{
  return self->_dateType;
}

- (void)setDateType:(int64_t)a3
{
  self->_dateType = a3;
}

- (int64_t)spanType
{
  return self->_spanType;
}

- (void)setSpanType:(int64_t)a3
{
  self->_spanType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spanDate, 0);
}

@end
