@implementation NSUserDefaults

void __57__NSUserDefaults_SafariServicesExtras___sf_sfAppDefaults__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C99EA0]);
  _SFSFAppContainerURL();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_initWithSuiteName:container:", CFSTR("com.apple.sfapp"), v3);
  v2 = (void *)_sf_sfAppDefaults_sfAppDefaults;
  _sf_sfAppDefaults_sfAppDefaults = v1;

}

@end
