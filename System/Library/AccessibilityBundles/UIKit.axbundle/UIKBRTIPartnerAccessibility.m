@implementation UIKBRTIPartnerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKBRTIPartner");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKBRTIPartner"), CFSTR("_performKeyboardOutputOperations:"), "I", "@", 0);
  objc_storeStrong(v4, obj);
}

- (unsigned)_performKeyboardOutputOperations:(id)a3
{
  unsigned int v4;
  objc_super v5;
  unsigned int v6;
  id location[2];
  UIKBRTIPartnerAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  _UIAccessibilityBlockPostingOfAllNotifications();
  v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UIKBRTIPartnerAccessibility;
  v6 = -[UIKBRTIPartnerAccessibility _performKeyboardOutputOperations:](&v5, sel__performKeyboardOutputOperations_, location[0]);
  AXPerformBlockAsynchronouslyOnMainThread();
  v4 = v6;
  objc_storeStrong(location, 0);
  return v4;
}

uint64_t __64__UIKBRTIPartnerAccessibility__performKeyboardOutputOperations___block_invoke()
{
  return AXUIUnblockKeyboardEntryNotifications();
}

@end
