@implementation HKHRAFibBurdenAnalysisResult

- (HKHRAFibBurdenAnalysisResult)initWithBurdenPercentage:(id)a3 burdenPercentageWasClampedToLowerBound:(BOOL)a4 unavailabilityReason:(int64_t)a5
{
  id v9;
  HKHRAFibBurdenAnalysisResult *v10;
  HKHRAFibBurdenAnalysisResult *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKHRAFibBurdenAnalysisResult;
  v10 = -[HKHRAFibBurdenAnalysisResult init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_burdenPercentage, a3);
    v11->_burdenPercentageWasClampedToLowerBound = a4;
    v11->_unavailabilityReason = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HKHRAFibBurdenAnalysisResult *v4;
  HKHRAFibBurdenAnalysisResult *v5;
  NSNumber *burdenPercentage;
  BOOL v7;

  v4 = (HKHRAFibBurdenAnalysisResult *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      burdenPercentage = self->_burdenPercentage;
      v7 = (!burdenPercentage && !v5->_burdenPercentage
         || -[NSNumber isEqualToNumber:](burdenPercentage, "isEqualToNumber:", self->_burdenPercentage))
        && self->_burdenPercentageWasClampedToLowerBound == v5->_burdenPercentageWasClampedToLowerBound
        && self->_unavailabilityReason == v5->_unavailabilityReason;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_unavailabilityReason ^ -[NSNumber hash](self->_burdenPercentage, "hash");
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
  objc_msgSend(v5, "encodeObject:forKey:", burdenPercentage, CFSTR("BurdenPercentageKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_burdenPercentageWasClampedToLowerBound, CFSTR("BurdenPercentageWasClampedToLowerBoundKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_unavailabilityReason, CFSTR("UnavailabilityReasonKey"));

}

- (HKHRAFibBurdenAnalysisResult)initWithCoder:(id)a3
{
  id v4;
  HKHRAFibBurdenAnalysisResult *v5;
  uint64_t v6;
  NSNumber *burdenPercentage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRAFibBurdenAnalysisResult;
  v5 = -[HKHRAFibBurdenAnalysisResult init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BurdenPercentageKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    burdenPercentage = v5->_burdenPercentage;
    v5->_burdenPercentage = (NSNumber *)v6;

    v5->_burdenPercentageWasClampedToLowerBound = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BurdenPercentageWasClampedToLowerBoundKey"));
    v5->_unavailabilityReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UnavailabilityReasonKey"));
  }

  return v5;
}

- (NSNumber)burdenPercentage
{
  return self->_burdenPercentage;
}

- (BOOL)burdenPercentageWasClampedToLowerBound
{
  return self->_burdenPercentageWasClampedToLowerBound;
}

- (void)setBurdenPercentageWasClampedToLowerBound:(BOOL)a3
{
  self->_burdenPercentageWasClampedToLowerBound = a3;
}

- (int64_t)unavailabilityReason
{
  return self->_unavailabilityReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_burdenPercentage, 0);
}

@end
