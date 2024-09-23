@implementation PeriodicFPCK

- (void)shouldPauseWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  _Block_copy(v3);
  v4 = swift_retain();
  sub_23AFE9718(v4, (uint64_t)v3);
  _Block_release(v3);
  _Block_release(v3);
  swift_release();
}

@end
