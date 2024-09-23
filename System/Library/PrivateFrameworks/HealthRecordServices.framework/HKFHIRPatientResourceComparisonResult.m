@implementation HKFHIRPatientResourceComparisonResult

- (HKFHIRPatientResourceComparisonResult)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKFHIRPatientResourceComparisonResult)initWithOutcome:(unint64_t)a3
{
  HKFHIRPatientResourceComparisonResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKFHIRPatientResourceComparisonResult;
  result = -[HKFHIRPatientResourceComparisonResult init](&v5, sel_init);
  if (result)
    result->_outcome = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  HKFHIRPatientResourceComparisonResult *v4;
  unint64_t outcome;
  BOOL v6;

  v4 = (HKFHIRPatientResourceComparisonResult *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      outcome = self->_outcome;
      v6 = outcome == -[HKFHIRPatientResourceComparisonResult outcome](v4, "outcome");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_outcome;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_outcome, CFSTR("outcome"));
}

- (HKFHIRPatientResourceComparisonResult)initWithCoder:(id)a3
{
  return -[HKFHIRPatientResourceComparisonResult initWithOutcome:](self, "initWithOutcome:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("outcome")));
}

- (unint64_t)outcome
{
  return self->_outcome;
}

@end
