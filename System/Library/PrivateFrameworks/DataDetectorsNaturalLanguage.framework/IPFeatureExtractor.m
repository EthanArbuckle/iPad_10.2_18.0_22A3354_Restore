@implementation IPFeatureExtractor

+ (id)defaultExtractor
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 context:(id)a5
{
  return 0;
}

@end
