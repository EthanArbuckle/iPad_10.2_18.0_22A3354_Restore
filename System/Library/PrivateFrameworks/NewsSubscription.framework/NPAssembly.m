@implementation NPAssembly

- (NPAssembly)init
{
  return (NPAssembly *)Assembly.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
