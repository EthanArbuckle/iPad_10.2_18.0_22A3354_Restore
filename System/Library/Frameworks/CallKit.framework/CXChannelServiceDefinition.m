@implementation CXChannelServiceDefinition

- (Protocol)clientXPCInterface
{
  return (Protocol *)&unk_1EE70CF00;
}

- (Protocol)serverXPCInterface
{
  return (Protocol *)&unk_1EE710010;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.callkit.service.channel");
}

- (CXServiceDomain)domain
{
  return (CXServiceDomain *)+[CXServiceDomain callKitServiceDomain](CXServiceDomain, "callKitServiceDomain");
}

@end
