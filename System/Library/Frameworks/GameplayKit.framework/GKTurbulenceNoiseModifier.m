@implementation GKTurbulenceNoiseModifier

- (GKTurbulenceNoiseModifier)init
{
  return -[GKTurbulenceNoiseModifier initWithFrequency:power:roughness:seed:](self, "initWithFrequency:power:roughness:seed:", 0, 1.0, 1.0, 1.0);
}

- (GKTurbulenceNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  return -[GKTurbulenceNoiseModifier initWithFrequency:power:roughness:seed:](self, "initWithFrequency:power:roughness:seed:", 0, 1.0, 1.0, 1.0);
}

- (GKTurbulenceNoiseModifier)initWithFrequency:(double)a3 power:(double)a4 roughness:(double)a5 seed:(int)a6
{
  uint64_t v6;
  GKTurbulenceNoiseModifier *v10;
  GKTurbulenceNoiseModifier *v11;
  GKPerlinNoiseSource *v12;
  GKPerlinNoiseSource *v13;
  GKPerlinNoiseSource *v14;
  GKPerlinNoiseSource *v15;
  GKPerlinNoiseSource *v16;
  GKPerlinNoiseSource *v17;
  objc_super v19;

  v6 = *(_QWORD *)&a6;
  v19.receiver = self;
  v19.super_class = (Class)GKTurbulenceNoiseModifier;
  v10 = -[GKNoiseModifier initWithInputModuleCount:](&v19, sel_initWithInputModuleCount_, 1);
  v11 = v10;
  if (v10)
  {
    v10->_power = a4;
    v12 = -[GKPerlinNoiseSource initWithFrequency:octaveCount:persistence:lacunarity:seed:]([GKPerlinNoiseSource alloc], "initWithFrequency:octaveCount:persistence:lacunarity:seed:", (uint64_t)a5, v6, a3, 0.5, 0.5);
    v13 = v11->_perlin[0];
    v11->_perlin[0] = v12;

    v14 = -[GKPerlinNoiseSource initWithFrequency:octaveCount:persistence:lacunarity:seed:]([GKPerlinNoiseSource alloc], "initWithFrequency:octaveCount:persistence:lacunarity:seed:", (uint64_t)a5, (v6 + 1), a3, 0.5, 0.5);
    v15 = v11->_perlin[1];
    v11->_perlin[1] = v14;

    v16 = -[GKPerlinNoiseSource initWithFrequency:octaveCount:persistence:lacunarity:seed:]([GKPerlinNoiseSource alloc], "initWithFrequency:octaveCount:persistence:lacunarity:seed:", (uint64_t)a5, (v6 + 2), a3, 0.5, 0.5);
    v17 = v11->_perlin[2];
    v11->_perlin[2] = v16;

  }
  return v11;
}

- (void)dealloc
{
  GKPerlinNoiseSource **perlin;
  GKPerlinNoiseSource *v4;
  GKPerlinNoiseSource *v5;
  GKPerlinNoiseSource *v6;
  objc_super v7;

  perlin = self->_perlin;
  v4 = self->_perlin[0];
  self->_perlin[0] = 0;

  v5 = perlin[1];
  perlin[1] = 0;

  v6 = perlin[2];
  perlin[2] = 0;

  v7.receiver = self;
  v7.super_class = (Class)GKTurbulenceNoiseModifier;
  -[GKTurbulenceNoiseModifier dealloc](&v7, sel_dealloc);
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKTurbulenceNoiseModifier *)self
{
  float64x2_t *v2;
  float64x2_t v3;
  GKPerlinNoiseSource **perlin;
  GKPerlinNoiseSource *v6;
  double v7;
  GKPerlinNoiseSource *v8;
  float64x2_t v9;
  __int128 v10;
  GKPerlinNoiseSource *v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  void *v16;
  double v17;
  double v18;
  __int128 v20;
  float64_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  _OWORD v26[2];
  _OWORD v27[2];
  _OWORD v28[2];
  _OWORD v29[2];

  v22 = *v2;
  v24 = v2[1];
  perlin = self->_perlin;
  v6 = self->_perlin[0];
  v3.f64[0] = 0.8;
  v29[0] = vaddq_f64(*v2, (float64x2_t)xmmword_227BC0280);
  v29[1] = vaddq_f64(v24, v3);
  -[GKPerlinNoiseSource valueAt:](v6, "valueAt:", v29);
  v21 = v7;
  v8 = perlin[1];
  v9.f64[1] = v22.f64[1];
  v9.f64[0] = 0.15;
  v28[0] = vaddq_f64(v22, (float64x2_t)xmmword_227BC0290);
  v28[1] = vaddq_f64(v24, v9);
  -[GKPerlinNoiseSource valueAt:](v8, "valueAt:", v28);
  v20 = v10;
  v11 = perlin[2];
  v12.f64[1] = v22.f64[1];
  v12.f64[0] = 0.33;
  v27[0] = vaddq_f64(v22, (float64x2_t)xmmword_227BC02A0);
  v27[1] = vaddq_f64(v24, v12);
  -[GKPerlinNoiseSource valueAt:](v11, "valueAt:", v27);
  v13.f64[1] = *((float64_t *)&v20 + 1);
  v14.f64[0] = v21;
  *(_QWORD *)&v14.f64[1] = v20;
  v13.f64[0] = self->_power;
  v23 = vmulq_f64(v13, v15);
  v25 = vmulq_n_f64(v14, v13.f64[0]);
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v25;
  v26[1] = v23;
  objc_msgSend(v16, "valueAt:", v26);
  v18 = v17;

  return v18;
}

- (id)cloneModule
{
  return -[GKTurbulenceNoiseModifier initWithFrequency:power:roughness:seed:]([GKTurbulenceNoiseModifier alloc], "initWithFrequency:power:roughness:seed:", self->_seed, self->_frequency, self->_power, self->_roughness);
}

- (void).cxx_destruct
{
  id *perlin;

  perlin = (id *)self->_perlin;
  objc_storeStrong((id *)&self->_perlin[2], 0);
  objc_storeStrong(perlin + 1, 0);
  objc_storeStrong(perlin, 0);
}

@end
