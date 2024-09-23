@implementation CADeviceSupportsBrightnessTransactions

void __CADeviceSupportsBrightnessTransactions_block_invoke()
{
  int AppBooleanValue;
  NSObject *v1;
  const char *v2;
  const char *v3;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (MGGetBoolAnswer())
    CADeviceSupportsBrightnessTransactions::supports_brightness_transaction = 1;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SynchronousBrightnessTransactions"), (CFStringRef)*MEMORY[0x1E0C9B248], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    CADeviceSupportsBrightnessTransactions::supports_brightness_transaction = AppBooleanValue != 0;
  if (x_log_hook_p())
  {
    x_log_();
  }
  else
  {
    v1 = x_log_category_utilities;
    if (os_log_type_enabled((os_log_t)x_log_category_utilities, OS_LOG_TYPE_DEFAULT))
    {
      v2 = "YES";
      if (CADeviceSupportsBrightnessTransactions::supports_brightness_transaction)
        v3 = "YES";
      else
        v3 = "NO";
      if (!keyExistsAndHasValidFormat)
        v2 = "NO";
      *(_DWORD *)buf = 136315394;
      v6 = v3;
      v7 = 2080;
      v8 = v2;
      _os_log_impl(&dword_184457000, v1, OS_LOG_TYPE_DEFAULT, "Brightness Transactions Enabled: %s, Overridden: %s\n", buf, 0x16u);
    }
  }
}

@end
