@implementation PHASESphericalCapDirectivityModelParameters

- (PHASESphericalCapDirectivityModelParameters)init
{
  PHASESphericalCapDirectivityModelParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASESphericalCapDirectivityModelParameters;
  result = -[PHASEDirectivityModelParameters initInternal](&v3, sel_initInternal);
  if (result)
  {
    result->_sphereRadius = 0.3;
    result->_capOpeningAngle = 30.0;
  }
  return result;
}

- (void)setSphereRadius:(double)a3
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sphereRadius = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.001, 10.0);

}

- (void)setCapOpeningAngle:(double)a3
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_capOpeningAngle = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.01, 360.0);

}

- (double)sphereRadius
{
  return self->_sphereRadius;
}

- (double)capOpeningAngle
{
  return self->_capOpeningAngle;
}

@end
