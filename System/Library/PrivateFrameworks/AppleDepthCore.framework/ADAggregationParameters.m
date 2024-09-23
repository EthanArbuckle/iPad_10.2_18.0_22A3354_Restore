@implementation ADAggregationParameters

- (void)setMaxPointCloudAge:(double)a3
{
  self->_maxPointCloudAge = a3;
}

- (void)setAggregationSize:(unsigned int)a3
{
  self->_aggregationSize = a3;
}

- (unsigned)aggregationSize
{
  return self->_aggregationSize;
}

- (double)maxPointCloudAge
{
  return self->_maxPointCloudAge;
}

@end
