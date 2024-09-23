@implementation GEOClientRankingModelFeatureFunctionLinear

- (GEOClientRankingModelFeatureFunctionLinear)init
{
  GEOClientRankingModelFeatureFunctionLinear *result;

  result = (GEOClientRankingModelFeatureFunctionLinear *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOClientRankingModelFeatureFunctionLinear)initWithWeight:(float)a3 maxRelativeValue:(float)a4 meanValue:(float)a5
{
  GEOClientRankingModelFeatureFunctionLinear *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOClientRankingModelFeatureFunctionLinear;
  result = -[GEOClientRankingModelFeatureFunctionLinear init](&v9, sel_init);
  if (result)
  {
    result->_weight = a3;
    result->_maxRelativeValue = a4;
    result->_meanValue = a5;
  }
  return result;
}

- (int64_t)functionType
{
  return 1;
}

- (float)weight
{
  return self->_weight;
}

- (float)maxRelativeValue
{
  return self->_maxRelativeValue;
}

- (float)meanValue
{
  return self->_meanValue;
}

@end
