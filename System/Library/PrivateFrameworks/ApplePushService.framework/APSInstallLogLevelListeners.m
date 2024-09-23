@implementation APSInstallLogLevelListeners

void ___APSInstallLogLevelListeners_block_invoke()
{
  sAPSAlertsEnabled = 0;
  CFPreferencesSynchronize(CFSTR("com.apple.apsalerts"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  _APSLoadPreferences();
}

@end
