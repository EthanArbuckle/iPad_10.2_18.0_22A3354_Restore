@implementation _UIPreviewPresentationContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIPreviewPresentationContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIPreviewPresentationContainerView");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("contentView"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)accessibilityElements
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[2];
  _UIPreviewPresentationContainerViewAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = v8[0];
  v4 = (id)-[_UIPreviewPresentationContainerViewAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("platterView"));
  objc_msgSend(v3, "axSafelyAddObject:");

  v5 = v8[0];
  v6 = (id)-[_UIPreviewPresentationContainerViewAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("contentView"));
  objc_msgSend(v5, "axSafelyAddObject:");

  v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (BOOL)accessibilityPerformEscape
{
  id v3;

  UIAccessibilityPostNotification(*MEMORY[0x24BEBAFA8], MEMORY[0x24BDBD1C0]);
  AXPerformBlockOnMainThreadAfterDelay();
  v3 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("accessibilityDismissActionSheet"), 0);

  return 1;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
