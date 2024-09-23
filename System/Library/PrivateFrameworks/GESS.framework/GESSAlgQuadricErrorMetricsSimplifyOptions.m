@implementation GESSAlgQuadricErrorMetricsSimplifyOptions

- (GESSAlgQuadricErrorMetricsSimplifyOptions)init
{
  GESSAlgQuadricErrorMetricsSimplifyOptions *v2;
  double v3;
  GESSAlgQuadricErrorMetricsSimplifyOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GESSAlgQuadricErrorMetricsSimplifyOptions;
  v2 = -[GESSAlgQuadricErrorMetricsSimplifyOptions init](&v6, sel_init);
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1058944319;
    -[GESSAlgQuadricErrorMetricsSimplifyOptions setStrength:](v2, "setStrength:", v3);
    -[GESSAlgQuadricErrorMetricsSimplifyOptions setFixBoundary:](v4, "setFixBoundary:", 1);
  }
  return v4;
}

- (float)strength
{
  return self->strength;
}

- (void)setStrength:(float)a3
{
  self->strength = a3;
}

- (BOOL)fixBoundary
{
  return self->fixBoundary;
}

- (void)setFixBoundary:(BOOL)a3
{
  self->fixBoundary = a3;
}

@end
