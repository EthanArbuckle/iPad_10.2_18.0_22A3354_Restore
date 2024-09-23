@implementation BT709BluPrimaryData

CFDataRef __get_BT709BluPrimaryData_block_invoke()
{
  CFDataRef result;

  if (ColorSyncProfileGetBT709BluePrimary_predicate != -1)
    dispatch_once(&ColorSyncProfileGetBT709BluePrimary_predicate, &__block_literal_global_185);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT709BluePrimary_bXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  get_BT709BluPrimaryData_data = (uint64_t)result;
  return result;
}

@end
