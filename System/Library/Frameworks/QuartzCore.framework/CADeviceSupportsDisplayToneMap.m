@implementation CADeviceSupportsDisplayToneMap

void __CADeviceSupportsDisplayToneMap_block_invoke()
{
  if (MGIsDeviceOneOfType())
    CADeviceSupportsDisplayToneMap::display_tonemap = 1;
  if (CADeviceIsVirtualized::once[0] != -1)
    dispatch_once(CADeviceIsVirtualized::once, &__block_literal_global_204);
  if (CADeviceIsVirtualized::is_virtualized)
    CADeviceSupportsDisplayToneMap::display_tonemap = 0;
}

@end
