@implementation HMIVideoAnalyzerEventVehicle

- (HMIVideoAnalyzerEventVehicle)initWithConfidence:(id)a3 boundingBox:(CGRect)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMIVideoAnalyzerEventVehicle;
  return -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v5, sel_initWithConfidence_boundingBox_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (BOOL)isEqual:(id)a3
{
  HMIVideoAnalyzerEventVehicle *v4;
  BOOL v5;
  objc_super v7;

  v4 = (HMIVideoAnalyzerEventVehicle *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7.receiver = self;
      v7.super_class = (Class)HMIVideoAnalyzerEventVehicle;
      v5 = -[HMIVideoAnalyzerEvent isEqual:](&v7, sel_isEqual_, v4);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
