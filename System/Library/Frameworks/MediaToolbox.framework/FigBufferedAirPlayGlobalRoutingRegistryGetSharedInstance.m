@implementation FigBufferedAirPlayGlobalRoutingRegistryGetSharedInstance

uint64_t __FigBufferedAirPlayGlobalRoutingRegistryGetSharedInstance_block_invoke()
{
  uint64_t result;

  if (FigServer_IsMediaplaybackd())
    result = FigBufferedAirPlayGlobalRoutingRegistryRemoteGetShared();
  else
    result = FigBufferedAirPlayGlobalRoutingRegistryLocalGetShared();
  FigBufferedAirPlayGlobalRoutingRegistryGetSharedInstance_sGlobalRoutingRegistry = result;
  return result;
}

@end
