@implementation MDPlistBytesAddObject

uint64_t ____MDPlistBytesAddObject_block_invoke()
{
  uint64_t result;

  qword_1EE5C94D0 = CFArrayGetTypeID();
  qword_1EE5C94D8 = CFDictionaryGetTypeID();
  qword_1EE5C94E0 = CFBooleanGetTypeID();
  qword_1EE5C94F0 = CFDataGetTypeID();
  qword_1EE5C94E8 = CFDateGetTypeID();
  qword_1EE5C94F8 = CFNullGetTypeID();
  qword_1EE5C9500 = CFNumberGetTypeID();
  qword_1EE5C94C8 = CFStringGetTypeID();
  qword_1EE5C9508 = CFUUIDGetTypeID();
  qword_1EE5C9510 = CFURLGetTypeID();
  if (qword_1EE5C94B0 != -1)
    dispatch_once(&qword_1EE5C94B0, &__block_literal_global_7_0);
  qword_1EE5C9518 = qword_1EE5C94B8;
  result = _MDStoreOIDArrayGetTypeID();
  qword_1EE5C9520 = result;
  return result;
}

@end
