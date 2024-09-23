@implementation TSLaunchPad

+ (void)launchSettings
{
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "openApplication:options:withResult:", CFSTR("com.apple.Preferences"), 0, 0);

}

@end
