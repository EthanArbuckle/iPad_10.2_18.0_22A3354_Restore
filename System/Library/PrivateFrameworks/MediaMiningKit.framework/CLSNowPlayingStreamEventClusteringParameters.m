@implementation CLSNowPlayingStreamEventClusteringParameters

- (CLSNowPlayingStreamEventClusteringParameters)init
{
  CLSNowPlayingStreamEventClusteringParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSNowPlayingStreamEventClusteringParameters;
  result = -[CLSNowPlayingStreamEventClusteringParameters init](&v3, sel_init);
  if (result)
  {
    result->_minimumClusteringTimeInSeconds = 1800.0;
    result->_algorithm = 1;
  }
  return result;
}

- (double)minimumClusterTimeInSeconds
{
  return self->_minimumClusteringTimeInSeconds;
}

- (void)setMinimumClusterTimeInSeconds:(double)a3
{
  self->_minimumClusteringTimeInSeconds = a3;
}

- (unint64_t)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(unint64_t)a3
{
  self->_algorithm = a3;
}

@end
