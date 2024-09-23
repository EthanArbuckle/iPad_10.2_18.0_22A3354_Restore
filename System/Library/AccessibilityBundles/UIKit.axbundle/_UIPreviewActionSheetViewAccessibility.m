@implementation _UIPreviewActionSheetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIPreviewActionSheetView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityPerformEscape
{
  id v3;

  v3 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("accessibilityDismissActionSheet"), 0);

  return 1;
}

@end
