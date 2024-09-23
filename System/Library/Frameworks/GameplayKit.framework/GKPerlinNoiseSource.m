@implementation GKPerlinNoiseSource

+ (GKPerlinNoiseSource)perlinNoiseSourceWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount persistence:(double)persistence lacunarity:(double)lacunarity seed:(int32_t)seed
{
  return (GKPerlinNoiseSource *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrequency:octaveCount:persistence:lacunarity:seed:", octaveCount, *(_QWORD *)&seed, frequency, persistence, lacunarity);
}

- (GKPerlinNoiseSource)init
{
  return -[GKPerlinNoiseSource initWithFrequency:octaveCount:persistence:lacunarity:seed:](self, "initWithFrequency:octaveCount:persistence:lacunarity:seed:", 6, 0, 1.0, 0.5, 2.0);
}

- (GKPerlinNoiseSource)initWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount persistence:(double)persistence lacunarity:(double)lacunarity seed:(int32_t)seed
{
  uint64_t v7;
  GKPerlinNoiseSource *v12;
  GKPerlinNoiseSource *v13;
  objc_super v15;

  v7 = *(_QWORD *)&seed;
  v15.receiver = self;
  v15.super_class = (Class)GKPerlinNoiseSource;
  v12 = -[GKPerlinNoiseSource init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[GKCoherentNoiseSource setFrequency:](v12, "setFrequency:", frequency);
    -[GKCoherentNoiseSource setOctaveCount:](v13, "setOctaveCount:", octaveCount);
    -[GKPerlinNoiseSource setPersistence:](v13, "setPersistence:", persistence);
    -[GKCoherentNoiseSource setLacunarity:](v13, "setLacunarity:", lacunarity);
    -[GKCoherentNoiseSource setSeed:](v13, "setSeed:", v7);
  }
  return v13;
}

- (double)valueAt:(GKPerlinNoiseSource *)self
{
  float64x2_t *v2;
  float64x2_t v4;
  NSInteger v5;
  double v6;
  double v7;
  __int16 v8;
  float64x2_t v9;
  double v10;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  _OWORD v17[2];

  v13 = *v2;
  v15 = v2[1];
  -[GKCoherentNoiseSource frequency](self, "frequency");
  v12 = v4;
  if (-[GKCoherentNoiseSource octaveCount](self, "octaveCount") < 1)
    return 0.0;
  v5 = 0;
  v14 = vmulq_n_f64(v13, v12.f64[0]);
  v16 = vmulq_f64(v12, v15);
  v6 = 0.0;
  v7 = 1.0;
  do
  {
    v8 = -[GKCoherentNoiseSource seed](self, "seed");
    v17[0] = v14;
    v17[1] = v16;
    v6 = v6 + getGradientCoherentNoise((double *)v17, (unsigned __int16)v5 + v8) * v7;
    -[GKCoherentNoiseSource lacunarity](self, "lacunarity");
    v14 = vmulq_n_f64(v14, v9.f64[0]);
    v16 = vmulq_f64(v9, v16);
    -[GKPerlinNoiseSource persistence](self, "persistence");
    v7 = v10 * v7;
    ++v5;
  }
  while (-[GKCoherentNoiseSource octaveCount](self, "octaveCount") > v5);
  return v6;
}

- (id)cloneModule
{
  double v3;
  double v4;
  NSInteger v5;
  double v6;
  double v7;
  double v8;

  -[GKCoherentNoiseSource frequency](self, "frequency");
  v4 = v3;
  v5 = -[GKCoherentNoiseSource octaveCount](self, "octaveCount");
  -[GKPerlinNoiseSource persistence](self, "persistence");
  v7 = v6;
  -[GKCoherentNoiseSource lacunarity](self, "lacunarity");
  return +[GKPerlinNoiseSource perlinNoiseSourceWithFrequency:octaveCount:persistence:lacunarity:seed:](GKPerlinNoiseSource, "perlinNoiseSourceWithFrequency:octaveCount:persistence:lacunarity:seed:", v5, -[GKCoherentNoiseSource seed](self, "seed"), v4, v7, v8);
}

- (double)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(double)persistence
{
  self->_persistence = persistence;
}

@end
