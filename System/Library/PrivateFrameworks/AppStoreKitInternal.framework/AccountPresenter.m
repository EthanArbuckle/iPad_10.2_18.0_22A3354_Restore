@implementation AccountPresenter

- (void)storeAccountsDidChange
{
  sub_1D86D9E40((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1D88F3584);
}

- (void)iCloudAccountsDidChange
{
  sub_1D86D9E40((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1D88F3874);
}

- (void)restrictionsDidChange:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_1D88F39BC((uint64_t)sub_1D88F93CC, (uint64_t)&block_descriptor_173_0);

  swift_release();
}

- (void)automaticUpdatesEnabledDidChange
{
  sub_1D86D9E40((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1D88F3C14);
}

- (void)profilePictureStoreDidChange
{
  swift_retain();
  sub_1D88F3D64(0, 0);
  swift_release();
}

- (void)familyInfoDidChange
{
  sub_1D86D9E40((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1D88F3F5C);
}

@end
