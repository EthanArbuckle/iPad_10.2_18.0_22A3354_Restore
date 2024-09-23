@implementation HMDMPCAssistantRemoteControlDestinationFactory

- (id)nowPlayingApplicationDestination
{
  return (id)objc_msgSend(MEMORY[0x1E0D4B338], "nowPlayingApplicationDestination");
}

- (id)systemMediaApplicationDestination
{
  return (id)objc_msgSend(MEMORY[0x1E0D4B338], "systemMediaApplicationDestination");
}

- (void)resolveMPCDestination:(id)a3 withHashedRouteIdentifiers:(id)a4 audioRoutingInfo:(id)a5 completion:(id)a6
{
  objc_msgSend(a3, "resolveWithHashedRouteIdentifiers:audioRoutingInfo:completion:", a4, *(unsigned int *)&a5, a6);
}

- (id)mutableCopyForMPCDestination:(id)a3
{
  return (id)objc_msgSend(a3, "mutableCopy");
}

@end
