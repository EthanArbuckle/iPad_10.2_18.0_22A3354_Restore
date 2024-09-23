@implementation HKHRAFibBurdenSevenDayAnalysisResults

- (HKHRAFibBurdenSevenDayAnalysisResults)initWithResult:(int64_t)a3 sample:(id)a4 onboardedWithinAnalysisInterval:(BOOL)a5
{
  id v9;
  HKHRAFibBurdenSevenDayAnalysisResults *v10;
  HKHRAFibBurdenSevenDayAnalysisResults *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisResults;
  v10 = -[HKHRAFibBurdenSevenDayAnalysisResults init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_result = a3;
    objc_storeStrong((id *)&v10->_sampleCreated, a4);
    v11->_onboardedWithinAnalysisInterval = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  HKQuantitySample *sampleCreated;
  BOOL v6;

  v4 = (unsigned __int8 *)a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_result == *((_QWORD *)v4 + 2)
    && ((sampleCreated = self->_sampleCreated, !((unint64_t)sampleCreated | *((_QWORD *)v4 + 3)))
     || -[HKQuantitySample isEqual:](sampleCreated, "isEqual:"))
    && self->_onboardedWithinAnalysisInterval == v4[8];

  return v6;
}

- (unint64_t)hash
{
  int64_t v2;

  v2 = self->_result;
  return (-[HKQuantitySample hash](self->_sampleCreated, "hash") ^ v2) != self->_onboardedWithinAnalysisInterval;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t result;
  id v5;

  result = self->_result;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", result, CFSTR("Result"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sampleCreated, CFSTR("Sample"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_onboardedWithinAnalysisInterval, CFSTR("OnboardedWithinAnalysisInterval"));

}

- (HKHRAFibBurdenSevenDayAnalysisResults)initWithCoder:(id)a3
{
  id v4;
  HKHRAFibBurdenSevenDayAnalysisResults *v5;
  uint64_t v6;
  HKQuantitySample *sampleCreated;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisResults;
  v5 = -[HKHRAFibBurdenSevenDayAnalysisResults init](&v9, sel_init);
  if (v5)
  {
    v5->_result = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Result"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Sample"));
    v6 = objc_claimAutoreleasedReturnValue();
    sampleCreated = v5->_sampleCreated;
    v5->_sampleCreated = (HKQuantitySample *)v6;

    v5->_onboardedWithinAnalysisInterval = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OnboardedWithinAnalysisInterval"));
  }

  return v5;
}

- (int64_t)result
{
  return self->_result;
}

- (HKQuantitySample)sampleCreated
{
  return self->_sampleCreated;
}

- (BOOL)onboardedWithinAnalysisInterval
{
  return self->_onboardedWithinAnalysisInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCreated, 0);
}

@end
