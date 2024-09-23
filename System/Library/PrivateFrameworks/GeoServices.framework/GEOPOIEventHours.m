@implementation GEOPOIEventHours

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventHoursForDateTimeRanges:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOPOIEventHours *v11;
  GEOPOIEventHours *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          v11 = [GEOPOIEventHours alloc];
          v12 = -[GEOPOIEventHours initWithDateTimeRange:](v11, "initWithDateTimeRange:", v10, (_QWORD)v14);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (GEOPOIEventHours)init
{
  GEOPOIEventHours *result;

  result = (GEOPOIEventHours *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOPOIEventHours)initWithDateInterval:(id)a3
{
  id v5;
  GEOPOIEventHours *v6;
  GEOPOIEventHours *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPOIEventHours;
  v6 = -[GEOPOIEventHours init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dateInterval, a3);

  return v7;
}

- (GEOPOIEventHours)initWithDateTimeRange:(id)a3
{
  _QWORD *v4;
  GEOPOIEventHours *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDateInterval *dateInterval;
  id v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t i;
  int v17;
  GEOLocalTimeInterval *v18;
  GEOPOIEventHours *v19;
  void *v20;
  uint64_t v22;
  int v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOPOIEventHours;
  v5 = -[GEOPOIEventHours init](&v24, sel_init);
  if (!v5)
  {
LABEL_21:
    v19 = v5;
    goto LABEL_22;
  }
  if (objc_msgSend(v4, "hasValidStartAndEndDates"))
  {
    v6 = 0.0;
    v7 = 0.0;
    if (v4)
      v7 = (double)(unint64_t)v4[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v6 = (double)(unint64_t)v4[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v10;

    v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
    if (v4)
      v13 = v4[3];
    else
      v13 = 0;
    v14 = (void *)objc_msgSend(v12, "initWithCapacity:", v13);
    v15 = 0;
    if (!v4)
      goto LABEL_15;
LABEL_10:
    for (i = v4[3]; v15 < i; i = 0)
    {
      v23 = 0;
      v22 = 0;
      v22 = -[GEOPDDateTimeRange timeRangeAtIndex:]((uint64_t)v4, v15);
      v23 = v17;
      v18 = -[GEOLocalTimeInterval initWithLocalTimeRange:]([GEOLocalTimeInterval alloc], "initWithLocalTimeRange:", &v22);
      if (v18)
        objc_msgSend(v14, "addObject:", v18);

      ++v15;
      if (v4)
        goto LABEL_10;
LABEL_15:
      ;
    }
    if (objc_msgSend(v14, "count"))
      v20 = v14;
    else
      v20 = 0;
    objc_storeStrong((id *)&v5->_hours, v20);

    goto LABEL_21;
  }
  v19 = 0;
LABEL_22:

  return v19;
}

- (GEOPOIEventHours)initWithCoder:(id)a3
{
  id v4;
  GEOPOIEventHours *v5;
  uint64_t v6;
  NSDateInterval *dateInterval;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *hours;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPOIEventHours;
  v5 = -[GEOPOIEventHours init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPOIEventHoursDateIntervalKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("GEOPOIEventHoursHoursKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    hours = v5->_hours;
    v5->_hours = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *dateInterval;
  id v5;

  dateInterval = self->_dateInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dateInterval, CFSTR("GEOPOIEventHoursDateIntervalKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hours, CFSTR("GEOPOIEventHoursHoursKey"));

}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (NSArray)hours
{
  return self->_hours;
}

- (void)setHours:(id)a3
{
  objc_storeStrong((id *)&self->_hours, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
