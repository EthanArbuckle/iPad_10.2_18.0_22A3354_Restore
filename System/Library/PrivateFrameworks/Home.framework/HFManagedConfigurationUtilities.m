@implementation HFManagedConfigurationUtilities

+ (BOOL)isExplicitContentAllowed
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FF8]);

  return v3 == 1;
}

@end
