@implementation GKBillowNoiseSource

+ (GKBillowNoiseSource)billowNoiseSourceWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount persistence:(double)persistence lacunarity:(double)lacunarity seed:(int32_t)seed
{
  return (GKBillowNoiseSource *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrequency:octaveCount:persistence:lacunarity:seed:", octaveCount, *(_QWORD *)&seed, frequency, persistence, lacunarity);
}

- (GKBillowNoiseSource)init
{
  return -[GKBillowNoiseSource initWithFrequency:octaveCount:persistence:lacunarity:seed:](self, "initWithFrequency:octaveCount:persistence:lacunarity:seed:", 6, 0, 1.0, 0.5, 2.0);
}

- (GKBillowNoiseSource)initWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount persistence:(double)persistence lacunarity:(double)lacunarity seed:(int32_t)seed
{
  uint64_t v7;
  GKBillowNoiseSource *v12;
  GKBillowNoiseSource *v13;
  objc_super v15;

  v7 = *(_QWORD *)&seed;
  v15.receiver = self;
  v15.super_class = (Class)GKBillowNoiseSource;
  v12 = -[GKBillowNoiseSource init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[GKCoherentNoiseSource setFrequency:](v12, "setFrequency:", frequency);
    -[GKCoherentNoiseSource setOctaveCount:](v13, "setOctaveCount:", octaveCount);
    -[GKBillowNoiseSource setPersistence:](v13, "setPersistence:", persistence);
    -[GKCoherentNoiseSource setLacunarity:](v13, "setLacunarity:", lacunarity);
    -[GKCoherentNoiseSource setSeed:](v13, "setSeed:", v7);
  }
  return v13;
}

- (double)valueAt:(GKBillowNoiseSource *)self
{
  float64x2_t *v2;
  float64x2_t v4;
  NSInteger v5;
  double v6;
  double v7;
  __int16 v8;
  double v9;
  float64x2_t v10;
  double v11;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  _OWORD v18[2];

  v14 = *v2;
  v16 = v2[1];
  -[GKCoherentNoiseSource frequency](self, "frequency");
  v13 = v4;
  if (-[GKCoherentNoiseSource octaveCount](self, "octaveCount") < 1)
    return 0.5;
  v5 = 0;
  v15 = vmulq_n_f64(v14, v13.f64[0]);
  v17 = vmulq_f64(v13, v16);
  v6 = 0.0;
  v7 = 1.0;
  do
  {
    v8 = -[GKCoherentNoiseSource seed](self, "seed");
    v18[0] = v15;
    v18[1] = v17;
    v9 = fabs(getGradientCoherentNoise((double *)v18, (unsigned __int16)v5 + v8));
    v6 = v6 - (v7 - (v9 + v9) * v7);
    -[GKCoherentNoiseSource lacunarity](self, "lacunarity");
    v15 = vmulq_n_f64(v15, v10.f64[0]);
    v17 = vmulq_f64(v10, v17);
    -[GKBillowNoiseSource persistence](self, "persistence");
    v7 = v11 * v7;
    ++v5;
  }
  while (-[GKCoherentNoiseSource octaveCount](self, "octaveCount") > v5);
  return v6 + 0.5;
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
  -[GKBillowNoiseSource persistence](self, "persistence");
  v7 = v6;
  -[GKCoherentNoiseSource lacunarity](self, "lacunarity");
  return +[GKBillowNoiseSource billowNoiseSourceWithFrequency:octaveCount:persistence:lacunarity:seed:](GKBillowNoiseSource, "billowNoiseSourceWithFrequency:octaveCount:persistence:lacunarity:seed:", v5, -[GKCoherentNoiseSource seed](self, "seed"), v4, v7, v8);
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
