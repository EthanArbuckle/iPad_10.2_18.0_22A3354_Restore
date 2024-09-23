@implementation BT709GreenPrimaryData

CFDataRef __get_BT709GreenPrimaryData_block_invoke()
{
  CFDataRef result;

  if (ColorSyncProfileGetBT709GreenPrimary_predicate[0] != -1)
    dispatch_once(ColorSyncProfileGetBT709GreenPrimary_predicate, &__block_literal_global_183);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT709GreenPrimary_gXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  get_BT709GreenPrimaryData_data = (uint64_t)result;
  return result;
}

@end
