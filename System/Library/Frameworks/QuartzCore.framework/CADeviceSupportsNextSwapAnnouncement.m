@implementation CADeviceSupportsNextSwapAnnouncement

uint64_t __CADeviceSupportsNextSwapAnnouncement_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  CADeviceSupportsNextSwapAnnouncement::b = result;
  return result;
}

@end
