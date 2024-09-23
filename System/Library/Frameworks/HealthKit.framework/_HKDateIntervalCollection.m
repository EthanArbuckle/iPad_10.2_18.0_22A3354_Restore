@implementation _HKDateIntervalCollection

- (_HKDateIntervalCollection)initWithAnchorDate:(id)a3 intervalComponents:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _HKDateIntervalCollection *v10;
  uint64_t v11;
  NSDate *anchorDate;
  uint64_t v13;
  NSDateComponents *intervalComponents;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v21;
  void *v22;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKDateIntervalCollection.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("anchorDate != nil"));

  }
  objc_msgSend(v8, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKDateIntervalCollection.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intervalComponents.calendar != nil"));

  }
  v23.receiver = self;
  v23.super_class = (Class)_HKDateIntervalCollection;
  v10 = -[_HKDateIntervalCollection init](&v23, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    anchorDate = v10->_anchorDate;
    v10->_anchorDate = (NSDate *)v11;

    v13 = objc_msgSend(v8, "copy");
    intervalComponents = v10->_intervalComponents;
    v10->_intervalComponents = (NSDateComponents *)v13;

    v10->_maxComponent = objc_msgSend(v8, "hk_maxComponentValue");
    -[NSDateComponents hk_approximateDuration](v10->_intervalComponents, "hk_approximateDuration");
    v10->_approximateIntervalDuration = v15;
    if (-[NSDateComponents year](v10->_intervalComponents, "year") == 0x7FFFFFFFFFFFFFFFLL
      && -[NSDateComponents month](v10->_intervalComponents, "month") == 0x7FFFFFFFFFFFFFFFLL
      && -[NSDateComponents weekOfYear](v10->_intervalComponents, "weekOfYear") == 0x7FFFFFFFFFFFFFFFLL
      && -[NSDateComponents weekOfMonth](v10->_intervalComponents, "weekOfMonth") == 0x7FFFFFFFFFFFFFFFLL
      && -[NSDateComponents day](v10->_intervalComponents, "day") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = -[NSDateComponents hour](v10->_intervalComponents, "hour");
      v10->_canonicalIntervalDuration = 0.0;
      v10->_canUseFastDateMath = v16 == 0x7FFFFFFFFFFFFFFFLL;
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSDateComponents calendar](v10->_intervalComponents, "calendar");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dateByAddingComponents:toDate:options:", v10->_intervalComponents, v10->_anchorDate, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "timeIntervalSinceDate:", v10->_anchorDate);
        v10->_canonicalIntervalDuration = v19;

      }
    }
    else
    {
      v10->_canUseFastDateMath = 0;
      v10->_canonicalIntervalDuration = 0.0;
    }
  }

  return v10;
}

- (id)dateIntervalAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  if (self->_canUseFastDateMath && self->_enableRiskyFastMathOptimization)
  {
    -[NSDate dateByAddingTimeInterval:](self->_anchorDate, "dateByAddingTimeInterval:", self->_canonicalIntervalDuration * (double)a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v5, self->_canonicalIntervalDuration);
  }
  else
  {
    -[NSDateComponents calendar](self->_intervalComponents, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v9;

    v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    -[_HKDateIntervalCollection _dateByAddingInterval:toDate:calendar:workComponents:](self, "_dateByAddingInterval:toDate:calendar:workComponents:", a3, self->_anchorDate, v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKDateIntervalCollection _dateByAddingInterval:toDate:calendar:workComponents:](self, "_dateByAddingInterval:toDate:calendar:workComponents:", a3 + 1, self->_anchorDate, v5, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v12);

  }
  return v6;
}

- (id)_dateByAddingInterval:(int64_t)a3 toDate:(id)a4 calendar:(id)a5 workComponents:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int64_t maxComponent;
  void *v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  id v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v10;
  v14 = v13;
  v15 = v13;
  if (a3)
  {
    maxComponent = self->_maxComponent;
    v15 = v13;
    if (maxComponent)
    {
      v17 = v13;
      v18 = 0x7FFFFFFF / maxComponent;
      do
      {
        if (a3 >= 0)
          v19 = a3;
        else
          v19 = -a3;
        if (v19 >= v18)
          v19 = v18;
        if (a3 >= 0)
          v20 = v19;
        else
          v20 = -v19;
        if (-[NSDateComponents year](self->_intervalComponents, "year") != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "setYear:", -[NSDateComponents year](self->_intervalComponents, "year") * v20);
        if (-[NSDateComponents month](self->_intervalComponents, "month") != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "setMonth:", -[NSDateComponents month](self->_intervalComponents, "month") * v20);
        if (-[NSDateComponents weekOfYear](self->_intervalComponents, "weekOfYear") != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "setWeekOfYear:", -[NSDateComponents weekOfYear](self->_intervalComponents, "weekOfYear") * v20);
        if (-[NSDateComponents weekOfMonth](self->_intervalComponents, "weekOfMonth") != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "setWeekOfMonth:", -[NSDateComponents weekOfMonth](self->_intervalComponents, "weekOfMonth") * v20);
        if (-[NSDateComponents day](self->_intervalComponents, "day") != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "setDay:", -[NSDateComponents day](self->_intervalComponents, "day") * v20);
        if (-[NSDateComponents hour](self->_intervalComponents, "hour") != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "setHour:", -[NSDateComponents hour](self->_intervalComponents, "hour") * v20);
        if (-[NSDateComponents minute](self->_intervalComponents, "minute") != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "setMinute:", -[NSDateComponents minute](self->_intervalComponents, "minute") * v20);
        if (-[NSDateComponents second](self->_intervalComponents, "second") != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "setSecond:", -[NSDateComponents second](self->_intervalComponents, "second") * v20);
        if (-[NSDateComponents nanosecond](self->_intervalComponents, "nanosecond") != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "setNanosecond:", -[NSDateComponents nanosecond](self->_intervalComponents, "nanosecond") * v20);
        objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v12, v17, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v15;
        a3 -= v20;
      }
      while (a3);
    }
  }
  v21 = v15;

  return v21;
}

- (id)dateIntervalContainingDate:(id)a3 index:(int64_t *)a4
{
  id v6;
  double v7;
  int64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char v19;

  v6 = a3;
  objc_msgSend(v6, "timeIntervalSinceDate:", self->_anchorDate);
  v8 = vcvtmd_s64_f64(v7 / self->_approximateIntervalDuration);
  -[_HKDateIntervalCollection dateIntervalAtIndex:](self, "dateIntervalAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hk_isBeforeOrEqualToDate:", v6);

  if (v11)
  {
    do
    {
      -[_HKDateIntervalCollection dateIntervalAtIndex:](self, "dateIntervalAtIndex:", ++v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hk_isBeforeOrEqualToDate:", v6);

      v9 = v12;
    }
    while ((v14 & 1) != 0);
  }
  else
  {
    v12 = v9;
  }
  objc_msgSend(v12, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hk_isAfterDate:", v6);

  if (!v16)
  {
    v17 = v12;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  do
  {
    -[_HKDateIntervalCollection dateIntervalAtIndex:](self, "dateIntervalAtIndex:", --v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hk_isAfterDate:", v6);

    v12 = v17;
  }
  while ((v19 & 1) != 0);
  if (a4)
LABEL_8:
    *a4 = v8;
LABEL_9:

  return v17;
}

- (id)dateIntervalForIntervalsContainingInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKDateIntervalCollection dateIntervalContainingDate:index:](self, "dateIntervalContainingDate:index:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_HKDateIntervalCollection dateIntervalContainingDate:index:](self, "dateIntervalContainingDate:index:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v10, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _HKDateIntervalCollection *v4;
  char v5;

  v4 = (_HKDateIntervalCollection *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[NSDate isEqualToDate:](self->_anchorDate, "isEqualToDate:", v4->_anchorDate))
    {
      v5 = -[NSDateComponents isEqual:](self->_intervalComponents, "isEqual:", v4->_intervalComponents);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_anchorDate, "hash");
  return -[NSDateComponents hash](self->_intervalComponents, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKDateIntervalCollection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _HKDateIntervalCollection *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchor_date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interval_components"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_HKDateIntervalCollection initWithAnchorDate:intervalComponents:](self, "initWithAnchorDate:intervalComponents:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *anchorDate;
  id v5;

  anchorDate = self->_anchorDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", anchorDate, CFSTR("anchor_date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intervalComponents, CFSTR("interval_components"));

}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (BOOL)enableRiskyFastMathOptimization
{
  return self->_enableRiskyFastMathOptimization;
}

- (void)setEnableRiskyFastMathOptimization:(BOOL)a3
{
  self->_enableRiskyFastMathOptimization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end
