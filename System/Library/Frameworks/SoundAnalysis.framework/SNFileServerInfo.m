@implementation SNFileServerInfo

- (NSString)identifier
{
  return (NSString *)sub_1D446FB60((uint64_t)self, (uint64_t)a2, sub_1D446FAB8);
}

- (NSString)idsDeviceID
{
  return (NSString *)sub_1D446FB60((uint64_t)self, (uint64_t)a2, sub_1D446FAF0);
}

- (NSString)model
{
  return (NSString *)sub_1D446FB60((uint64_t)self, (uint64_t)a2, sub_1D446FB28);
}

- (NSString)name
{
  return (NSString *)sub_1D446FB60((uint64_t)self, (uint64_t)a2, sub_1D446FB98);
}

- (SNFileServerInfo)init
{
  SNFileServerInfo.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D42CB514();
}

@end
