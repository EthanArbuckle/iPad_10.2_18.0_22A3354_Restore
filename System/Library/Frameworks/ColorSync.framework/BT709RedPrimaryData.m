@implementation BT709RedPrimaryData

CFDataRef __get_BT709RedPrimaryData_block_invoke()
{
  CFDataRef result;

  if (ColorSyncProfileGetBT709RedPrimary_predicate != -1)
    dispatch_once(&ColorSyncProfileGetBT709RedPrimary_predicate, &__block_literal_global_181);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT709RedPrimary_rXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  get_BT709RedPrimaryData_data = (uint64_t)result;
  return result;
}

@end
