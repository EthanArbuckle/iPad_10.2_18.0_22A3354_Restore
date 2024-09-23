@implementation DisplayP3BluePrimaryData

CFDataRef __get_DisplayP3BluePrimaryData_block_invoke()
{
  CFDataRef result;

  if (ColorSyncProfileGetDisplayP3BluePrimary_predicate != -1)
    dispatch_once(&ColorSyncProfileGetDisplayP3BluePrimary_predicate, &__block_literal_global_197);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetDisplayP3BluePrimary_bXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  get_DisplayP3BluePrimaryData_data = (uint64_t)result;
  return result;
}

@end
