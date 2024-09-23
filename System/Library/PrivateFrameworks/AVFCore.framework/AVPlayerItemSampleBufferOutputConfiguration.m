@implementation AVPlayerItemSampleBufferOutputConfiguration

- (double)advanceIntervalForDataAvailability
{
  return self->_advanceIntervalForDataAvailability;
}

- (void)setAdvanceIntervalForDataAvailability:(double)a3
{
  self->_advanceIntervalForDataAvailability = a3;
}

@end
