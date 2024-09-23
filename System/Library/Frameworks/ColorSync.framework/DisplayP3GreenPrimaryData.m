@implementation DisplayP3GreenPrimaryData

CFDataRef __get_DisplayP3GreenPrimaryData_block_invoke()
{
  CFDataRef result;

  if (ColorSyncProfileGetDisplayP3GreenPrimary_predicate[0] != -1)
    dispatch_once(ColorSyncProfileGetDisplayP3GreenPrimary_predicate, &__block_literal_global_195);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetDisplayP3GreenPrimary_gXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  get_DisplayP3GreenPrimaryData_data = (uint64_t)result;
  return result;
}

@end
