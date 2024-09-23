@implementation APSAlert

void __APSAlert_block_invoke()
{
  const char *v0;
  int out_token;

  out_token = 0;
  v0 = (const char *)objc_msgSend(CFSTR("APSAlertSettingsDidChangeNotification"), "UTF8String");
  notify_register_dispatch(v0, &out_token, MEMORY[0x1E0C80D38], &__block_literal_global_38_0);
  _APSLoadPreferences();
}

@end
