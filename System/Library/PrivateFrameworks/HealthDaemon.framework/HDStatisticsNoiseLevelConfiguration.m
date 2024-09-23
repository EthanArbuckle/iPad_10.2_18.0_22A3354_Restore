@implementation HDStatisticsNoiseLevelConfiguration

- (HDStatisticsNoiseLevelConfiguration)initWithOverlapProcessingEnabled:(BOOL)a3
{
  HDStatisticsNoiseLevelConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDStatisticsNoiseLevelConfiguration;
  result = -[HDStatisticsNoiseLevelConfiguration init](&v5, sel_init);
  if (result)
    result->_enableOverlapProcessing = a3;
  return result;
}

- (BOOL)enableOverlapProcessing
{
  return self->_enableOverlapProcessing;
}

- (void)setEnableOverlapProcessing:(BOOL)a3
{
  self->_enableOverlapProcessing = a3;
}

@end
