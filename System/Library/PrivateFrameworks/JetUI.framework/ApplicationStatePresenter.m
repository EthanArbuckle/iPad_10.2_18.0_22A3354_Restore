@implementation ApplicationStatePresenter

- (void)applicationDidBecomeActive
{
  sub_1AC6B4410((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1AC6B42B4);
}

- (void)applicationDidResignActive
{
  sub_1AC6B4410((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1AC6B4364);
}

@end
