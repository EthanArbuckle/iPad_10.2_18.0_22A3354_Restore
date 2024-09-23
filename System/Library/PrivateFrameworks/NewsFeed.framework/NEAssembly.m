@implementation NEAssembly

- (NEAssembly)init
{
  return (NEAssembly *)Assembly.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
