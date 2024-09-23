@implementation GKGaussianDistribution

- (GKGaussianDistribution)initWithRandomSource:(id)source lowestValue:(NSInteger)lowestInclusive highestValue:(NSInteger)highestInclusive
{
  GKGaussianDistribution *result;
  float v8;
  float v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKGaussianDistribution;
  result = -[GKRandomDistribution initWithRandomSource:lowestValue:highestValue:](&v10, sel_initWithRandomSource_lowestValue_highestValue_, source);
  if (result)
  {
    v8 = (double)(highestInclusive + lowestInclusive) * 0.5;
    result->_mean = v8;
    v9 = (float)((float)highestInclusive - v8) * 0.333333333;
    result->_deviation = v9;
  }
  return result;
}

- (GKGaussianDistribution)initWithRandomSource:(id)source mean:(float)mean deviation:(float)deviation
{
  GKGaussianDistribution *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKGaussianDistribution;
  result = -[GKRandomDistribution initWithRandomSource:lowestValue:highestValue:](&v8, sel_initWithRandomSource_lowestValue_highestValue_, source, (int)(float)(mean - (float)(deviation * 3.0)), (int)(float)((float)(deviation * 3.0) + mean));
  if (result)
  {
    result->_mean = mean;
    result->_deviation = deviation;
  }
  return result;
}

- (int64_t)nextInt
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  signed int v9;
  int64_t lowest;
  int64_t highest;

  -[GKRandom nextUniform](self->super._source, "nextUniform");
  v4 = v3;
  -[GKRandom nextUniform](self->super._source, "nextUniform");
  v6 = v5;
  v7 = v5 * 6.28318531;
  v8 = cosf(v7);
  v9 = llroundf(self->_mean + (float)((float)(self->_deviation * v8) * sqrtf(logf(v4) * -2.0)));
  lowest = self->super._lowest;
  highest = self->super._highest;
  if (lowest > v9 || highest < v9)
    return (int)(lowest + (uint64_t)(float)(v6 * (float)(highest - lowest)));
  else
    return v9;
}

- (float)mean
{
  return self->_mean;
}

- (float)deviation
{
  return self->_deviation;
}

@end
