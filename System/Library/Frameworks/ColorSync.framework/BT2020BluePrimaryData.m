@implementation BT2020BluePrimaryData

CFDataRef __get_BT2020BluePrimaryData_block_invoke()
{
  CFDataRef result;

  if (ColorSyncProfileGetBT2020BluePrimary_predicate != -1)
    dispatch_once(&ColorSyncProfileGetBT2020BluePrimary_predicate, &__block_literal_global_191);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT2020BluePrimary_bXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  get_BT2020BluePrimaryData_data = (uint64_t)result;
  return result;
}

@end
