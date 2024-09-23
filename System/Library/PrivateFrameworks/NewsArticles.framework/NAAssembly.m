@implementation NAAssembly

- (NAAssembly)init
{
  return (NAAssembly *)Assembly.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
