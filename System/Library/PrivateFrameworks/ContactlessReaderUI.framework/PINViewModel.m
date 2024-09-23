@implementation PINViewModel

- (void)errorInDaemonWithError:(int64_t)a3
{
  sub_22F870E04((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_22F86DCA8);
}

- (void)closePINUI
{
  sub_22F870554((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_22F86E964);
}

- (void)closePINUIImmediate
{
  sub_22F870554((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_22F870054);
}

- (void)updateSessionEventWithSessionEvent:(int64_t)a3
{
  sub_22F870E04((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_22F870764);
}

@end
