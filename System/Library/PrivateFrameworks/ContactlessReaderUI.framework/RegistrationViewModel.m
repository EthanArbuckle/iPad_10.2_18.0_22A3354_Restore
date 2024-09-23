@implementation RegistrationViewModel

- (void)notifyRegUIResultWithResult:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = sub_22F98EDB8();
  v5 = v4;
  swift_retain();
  sub_22F952B78(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)closeRegUI
{
  sub_22F870554((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_22F952EE0);
}

- (void)closeRegUIImmediate
{
  sub_22F870554((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_22F9532C4);
}

@end
