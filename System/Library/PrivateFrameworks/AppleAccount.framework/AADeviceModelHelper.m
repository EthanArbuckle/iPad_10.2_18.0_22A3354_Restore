@implementation AADeviceModelHelper

+ (BOOL)isDeviceiPhone
{
  return objc_msgSend(a1, "isDeviceEqualTo:", CFSTR("iPhone"));
}

+ (BOOL)isDeviceiPad
{
  return objc_msgSend(a1, "isDeviceEqualTo:", CFSTR("iPad"));
}

+ (BOOL)isDeviceEqualTo:(id)a3
{
  id v3;
  NSObject *v4;
  char v5;

  v3 = a3;
  if (isDeviceEqualTo__onceToken != -1)
    dispatch_once(&isDeviceEqualTo__onceToken, &__block_literal_global_26);
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[AADeviceModelHelper isDeviceEqualTo:].cold.1(v4);

  v5 = objc_msgSend((id)isDeviceEqualTo__deviceModel, "isEqualToString:", v3);
  return v5;
}

void __39__AADeviceModelHelper_isDeviceEqualTo___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)isDeviceEqualTo__deviceModel;
  isDeviceEqualTo__deviceModel = v0;

}

+ (void)isDeviceEqualTo:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = isDeviceEqualTo__deviceModel;
  _os_log_debug_impl(&dword_19EACA000, log, OS_LOG_TYPE_DEBUG, "Current device model: %@", (uint8_t *)&v1, 0xCu);
}

@end
