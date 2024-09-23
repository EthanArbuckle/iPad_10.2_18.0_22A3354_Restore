@implementation HKHeartRateSummaryStatistics

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (id)_bucketAtIndex:(int64_t)a3 createdIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  HKHeartRateSummaryStatisticsBucket *v12;

  v4 = a4;
  v7 = -[NSMutableArray count](self->_sortedBuckets, "count") - 1;
  if (v7 < 0)
  {
    v10 = 0;
LABEL_12:
    v12 = 0;
    goto LABEL_14;
  }
  v8 = 0;
  while (1)
  {
    v9 = v7 + v8;
    if (v7 + v8 < 0 != __OFADD__(v7, v8))
      ++v9;
    v10 = v9 >> 1;
    -[NSMutableArray objectAtIndexedSubscript:](self->_sortedBuckets, "objectAtIndexedSubscript:", v9 >> 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "bucketIndex") == a3)
      break;
    if (objc_msgSend(v11, "bucketIndex") >= a3)
      v7 = v10 - 1;
    else
      v8 = v10 + 1;

    if (v8 > v7)
      goto LABEL_12;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_sortedBuckets, "objectAtIndexedSubscript:", v10);
  v12 = (HKHeartRateSummaryStatisticsBucket *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_14:
    if (v4)
    {
      v12 = -[HKHeartRateSummaryStatisticsBucket initWithBucketIndex:]([HKHeartRateSummaryStatisticsBucket alloc], "initWithBucketIndex:", a3);
      -[NSMutableArray insertObject:atIndex:](self->_sortedBuckets, "insertObject:atIndex:", v12, v10);
    }
  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  HKHeartRateSummaryStatistics *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *sortedBuckets;
  NSMutableArray *v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v7 = (HKHeartRateSummaryStatistics *)a3;
  if (self == v7)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HKHeartRateSummaryStatistics dateInterval](self, "dateInterval");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHeartRateSummaryStatistics dateInterval](v7, "dateInterval");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HKHeartRateSummaryStatistics dateInterval](v7, "dateInterval");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          LOBYTE(v11) = 0;
          goto LABEL_21;
        }
        v3 = (void *)v10;
        -[HKHeartRateSummaryStatistics dateInterval](self, "dateInterval");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKHeartRateSummaryStatistics dateInterval](v7, "dateInterval");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v4, "isEqual:", v5))
        {
          LOBYTE(v11) = 0;
          goto LABEL_19;
        }
      }
      sortedBuckets = self->_sortedBuckets;
      v13 = v7->_sortedBuckets;
      if (sortedBuckets != v13 && (!v13 || !-[NSMutableArray isEqual:](sortedBuckets, "isEqual:"))
        || (v14 = -[HKHeartRateSummaryStatistics numberOfReadings](self, "numberOfReadings"),
            v14 != -[HKHeartRateSummaryStatistics numberOfReadings](v7, "numberOfReadings")))
      {
        LOBYTE(v11) = 0;
        goto LABEL_18;
      }
      -[HKHeartRateSummaryStatistics sessionUUID](self, "sessionUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHeartRateSummaryStatistics sessionUUID](v7, "sessionUUID");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v15 == (void *)v16)
      {
        v33 = v5;
        v34 = v4;
        v31 = (void *)v16;
        v32 = v15;
      }
      else
      {
        -[HKHeartRateSummaryStatistics sessionUUID](v7, "sessionUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
LABEL_33:

LABEL_18:
          if (v8 == v9)
          {
LABEL_21:

            goto LABEL_22;
          }
LABEL_19:

          goto LABEL_21;
        }
        v33 = v5;
        v34 = v4;
        -[HKHeartRateSummaryStatistics sessionUUID](self, "sessionUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKHeartRateSummaryStatistics sessionUUID](v7, "sessionUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isEqual:", v19) & 1) == 0)
        {

          LOBYTE(v11) = 0;
          goto LABEL_37;
        }
        v28 = v19;
        v29 = v18;
        v30 = v11;
        v31 = v17;
        v32 = v15;
      }
      -[HKHeartRateSummaryStatistics highlightedReadings](self, "highlightedReadings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHeartRateSummaryStatistics highlightedReadings](v7, "highlightedReadings");
      v22 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = v21 == (void *)v22;
      if (v21 == (void *)v22)
      {

      }
      else
      {
        v23 = (void *)v22;
        -[HKHeartRateSummaryStatistics highlightedReadings](v7, "highlightedReadings");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          -[HKHeartRateSummaryStatistics highlightedReadings](self, "highlightedReadings");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHeartRateSummaryStatistics highlightedReadings](v7, "highlightedReadings");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v11) = objc_msgSend(v26, "isEqual:", v27);

          v15 = v32;
          if (v32 == v31)
          {

          }
          else
          {

          }
          goto LABEL_36;
        }

      }
      v17 = v31;
      v15 = v32;
      if (v32 == v31)
      {

LABEL_36:
LABEL_37:
        v5 = v33;
        v4 = v34;
        if (v8 == v9)
          goto LABEL_21;
        goto LABEL_19;
      }

      v5 = v33;
      v4 = v34;
      goto LABEL_33;
    }
    LOBYTE(v11) = 0;
  }
LABEL_22:

  return (char)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedReadings, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_sortedBuckets, 0);
}

- (HKHeartRateSummaryStatistics)initWithDateInterval:(id)a3 numberOfBuckets:(int64_t)a4 sessionUUID:(id)a5
{
  id v9;
  id v10;
  HKHeartRateSummaryStatistics *v11;
  HKHeartRateSummaryStatistics *v12;
  uint64_t v13;
  NSMutableArray *sortedBuckets;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKHeartRateSummaryStatistics;
  v11 = -[HKHeartRateSummaryStatistics init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dateInterval, a3);
    v12->_numberOfBuckets = a4;
    objc_storeStrong((id *)&v12->_sessionUUID, a5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    sortedBuckets = v12->_sortedBuckets;
    v12->_sortedBuckets = (NSMutableArray *)v13;

  }
  return v12;
}

- (id)initFromStatistics:(id)a3
{
  id *v4;
  HKHeartRateSummaryStatistics *v5;
  HKHeartRateSummaryStatistics *v6;
  uint64_t v7;
  NSMutableArray *sortedBuckets;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v21.receiver = self;
  v21.super_class = (Class)HKHeartRateSummaryStatistics;
  v5 = -[HKHeartRateSummaryStatistics init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dateInterval, v4[2]);
    v6->_numberOfBuckets = (int64_t)v4[3];
    v6->_numberOfReadings = (int64_t)v4[4];
    objc_storeStrong((id *)&v6->_sessionUUID, v4[5]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    sortedBuckets = v6->_sortedBuckets;
    v6->_sortedBuckets = (NSMutableArray *)v7;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v4[1];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = v6->_sortedBuckets;
          v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "copy", (_QWORD)v17);
          -[NSMutableArray addObject:](v14, "addObject:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v11);
    }

    objc_storeStrong((id *)&v6->_highlightedReadings, v4[6]);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initFromStatistics:", self);
}

- (void)_setHighlightedReadings:(id)a3
{
  NSArray *v4;
  NSArray *highlightedReadings;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  highlightedReadings = self->_highlightedReadings;
  self->_highlightedReadings = v4;

}

- (void)addHeartRateInBeatsPerMinute:(double)a3 forTime:(double)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  int64_t numberOfBuckets;
  int64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSDateInterval *dateInterval;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  NSDateInterval *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[NSDateInterval hk_containsTime:](self->_dateInterval, "hk_containsTime:", a4))
  {
    -[NSDateInterval startDate](self->_dateInterval, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v9 = a4 - v8;

    v10 = v9 * (double)self->_numberOfBuckets;
    -[NSDateInterval duration](self->_dateInterval, "duration");
    v12 = vcvtmd_s64_f64(v10 / v11);
    numberOfBuckets = self->_numberOfBuckets;
    if (numberOfBuckets <= v12)
      v14 = numberOfBuckets - 1;
    else
      v14 = v12;
    -[HKHeartRateSummaryStatistics _bucketAtIndex:createdIfNeeded:](self, "_bucketAtIndex:createdIfNeeded:", v14, 1);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addHeartRateInBeatsPerMinute:", llround(a3));
    ++self->_numberOfReadings;

  }
  else
  {
    _HKInitializeLogging();
    v15 = (void *)HKLogHeartRate;
    if (os_log_type_enabled((os_log_t)HKLogHeartRate, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v17 = (void *)objc_opt_class();
      v18 = (void *)MEMORY[0x1E0C99D68];
      v19 = v17;
      objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:", a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      dateInterval = self->_dateInterval;
      *(_DWORD *)buf = 138543874;
      v24 = v17;
      v25 = 2114;
      v26 = v20;
      v27 = 2114;
      v28 = dateInterval;
      _os_log_error_impl(&dword_19A0E6000, v16, OS_LOG_TYPE_ERROR, "%{public}@: attempting to add heart rate for date %{public}@ outside of date interval %{public}@", buf, 0x20u);

    }
  }
}

- (id)bucketAtIndex:(int64_t)a3
{
  return -[HKHeartRateSummaryStatistics _bucketAtIndex:createdIfNeeded:](self, "_bucketAtIndex:createdIfNeeded:", a3, 0);
}

- (void)enumerateBucketsWithBlock:(id)a3
{
  void (**v5)(id, _QWORD);
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHeartRateSummaryStatistics.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_sortedBuckets;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v5[2](v5, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfBuckets, CFSTR("NumberOfBuckets"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sortedBuckets, CFSTR("SortedBuckets"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfReadings, CFSTR("NumberOfReadings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionUUID, CFSTR("SessionUUIDKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_highlightedReadings, CFSTR("HighlightedReadings"));

}

- (HKHeartRateSummaryStatistics)initWithCoder:(id)a3
{
  id v4;
  HKHeartRateSummaryStatistics *v5;
  uint64_t v6;
  NSDateInterval *dateInterval;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *sortedBuckets;
  uint64_t v14;
  NSUUID *sessionUUID;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *highlightedReadings;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKHeartRateSummaryStatistics;
  v5 = -[HKHeartRateSummaryStatistics init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateInterval"));
    v6 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

    v5->_numberOfBuckets = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NumberOfBuckets"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("SortedBuckets"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mutableCopy");
    sortedBuckets = v5->_sortedBuckets;
    v5->_sortedBuckets = (NSMutableArray *)v12;

    v5->_numberOfReadings = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NumberOfReadings"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SessionUUIDKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("HighlightedReadings"));
    v19 = objc_claimAutoreleasedReturnValue();
    highlightedReadings = v5->_highlightedReadings;
    v5->_highlightedReadings = (NSArray *)v19;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKHeartRateSummaryStatistics numberOfReadings](self, "numberOfReadings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p count:%@ %@ - %@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  -[HKHeartRateSummaryStatistics dateInterval](self, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSMutableArray hash](self->_sortedBuckets, "hash");
  v6 = v5 ^ v4 ^ -[HKHeartRateSummaryStatistics numberOfReadings](self, "numberOfReadings");
  v7 = -[NSMutableArray hash](self->_sortedBuckets, "hash");
  -[HKHeartRateSummaryStatistics sessionUUID](self, "sessionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");
  -[HKHeartRateSummaryStatistics highlightedReadings](self, "highlightedReadings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (int64_t)numberOfBuckets
{
  return self->_numberOfBuckets;
}

- (int64_t)numberOfReadings
{
  return self->_numberOfReadings;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSArray)highlightedReadings
{
  return self->_highlightedReadings;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__HKHeartRateSummaryStatistics_Testing___dictionaryRepresentation__block_invoke;
  v6[3] = &unk_1E37F7D80;
  v4 = v3;
  v7 = v4;
  -[HKHeartRateSummaryStatistics enumerateBucketsWithBlock:](self, "enumerateBucketsWithBlock:", v6);

  return v4;
}

void __66__HKHeartRateSummaryStatistics_Testing___dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "heartRatesInBeatsPerMinute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (char *)v11 - ((8 * objc_msgSend(v4, "count") + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v4, "getIndexes:maxCount:inIndexRange:", v5, objc_msgSend(v4, "count"), 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)&v5[8 * v7]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

      ++v7;
    }
    while (v7 < objc_msgSend(v4, "count"));
  }
  if (objc_msgSend(v6, "count"))
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "bucketIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v6, v10);

  }
}

- (id)_bucketsDescription
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  if (!-[NSMutableArray count](self->_sortedBuckets, "count"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("(\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__HKHeartRateSummaryStatistics_Testing___bucketsDescription__block_invoke;
  v6[3] = &unk_1E37F7D80;
  v4 = v3;
  v7 = v4;
  -[HKHeartRateSummaryStatistics enumerateBucketsWithBlock:](self, "enumerateBucketsWithBlock:", v6);
  objc_msgSend(v4, "appendFormat:", CFSTR(")"));

  return v4;
}

void __60__HKHeartRateSummaryStatistics_Testing___bucketsDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "bucketIndex"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heartRatesInBeatsPerMinute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "appendFormat:", CFSTR("    %@ => %@\n"), v6, v5);
}

@end
