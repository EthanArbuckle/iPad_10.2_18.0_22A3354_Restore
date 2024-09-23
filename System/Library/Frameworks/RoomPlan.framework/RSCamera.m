@implementation RSCamera

- (int64_t)trackingState
{
  return *(_QWORD *)self->trackingState;
}

- (void)setTrackingState:(int64_t)a3
{
  *(_QWORD *)self->trackingState = a3;
}

@end
