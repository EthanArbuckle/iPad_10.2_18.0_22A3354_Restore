@implementation VNCoreSceneUnderstandingDetectorSceneprintConfiguration

- (BOOL)isEqual:(id)a3
{
  VNCoreSceneUnderstandingDetectorSceneprintConfiguration *v4;
  BOOL v5;
  objc_super v7;

  v4 = (VNCoreSceneUnderstandingDetectorSceneprintConfiguration *)a3;
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
      v7.super_class = (Class)VNCoreSceneUnderstandingDetectorSceneprintConfiguration;
      v5 = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration isEqual:](&v7, sel_isEqual_, v4);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end
