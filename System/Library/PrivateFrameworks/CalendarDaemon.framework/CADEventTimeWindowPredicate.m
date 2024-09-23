@implementation CADEventTimeWindowPredicate

- (CADEventTimeWindowPredicate)initWithPredicate:(id)a3 limitWithStartDate:(id)a4 endDate:(id)a5 mustStartInInterval:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  CADEventTimeWindowPredicate *v14;
  CADEventTimeWindowPredicate *v15;
  void *v16;
  double v17;
  uint64_t v18;
  NSDate *startDate;
  void *v20;
  double v21;
  uint64_t v22;
  NSDate *endDate;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CADEventTimeWindowPredicate;
  v14 = -[CADEventTimeWindowPredicate init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_wrappedPredicate, a3);
    if (v12)
    {
      v16 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:", floor(v17));
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v18;

    if (v13)
    {
      v20 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:", floor(v21));
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    endDate = v15->_endDate;
    v15->_endDate = (NSDate *)v22;

    v15->_mustStartInInterval = a6;
  }

  return v15;
}

- (id)predicateFormat
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateStyle:", 1);
  objc_msgSend(v3, "setTimeStyle:", 1);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[CADEventTimeWindowPredicate startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADEventTimeWindowPredicate endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CADEventTimeWindowPredicate mustStartInInterval](self, "mustStartInInterval"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("CADEventTimeWindowPredicate start:%@; end:%@; mustStartInInterval:%@"),
    v6,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (**v8)(_QWORD, _QWORD);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const void *v14;
  CFTypeID v15;
  uint64_t Event;
  const void *v17;
  id v19;
  CADEventTimeWindowPredicate *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[7];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = -[CADPredicate copyMatchingItemsWithDatabase:](self->_wrappedPredicate, "copyMatchingItemsWithDatabase:", a3);
  v21 = (void *)objc_opt_new();
  -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
  v6 = v5;
  -[NSDate timeIntervalSinceReferenceDate](self->_endDate, "timeIntervalSinceReferenceDate");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __61__CADEventTimeWindowPredicate_copyMatchingItemsWithDatabase___block_invoke;
  v26[3] = &unk_1E6A37628;
  v20 = self;
  v26[4] = self;
  v26[5] = v6;
  v26[6] = v7;
  v8 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1BCC9D8DC](v26);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    v19 = v9;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(const void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v15 = CFGetTypeID(v14);
        if (v15 == CalEventOccurrenceGetTypeID())
        {
          Event = CalEventOccurrenceGetEvent();
          CalEventOccurrenceGetDate();
          if (v8[2](v8, Event))
            objc_msgSend(v21, "addObject:", v14);
        }
        else if (CalEntityGetType() == 2)
        {
          v17 = (const void *)CalCopyTimeZone();
          -[NSDate timeIntervalSinceReferenceDate](v20->_startDate, "timeIntervalSinceReferenceDate");
          CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
          -[NSDate timeIntervalSinceReferenceDate](v20->_endDate, "timeIntervalSinceReferenceDate");
          CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
          CalEventGetStartDate();
          if ((((uint64_t (*)(_QWORD, const void *))v8[2])(v8, v14) & 1) != 0
            || CalEventOccurrencesExistForEventInDateRange())
          {
            objc_msgSend(v21, "addObject:", v14);
          }
          CFRelease(v17);
          v9 = v19;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v11);
  }

  return v21;
}

BOOL __61__CADEventTimeWindowPredicate_copyMatchingItemsWithDatabase___block_invoke(uint64_t a1, double a2)
{
  return (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) || *(double *)(a1 + 40) <= a2 && *(double *)(a1 + 48) > a2)
      && (double)CalEventGetDuration() + a2 > *(double *)(a1 + 40)
      && *(double *)(a1 + 48) > a2;
}

- (CADEventTimeWindowPredicate)initWithCoder:(id)a3
{
  id v4;
  CADEventTimeWindowPredicate *v5;
  uint64_t v6;
  CADPredicate *wrappedPredicate;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  NSDate *endDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CADEventTimeWindowPredicate;
  v5 = -[CADEventTimeWindowPredicate initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappedPredicate"));
    v6 = objc_claimAutoreleasedReturnValue();
    wrappedPredicate = v5->_wrappedPredicate;
    v5->_wrappedPredicate = (CADPredicate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    v5->_mustStartInInterval = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mustStartInInterval"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CADEventTimeWindowPredicate;
  v4 = a3;
  -[CADEventTimeWindowPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_wrappedPredicate, CFSTR("wrappedPredicate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_mustStartInInterval, CFSTR("mustStartInInterval"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)defaultPropertiesToLoad
{
  return -[CADPredicate defaultPropertiesToLoad](self->_wrappedPredicate, "defaultPropertiesToLoad");
}

- (CADPredicate)wrappedPredicate
{
  return self->_wrappedPredicate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)mustStartInInterval
{
  return self->_mustStartInInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_wrappedPredicate, 0);
}

@end
