@implementation BT601GreenPrimaryData

CFDataRef __get_BT601GreenPrimaryData_block_invoke()
{
  CFDataRef result;

  if (ColorSyncProfileGetBT601GreenPrimary_predicate != -1)
    dispatch_once(&ColorSyncProfileGetBT601GreenPrimary_predicate, &__block_literal_global_177);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT601GreenPrimary_gXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  get_BT601GreenPrimaryData_data = (uint64_t)result;
  return result;
}

@end
