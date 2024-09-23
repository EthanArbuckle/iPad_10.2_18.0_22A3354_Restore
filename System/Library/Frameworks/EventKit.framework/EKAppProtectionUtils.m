@implementation EKAppProtectionUtils

+ (id)reminderApApp
{
  if (reminderApApp_onceToken != -1)
    dispatch_once(&reminderApApp_onceToken, &__block_literal_global_76);
  return (id)reminderApApp__reminderApApp;
}

void __37__EKAppProtectionUtils_reminderApApp__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", *MEMORY[0x1E0D0C510]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reminderApApp__reminderApApp;
  reminderApApp__reminderApApp = v0;

}

+ (BOOL)isReminderAppLocked
{
  void *v2;
  char v3;

  objc_msgSend(a1, "reminderApApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLocked");

  return v3;
}

@end
