@implementation APSIsInAirPlaySenderSystemServer

uint64_t __APSIsInAirPlaySenderSystemServer_block_invoke()
{
  uint64_t result;

  if (FigIsAirplaydEnabled())
    result = FigServer_IsAirplayd();
  else
    result = in_audio_mx_server_process();
  APSIsInAirPlaySenderSystemServer_sIsInAirPlaySenderSystemServer = result;
  return result;
}

@end
