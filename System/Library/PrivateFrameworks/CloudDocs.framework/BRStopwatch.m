@implementation BRStopwatch

- (BRStopwatch)init
{
  BRStopwatch *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRStopwatch;
  v2 = -[BRStopwatch init](&v4, sel_init);
  if (v2)
    v2->_start = mach_absolute_time();
  return v2;
}

- (double)stop
{
  uint64_t v2;

  v2 = mach_absolute_time() - self->_start;
  return brc_monotonic_time_diff_to_interval(v2);
}

@end
