@implementation HMYearDayScheduleRule

- (HMYearDayScheduleRule)initWithDateInterval:(id)a3
{
  id v4;
  HMYearDayScheduleRule *v5;
  uint64_t v6;
  NSDateInterval *dateInterval;
  HMYearDayScheduleRule *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMYearDayScheduleRule;
  v5 = -[HMYearDayScheduleRule init](&v10, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v6 = objc_msgSend(v4, "copy");
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

  }
  v8 = v5;
LABEL_6:

  return v8;
}

- (HMYearDayScheduleRule)initWithValidFrom:(id)a3 validUntil:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  HMYearDayScheduleRule *v10;

  v6 = (objc_class *)MEMORY[0x1E0CB3588];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithStartDate:endDate:", v8, v7);

  v10 = -[HMYearDayScheduleRule initWithDateInterval:](self, "initWithDateInterval:", v9);
  return v10;
}

- (NSDate)validFrom
{
  void *v2;
  void *v3;

  -[HMYearDayScheduleRule dateInterval](self, "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)validUntil
{
  void *v2;
  void *v3;

  -[HMYearDayScheduleRule dateInterval](self, "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMYearDayScheduleRule dateInterval](self, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToDateInterval:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMYearDayScheduleRule dateInterval](self, "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[HMYearDayScheduleRule dateInterval](self, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return MEMORY[0x1E0C9AA70];
  v10[0] = CFSTR("HMDStartDateKey");
  -[HMYearDayScheduleRule dateInterval](self, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("HMDEndDateKey");
  v11[0] = v5;
  -[HMYearDayScheduleRule dateInterval](self, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMYearDayScheduleRule)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMYearDayScheduleRule *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "hmf_dateForKey:", CFSTR("HMDStartDateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_dateForKey:", CFSTR("HMDEndDateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v6);
    self = -[HMYearDayScheduleRule initWithDateInterval:](self, "initWithDateInterval:", v8);

    v7 = self;
  }

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableYearDayScheduleRule *v4;
  void *v5;
  HMMutableYearDayScheduleRule *v6;

  v4 = +[HMMutableYearDayScheduleRule allocWithZone:](HMMutableYearDayScheduleRule, "allocWithZone:", a3);
  -[HMYearDayScheduleRule dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMYearDayScheduleRule initWithDateInterval:](v4, "initWithDateInterval:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMYearDayScheduleRule dateInterval](self, "dateInterval");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMYearDayScheduleCodingKeyDateInterval"));

}

- (HMYearDayScheduleRule)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMYearDayScheduleRule *v6;
  HMYearDayScheduleRule *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMYearDayScheduleCodingKeyDateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[HMYearDayScheduleRule initWithDateInterval:](self, "initWithDateInterval:", v5);
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = 0;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from dateInterval: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMYearDayScheduleRule dateInterval](self, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Date Interval"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
