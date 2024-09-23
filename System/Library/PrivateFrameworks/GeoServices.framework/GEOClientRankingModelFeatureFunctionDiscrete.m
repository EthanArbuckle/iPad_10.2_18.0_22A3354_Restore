@implementation GEOClientRankingModelFeatureFunctionDiscrete

- (GEOClientRankingModelFeatureFunctionDiscrete)init
{
  GEOClientRankingModelFeatureFunctionDiscrete *result;

  result = (GEOClientRankingModelFeatureFunctionDiscrete *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOClientRankingModelFeatureFunctionDiscrete)initWithValueThresholdLow:(float)a3 weightLow:(float)a4 valueThresholdHigh:(float)a5 weightHigh:(float)a6
{
  GEOClientRankingModelFeatureFunctionDiscrete *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GEOClientRankingModelFeatureFunctionDiscrete;
  result = -[GEOClientRankingModelFeatureFunctionDiscrete init](&v11, sel_init);
  if (result)
  {
    result->_valueThresholdLow = a3;
    result->_weightLow = a4;
    result->_valueThresholdHigh = a5;
    result->_weightHigh = a6;
  }
  return result;
}

- (int64_t)functionType
{
  return 2;
}

- (float)valueThresholdLow
{
  return self->_valueThresholdLow;
}

- (float)weightLow
{
  return self->_weightLow;
}

- (float)valueThresholdHigh
{
  return self->_valueThresholdHigh;
}

- (float)weightHigh
{
  return self->_weightHigh;
}

@end
