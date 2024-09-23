@implementation HKSleepPeriod

+ (id)sleepPeriodWithDateInterval:(id)a3 segments:(id)a4
{
  id v5;
  id v6;
  HKSleepPeriod *v7;
  uint64_t v8;
  NSDateInterval *dateInterval;
  uint64_t v10;
  NSArray *segments;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HKSleepPeriod);
  v8 = objc_msgSend(v6, "copy");

  dateInterval = v7->_dateInterval;
  v7->_dateInterval = (NSDateInterval *)v8;

  v10 = objc_msgSend(v5, "copy");
  segments = v7->_segments;
  v7->_segments = (NSArray *)v10;

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p (%@ - %@), segments = %@>"), v5, self, v6, v7, self->_segments);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)hk_redactedDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (double)durationForCategory:(int64_t)a3 overlappingDateInterval:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  double v19;
  NSArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_segments;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v12, "category") == a3)
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v12, "sampleIntervals");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v23;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v23 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "intersectionWithDateInterval:", v6);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "duration");
                v10 = v10 + v19;

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v15);
          }

        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (BOOL)containsSegmentsWithAppleSleepTrackingData
{
  return -[NSArray hk_containsObjectPassingTest:](self->_segments, "hk_containsObjectPassingTest:", &__block_literal_global_33);
}

uint64_t __59__HKSleepPeriod_containsSegmentsWithAppleSleepTrackingData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsAppleSleepTrackingData");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *dateInterval;
  id v5;

  dateInterval = self->_dateInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dateInterval, CFSTR("DateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_segments, CFSTR("Segments"));

}

- (HKSleepPeriod)initWithCoder:(id)a3
{
  id v4;
  HKSleepPeriod *v5;
  uint64_t v6;
  NSDateInterval *dateInterval;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *segments;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSleepPeriod;
  v5 = -[HKSleepPeriod init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateInterval"));
    v6 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Segments"));
    v11 = objc_claimAutoreleasedReturnValue();
    segments = v5->_segments;
    v5->_segments = (NSArray *)v11;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a3;
  -[HKSleepPeriod dateInterval](self, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
  {
    objc_msgSend(v5, "dateInterval");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v18 = 0;
      goto LABEL_14;
    }
    v3 = (void *)v8;
    -[HKSleepPeriod dateInterval](self, "dateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqual:", v10))
    {
      v18 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v20 = v10;
    v22 = v9;
  }
  -[HKSleepPeriod segments](self, "segments", v20, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "segments");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

    v18 = 1;
  }
  else
  {
    v13 = (void *)v12;
    objc_msgSend(v5, "segments");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[HKSleepPeriod segments](self, "segments");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "segments");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

    }
    else
    {

      v18 = 0;
    }
  }
  v10 = v21;
  v9 = v23;
  if (v6 != v7)
    goto LABEL_13;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HKSleepPeriod dateInterval](self, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKSleepPeriod segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
