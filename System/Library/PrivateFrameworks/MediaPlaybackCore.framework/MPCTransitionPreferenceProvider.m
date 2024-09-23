@implementation MPCTransitionPreferenceProvider

+ (int64_t)currentTransitionPreference
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobileipod"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("TransitionStyle"));

  return v3;
}

@end
