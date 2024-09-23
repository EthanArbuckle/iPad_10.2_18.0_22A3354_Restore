@implementation AADeviceModelHelper

+ (BOOL)isDeviceiPhone
{
  return MEMORY[0x24BEDD108](a1, sel_isDeviceEqualTo_, CFSTR("iPhone"));
}

+ (BOOL)isDeviceiPad
{
  return MEMORY[0x24BEDD108](a1, sel_isDeviceEqualTo_, CFSTR("iPad"));
}

+ (BOOL)isDeviceEqualTo:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  char isEqualToString;

  v3 = a3;
  if (qword_255EAA6A0 != -1)
    dispatch_once(&qword_255EAA6A0, &unk_24FF9ED10);
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_230EB7A18(v4);

  isEqualToString = objc_msgSend_isEqualToString_((void *)qword_255EAA698, v5, (uint64_t)v3);
  return isEqualToString;
}

@end
