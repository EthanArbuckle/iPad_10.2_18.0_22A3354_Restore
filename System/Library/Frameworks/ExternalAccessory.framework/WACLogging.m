@implementation WACLogging

+ (BOOL)isEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSuiteNamed:", CFSTR("com.apple.logging"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DebugWACLogging"));

  return v3;
}

@end
