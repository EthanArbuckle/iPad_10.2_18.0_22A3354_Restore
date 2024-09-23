@implementation GKRidgedNoiseSource

+ (GKRidgedNoiseSource)ridgedNoiseSourceWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount lacunarity:(double)lacunarity seed:(int32_t)seed
{
  return (GKRidgedNoiseSource *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrequency:octaveCount:lacunarity:seed:", octaveCount, *(_QWORD *)&seed, frequency, lacunarity);
}

- (GKRidgedNoiseSource)init
{
  return -[GKRidgedNoiseSource initWithFrequency:octaveCount:lacunarity:seed:](self, "initWithFrequency:octaveCount:lacunarity:seed:", 6, 0, 1.0, 2.0);
}

- (GKRidgedNoiseSource)initWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount lacunarity:(double)lacunarity seed:(int32_t)seed
{
  uint64_t v6;
  GKRidgedNoiseSource *v10;
  GKRidgedNoiseSource *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  objc_super v52;

  v6 = *(_QWORD *)&seed;
  v52.receiver = self;
  v52.super_class = (Class)GKRidgedNoiseSource;
  v10 = -[GKRidgedNoiseSource init](&v52, sel_init);
  v11 = v10;
  if (v10)
  {
    -[GKCoherentNoiseSource setFrequency:](v10, "setFrequency:", frequency);
    -[GKCoherentNoiseSource setOctaveCount:](v11, "setOctaveCount:", octaveCount);
    -[GKCoherentNoiseSource setLacunarity:](v11, "setLacunarity:", lacunarity);
    -[GKCoherentNoiseSource setSeed:](v11, "setSeed:", v6);
    v11->m_weights[0] = 1.0;
    v11->m_weights[1] = 1.0 / lacunarity;
    v11->m_weights[2] = 1.0 / (lacunarity * lacunarity);
    v12 = lacunarity * lacunarity * lacunarity;
    v13 = 1.0 / v12;
    v14 = v12 * lacunarity;
    v11->m_weights[3] = v13;
    v11->m_weights[4] = 1.0 / v14;
    v15 = v14 * lacunarity;
    v16 = 1.0 / v15;
    v17 = v15 * lacunarity;
    v11->m_weights[5] = v16;
    v11->m_weights[6] = 1.0 / v17;
    v18 = v17 * lacunarity;
    v19 = 1.0 / v18;
    v20 = v18 * lacunarity;
    v11->m_weights[7] = v19;
    v11->m_weights[8] = 1.0 / v20;
    v21 = v20 * lacunarity;
    v22 = 1.0 / v21;
    v23 = v21 * lacunarity;
    v11->m_weights[9] = v22;
    v11->m_weights[10] = 1.0 / v23;
    v24 = v23 * lacunarity;
    v25 = 1.0 / v24;
    v26 = v24 * lacunarity;
    v11->m_weights[11] = v25;
    v11->m_weights[12] = 1.0 / v26;
    v27 = v26 * lacunarity;
    v28 = 1.0 / v27;
    v29 = v27 * lacunarity;
    v11->m_weights[13] = v28;
    v11->m_weights[14] = 1.0 / v29;
    v30 = v29 * lacunarity;
    v31 = 1.0 / v30;
    v32 = v30 * lacunarity;
    v11->m_weights[15] = v31;
    v11->m_weights[16] = 1.0 / v32;
    v33 = v32 * lacunarity;
    v34 = 1.0 / v33;
    v35 = v33 * lacunarity;
    v11->m_weights[17] = v34;
    v11->m_weights[18] = 1.0 / v35;
    v36 = v35 * lacunarity;
    v37 = 1.0 / v36;
    v38 = v36 * lacunarity;
    v11->m_weights[19] = v37;
    v11->m_weights[20] = 1.0 / v38;
    v39 = v38 * lacunarity;
    v40 = 1.0 / v39;
    v41 = v39 * lacunarity;
    v11->m_weights[21] = v40;
    v11->m_weights[22] = 1.0 / v41;
    v42 = v41 * lacunarity;
    v43 = 1.0 / v42;
    v44 = v42 * lacunarity;
    v11->m_weights[23] = v43;
    v11->m_weights[24] = 1.0 / v44;
    v45 = v44 * lacunarity;
    v46 = 1.0 / v45;
    v47 = v45 * lacunarity;
    v11->m_weights[25] = v46;
    v11->m_weights[26] = 1.0 / v47;
    v48 = v47 * lacunarity;
    v49 = 1.0 / v48;
    v50 = v48 * lacunarity;
    v11->m_weights[27] = v49;
    v11->m_weights[28] = 1.0 / v50;
    v11->m_weights[29] = 1.0 / (v50 * lacunarity);
  }
  return v11;
}

- (double)valueAt:(GKRidgedNoiseSource *)self
{
  float64x2_t *v2;
  float64x2_t v4;
  NSInteger v5;
  double v6;
  double v7;
  __int16 v8;
  double v9;
  double v10;
  float64x2_t v11;
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
    return -1.0;
  v5 = 0;
  v15 = vmulq_n_f64(v14, v13.f64[0]);
  v17 = vmulq_f64(v13, v16);
  v6 = 1.0;
  v7 = 0.0;
  do
  {
    v8 = -[GKCoherentNoiseSource seed](self, "seed");
    v18[0] = v15;
    v18[1] = v17;
    v9 = fabs(getGradientCoherentNoise((double *)v18, (unsigned __int16)v5 + v8));
    v10 = (1.0 - v9) * (1.0 - v9) * v6;
    v6 = fmax(fmin(v10 + v10, 1.0), 0.0);
    v7 = v7 + v10 * self->m_weights[v5];
    -[GKCoherentNoiseSource lacunarity](self, "lacunarity");
    v15 = vmulq_n_f64(v15, v11.f64[0]);
    v17 = vmulq_f64(v11, v17);
    ++v5;
  }
  while (-[GKCoherentNoiseSource octaveCount](self, "octaveCount") > v5);
  return v7 * 1.25 + -1.0;
}

- (id)cloneModule
{
  double v3;
  double v4;
  NSInteger v5;
  double v6;

  -[GKCoherentNoiseSource frequency](self, "frequency");
  v4 = v3;
  v5 = -[GKCoherentNoiseSource octaveCount](self, "octaveCount");
  -[GKCoherentNoiseSource lacunarity](self, "lacunarity");
  return +[GKRidgedNoiseSource ridgedNoiseSourceWithFrequency:octaveCount:lacunarity:seed:](GKRidgedNoiseSource, "ridgedNoiseSourceWithFrequency:octaveCount:lacunarity:seed:", v5, -[GKCoherentNoiseSource seed](self, "seed"), v4, v6);
}

@end
