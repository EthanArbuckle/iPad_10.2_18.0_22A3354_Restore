@implementation GKVoronoiNoiseSource

+ (GKVoronoiNoiseSource)voronoiNoiseWithFrequency:(double)frequency displacement:(double)displacement distanceEnabled:(BOOL)distanceEnabled seed:(int32_t)seed
{
  return (GKVoronoiNoiseSource *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrequency:displacement:distanceEnabled:seed:", distanceEnabled, *(_QWORD *)&seed, frequency, displacement);
}

- (GKVoronoiNoiseSource)init
{
  return -[GKVoronoiNoiseSource initWithFrequency:displacement:distanceEnabled:seed:](self, "initWithFrequency:displacement:distanceEnabled:seed:", 0, 0, 1.0, 1.0);
}

- (GKVoronoiNoiseSource)initWithFrequency:(double)frequency displacement:(double)displacement distanceEnabled:(BOOL)distanceEnabled seed:(int32_t)seed
{
  uint64_t v6;
  _BOOL8 v7;
  GKVoronoiNoiseSource *v10;
  GKVoronoiNoiseSource *v11;
  objc_super v13;

  v6 = *(_QWORD *)&seed;
  v7 = distanceEnabled;
  v13.receiver = self;
  v13.super_class = (Class)GKVoronoiNoiseSource;
  v10 = -[GKVoronoiNoiseSource init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[GKVoronoiNoiseSource setFrequency:](v10, "setFrequency:", frequency);
    -[GKVoronoiNoiseSource setDisplacement:](v11, "setDisplacement:", displacement);
    -[GKVoronoiNoiseSource setDistanceEnabled:](v11, "setDistanceEnabled:", v7);
    -[GKVoronoiNoiseSource setSeed:](v11, "setSeed:", v6);
  }
  return v11;
}

- (double)valueAt:(GKVoronoiNoiseSource *)self
{
  float64x2_t *v2;
  float32x4_t v3;
  float32_t v5;
  double v6;
  float32_t v7;
  double v8;
  float v9;
  char v10;
  unsigned int v11;
  float32x4_t v12;
  float32x4_t v14;

  *(float32x2_t *)v3.f32 = vcvt_f32_f64(*v2);
  v5 = v2[1].f64[0];
  v3.f32[2] = v5;
  v14 = v3;
  -[GKVoronoiNoiseSource frequency](self, "frequency");
  v7 = v6;
  -[GKVoronoiNoiseSource displacement](self, "displacement");
  v9 = v8;
  v10 = -[GKVoronoiNoiseSource isDistanceEnabled](self, "isDistanceEnabled");
  v11 = -[GKVoronoiNoiseSource seed](self, "seed");
  v12.f32[0] = v7;
  return __voronoiNoise(v10, v11, v14, v12, v9);
}

- (id)cloneModule
{
  double v3;
  double v4;
  double v5;

  -[GKVoronoiNoiseSource frequency](self, "frequency");
  v4 = v3;
  -[GKVoronoiNoiseSource displacement](self, "displacement");
  return +[GKVoronoiNoiseSource voronoiNoiseWithFrequency:displacement:distanceEnabled:seed:](GKVoronoiNoiseSource, "voronoiNoiseWithFrequency:displacement:distanceEnabled:seed:", -[GKVoronoiNoiseSource isDistanceEnabled](self, "isDistanceEnabled"), -[GKVoronoiNoiseSource seed](self, "seed"), v4, v5);
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)frequency
{
  self->_frequency = frequency;
}

- (double)displacement
{
  return self->_displacement;
}

- (void)setDisplacement:(double)displacement
{
  self->_displacement = displacement;
}

- (BOOL)isDistanceEnabled
{
  return self->_distanceEnabled;
}

- (void)setDistanceEnabled:(BOOL)distanceEnabled
{
  self->_distanceEnabled = distanceEnabled;
}

- (int32_t)seed
{
  return self->_seed;
}

- (void)setSeed:(int32_t)seed
{
  self->_seed = seed;
}

@end
