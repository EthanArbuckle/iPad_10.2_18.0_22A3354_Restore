@implementation NYAssembly

- (NYAssembly)init
{
  return (NYAssembly *)Assembly.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
