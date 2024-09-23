@implementation _DPBiasedCoin

- (_DPBiasedCoin)init
{

  return 0;
}

- (_DPBiasedCoin)initWithBias:(double)a3
{
  _DPBiasedCoin *result;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DPBiasedCoin;
  result = -[_DPBiasedCoin init](&v6, sel_init);
  if (result)
  {
    v5 = 1.0;
    if (a3 <= 1.0)
      v5 = a3;
    if (a3 < 0.0)
      v5 = 0.0;
    result->_bias = v5;
  }
  return result;
}

+ (_DPBiasedCoin)coinWithBias:(double)a3
{
  return (_DPBiasedCoin *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithBias:", a3);
}

- (BOOL)flip
{
  double bias;

  bias = self->_bias;
  return bias >= 2.22044605e-16 && uniformRandomProbability() >= 1.0 - bias;
}

- (unsigned)generateByte
{
  unsigned __int8 v2;
  uint64_t v4;
  double bias;

  if (self->_bias < 2.22044605e-16)
    return 0;
  v2 = 0;
  v4 = 8;
  do
  {
    bias = self->_bias;
    v2 = (uniformRandomProbability() >= 1.0 - bias) | (2 * v2);
    --v4;
  }
  while (v4);
  return v2;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { bias=%.16g }"), v5, *(_QWORD *)&self->_bias);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (double)sanitizedProbability:(double)a3
{
  double v3;
  BOOL v4;
  double result;

  v3 = 1.0;
  if (a3 <= 1.0)
    v3 = a3;
  v4 = a3 < 0.0;
  result = 0.0;
  if (!v4)
    return v3;
  return result;
}

- (double)bias
{
  return self->_bias;
}

@end
