@implementation MDPlistContainerCreateCommon

CFTypeID ___MDPlistContainerCreateCommon_block_invoke()
{
  CFTypeID result;

  gCFArrayTypeID = CFArrayGetTypeID();
  gCFDictionaryTypeID = CFDictionaryGetTypeID();
  gCFNullTypeID = CFNullGetTypeID();
  gCFStringTypeID = CFStringGetTypeID();
  gCFDataTypeID = CFDataGetTypeID();
  gCFUUIDTypeID = CFUUIDGetTypeID();
  gCFURLTypeID = CFURLGetTypeID();
  gCFDateTypeID = CFDateGetTypeID();
  gCFBooleanTypeID = CFBooleanGetTypeID();
  result = CFNumberGetTypeID();
  gCFNumberTypeID = result;
  return result;
}

@end
