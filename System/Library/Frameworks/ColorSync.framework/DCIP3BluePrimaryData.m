@implementation DCIP3BluePrimaryData

CFDataRef __get_DCIP3BluePrimaryData_block_invoke()
{
  CFDataRef result;

  if (ColorSyncProfileGetDCIP3BluePrimary_predicate[0] != -1)
    dispatch_once(ColorSyncProfileGetDCIP3BluePrimary_predicate, &__block_literal_global_203);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetDCIP3BluePrimary_bXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  get_DCIP3BluePrimaryData_data = (uint64_t)result;
  return result;
}

@end
