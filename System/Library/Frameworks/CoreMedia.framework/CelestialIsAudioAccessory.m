@implementation CelestialIsAudioAccessory

uint64_t __CelestialIsAudioAccessory_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  if ((_DWORD)result == 7)
    CelestialIsAudioAccessory_sIsAudioAccessory = 1;
  return result;
}

@end
