@implementation HMIVideoAnalyzerEventPackage

- (HMIVideoAnalyzerEventPackage)initWithConfidence:(id)a3 boundingBox:(CGRect)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMIVideoAnalyzerEventPackage;
  return -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v5, sel_initWithConfidence_boundingBox_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (BOOL)isEqual:(id)a3
{
  HMIVideoAnalyzerEventPackage *v4;
  BOOL v5;
  objc_super v7;

  v4 = (HMIVideoAnalyzerEventPackage *)a3;
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
      v7.super_class = (Class)HMIVideoAnalyzerEventPackage;
      v5 = -[HMIVideoAnalyzerEvent isEqual:](&v7, sel_isEqual_, v4);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end
