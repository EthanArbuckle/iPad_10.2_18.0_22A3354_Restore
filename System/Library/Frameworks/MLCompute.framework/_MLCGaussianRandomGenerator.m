@implementation _MLCGaussianRandomGenerator

- (_MLCGaussianRandomGenerator)initWithMean:(double)a3 scale:(double)a4 seeded:(BOOL)a5 seedValue:(unint64_t)a6
{
  _BOOL4 v7;
  _MLCGaussianRandomGenerator *result;
  objc_super v11;

  v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)_MLCGaussianRandomGenerator;
  result = -[_MLCGaussianRandomGenerator init](&v11, sel_init);
  if (result)
  {
    result->_mean = a3;
    result->_scale = a4;
    result->_seeded = v7;
    if (v7)
      result->_seedValue = a6;
  }
  return result;
}

+ (id)zeroMeanGaussianRandomGenerator
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMean:scale:seeded:seedValue:", 0, arc4random_uniform(0x40000000u), 0.0, 1.0);
}

+ (id)zeroMeanGaussianRandomGeneratorWithSeed:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMean:scale:seeded:seedValue:", 0, a3, 0.0, 1.0);
}

- (double)sample
{
  int v3;
  double v4;
  double v5;
  int v6;
  double v7;
  double v8;
  __double2 v9;
  double v10;
  double v11;
  double v12;

  v3 = sample_generateNoise;
  sample_generateNoise ^= 1u;
  if (v3)
  {
    v4 = *(double *)&sample_z1;
  }
  else
  {
    do
    {
      v5 = (double)rand_r((unsigned int *)&self->_seedValue) * 4.65661288e-10;
      v6 = rand_r((unsigned int *)&self->_seedValue);
    }
    while (v5 <= 2.22044605e-16);
    v7 = (double)v6 * 4.65661288e-10;
    v8 = sqrt(log(v5) * -2.0);
    v9 = __sincos_stret(v7 * 6.28318531);
    v4 = v8 * v9.__cosval;
    *(double *)&sample_z1 = v8 * v9.__sinval;
  }
  -[_MLCGaussianRandomGenerator scale](self, "scale");
  v11 = v10;
  -[_MLCGaussianRandomGenerator mean](self, "mean");
  return v12 + v4 * v11;
}

- (double)mean
{
  return self->_mean;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)seeded
{
  return self->_seeded;
}

- (unint64_t)seedValue
{
  return self->_seedValue;
}

@end
