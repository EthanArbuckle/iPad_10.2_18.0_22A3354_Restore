@implementation SNFileServerDiscoveryResult

- (SNFileServerInfo)serverInfo
{
  SNFileServerDiscoveryResult *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D4445310();
  v4 = v3;

  return (SNFileServerInfo *)v4;
}

- (unint64_t)state
{
  return sub_1D44453F0();
}

- (SNFileServerDiscoveryResult)init
{
  SNFileServerDiscoveryResult.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
