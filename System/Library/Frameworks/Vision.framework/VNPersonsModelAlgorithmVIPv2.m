@implementation VNPersonsModelAlgorithmVIPv2

- (Class)faceModelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  VNPersonsModelAlgorithmVIPv2 *v4;
  char isKindOfClass;

  v4 = (VNPersonsModelAlgorithmVIPv2 *)a3;
  if (self == v4)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
