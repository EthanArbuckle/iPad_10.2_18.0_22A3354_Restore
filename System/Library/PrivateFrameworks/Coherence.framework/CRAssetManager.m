@implementation CRAssetManager

- (void)willEnterForeground
{
  sub_1BDD87898((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BDD88E6C);
}

- (void)didEnterBackground
{
  sub_1BDD87898((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BE10FA80);
}

@end
