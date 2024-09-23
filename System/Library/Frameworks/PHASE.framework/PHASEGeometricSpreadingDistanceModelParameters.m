@implementation PHASEGeometricSpreadingDistanceModelParameters

- (PHASEGeometricSpreadingDistanceModelParameters)init
{
  PHASEGeometricSpreadingDistanceModelParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASEGeometricSpreadingDistanceModelParameters;
  result = -[PHASEDistanceModelParameters initInternal](&v3, sel_initInternal);
  if (result)
    result->_rolloffFactor = 1.0;
  return result;
}

- (void)setRolloffFactor:(double)rolloffFactor
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_rolloffFactor = PHASEGetPropertyBounded<double>(v8, v7, rolloffFactor, 0.0, 1.79769313e308);

}

- (double)rolloffFactor
{
  return self->_rolloffFactor;
}

@end
