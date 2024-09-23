@implementation CBGrimaldiSamplingStrategySingleSample

- (NSString)description
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unsigned)getInitialNumberOfSamples
{
  return 1;
}

- (unsigned)getNextNumberOfSamplesFromNewLux:(float)a3 withLastLux:(id)a4
{
  return 1;
}

@end
