@implementation SuddenChangeParameters

- (int)margin
{
  return self->margin;
}

- (void)setMargin:(int)a3
{
  self->margin = a3;
}

- (int)minSamplesCount
{
  return self->minSamplesCount;
}

- (void)setMinSamplesCount:(int)a3
{
  self->minSamplesCount = a3;
}

- (int)minSamplesCountFastBandwidthEstimation
{
  return self->minSamplesCountFastBandwidthEstimation;
}

- (void)setMinSamplesCountFastBandwidthEstimation:(int)a3
{
  self->minSamplesCountFastBandwidthEstimation = a3;
}

- (int)minMarginRequired
{
  return self->minMarginRequired;
}

- (void)setMinMarginRequired:(int)a3
{
  self->minMarginRequired = a3;
}

- (double)percentage
{
  return self->percentage;
}

- (void)setPercentage:(double)a3
{
  self->percentage = a3;
}

- (double)durationThresholdUpward
{
  return self->durationThresholdUpward;
}

- (void)setDurationThresholdUpward:(double)a3
{
  self->durationThresholdUpward = a3;
}

- (double)durationThresholdDownward
{
  return self->durationThresholdDownward;
}

- (void)setDurationThresholdDownward:(double)a3
{
  self->durationThresholdDownward = a3;
}

@end
