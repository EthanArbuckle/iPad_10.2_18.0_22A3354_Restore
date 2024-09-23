@implementation HKHRAFibBurdenSevenDaySampleProperties

- (HKHRAFibBurdenSevenDaySampleProperties)initWithBurdenPercentage:(id)a3 timeZone:(id)a4
{
  id v7;
  id v8;
  HKHRAFibBurdenSevenDaySampleProperties *v9;
  HKHRAFibBurdenSevenDaySampleProperties *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKHRAFibBurdenSevenDaySampleProperties;
  v9 = -[HKHRAFibBurdenSevenDaySampleProperties init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_burdenPercentage, a3);
    objc_storeStrong((id *)&v10->_timeZone, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *burdenPercentage;
  id v5;

  burdenPercentage = self->_burdenPercentage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", burdenPercentage, CFSTR("burdenPercentage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));

}

- (HKHRAFibBurdenSevenDaySampleProperties)initWithCoder:(id)a3
{
  id v4;
  HKHRAFibBurdenSevenDaySampleProperties *v5;
  uint64_t v6;
  NSNumber *burdenPercentage;
  uint64_t v8;
  NSTimeZone *timeZone;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHRAFibBurdenSevenDaySampleProperties;
  v5 = -[HKHRAFibBurdenSevenDaySampleProperties init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("burdenPercentage"));
    v6 = objc_claimAutoreleasedReturnValue();
    burdenPercentage = v5->_burdenPercentage;
    v5->_burdenPercentage = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v8 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

  }
  return v5;
}

- (NSNumber)burdenPercentage
{
  return self->_burdenPercentage;
}

- (void)setBurdenPercentage:(id)a3
{
  objc_storeStrong((id *)&self->_burdenPercentage, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_burdenPercentage, 0);
}

@end
