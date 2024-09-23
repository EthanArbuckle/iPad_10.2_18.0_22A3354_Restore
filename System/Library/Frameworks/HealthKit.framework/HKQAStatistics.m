@implementation HKQAStatistics

- (HKQAStatistics)initWithSampleCount:(id)a3 sampleCountByType:(id)a4
{
  id v7;
  id v8;
  HKQAStatistics *v9;
  HKQAStatistics *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKQAStatistics;
  v9 = -[HKQAStatistics init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sampleCount, a3);
    objc_storeStrong((id *)&v10->_sampleCountByType, a4);
  }

  return v10;
}

- (HKQAStatistics)initWithCoder:(id)a3
{
  id v4;
  HKQAStatistics *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSNumber *sampleCount;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *sampleCountByType;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKQAStatistics;
  v5 = -[HKQAStatistics init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_sampleCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    sampleCount = v5->_sampleCount;
    v5->_sampleCount = (NSNumber *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = (void *)objc_msgSend(v10, "initWithObjects:", v11, v12, objc_opt_class(), 0);
    NSStringFromSelector(sel_sampleCountByType);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    sampleCountByType = v5->_sampleCountByType;
    v5->_sampleCountByType = (NSDictionary *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *sampleCount;
  id v5;
  void *v6;
  NSDictionary *sampleCountByType;
  id v8;

  sampleCount = self->_sampleCount;
  v5 = a3;
  NSStringFromSelector(sel_sampleCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", sampleCount, v6);

  sampleCountByType = self->_sampleCountByType;
  NSStringFromSelector(sel_sampleCountByType);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", sampleCountByType, v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)sampleCount
{
  return self->_sampleCount;
}

- (NSDictionary)sampleCountByType
{
  return self->_sampleCountByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCountByType, 0);
  objc_storeStrong((id *)&self->_sampleCount, 0);
}

@end
