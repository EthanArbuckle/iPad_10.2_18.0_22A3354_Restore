@implementation AppLifeCycleCoordinator

- (void)didBecomeActive
{
  sub_21D3A6848((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_21D3A666C);
}

- (void)willResignActive
{
  sub_21D3A6848((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_21D3A6788);
}

- (void)didFinishLaunching
{
  sub_21D3A6848((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_21D3A67F4);
}

@end
