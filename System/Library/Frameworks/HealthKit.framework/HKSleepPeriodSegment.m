@implementation HKSleepPeriodSegment

+ (id)sleepPeriodSegmentWithDateInterval:(id)a3 category:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sleepPeriodSegmentWithDateInterval:sampleIntervals:category:containsAppleSleepTrackingData:", v7, v8, a4, 0, v11, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)sleepPeriodSegmentWithDateInterval:(id)a3 sampleIntervals:(id)a4 category:(int64_t)a5
{
  return (id)objc_msgSend(a1, "sleepPeriodSegmentWithDateInterval:sampleIntervals:category:containsAppleSleepTrackingData:", a3, a4, a5, 0);
}

+ (id)sleepPeriodSegmentWithDateInterval:(id)a3 sampleIntervals:(id)a4 category:(int64_t)a5 containsAppleSleepTrackingData:(BOOL)a6
{
  id v9;
  id v10;
  HKSleepPeriodSegment *v11;
  uint64_t v12;
  NSDateInterval *dateInterval;
  uint64_t v14;
  NSArray *sampleIntervals;

  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HKSleepPeriodSegment);
  v12 = objc_msgSend(v10, "copy");

  dateInterval = v11->_dateInterval;
  v11->_dateInterval = (NSDateInterval *)v12;

  v14 = objc_msgSend(v9, "copy");
  sampleIntervals = v11->_sampleIntervals;
  v11->_sampleIntervals = (NSArray *)v14;

  v11->_category = a5;
  v11->_containsAppleSleepTrackingData = a6;
  return v11;
}

- (id)mergingSleepPeriodSegment:(id)a3
{
  id v5;
  int64_t v6;
  HKDateIntervalTree *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[HKSleepPeriodSegment category](self, "category");
  if (v6 != objc_msgSend(v5, "category"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepPeriod.m"), 72, CFSTR("Cannot merge segments with different category values."));

  }
  v7 = objc_alloc_init(HKDateIntervalTree);
  -[HKDateIntervalTree setMergeIntervals:](v7, "setMergeIntervals:", 1);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[HKSleepPeriodSegment sampleIntervals](self, "sampleIntervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        -[HKDateIntervalTree insertInterval:](v7, "insertInterval:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v10);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v5, "sampleIntervals", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        -[HKDateIntervalTree insertInterval:](v7, "insertInterval:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v15);
  }

  -[HKDateIntervalTree mergedIntervals](v7, "mergedIntervals");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSleepPeriodSegment dateInterval](self, "dateInterval");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateInterval");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "earlierDate:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSleepPeriodSegment dateInterval](self, "dateInterval");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "endDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateInterval");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "endDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "laterDate:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v23, v28);
  if (-[HKSleepPeriodSegment containsAppleSleepTrackingData](self, "containsAppleSleepTrackingData"))
    v30 = 1;
  else
    v30 = objc_msgSend(v5, "containsAppleSleepTrackingData");
  +[HKSleepPeriodSegment sleepPeriodSegmentWithDateInterval:sampleIntervals:category:containsAppleSleepTrackingData:](HKSleepPeriodSegment, "sleepPeriodSegmentWithDateInterval:sampleIntervals:category:containsAppleSleepTrackingData:", v29, v18, -[HKSleepPeriodSegment category](self, "category"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t category;
  const __CFString *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_sampleIntervals, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  category = self->_category;
  if (category > 5)
    v10 = &stru_1E37FD4C0;
  else
    v10 = off_1E37EC448[category];
  HKStringFromBool(self->_containsAppleSleepTrackingData);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p (%@ - %@), %@ samples, category = %@, containsAppleSleepTrackingData = %@>"), v5, self, v6, v7, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_sampleIntervals, CFSTR("SampleIntervals"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("Category"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_containsAppleSleepTrackingData, CFSTR("ContainsAppleSleepTrackingData"));

}

- (HKSleepPeriodSegment)initWithCoder:(id)a3
{
  id v4;
  HKSleepPeriodSegment *v5;
  uint64_t v6;
  NSDateInterval *dateInterval;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *sampleIntervals;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSleepPeriodSegment;
  v5 = -[HKSleepPeriodSegment init](&v14, sel_init);
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("SampleIntervals"));
    v11 = objc_claimAutoreleasedReturnValue();
    sampleIntervals = v5->_sampleIntervals;
    v5->_sampleIntervals = (NSArray *)v11;

    v5->_category = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Category"));
    v5->_containsAppleSleepTrackingData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ContainsAppleSleepTrackingData"));
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int64_t v17;
  _BOOL4 v18;
  void *v20;
  void *v21;
  void *v22;

  v7 = a3;
  -[HKSleepPeriodSegment dateInterval](self, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v9)
  {
    objc_msgSend(v7, "dateInterval");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      LOBYTE(v16) = 0;
      goto LABEL_23;
    }
    v3 = (void *)v10;
    -[HKSleepPeriodSegment dateInterval](self, "dateInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqual:", v4))
    {
      LOBYTE(v16) = 0;
LABEL_22:

      goto LABEL_23;
    }
    v21 = v4;
    v22 = v11;
  }
  -[HKSleepPeriodSegment sampleIntervals](self, "sampleIntervals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sampleIntervals");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v13)
    goto LABEL_10;
  objc_msgSend(v7, "sampleIntervals");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_16;
  v5 = (void *)v14;
  -[HKSleepPeriodSegment sampleIntervals](self, "sampleIntervals");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sampleIntervals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqual:", v4))
  {
    v20 = v15;
LABEL_10:
    v17 = -[HKSleepPeriodSegment category](self, "category");
    if (v17 == objc_msgSend(v7, "category"))
    {
      v18 = -[HKSleepPeriodSegment containsAppleSleepTrackingData](self, "containsAppleSleepTrackingData");
      v16 = v18 ^ objc_msgSend(v7, "containsAppleSleepTrackingData") ^ 1;
      v15 = v20;
      if (v12 == v13)
        goto LABEL_20;
      goto LABEL_18;
    }
    if (v12 == v13)
    {
      LOBYTE(v16) = 0;
      goto LABEL_20;
    }

LABEL_16:
    LOBYTE(v16) = 0;
    goto LABEL_21;
  }
  LOBYTE(v16) = 0;
LABEL_18:

LABEL_20:
LABEL_21:
  v4 = v21;
  v11 = v22;
  if (v8 != v9)
    goto LABEL_22;
LABEL_23:

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;

  -[HKSleepPeriodSegment dateInterval](self, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKSleepPeriodSegment sampleIntervals](self, "sampleIntervals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[HKSleepPeriodSegment category](self, "category");
  v8 = v7 ^ -[HKSleepPeriodSegment containsAppleSleepTrackingData](self, "containsAppleSleepTrackingData");

  return v8;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)sampleIntervals
{
  return self->_sampleIntervals;
}

- (int64_t)category
{
  return self->_category;
}

- (BOOL)containsAppleSleepTrackingData
{
  return self->_containsAppleSleepTrackingData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleIntervals, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
