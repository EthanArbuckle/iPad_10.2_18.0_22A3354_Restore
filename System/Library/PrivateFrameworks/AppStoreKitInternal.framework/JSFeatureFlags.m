@implementation JSFeatureFlags

- (_TtC19AppStoreKitInternal14JSFeatureFlags)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[JSFeatureFlags init](&v3, sel_init);
}

- (BOOL)isEnabled:(id)a3
{
  return sub_1D868E510(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1D83BAC1C);
}

- (BOOL)isGSEUIEnabled:(id)a3
{
  return sub_1D868E510(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1D868E570);
}

@end
