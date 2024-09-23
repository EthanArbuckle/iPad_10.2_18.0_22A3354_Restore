@implementation SUApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityContentLanguage
{
  void *v2;
  void *v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SUStoreController")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("storeContentLanguage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
