@implementation IOAVPropertyListCreateWithCFProperties

CFTypeID __IOAVPropertyListCreateWithCFProperties_block_invoke()
{
  CFTypeID result;

  IOAVPropertyListCreateWithCFProperties_BOOLeanTypeID = CFBooleanGetTypeID();
  IOAVPropertyListCreateWithCFProperties_numberTypeID = CFNumberGetTypeID();
  IOAVPropertyListCreateWithCFProperties_stringTypeID = CFStringGetTypeID();
  IOAVPropertyListCreateWithCFProperties_dateTypeID = CFDateGetTypeID();
  IOAVPropertyListCreateWithCFProperties_dataTypeID = CFDataGetTypeID();
  IOAVPropertyListCreateWithCFProperties_arrayTypeID = CFArrayGetTypeID();
  IOAVPropertyListCreateWithCFProperties_dictionaryTypeID = CFDictionaryGetTypeID();
  result = CFSetGetTypeID();
  IOAVPropertyListCreateWithCFProperties_setTypeID = result;
  return result;
}

@end
