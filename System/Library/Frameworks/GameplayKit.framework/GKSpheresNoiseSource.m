@implementation GKSpheresNoiseSource

+ (GKSpheresNoiseSource)spheresNoiseWithFrequency:(double)frequency
{
  return (GKSpheresNoiseSource *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrequency:", frequency);
}

- (GKSpheresNoiseSource)init
{
  return -[GKSpheresNoiseSource initWithFrequency:](self, "initWithFrequency:", 1.0);
}

- (GKSpheresNoiseSource)initWithFrequency:(double)frequency
{
  GKSpheresNoiseSource *v4;
  GKSpheresNoiseSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKSpheresNoiseSource;
  v4 = -[GKSpheresNoiseSource init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[GKSpheresNoiseSource setFrequency:](v4, "setFrequency:", frequency);
  return v5;
}

- (double)valueAt:(GKSpheresNoiseSource *)self
{
  float64x2_t *v2;
  double v3;
  double v4;
  double result;

  v3 = sqrt(vaddvq_f64(vmulq_f64(*v2, *v2)) + v2[1].f64[0] * v2[1].f64[0]);
  -[GKSpheresNoiseSource frequency](self, "frequency");
  +[GKNoiseSourceUtils radialLerpValueForDistanceToOrigin:frequency:](GKNoiseSourceUtils, "radialLerpValueForDistanceToOrigin:frequency:", v3, v4);
  return result;
}

- (id)cloneModule
{
  -[GKSpheresNoiseSource frequency](self, "frequency");
  return +[GKSpheresNoiseSource spheresNoiseWithFrequency:](GKSpheresNoiseSource, "spheresNoiseWithFrequency:");
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
