@implementation FBSScene(AXExtras)

- (BOOL)accessibilitySceneIsCallServiceBanner
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  objc_opt_class();
  objc_msgSend(a1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_legacyOtherSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForSetting:", 3001);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "integerValue") == 1;
  else
    v7 = 0;

  return v7;
}

- (BOOL)accessibilityIsSceneOnContinuityDisplay
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 8;

  return v3;
}

@end
