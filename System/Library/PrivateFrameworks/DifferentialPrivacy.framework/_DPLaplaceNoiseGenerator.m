@implementation _DPLaplaceNoiseGenerator

- (_DPLaplaceNoiseGenerator)init
{

  return 0;
}

- (_DPLaplaceNoiseGenerator)initWithScale:(double)a3
{
  _DPLaplaceNoiseGenerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DPLaplaceNoiseGenerator;
  result = -[_DPLaplaceNoiseGenerator init](&v5, sel_init);
  if (result)
    result->_b = a3;
  return result;
}

+ (id)zeroMeanLaplaceNoiseGenerator:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithScale:", a3);
}

- (double)sample
{
  double v3;
  double v4;
  double v5;
  double v6;

  do
  {
    v3 = uniformRandomProbability() + -0.5;
    v4 = fabs(v3);
  }
  while (isEqualToOne(v4 + v4));
  v5 = log(v4 * -2.0 + 1.0);
  if (v3 <= 0.0)
    v6 = 0.0;
  else
    v6 = 1.0;
  if (v3 < 0.0)
    v6 = -1.0;
  return 0.0 - v5 * (v6 * self->_b);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { scale=%.16g }"), v5, *(_QWORD *)&self->_b);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)b
{
  return self->_b;
}

@end
