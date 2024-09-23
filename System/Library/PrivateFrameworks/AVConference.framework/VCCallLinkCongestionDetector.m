@implementation VCCallLinkCongestionDetector

- (VCCallLinkCongestionDetector)initWithRTTThreshold:(double)a3 lossRateThreshold:(double)a4
{
  VCCallLinkCongestionDetector *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCCallLinkCongestionDetector;
  result = -[VCCallLinkCongestionDetector init](&v7, sel_init);
  if (result)
  {
    result->isLinkCongested = 0;
    result->rttThreshold = a3;
    result->lossRateThreshold = a4;
  }
  return result;
}

- (void)addNewRTT:(double)a3 packetLossRate:(double)a4 timestamp:(double)a5
{
  BOOL v5;

  v5 = self->rttThreshold < a3 || self->lossRateThreshold < a4;
  self->isLinkCongested = v5;
}

- (BOOL)isLinkCongested
{
  return self->isLinkCongested;
}

- (void)setIsLinkCongested:(BOOL)a3
{
  self->isLinkCongested = a3;
}

@end
