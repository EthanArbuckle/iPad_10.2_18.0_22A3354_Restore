@implementation HMDXPCMessageTransportFactory

- (HMDXPCMessageTransport)defaultTransport
{
  return +[HMDXPCMessageTransport defaultTransport](HMDXPCMessageTransport, "defaultTransport");
}

@end
