@implementation AMDBaseEvent

+ (BOOL)validateInput:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v6[15];
  char v7;
  id v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = MEMORY[0x1E0C81028];
  v7 = 16;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
  {
    log = v8;
    type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_error_impl(&dword_1DC678000, log, type, "Method 'validateInput' not implemented in AMDBaseEvent", v6, 2u);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return 0;
}

@end
