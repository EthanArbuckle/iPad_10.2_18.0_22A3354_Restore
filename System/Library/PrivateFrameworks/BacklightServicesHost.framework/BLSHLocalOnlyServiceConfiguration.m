@implementation BLSHLocalOnlyServiceConfiguration

+ (id)configurationWithFadeInDuration:(double)a3 fadeOutDuration:(double)a4 dimmingDuration:(double)a5 dimmedFactor:(float)a6
{
  id v10;
  double v11;

  v10 = objc_alloc((Class)a1);
  *(float *)&v11 = a6;
  return (id)objc_msgSend(v10, "initWithFadeInDuration:fadeOutDuration:dimmingDuration:dimmedFactor:", a3, a4, a5, v11);
}

+ (id)configurationWithFadeInDuration:(double)a3 fadeOutDuration:(double)a4
{
  id v6;
  double v7;

  v6 = objc_alloc((Class)a1);
  LODWORD(v7) = 1.0;
  return (id)objc_msgSend(v6, "initWithFadeInDuration:fadeOutDuration:dimmingDuration:dimmedFactor:", a3, a4, 0.1, v7);
}

- (BLSHLocalOnlyServiceConfiguration)initWithFadeInDuration:(double)a3 fadeOutDuration:(double)a4 dimmingDuration:(double)a5 dimmedFactor:(float)a6
{
  BLSHLocalOnlyServiceConfiguration *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BLSHLocalOnlyServiceConfiguration;
  result = -[BLSHLocalOnlyServiceConfiguration init](&v11, sel_init);
  if (result)
  {
    result->_fadeInDuration = a3;
    result->_fadeOutDuration = a4;
    result->_dimmingDuration = a5;
    result->_dimmedFactor = a6;
  }
  return result;
}

- (BLSHLocalOnlyServiceConfiguration)init
{
  double v2;

  LODWORD(v2) = 1.0;
  return -[BLSHLocalOnlyServiceConfiguration initWithFadeInDuration:fadeOutDuration:dimmingDuration:dimmedFactor:](self, "initWithFadeInDuration:fadeOutDuration:dimmingDuration:dimmedFactor:", 0.1, 0.1, 0.1, v2);
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (double)dimmingDuration
{
  return self->_dimmingDuration;
}

- (float)dimmedFactor
{
  return self->_dimmedFactor;
}

@end
