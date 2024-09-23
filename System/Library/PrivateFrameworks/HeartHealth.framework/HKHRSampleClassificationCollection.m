@implementation HKHRSampleClassificationCollection

- (HKHRSampleClassificationCollection)initWithClassifications:(id)a3 dayIndex:(id)a4 majorityTimeZone:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKHRSampleClassificationCollection *v12;
  HKHRSampleClassificationCollection *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKHRSampleClassificationCollection;
  v12 = -[HKHRSampleClassificationCollection init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_classifications, a3);
    objc_storeStrong((id *)&v13->_dayIndex, a4);
    objc_storeStrong((id *)&v13->_majorityTimeZone, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *classifications;
  id v5;

  classifications = self->_classifications;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", classifications, CFSTR("Classifications"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dayIndex, CFSTR("DayIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_majorityTimeZone, CFSTR("MajorityTimeZone"));

}

- (HKHRSampleClassificationCollection)initWithCoder:(id)a3
{
  id v4;
  HKHRSampleClassificationCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *classifications;
  uint64_t v11;
  NSNumber *dayIndex;
  uint64_t v13;
  NSString *majorityTimeZone;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKHRSampleClassificationCollection;
  v5 = -[HKHRSampleClassificationCollection init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Classifications"));
    v9 = objc_claimAutoreleasedReturnValue();
    classifications = v5->_classifications;
    v5->_classifications = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DayIndex"));
    v11 = objc_claimAutoreleasedReturnValue();
    dayIndex = v5->_dayIndex;
    v5->_dayIndex = (NSNumber *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MajorityTimeZone"));
    v13 = objc_claimAutoreleasedReturnValue();
    majorityTimeZone = v5->_majorityTimeZone;
    v5->_majorityTimeZone = (NSString *)v13;

  }
  return v5;
}

- (NSArray)classifications
{
  return self->_classifications;
}

- (void)setClassifications:(id)a3
{
  objc_storeStrong((id *)&self->_classifications, a3);
}

- (NSNumber)dayIndex
{
  return self->_dayIndex;
}

- (void)setDayIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)majorityTimeZone
{
  return self->_majorityTimeZone;
}

- (void)setMajorityTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_majorityTimeZone, 0);
  objc_storeStrong((id *)&self->_dayIndex, 0);
  objc_storeStrong((id *)&self->_classifications, 0);
}

@end
