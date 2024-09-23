@implementation BT601BluePrimaryData

CFDataRef __get_BT601BluePrimaryData_block_invoke()
{
  CFDataRef result;

  if (ColorSyncProfileGetBT601BluePrimary_predicate != -1)
    dispatch_once(&ColorSyncProfileGetBT601BluePrimary_predicate, &__block_literal_global_179);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT601BluePrimary_bXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  get_BT601BluePrimaryData_data = (uint64_t)result;
  return result;
}

@end
