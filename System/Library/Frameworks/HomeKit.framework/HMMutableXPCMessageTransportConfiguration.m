@implementation HMMutableXPCMessageTransportConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  HMXPCMessageTransportConfiguration *v4;
  void *v5;
  HMXPCMessageTransportConfiguration *v6;
  void *v7;

  v4 = +[HMXPCMessageTransportConfiguration allocWithZone:](HMXPCMessageTransportConfiguration, "allocWithZone:", a3);
  -[HMXPCMessageTransportConfiguration machServiceName](self, "machServiceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMXPCMessageTransportConfiguration initWithMachServiceName:](v4, "initWithMachServiceName:", v5);

  -[HMXPCMessageTransportConfiguration setRequiredEntitlements:](v6, "setRequiredEntitlements:", -[HMXPCMessageTransportConfiguration requiredEntitlements](self, "requiredEntitlements"));
  -[HMXPCMessageTransportConfiguration setRequiresHomeDataAccess:](v6, "setRequiresHomeDataAccess:", -[HMXPCMessageTransportConfiguration requiresHomeDataAccess](self, "requiresHomeDataAccess"));
  -[HMXPCMessageTransportConfiguration queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMXPCMessageTransportConfiguration setQueue:](v6, "setQueue:", v7);

  return v6;
}

@end
