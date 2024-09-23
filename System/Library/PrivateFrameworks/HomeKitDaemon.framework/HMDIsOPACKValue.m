@implementation HMDIsOPACKValue

CFTypeID __HMDIsOPACKValue_block_invoke()
{
  CFTypeID result;

  HMDIsOPACKValue_arrayTypeID = CFArrayGetTypeID();
  HMDIsOPACKValue_dictionaryTypeID = CFDictionaryGetTypeID();
  HMDIsOPACKValue_nullTypeID = CFNullGetTypeID();
  HMDIsOPACKValue_BOOLeanTypeID = CFBooleanGetTypeID();
  HMDIsOPACKValue_stringTypeID = CFStringGetTypeID();
  HMDIsOPACKValue_numberTypeID = CFNumberGetTypeID();
  HMDIsOPACKValue_dataTypeID = CFDataGetTypeID();
  result = CFDateGetTypeID();
  HMDIsOPACKValue_dateTypeID = result;
  return result;
}

@end
