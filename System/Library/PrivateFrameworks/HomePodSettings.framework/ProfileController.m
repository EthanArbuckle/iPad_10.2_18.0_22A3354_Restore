@implementation ProfileController

- (void)profilesChangedForLocalDeviceWithProfiles:(id)a3
{
  uint64_t v3;

  v3 = sub_22DFDD40C();
  swift_retain();
  ProfileController.profilesChangedForLocalDevice(profiles:)((Swift::OpaquePointer)v3);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
