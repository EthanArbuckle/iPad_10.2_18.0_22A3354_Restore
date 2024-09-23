@implementation VNPersonsModelAlgorithm

- (Class)faceModelClass
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return 0;
}

- (id)description
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (VNPersonsModelAlgorithm)initWithCoder:(id)a3
{
  VNPersonsModelAlgorithm *v4;

  v4 = (VNPersonsModelAlgorithm *)objc_alloc_init((Class)objc_opt_class());

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
