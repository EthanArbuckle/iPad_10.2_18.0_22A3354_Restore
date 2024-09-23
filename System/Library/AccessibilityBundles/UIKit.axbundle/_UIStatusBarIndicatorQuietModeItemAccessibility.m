@implementation _UIStatusBarIndicatorQuietModeItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarIndicatorQuietModeItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarIndicatorQuietModeItem"), CFSTR("focusName"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id v5;
  id v6[2];
  _UIStatusBarIndicatorQuietModeItemAccessibility *v7;

  v7 = self;
  v6[1] = (id)a2;
  v3 = objc_alloc(MEMORY[0x24BDFEA60]);
  v4 = (id)-[_UIStatusBarIndicatorQuietModeItemAccessibility safeStringForKey:](v7, "safeStringForKey:", CFSTR("focusName"));
  v6[0] = (id)objc_msgSend(v3, "initWithString:");

  objc_msgSend(v6[0], "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC28]);
  v5 = v6[0];
  objc_storeStrong(v6, 0);
  return v5;
}

@end
