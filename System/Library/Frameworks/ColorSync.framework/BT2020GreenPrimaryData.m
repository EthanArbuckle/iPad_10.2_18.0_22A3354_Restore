@implementation BT2020GreenPrimaryData

CFDataRef __get_BT2020GreenPrimaryData_block_invoke()
{
  CFDataRef result;

  if (ColorSyncProfileGetBT2020GreenPrimary_predicate[0] != -1)
    dispatch_once(ColorSyncProfileGetBT2020GreenPrimary_predicate, &__block_literal_global_189);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT2020GreenPrimary_gXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  get_BT2020GreenPrimaryData_data = (uint64_t)result;
  return result;
}

@end
