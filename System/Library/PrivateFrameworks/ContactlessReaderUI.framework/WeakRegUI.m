@implementation WeakRegUI

- (void)notifyRegUIResultWithResult:(id)a3
{
  sub_22F98EDB8();
  swift_retain();
  sub_22F91AE28();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)closeRegUI
{
  sub_22F870554((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_22F91B114);
}

- (void)closeRegUIImmediate
{
  sub_22F870554((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_22F91B148);
}

@end
