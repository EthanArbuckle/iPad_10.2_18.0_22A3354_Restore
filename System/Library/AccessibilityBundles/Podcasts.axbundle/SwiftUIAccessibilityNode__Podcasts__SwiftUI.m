@implementation SwiftUIAccessibilityNode__Podcasts__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUI.AccessibilityNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SwiftUI.AccessibilityNode"), CFSTR("accessibilityCustomAttribute:"), "@", 0);
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  id v3;
  char v4;
  id v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  SwiftUIAccessibilityNode__Podcasts__SwiftUI *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __96__SwiftUIAccessibilityNode__Podcasts__SwiftUI__accessibilityHitTestShouldFallbackToNearestChild__block_invoke;
  v11 = &unk_2502FD250;
  v12 = self;
  v13 = &v14;
  AXPerformSafeBlock();
  v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v3)
  {
    v4 = objc_msgSend(v3, "BOOLValue");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SwiftUIAccessibilityNode__Podcasts__SwiftUI;
    v5 = -[SwiftUIAccessibilityNode__Podcasts__SwiftUI _accessibilityExpandedStatus](&v7, sel__accessibilityExpandedStatus);

    return v5 != 0;
  }
  return v4;
}

@end
