@implementation APSIsInAudioSystemServer

uint64_t __APSIsInAudioSystemServer_block_invoke()
{
  uint64_t result;

  result = in_audio_mx_server_process();
  APSIsInAudioSystemServer_sIsInAudioSystemServer = result;
  return result;
}

@end
