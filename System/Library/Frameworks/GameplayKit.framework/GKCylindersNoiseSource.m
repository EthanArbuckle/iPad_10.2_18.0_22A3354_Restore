@implementation GKCylindersNoiseSource

+ (GKCylindersNoiseSource)cylindersNoiseWithFrequency:(double)frequency
{
  return (GKCylindersNoiseSource *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrequency:", frequency);
}

- (GKCylindersNoiseSource)init
{
  return -[GKCylindersNoiseSource initWithFrequency:](self, "initWithFrequency:", 1.0);
}

- (GKCylindersNoiseSource)initWithFrequency:(double)frequency
{
  GKCylindersNoiseSource *v4;
  GKCylindersNoiseSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKCylindersNoiseSource;
  v4 = -[GKCylindersNoiseSource init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[GKCylindersNoiseSource setFrequency:](v4, "setFrequency:", frequency);
  return v5;
}

- (double)valueAt:(GKCylindersNoiseSource *)self
{
  double *v2;
  double v3;
  double v4;
  double result;

  v3 = sqrt(v2[2] * v2[2] + *v2 * *v2);
  -[GKCylindersNoiseSource frequency](self, "frequency");
  +[GKNoiseSourceUtils radialLerpValueForDistanceToOrigin:frequency:](GKNoiseSourceUtils, "radialLerpValueForDistanceToOrigin:frequency:", v3, v4);
  return result;
}

- (id)cloneModule
{
  -[GKCylindersNoiseSource frequency](self, "frequency");
  return +[GKCylindersNoiseSource cylindersNoiseWithFrequency:](GKCylindersNoiseSource, "cylindersNoiseWithFrequency:");
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)frequency
{
  self->_frequency = frequency;
}

@end
