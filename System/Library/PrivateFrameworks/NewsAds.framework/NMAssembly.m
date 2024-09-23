@implementation NMAssembly

- (NMAssembly)init
{
  return (NMAssembly *)Assembly.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
