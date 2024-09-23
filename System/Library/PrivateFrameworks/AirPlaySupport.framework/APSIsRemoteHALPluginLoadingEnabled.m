@implementation APSIsRemoteHALPluginLoadingEnabled

uint64_t __APSIsRemoteHALPluginLoadingEnabled_block_invoke()
{
  uint64_t result;

  result = FigIsAirplaydEnabled();
  APSIsRemoteHALPluginLoadingEnabled_sRemoteHalPluginLoadingEnabled = result;
  return result;
}

@end
