@implementation NSUserDefaults

void __40__NSUserDefaults_Email__em_userDefaults__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.mail"));

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("group.com.apple.mail"));
  v3 = (void *)em_userDefaults_userDefaults;
  em_userDefaults_userDefaults = v2;

}

void __47__NSUserDefaults_Email__em_lockdownModeEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D44638], "shared");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  em_lockdownModeEnabled_lockdownModeEnabled = objc_msgSend(v0, "enabled");

}

@end
