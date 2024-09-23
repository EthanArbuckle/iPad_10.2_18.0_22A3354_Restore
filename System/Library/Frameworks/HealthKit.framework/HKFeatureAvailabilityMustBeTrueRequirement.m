@implementation HKFeatureAvailabilityMustBeTrueRequirement

- (HKFeatureAvailabilityMustBeTrueRequirement)initWithWhatMustBeTrue:(BOOL)a3
{
  HKFeatureAvailabilityMustBeTrueRequirement *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityMustBeTrueRequirement;
  result = -[HKFeatureAvailabilityMustBeTrueRequirement init](&v5, sel_init);
  if (result)
    result->_isTrue = a3;
  return result;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTrue, a4);
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_isTrue == v4[8];

  return v5;
}

- (unint64_t)hash
{
  return self->_isTrue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_isTrue, CFSTR("IsTrue"));
}

- (HKFeatureAvailabilityMustBeTrueRequirement)initWithCoder:(id)a3
{
  id v4;
  HKFeatureAvailabilityMustBeTrueRequirement *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKFeatureAvailabilityMustBeTrueRequirement;
  v5 = -[HKFeatureAvailabilityMustBeTrueRequirement init](&v7, sel_init);
  if (v5)
    v5->_isTrue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsTrue"));

  return v5;
}

@end
