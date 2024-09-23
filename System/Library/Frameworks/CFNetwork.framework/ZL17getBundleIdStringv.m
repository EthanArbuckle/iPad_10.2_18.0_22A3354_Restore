@implementation ZL17getBundleIdStringv

char *___ZL17getBundleIdStringv_block_invoke()
{
  char *result;
  CFIndex Length;
  CFIndex v2;

  if (getBundleId(void)::onceToken != -1)
    dispatch_once(&getBundleId(void)::onceToken, &__block_literal_global_81_8983);
  result = (char *)getBundleId(void)::bundleID;
  getBundleIdString(void)::bundleID = getBundleId(void)::bundleID;
  if (getBundleId(void)::bundleID)
  {
    Length = CFStringGetLength((CFStringRef)getBundleId(void)::bundleID);
    v2 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    result = (char *)malloc_type_malloc(v2, 0x1F19698EuLL);
    getBundleIdString(void)::bundleIdString = (uint64_t)result;
    if (result)
      return (char *)CFStringGetCString((CFStringRef)getBundleIdString(void)::bundleID, result, v2, 0x8000100u);
  }
  return result;
}

@end
