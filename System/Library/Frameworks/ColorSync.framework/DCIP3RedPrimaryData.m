@implementation DCIP3RedPrimaryData

CFDataRef __get_DCIP3RedPrimaryData_block_invoke()
{
  CFDataRef result;

  if (ColorSyncProfileGetDCIP3RedPrimary_predicate != -1)
    dispatch_once(&ColorSyncProfileGetDCIP3RedPrimary_predicate, &__block_literal_global_199);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetDCIP3RedPrimary_rXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  get_DCIP3RedPrimaryData_data = (uint64_t)result;
  return result;
}

@end
