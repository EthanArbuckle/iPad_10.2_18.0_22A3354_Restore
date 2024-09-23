@implementation _UIPreviewPresentationPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIPreviewPresentationPlatterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)accessibilityPerformEscape
{
  id v3;

  v3 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("accessibilityDismissActionSheet"), 0);

  return 1;
}

@end
