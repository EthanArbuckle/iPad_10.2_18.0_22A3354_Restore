@implementation BT2020RedPrimaryData

CFDataRef __get_BT2020RedPrimaryData_block_invoke()
{
  CFDataRef result;

  if (ColorSyncProfileGetBT2020RedPrimary_predicate != -1)
    dispatch_once(&ColorSyncProfileGetBT2020RedPrimary_predicate, &__block_literal_global_187);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT2020RedPrimary_rXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  get_BT2020RedPrimaryData_data = (uint64_t)result;
  return result;
}

@end
